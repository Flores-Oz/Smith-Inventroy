using SmithInventory.DB;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SmithInventory.PagesAdmin
{
    public partial class OtrasSecciones : System.Web.UI.Page
    {
        DB.DCSmithDataContext Conn = new DB.DCSmithDataContext(Global.CADENA);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarCategorias();
                CargarFarmaceuticas();
                CargarRoles();
                CargarTipoCliente();
                CargarEstados();
            }
        }

        public void CargarCategorias()
        {
            var Categorias = from cat in Conn.Categoria
                             select cat;
            GridViewCategorias.DataSource = Categorias;
            GridViewCategorias.DataBind();
        }

        public void CargarFarmaceuticas()
        {
            var Farmaceuticas = from far in Conn.Casa_Farmaceutica
                             select far;
            GridViewCasaFarmaceutica.DataSource = Farmaceuticas;
            GridViewCasaFarmaceutica.DataBind();
        }

        public void CargarRoles()
        {
            var roles = from rol in Conn.Rol
                                select rol;
            GridViewRoles.DataSource = roles;
            GridViewRoles.DataBind();
        }

        public void CargarTipoCliente()
        {
            var tipoCliente = from clien in Conn.Tipo_Cliente
                        select clien;
            GridViewTipoCliente.DataSource = tipoCliente;
            GridViewTipoCliente.DataBind();
        }

        public void CargarEstados()
        {
            var estados = from est in Conn.Estados
                              select est;
            GridViewEstados.DataSource = estados;
            GridViewEstados.DataBind();
        }

        protected void ButtonGuardarCat_Click(object sender, EventArgs e)
        {
            //GuardarCategoria
            using (var contexto = new DCSmithDataContext(Global.CADENA))
            {
                // Crear una nueva instancia de la clase Categoria
                Categoria nuevaCategoria = new Categoria
                {
                    Nombre_Categoria = TextBoxNombreCategoria.Text,
                    Descripcion_Categoria = TextBoxDescripcionCat.Text
                };

                // Agregar la nueva categoría al contexto
                contexto.Categoria.InsertOnSubmit(nuevaCategoria);

                // Guardar los cambios en la base de datos
                contexto.SubmitChanges();

                // Limpiar los campos del formulario
                TextBoxNombreCategoria.Text = string.Empty;
                TextBoxDescripcionCat.Text = string.Empty;

                // Recargar las categorías para reflejar los cambios
                CargarCategorias();
            }
        }

        protected void GridViewCategorias_SelectedIndexChanged(object sender, EventArgs e)
        {
            //CargarCategorias

        }

        protected void GridViewCategorias_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            //CargarCategorias
            GridViewCategorias.PageIndex = e.NewPageIndex;
            CargarCategorias();
        }

        protected void GridViewCategorias_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridViewCategorias.EditIndex = e.NewEditIndex;
            CargarCategorias();
        }

        protected void GridViewCategorias_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridViewCategorias.EditIndex = -1;
            CargarCategorias();
        }

        protected void GridViewCategorias_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int idCategoria = Convert.ToInt32(GridViewCategorias.DataKeys[e.RowIndex].Value);

            // Obtener la fila actual que está siendo editada
            GridViewRow fila = GridViewCategorias.Rows[e.RowIndex];

            // Usar FindControl para obtener los valores de los TextBox
            TextBox txtNombre = (TextBox)fila.FindControl("txtNombreCategoria");
            TextBox txtDescripcion = (TextBox)fila.FindControl("txtDescripcionCategoria");

            string nuevoNombre = txtNombre.Text;
            string nuevaDescripcion = txtDescripcion.Text;

            using (var contexto = new DCSmithDataContext(Global.CADENA))
            {
                // Encontrar la categoría que se está editando
                var categoria = contexto.Categoria.FirstOrDefault(c => c.ID_Categoria == idCategoria);
                if (categoria != null)
                {
                    // Actualizar los valores
                    categoria.Nombre_Categoria = nuevoNombre;
                    categoria.Descripcion_Categoria = nuevaDescripcion;

                    // Guardar los cambios en la base de datos
                    contexto.SubmitChanges();
                }
            }

            // Salir del modo de edición
            GridViewCategorias.EditIndex = -1;
            CargarCategorias();
        }
    }
}