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
                CargarProductos();
                CargarCategorias();
            }
        }

        public void CargarProductos()
        {
            var Produc = from p in conn.Producto
                         select p;
            gvProducto.DataSource = Produc;
            gvProducto.DataBind();
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

        protected void gvProducto_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvProducto.EditIndex = e.NewEditIndex;
            CargarProductos();
        }

        protected void gvProducto_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvProducto.EditIndex = -1;
            CargarProductos();
        }

        protected void gvProducto_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            GridViewRow fila = gvProducto.Rows[e.RowIndex];

            // Obtener el ID del producto
            int idProducto = Convert.ToInt32(gvProducto.DataKeys[e.RowIndex].Value);

            // Obtener el nombre, precio y stock
            TextBox txtNombreProducto = (TextBox)fila.FindControl("txtNombreProducto");
            TextBox txtPrecio = (TextBox)fila.FindControl("txtPrecio");
            TextBox txtStock = (TextBox)fila.FindControl("txtStock");
            CheckBox chkEstadoEdit = (CheckBox)fila.FindControl("chkEstadoEdit");

            string nuevoNombre = txtNombreProducto.Text;
            decimal nuevoPrecio = Convert.ToDecimal(txtPrecio.Text);
            decimal nuevoPrecioCosto = Convert.ToDecimal(txtStock.Text);
            bool nuevoEstado = chkEstadoEdit.Checked;

            // Aquí puedes actualizar el producto en la base de datos
            using (var contexto = new DCSmithDataContext(Global.CADENA))
            {
                var producto = contexto.Producto.FirstOrDefault(p => p.ID_Producto == idProducto);
                if (producto != null)
                {
                    producto.Nombre_Producto = nuevoNombre;
                    producto.Precio_Venta = nuevoPrecio;
                    producto.Precio_Costo = nuevoPrecioCosto;
                    producto.Estado = nuevoEstado; // Asignar el nuevo estado
                    contexto.SubmitChanges();
                }
            }
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "showUpdateMessageProducto();", true);
            gvProducto.EditIndex = -1;
            CargarProductos();

        }

        protected void gvProducto_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvProducto.PageIndex = e.NewPageIndex;
            CargarProductos();
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
                    CargarProductos();
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