using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SmithInventory
{
    public partial class _default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Session.Clear();
            }
        }

        protected void ButtonLogin_Click(object sender, EventArgs e)
        {
            string usuario = TextBoxUser.Text.Trim();
            string contraseña = TextBoxPass.Text.Trim();

            if (string.IsNullOrEmpty(usuario) || string.IsNullOrEmpty(contraseña))
            {
                // Muestra mensaje si los campos están vacíos
                ClientScript.RegisterStartupScript(this.GetType(), "showMessageProfAsign", "showMessageProfAsign();", true);
                return;
            }

            using (var context = new DB.DCSmithDataContext(Global.CADENA))
            {
                // Verificar en la tabla Usuario
                var usuarioDB = context.Usuario.FirstOrDefault(u => u.Usuario1 == usuario && u.Password == contraseña);

                if (usuarioDB != null)
                {
                    // Usuario encontrado, obtener el rol
                    int rol = usuarioDB.id_Rol;  // Suponiendo que el campo 'id_Rol' determina el rol del usuario

                    // Establecer la sesión con la información del usuario
                    Session["Usuario"] = usuarioDB.Usuario1;
                    Session["id_Usuario"] = usuarioDB.id_Usuario;

                    // Dependiendo del rol, redirigir a la página correspondiente
                    switch (rol)
                    {
                        case 1: // Administrador
                            Response.Redirect("PagesAdmin/Inicio.aspx");
                            break;

                        case 2: // Enfermeras
                            Response.Redirect("PagesEnfermera/InicioEnfermera.aspx");
                            break;

                        default:
                            // Redirigir a una página de error o un mensaje si el rol no es válido
                            ClientScript.RegisterStartupScript(this.GetType(), "showMessageCursoG", "showMessageCursoG();", true);
                            break;
                    }
                }
                else
                {
                    // Credenciales inválidas
                    ClientScript.RegisterStartupScript(this.GetType(), "showMessageCursoG", "showMessageCursoG();", true);
                }
            }

        }
    }
}