using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SmithInventory.PagesAdmin
{
    public partial class Lotes : System.Web.UI.Page
    {
        private decimal totalLote = 0;
        DB.DCSmithDataContext connec = new DB.DCSmithDataContext(Global.CADENA);
        private List<ProductsLote> productosLote = new List<ProductsLote>();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarProductos();
                CargarCasas();
            }
        }

        private void CargarProductos()
        {
            var productos = from p in connec.Producto
                            select new
                            {
                                codigo = p.ID_Producto,
                                nombre = p.Nombre_Producto
                            };

            ddlProductoLote.DataSource = productos;
            ddlProductoLote.DataTextField = "nombre";
            ddlProductoLote.DataValueField = "codigo";
            ddlProductoLote.DataBind();
        }

        private void CargarCasas()
        {
            var casas = from c in connec.Casa_Farmaceutica
                        select new
                        {
                            codigo = c.ID_CasaFarmaceutica,
                            nombre = c.Casa_Farmaceutica1
                        };

            DropDownListCasaFarma.DataSource = casas;
            DropDownListCasaFarma.DataTextField = "nombre";
            DropDownListCasaFarma.DataValueField = "codigo";
            DropDownListCasaFarma.DataBind();
        }

        protected void btnAgregarProductoLote_Click(object sender, EventArgs e)
        {
            DataTable dtProductos = new DataTable();

            // Crear la estructura de la tabla si es la primera vez
            if (ViewState["ProductosLote"] != null)
            {
                dtProductos = (DataTable)ViewState["ProductosLote"];
            }
            else
            {
                dtProductos.Columns.Add("ProductoID", typeof(int)); // Asegúrate de agregar esta columna
                dtProductos.Columns.Add("Producto");
                dtProductos.Columns.Add("Cantidad");
                dtProductos.Columns.Add("Precio");
                dtProductos.Columns.Add("Descuento");
                dtProductos.Columns.Add("Subtotal");
                dtProductos.Columns.Add("FechaCaducidad");
            }

            // Añadir el producto actual
            DataRow dr = dtProductos.NewRow();
            dr["ProductoID"] = ddlProductoLote.SelectedValue; // ID del producto
            dr["Producto"] = ddlProductoLote.SelectedItem.Text;
            dr["Cantidad"] = txtCantidadLote.Text;
            dr["Precio"] = txtPrecioLote.Text;
            dr["Descuento"] = txtDescuentoLote.Text;
            dr["Subtotal"] = txtSubtotalLote.Text;
            dr["FechaCaducidad"] = txtFechaCaducidadLote.Text;
            dtProductos.Rows.Add(dr);

            // Actualizar el ViewState y el GridView
            ViewState["ProductosLote"] = dtProductos;
            gvProductosLote.DataSource = dtProductos;
            gvProductosLote.DataBind();

            // Actualizar el total del lote
            totalLote += Convert.ToDecimal(txtSubtotalLote.Text);
            txtTotalLote.Text = totalLote.ToString("F2");
        }

        protected void ddlProductoLote_TextChanged(object sender, EventArgs e)
        {
            // Obtener el ID del producto seleccionado
            int idProducto = Convert.ToInt32(ddlProductoLote.SelectedValue);

            // Consultar el precio del producto usando LINQ
            var producto = (from p in connec.Producto
                            where p.ID_Producto == idProducto
                            select p).FirstOrDefault();

            // Asignar el precio al TextBox
            txtPrecioLote.Text = producto != null ? producto.Precio_Venta.ToString("F2") : "0.00";
        }

        private void CalcularSubtotal()
        {
            // Validar los valores de cantidad, precio y descuento
            int cantidad = int.TryParse(txtCantidadLote.Text, out cantidad) ? cantidad : 0;
            decimal precio = decimal.TryParse(txtPrecioLote.Text, out precio) ? precio : 0;
            int descuento = int.TryParse(txtDescuentoLote.Text, out descuento) ? descuento : 0;

            // Calcular el subtotal
            decimal subtotal = (cantidad * precio) - descuento;
            txtSubtotalLote.Text = subtotal.ToString("F2");
        }

        protected void txtCantidadLote_TextChanged(object sender, EventArgs e)
        {
            CalcularSubtotal();
        }

        protected void txtDescuentoLote_TextChanged(object sender, EventArgs e)
        {
            CalcularSubtotal();
        }

        private void CalcularTotalLote()
        {
            decimal totalLote = 0;

            // Iterar sobre los productos añadidos y calcular el total
            foreach (GridViewRow row in gvProductosLote.Rows)
            {
                var txtSubtotalProducto = (TextBox)row.FindControl("txtSubtotalProducto");

                if (txtSubtotalProducto != null && decimal.TryParse(txtSubtotalProducto.Text, out decimal subtotalProducto))
                {
                    totalLote += subtotalProducto;
                }
            }

            // Mostrar el total del lote
            txtTotalLote.Text = totalLote.ToString("F2");
        }

        protected void gvProductosLote_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Eliminar")
            {
                // Convertir el argumento del comando (ProductoID) en un número entero
                int productoID = Convert.ToInt32(e.CommandArgument);

                // Obtener el DataTable desde el ViewState
                DataTable dtProductos = (DataTable)ViewState["ProductosLote"];

                // Buscar la fila que coincida con el ProductoID
                DataRow rowToDelete = dtProductos.AsEnumerable()
                                                 .FirstOrDefault(row => row.Field<int>("ProductoID") == productoID);

                // Si se encuentra la fila, eliminarla
                if (rowToDelete != null)
                {
                    dtProductos.Rows.Remove(rowToDelete);
                }

                // Actualizar el ViewState y el GridView después de la eliminación
                ViewState["ProductosLote"] = dtProductos;
                gvProductosLote.DataSource = dtProductos;
                gvProductosLote.DataBind();

                // Actualizar el total del lote
                ActualizarTotalLote();
            }
        }

        private void BindGridView()
        {
            gvProductosLote.DataSource = productosLote;
            gvProductosLote.DataBind();
        }

        private void ActualizarTotalLote()
        {
            decimal total = productosLote.Sum(p => p.Subtotal);
            txtTotalLote.Text = total.ToString("F2");
        }

        private List<Productos> ObtenerListaProductos()
        {
            return new List<Productos> {
                new Productos { ID_Producto = 1, NombreProducto = "Producto A", Precio = 10 },
                new Productos { ID_Producto = 2, NombreProducto = "Producto B", Precio = 20 }
            };
        }

        protected void txtTotalLote_TextChanged(object sender, EventArgs e)
        {

        }

        protected void txtSubtotalLote_TextChanged(object sender, EventArgs e)
        {
            CalcularTotalLote();
        }

        protected void btnGuardarLote_Click(object sender, EventArgs e)
        {

        }
    }

    public class ProductsLote
    {
        public int ProductoID { get; set; }
        public string Producto { get; set; }
        public int Cantidad { get; set; }
        public decimal Precio { get; set; }
        public decimal Descuento { get; set; }
        public decimal Subtotal { get; set; }
        public DateTime FechaCaducidad { get; set; }
    }

    public class Productos
    {
        public int ID_Producto { get; set; }
        public string NombreProducto { get; set; }
        public decimal Precio { get; set; }
    }
}
