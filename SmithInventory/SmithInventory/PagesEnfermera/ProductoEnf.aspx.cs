using SmithInventory.DB;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SmithInventory.PagesEnfermera
{
    public partial class Producto : System.Web.UI.Page
    {
        DB.DCSmithDataContext conn = new DB.DCSmithDataContext(Global.CADENA);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
               
                CargarCategorias();
            }
        }

        public void Limpiar()
        {
            txtNombreProducto.Text = string.Empty;
            txtPrecioCosto.Text = string.Empty;
            txtPrecioVenta.Text = string.Empty;
        }

        public void CargarCategorias()
        {
            var Cate = from cat in conn.Categoria
                       select new
                       {
                           id_categoria = cat.ID_Categoria,
                           categoria = cat.Nombre_Categoria
                       };
            ddlCategoria.DataSource = Cate;
            ddlCategoria.DataTextField = "categoria";
            ddlCategoria.DataValueField = "id_categoria";
            ddlCategoria.DataBind();
        }

        protected void ButtonGuardarProducto_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrWhiteSpace(txtNombreProducto.Text) ||
        string.IsNullOrWhiteSpace(txtPrecioCosto.Text) ||
        string.IsNullOrWhiteSpace(txtPrecioVenta.Text) ||
        ddlCategoria.SelectedValue == null)
            {
                // Mostrar mensaje de error si algún campo está vacío
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "showErrorMessageProducto();", true);
                return;
            }
            else
            {

                try
                {
                    // Recuperar los valores ingresados
                    string nombreProducto = txtNombreProducto.Text;
                    decimal precioCosto = Convert.ToDecimal(txtPrecioCosto.Text);
                    decimal precioVenta = Convert.ToDecimal(txtPrecioVenta.Text);
                    int idCategoria = Convert.ToInt32(ddlCategoria.SelectedValue);
                    bool estado = chkEstado.Checked;

                    // Crear un nuevo objeto de Producto de la clase correcta
                    SmithInventory.DB.Producto nuevoProducto = new SmithInventory.DB.Producto
                    {
                        Nombre_Producto = nombreProducto,
                        Precio_Costo = precioCosto,
                        Precio_Venta = precioVenta,
                        ID_Categoria = idCategoria,
                        Estado = estado
                    };

                    using (var contexto = new DCSmithDataContext(Global.CADENA))
                    {
                        contexto.Producto.InsertOnSubmit(nuevoProducto);
                        contexto.SubmitChanges();
                    }

                    // Mostrar mensaje de éxito y refrescar la lista
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "showSuccessMessageProducto();", true);
                    Limpiar();
                }
                catch (Exception ex)
                {
                    // Mostrar mensaje de error si algo sale mal
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "showErrorMessageProducto();", true);
                }
            }
        }

    }
}