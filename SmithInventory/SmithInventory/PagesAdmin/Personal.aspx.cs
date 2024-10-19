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
            if (string.IsNullOrWhiteSpace(txtUsuario.Text) ||
            string.IsNullOrWhiteSpace(txtPassword.Text))
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "showErrorMessageUser();", true);
                return;
            }
            else
            {
                try
                {
                    // Recuperar los valores ingresados
                    string nombreUsuario = txtUsuario.Text;
                    string password = txtPassword.Text;
                    bool estado = chkEstado.Checked;

                    // Crear un nuevo objeto de Usuario de la clase correspondiente
                    SmithInventory.DB.Usuario nuevoUsuario = new SmithInventory.DB.Usuario
                    {
                        Usuario1 = nombreUsuario,
                        Password = password,
                        Estado = estado,
                        Fecha_Creacion = DateTime.Now
                    };

                    // Usar el contexto para insertar el nuevo usuario en la base de datos
                    using (var contexto = new DCSmithDataContext(Global.CADENA))
                    {
                        contexto.Usuario.InsertOnSubmit(nuevoUsuario);
                        contexto.SubmitChanges();
                    }

                    // Mostrar mensaje de éxito y refrescar la lista de usuarios
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "showSuccessMessageUsuario();", true);
                    CargarUsuario(); // Método que refresca la lista de usuarios
                }
                catch (Exception ex)
                {
                    // Mostrar mensaje de error si algo sale mal
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "showErrorMessageUsuario();", true);
                }
            }

        }

        protected void ButtonGuardarPersonal_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrWhiteSpace(txtDPI.Text) ||
            string.IsNullOrWhiteSpace(txtPrimerNombre.Text) ||
                    string.IsNullOrWhiteSpace(txtSegundoNombre.Text) ||
                string.IsNullOrWhiteSpace(txtPrimerApellido.Text) ||
                string.IsNullOrWhiteSpace(txtSegundoApellido.Text) ||
                    string.IsNullOrWhiteSpace(txtDireccion.Text) ||
                string.IsNullOrWhiteSpace(txtTelefono.Text))
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "showErrorMessagePersonal();", true);
                return;
            }
            else
            {
                try
                {
                    // Recuperar los valores ingresados
                    string dpi = txtDPI.Text;
                    string pNombre = txtPrimerNombre.Text;
                    string sNombre = txtSegundoNombre.Text;
                    string pApellido = txtPrimerApellido.Text;
                    string sApellido = txtSegundoApellido.Text;
                    string direccion = txtDireccion.Text;
                    string telefono = txtTelefono.Text;

                    SmithInventory.DB.Personal nuevoPersonal = new SmithInventory.DB.Personal{ 
                              DPI = dpi,
                              Primer_Nombre = pNombre,
                              Segundo_Nombre = sNombre,
                              Primer_Apellido = pApellido,
                              Segundo_Apellido = sApellido,
                              Direccion = direccion,
                              Telefono = telefono
                    };
                    // Usar el contexto para insertar el nuevo usuario en la base de datos
                    using (var contexto = new DCSmithDataContext(Global.CADENA))
                    {
                        contexto.Personal.InsertOnSubmit(nuevoPersonal);
                        contexto.SubmitChanges();
                    }

                    // Mostrar mensaje de éxito y refrescar la lista de usuarios
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "showSuccessMessagePersonal();", true);
                    CargarPersonal(); // Método que refresca la lista de usuarios
                }
                catch (Exception ex)
                {
                    // Mostrar mensaje de error si algo sale mal
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "showErrorMessagePersonal();", true);
                }
            }
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
            gvUsuarios.EditIndex = -1;
            CargarUsuario(); 
        }

        protected void gvUsuarios_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvUsuarios.EditIndex = e.NewEditIndex;
            CargarUsuario();
        }

        protected void gvPersonal_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvPersonal.EditIndex = e.NewEditIndex;
            CargarPersonal();
        }

        protected void gvPersonal_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvPersonal.EditIndex = -1;
            CargarPersonal();
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