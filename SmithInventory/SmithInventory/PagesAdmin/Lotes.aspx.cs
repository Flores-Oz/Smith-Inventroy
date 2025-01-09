using SmithInventory.DB;
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
                //CargarProductos2();
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
        public void Limpiar()
        {
            txtCantidadLote.Text = string.Empty;
            txtPrecioLote.Text = string.Empty;
            txtDescuentoLote.Text = string.Empty;
            txtSubtotalLote.Text = string.Empty;
            txtFechaCaducidadLote.Text = string.Empty;
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
                dtProductos.Columns.Add("Cantidad", typeof(int));
                dtProductos.Columns.Add("Precio");
                dtProductos.Columns.Add("Descuento");
                dtProductos.Columns.Add("Subtotal");
                dtProductos.Columns.Add("FechaCaducidad");
            }

            // Añadir el producto actual
            //Debo de meter un try catch
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
            Limpiar();
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
            try
            {
                using (var db = new DCSmithDataContext(Global.CADENA))
                {
                    // Crear el objeto del nuevo lote
                    var nuevoLote = new Lote_Ingreso
                    {
                        ID_CasaFarmaceutica = Convert.ToInt32(DropDownListCasaFarma.SelectedValue),
                        Fecha_Ingreso = DateTime.Now, // Fecha actual
                        Estado = true, // Cambiar según tu lógica
                        Descuento = string.IsNullOrEmpty(txtDescuentoLote.Text) ? (int?)null : Convert.ToInt32(txtDescuentoLote.Text),
                        Total_Lote = Convert.ToDecimal(txtTotalLote.Text),
                        id_Usuario = Convert.ToInt16(Session["id_Usuario"]) // ID del usuario actual
                    };

                    // Insertar el nuevo lote
                    db.Lote_Ingreso.InsertOnSubmit(nuevoLote);
                    db.SubmitChanges(); // Guardar para que se genere el id_Lote automáticamente

                    // Ahora el nuevoLote.id_Lote contiene el ID generado por la base de datos
                    int idLoteGenerado = nuevoLote.id_Lote;

                    // Guardar los detalles del lote
                    GuardarDetalleLote(idLoteGenerado, db);

                    // Mensaje de éxito
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "showSuccessMessageLote();", true);
                    gvProductosLote.DataSource = null;
                    gvProductosLote.DataBind();
                    txtTotalLote.Text = "";
                    //lblMensaje.Text = "Lote guardado exitosamente.";
                }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "showErrorMessageLote();", true);
                //lblMensaje.Text = "Ocurrió un error al guardar el lote: " + ex.Message;
            }
        }

        private void GuardarDetalleLote(int idLote, DB.DCSmithDataContext db)
        {
            try
            {
                foreach (GridViewRow fila in gvProductosLote.Rows)
                {
                    // Obtener los controles de la fila
                    TextBox txtCantidad = fila.FindControl("txtCantidad") as TextBox;
                    TextBox txtPrecio = fila.FindControl("txtPrecio") as TextBox;
                    TextBox txtFechaCaducidad = fila.FindControl("txtFechaCaducidad") as TextBox;
                    TextBox txtDescuento = fila.FindControl("txtDescuento") as TextBox;

                    // Verificar si los controles no son nulos
                    if (txtCantidad != null && txtPrecio != null && txtFechaCaducidad != null)
                    {
                        // Obtener los valores de cada fila del GridView
                        int idProducto = Convert.ToInt32(gvProductosLote.DataKeys[fila.RowIndex].Value);
                        int cantidad = Convert.ToInt32(txtCantidad.Text);
                        decimal precio = Convert.ToDecimal(txtPrecio.Text);
                        decimal subtotal = cantidad * precio;
                        DateTime fechaCaducidad = Convert.ToDateTime(txtFechaCaducidad.Text);
                        int? descuento = string.IsNullOrEmpty(txtDescuento.Text) ? (int?)null : Convert.ToInt32(txtDescuento.Text);

                        // Crear el objeto del detalle del lote
                        var nuevoDetalleLote = new Detalle_Lote_Ingreso
                        {
                            id_Lote = idLote,
                            ID_Producto = idProducto,
                            Cantidad = cantidad,
                            Precio = precio,
                            SubTotal = subtotal,
                            Fecha_Caducida = fechaCaducidad,
                            Descuento = descuento
                        };

                        // Insertar el detalle en la base de datos
                        db.Detalle_Lote_Ingreso.InsertOnSubmit(nuevoDetalleLote);
                    }
                }

                // Guardar los cambios en la base de datos
                db.SubmitChanges();

                // Mensaje de éxito
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "showSuccessMessageDetLote();", true);
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "showErrorMessageDetLote();", true);
            }
        }

        private void CalcularTotalLotes()
        {
            decimal totalVenta = 0;

            foreach (GridViewRow fila in gvProductosLote.Rows)
            {
                // Obtener el índice de la columna "Subtotal" en el GridView
                int subtotalIndex = gvProductosLote.Columns.Cast<DataControlField>()
                                       .ToList()
                                       .FindIndex(col => col.HeaderText == "Subtotal");

                if (subtotalIndex != -1)
                {
                    // Obtener el valor de la celda en la columna de Subtotal y convertirlo a decimal
                    decimal subtotal = 0;
                    if (decimal.TryParse(fila.Cells[subtotalIndex].Text, out subtotal))
                    {
                        totalVenta += subtotal;
                    }
                }
            }

            // Actualizar el campo de total con el valor calculado
            txtTotalLote.Text = totalVenta.ToString("F2");
        }

        protected void ButtonCalcular_Click(object sender, EventArgs e)
        {
            CalcularTotalLotes();
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
