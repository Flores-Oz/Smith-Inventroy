using SmithInventory.DB;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
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
                using (var db = new DCSmithDataContext(Global.CADENA))
                {
                    // Cambiar el tipo de la clase 'Venta' a 'DB.Venta'
                    var nuevaVenta = new DB.Venta // Aquí debe ser DB.Venta
                    {
                        Fecha_Venta = DateTime.Now,
                        Total_Venta = Convert.ToDecimal(txtTotalVenta.Text),
                        id_Usuario = 1, // Suponiendo que el usuario es 1, este valor debería ser dinámico si es necesario
                        id_Estado = 1
                    };

                    db.Venta.InsertOnSubmit(nuevaVenta);
                    db.SubmitChanges();

                    // Obtener el ID de la venta generada para insertar los detalles
                    int idVentaGenerada = nuevaVenta.id_Venta;
                    GuardarDetalleVenta(idVentaGenerada, db);

                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "showSuccessMessageVenta();", true);
                }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "showErrorMessageVenta();", true);
            }
        }
        private void GuardarDetalleVenta(int idVenta, DB.DCSmithDataContext db)
        {
            try
            {
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
                            id_Venta = idVenta,
                            ID_Producto = idProducto,
                            Cantidad = cantidad,
                            Precio = precio,
                            Subtotal = subtotal,
                            Descuento = descuento,
                            ID_Cliente = ID_Cliente

                        };

                        db.Detalles_Venta.InsertOnSubmit(nuevoDetalleVenta);
                    }
                }

                db.SubmitChanges();
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "showSuccessMessageDetVenta();", true);
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "showErrorMessageDetVenta();", true);
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