using SmithInventory.DB;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
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

        protected void GridViewCasaFarmaceutica_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void GridViewCasaFarmaceutica_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridViewCasaFarmaceutica.PageIndex = e.NewPageIndex;
            CargarFarmaceuticas();
        }

        protected void GridViewCasaFarmaceutica_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridViewCasaFarmaceutica.EditIndex = e.NewEditIndex;
            CargarFarmaceuticas();
        }

        protected void GridViewCasaFarmaceutica_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridViewCasaFarmaceutica.EditIndex = -1;
            CargarFarmaceuticas();
        }

        protected void GridViewCasaFarmaceutica_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int idCasaFarmaceutica = Convert.ToInt32(GridViewCasaFarmaceutica.DataKeys[e.RowIndex].Value);

            GridViewRow fila = GridViewCasaFarmaceutica.Rows[e.RowIndex];

            TextBox txtCasaFarmaceutica = (TextBox)fila.FindControl("txtCasaFarmaceutica");
            TextBox txtDetalle = (TextBox)fila.FindControl("txtDetalle");

            string nuevoNombre = txtCasaFarmaceutica.Text;
            string nuevoDetalle = txtDetalle.Text;

            using (var contexto = new DCSmithDataContext(Global.CADENA))
            {
                var casaFarmaceutica = contexto.Casa_Farmaceutica.FirstOrDefault(c => c.ID_CasaFarmaceutica == idCasaFarmaceutica);
                if (casaFarmaceutica != null)
                {
                    casaFarmaceutica.Casa_Farmaceutica1 = nuevoNombre;
                    casaFarmaceutica.Detalle = nuevoDetalle;
                    contexto.SubmitChanges();
                }
            }

            GridViewCasaFarmaceutica.EditIndex = -1;
            CargarFarmaceuticas();
        }

        protected void GridViewRoles_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void GridViewRoles_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridViewRoles.PageIndex = e.NewPageIndex;
            CargarRoles();
        }

        protected void GridViewRoles_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridViewRoles.EditIndex = e.NewEditIndex;
            CargarRoles();
        }

        protected void GridViewRoles_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridViewRoles.EditIndex = -1;
            CargarRoles();
        }

        protected void GridViewRoles_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int idRol = Convert.ToInt32(GridViewRoles.DataKeys[e.RowIndex].Value);

            GridViewRow fila = GridViewRoles.Rows[e.RowIndex];

            TextBox txtPermiso = (TextBox)fila.FindControl("txtPermiso");
            TextBox txtDescripcionRol = (TextBox)fila.FindControl("txtDescripcionRol");

            int nuevoPermiso = Convert.ToInt16(txtPermiso.Text);
            string nuevaDescripcion = txtDescripcionRol.Text;

            using (var contexto = new DCSmithDataContext(Global.CADENA))
            {
                var rol = contexto.Rol.FirstOrDefault(r => r.id_Rol == idRol);
                if (rol != null)
                {
                    rol.Permiso = nuevoPermiso;
                    rol.Descripcion = nuevaDescripcion;
                    contexto.SubmitChanges();
                }
            }

            GridViewRoles.EditIndex = -1;
            CargarRoles();
        }

        protected void GridViewTipoCliente_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void GridViewTipoCliente_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {

        }

        protected void GridViewTipoCliente_RowEditing(object sender, GridViewEditEventArgs e)
        {

        }

        protected void GridViewTipoCliente_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {

        }

        protected void GridViewTipoCliente_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int idTipoCliente = Convert.ToInt32(GridViewTipoCliente.DataKeys[e.RowIndex].Value);

            GridViewRow fila = GridViewTipoCliente.Rows[e.RowIndex];

            TextBox txtTipoCliente = (TextBox)fila.FindControl("txtTipoCliente");

            string nuevoTipoCliente = txtTipoCliente.Text;

            using (var contexto = new DCSmithDataContext(Global.CADENA))
            {
                var tipoCliente = contexto.Tipo_Cliente.FirstOrDefault(tc => tc.id_Tipo == idTipoCliente);
                if (tipoCliente != null)
                {
                    tipoCliente.Tipo_Cliente1 = nuevoTipoCliente;
                    contexto.SubmitChanges();
                }
            }

            GridViewTipoCliente.EditIndex = -1;
            CargarTipoCliente();
        }

        protected void GridViewEstados_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void GridViewEstados_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {

        }

        protected void GridViewEstados_RowEditing(object sender, GridViewEditEventArgs e)
        {

        }

        protected void GridViewEstados_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {

        }

        protected void GridViewEstados_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int idEstado = Convert.ToInt32(gvEstados.DataKeys[e.RowIndex].Value);

            GridViewRow fila = gvEstados.Rows[e.RowIndex];

            TextBox txtEstado = (TextBox)fila.FindControl("txtEstado");

            string nuevoEstado = txtEstado.Text;

            using (var contexto = new DCSmithDataContext(Global.CADENA))
            {
                var estado = contexto.Estados.FirstOrDefault(es => es.ID_Estado == idEstado);
                if (estado != null)
                {
                    estado.Estado = nuevoEstado;
                    contexto.SubmitChanges();
                }
            }

            gvEstados.EditIndex = -1;
            CargarEstados();
        }
    }
}