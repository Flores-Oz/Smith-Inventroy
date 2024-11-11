using SmithInventory.DB;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Transactions;
using System.Web.UI.WebControls;

namespace SmithInventory.PagesAdmin
{
    public partial class Venta : System.Web.UI.Page
    {
        private decimal totalVenta = 0;
        DB.DCSmithDataContext connec = new DB.DCSmithDataContext(Global.CADENA);
        private List<ProductsVenta> productosVenta = new List<ProductsVenta>();
        private void CargarProductos()
        {
            var productos = from p in connec.Producto
                            select new
                            {
                                codigo = p.ID_Producto,
                                nombre = p.Nombre_Producto
                            };

            ddlProductoVenta.DataSource = productos;
            ddlProductoVenta.DataTextField = "nombre";
            ddlProductoVenta.DataValueField = "codigo";
            ddlProductoVenta.DataBind();
        }

        private void CargarClientes()
        {
            var clientes = from c in connec.Cliente
                           select new
                           {
                               codigo = c.ID_Cliente,
                               nombre = c.Nombre_Completo
                           };

            DropDownListCliente.DataSource = clientes;
            DropDownListCliente.DataTextField = "nombre";
            DropDownListCliente.DataValueField = "codigo";
            DropDownListCliente.DataBind();
        }

        public void Limpiar()
        {
            txtCantidadVenta.Text = string.Empty;
            txtPrecioVenta.Text = string.Empty;
            txtDescuentoVenta.Text = string.Empty;
            txtSubtotalVenta.Text = string.Empty;
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarProductos();
                CargarClientes();
            }
        }

        protected void txtTotalVenta_TextChanged(object sender, EventArgs e)
        {

        }

        protected void btnAgregarProductoVenta_Click(object sender, EventArgs e)
        {
            DataTable dtProductos = new DataTable();

            if (ViewState["ProductosVenta"] != null)
            {
                dtProductos = (DataTable)ViewState["ProductosVenta"];
            }
            else
            {
                dtProductos.Columns.Add("ProductoID", typeof(int));
                dtProductos.Columns.Add("Producto");
                dtProductos.Columns.Add("Cantidad", typeof(int));
                dtProductos.Columns.Add("Precio");
                dtProductos.Columns.Add("Descuento");
                dtProductos.Columns.Add("Subtotal");
            }

            DataRow dr = dtProductos.NewRow();
            dr["ProductoID"] = ddlProductoVenta.SelectedValue;
            dr["Producto"] = ddlProductoVenta.SelectedItem.Text;
            dr["Cantidad"] = txtCantidadVenta.Text;
            dr["Precio"] = txtPrecioVenta.Text;
            dr["Descuento"] = txtDescuentoVenta.Text;
            dr["Subtotal"] = txtSubtotalVenta.Text;
            dtProductos.Rows.Add(dr);

            ViewState["ProductosVenta"] = dtProductos;
            gvProductosVenta.DataSource = dtProductos;
            gvProductosVenta.DataBind();

            totalVenta += Convert.ToDecimal(txtSubtotalVenta.Text);
            txtTotalVenta.Text = totalVenta.ToString("F2");
            Limpiar();
        }

        private void CalcularSubtotal()
        {
            int cantidad = int.TryParse(txtCantidadVenta.Text, out cantidad) ? cantidad : 0;
            decimal precio = decimal.TryParse(txtPrecioVenta.Text, out precio) ? precio : 0;
            int descuento = int.TryParse(txtDescuentoVenta.Text, out descuento) ? descuento : 0;

            decimal subtotal = (cantidad * precio) - descuento;
            txtSubtotalVenta.Text = subtotal.ToString("F2");
        }

        protected void txtSubtotalVenta_TextChanged(object sender, EventArgs e)
        {

        }

        protected void txtDescuentoVenta_TextChanged(object sender, EventArgs e)
        {
            CalcularSubtotal();
        }

        protected void txtCantidadVenta_TextChanged(object sender, EventArgs e)
        {
            CalcularSubtotal();
        }

        protected void ddlProductoVenta_TextChanged(object sender, EventArgs e)
        {
            int idProducto = Convert.ToInt32(ddlProductoVenta.SelectedValue);
            var producto = (from p in connec.Producto
                            where p.ID_Producto == idProducto
                            select p).FirstOrDefault();

            txtPrecioVenta.Text = producto != null ? producto.Precio_Venta.ToString("F2") : "0.00";
        }

