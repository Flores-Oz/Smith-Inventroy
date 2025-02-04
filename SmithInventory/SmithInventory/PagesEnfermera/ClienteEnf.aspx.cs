using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SmithInventory.PagesEnfermera
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        DB.DCSmithDataContext connec = new DB.DCSmithDataContext(Global.CADENA);
        private void CargarTipos()
        {
            var tip = from cl in connec.Tipo_Cliente
                      select new
                      {
                          ID = cl.id_Tipo,
                          Tipo = cl.Tipo_Cliente1
                      };
            ddlTipoCliente.DataSource = tip;
            ddlTipoCliente.DataTextField = "Tipo";
            ddlTipoCliente.DataValueField = "ID";
            ddlTipoCliente.DataBind();
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarTipos();
            }
        }

        protected void btnGuardarCliente_Click(object sender, EventArgs e)
        {
            try
            {
                var nuevoCliente = new DB.Cliente
                {
                    DPI = txtDPICliente.Text.Trim(),
                    Nombre_Completo = txtNombreCliente.Text.Trim(),
                    Telefono = txtTelefonoCliente.Text.Trim(),
                    Direccion = txtDireccionCliente.Text.Trim(),
                    id_Tipo = Convert.ToInt32(ddlTipoCliente.SelectedValue)
                };

                connec.Cliente.InsertOnSubmit(nuevoCliente);
                connec.SubmitChanges();
                ClientScript.RegisterStartupScript(this.GetType(), "showSuccess", "showSuccessMessageCliente();", true);
                Limpiar();
                
            }
            catch (Exception ex)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "showError", "showErrorMessageCliente1();", true);
            }
        }
        protected void Limpiar()
        {
            txtDPICliente.Text = string.Empty;
            txtNombreCliente.Text = string.Empty;
            txtTelefonoCliente.Text = string.Empty;
            txtDireccionCliente.Text = string.Empty;
        }
    }
}