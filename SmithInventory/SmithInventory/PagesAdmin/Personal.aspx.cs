using SmithInventory.DB;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SmithInventory.PagesAdmin
{
    public partial class Personal : System.Web.UI.Page
    {
        DCSmithDataContext conn = new DCSmithDataContext(Global.CADENA);
        //Cargas
        public void CargarUsuario()
        {
            var users = from us in conn.Usuario
                        select us;
            gvUsuarios.DataSource = users;
            gvUsuarios.DataBind();
        }
        public void CargarPersonal()
        {
            var per = from p in conn.Personal
                      select p;
            gvPersonal.DataSource = per;
            gvPersonal.DataBind();
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarPersonal();
                CargarUsuario();
            }
        }

        protected void ButtonGuardarUser_Click(object sender, EventArgs e)
        {

        }

        protected void ButtonGuardarPersonal_Click(object sender, EventArgs e)
        {

        }

        protected void gvUsuarios_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int idUsuario = Convert.ToInt32(gvUsuarios.DataKeys[e.RowIndex].Value);

            GridViewRow fila = gvUsuarios.Rows[e.RowIndex];

            TextBox txtUsuario = (TextBox)fila.FindControl("txtUsuario");
            TextBox txtPassword = (TextBox)fila.FindControl("txtPassword");
            CheckBox chkEstadoEdit = (CheckBox)fila.FindControl("chkEstadoEdit");
            TextBox txtFechaCreacion = (TextBox)fila.FindControl("txtFechaCreacion");

            string nuevoUsuario = txtUsuario.Text;
            string nuevoPassword = txtPassword.Text;
            bool nuevoEstado = chkEstadoEdit.Checked;
            DateTime nuevaFechaCreacion = DateTime.Parse(txtFechaCreacion.Text);

            using (var contexto = new DCSmithDataContext(Global.CADENA))
            {
                var usuario = contexto.Usuario.FirstOrDefault(u => u.id_Usuario == idUsuario);
                if (usuario != null)
                {
                    usuario.Usuario1 = nuevoUsuario;
                    usuario.Password = nuevoPassword;
                    usuario.Estado = nuevoEstado;
                    usuario.Fecha_Creacion = nuevaFechaCreacion;
                    contexto.SubmitChanges();
                }
            }

            gvUsuarios.EditIndex = -1;
            CargarUsuario();
        }

        protected void gvUsuarios_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {

        }

        protected void gvUsuarios_RowEditing(object sender, GridViewEditEventArgs e)
        {

        }

        protected void gvPersonal_RowEditing(object sender, GridViewEditEventArgs e)
        {

        }

        protected void gvPersonal_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {

        }

        protected void gvPersonal_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int idPersonal = Convert.ToInt32(gvPersonal.DataKeys[e.RowIndex].Value);

            GridViewRow fila = gvPersonal.Rows[e.RowIndex];

            // Obtener los valores ingresados en los campos de la fila seleccionada
            TextBox txtNombrePersonal = (TextBox)fila.FindControl("txtNombrePersonal");
            TextBox txtSegundoNombre = (TextBox)fila.FindControl("txtSegundoNombre");
            TextBox txtApellidoPersonal = (TextBox)fila.FindControl("txtApellidoPersonal");
            TextBox txtSegundoApellido = (TextBox)fila.FindControl("txtSegundoApellido");
            TextBox txtDPI = (TextBox)fila.FindControl("txtDPI");
            TextBox txtDireccion = (TextBox)fila.FindControl("txtDireccion");
            TextBox txtTelefono = (TextBox)fila.FindControl("txtTelefono");
            // Asignar los valores a las variables correspondientes
            string nuevoNombre = txtNombrePersonal.Text;
            string nuevoNombre2 = txtSegundoNombre.Text;
            string nuevoApellido = txtApellidoPersonal.Text;
            string nuevoApellido2 = txtSegundoApellido.Text;
            string nuevoDPI = txtDPI.Text;
            string nuevaDireccion = txtDireccion.Text;
            string nuevoTelefono = txtTelefono.Text;

            using (var contexto = new DCSmithDataContext(Global.CADENA))
            {
                // Buscar el registro de personal correspondiente
                var personal = contexto.Personal.FirstOrDefault(p => p.id_Personal == idPersonal);
                if (personal != null)
                {
                    // Actualizar los valores del personal
                    personal.DPI = nuevoDPI;
                    personal.Primer_Nombre = nuevoNombre;
                    personal.Segundo_Nombre = nuevoNombre2;
                    personal.Primer_Apellido = nuevoApellido;
                    personal.Segundo_Apellido = nuevoApellido2;
                    personal.Direccion = nuevaDireccion;
                    personal.Telefono = nuevoTelefono;
                    // Guardar los cambios
                    contexto.SubmitChanges();
                }
            }

            // Cancelar el modo de edición y recargar la lista de personal
            gvPersonal.EditIndex = -1;
            CargarPersonal();

        }
    }
}