        protected void btnGuardarVenta_Click(object sender, EventArgs e)
        {
            try
            {
                // Iniciar un TransactionScope para manejar la transacción
                using (var scope = new TransactionScope())
                {
                    using (var db = new DCSmithDataContext(Global.CADENA))
                    {
                        // Crear una nueva instancia de la venta
                        var nuevaVenta = new DB.Venta
                        {
                            Fecha_Venta = DateTime.Now,
                            Total_Venta = decimal.TryParse(txtTotalVenta.Text, out decimal totalVenta) ? totalVenta : 0,
                            id_Usuario = 1, // Aquí debes reemplazarlo con la lógica para obtener el ID de usuario
                            id_Estado = 1
                        };

                        db.Venta.InsertOnSubmit(nuevaVenta);
                        db.SubmitChanges();

                        // Obtener el ID de la venta generada para insertar los detalles
                        int idVentaGenerada = nuevaVenta.id_Venta;

                        foreach (GridViewRow fila in gvProductosVenta.Rows)
                        {
                            TextBox txtCantidad = fila.FindControl("txtCantidad") as TextBox;
                            TextBox txtPrecio = fila.FindControl("txtPrecio") as TextBox;
                            TextBox txtDescuento = fila.FindControl("txtDescuento") as TextBox;

                            if (txtCantidad != null && txtPrecio != null)
                            {
                                int idProducto = Convert.ToInt32(gvProductosVenta.DataKeys[fila.RowIndex].Value);
                                int cantidad = Convert.ToInt32(txtCantidad.Text);
                                decimal precio = Convert.ToDecimal(txtPrecio.Text);
                                decimal subtotal = cantidad * precio;
                                int? descuento = string.IsNullOrEmpty(txtDescuento.Text) ? (int?)null : Convert.ToInt32(txtDescuento.Text);
                                int ID_Cliente = Convert.ToInt32(DropDownListCliente.SelectedValue);

                                var nuevoDetalleVenta = new Detalles_Venta
                                {
                                    id_Venta = idVentaGenerada,
                                    ID_Producto = idProducto,
                                    Cantidad = cantidad,
                                    Precio = precio,
                                    Subtotal = subtotal,
                                    Descuento = descuento,
                                    ID_Cliente = ID_Cliente
                                };

                                db.Detalles_Venta.InsertOnSubmit(nuevoDetalleVenta);

                                // Reducir la cantidad de productos en los lotes según disponibilidad
                                var lotesDisponibles = db.Detalle_Lote_Ingreso
                                    .Where(dl => dl.ID_Producto == idProducto && dl.Cantidad > 0)
                                    .OrderBy(dl => dl.Fecha_Caducida)
                                    .ToList();

                                int cantidadRestante = cantidad;
                                foreach (var lote in lotesDisponibles)
                                {
                                    if (cantidadRestante <= 0)
                                        break;

                                    if (lote.Cantidad >= cantidadRestante)
                                    {
                                        lote.Cantidad -= cantidadRestante;
                                        cantidadRestante = 0;
                                    }
                                    else
                                    {
                                        cantidadRestante -= lote.Cantidad;
                                        lote.Cantidad = 0;
                                    }
                                }

                                if (cantidadRestante > 0)
                                {
                                    throw new Exception($"Cantidad insuficiente en los lotes para el producto ID: {idProducto}. Cantidad solicitada: {cantidad}, Cantidad restante después de lotes disponibles: {cantidadRestante}");
                                }
                            }
                        }

                        // Si todo va bien, confirmar la transacción
                        db.SubmitChanges();
                        scope.Complete();

                        // Limpiar el GridView
                        gvProductosVenta.DataSource = null;
                        gvProductosVenta.DataBind();
                        txtTotalVenta.Text = "";

                        ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "showSuccessMessageVenta();", true);
                    }
                }
            }
            catch (Exception ex)
            {
                // Si ocurre un error, no se llama a Complete(), lo que causa un rollback
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", $"alert('Error en la transacción de la venta: {ex.Message}');", true);
            }
        }
        private void ActualizarTotalVenta()
        {
            decimal total = productosVenta.Sum(p => p.Subtotal);
            txtTotalVenta.Text = total.ToString("F2");
        }
        protected void gvProductosVenta_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Eliminar")
            {
                int productoID = Convert.ToInt32(e.CommandArgument);
                DataTable dtProductos = (DataTable)ViewState["ProductosVenta"];

                DataRow rowToDelete = dtProductos.AsEnumerable()
                                                 .FirstOrDefault(row => row.Field<int>("ProductoID") == productoID);

                if (rowToDelete != null)
                {
                    dtProductos.Rows.Remove(rowToDelete);
                }

                ViewState["ProductosVenta"] = dtProductos;
                gvProductosVenta.DataSource = dtProductos;
                gvProductosVenta.DataBind();

                ActualizarTotalVenta();
            }
        }
        public class ProductsVenta
        {
            public int ProductoID { get; set; }
            public string Producto { get; set; }
            public int Cantidad { get; set; }
            public decimal Precio { get; set; }
            public decimal Descuento { get; set; }
            public decimal Subtotal { get; set; }
        }
    }
}