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
        private void CargarClientes()
        {
            var client = from cl in connec.Cliente
                         select cl;
            gvClientes.DataSource = client;
            gvClientes.DataBind();
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarClientes(); // Cargar clientes en el GridView al cargar la página
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
                CargarClientes(); // Recargar el GridView
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
        protected void gvClientes_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvClientes.EditIndex = e.NewEditIndex;
            CargarClientes();
        }

        protected void gvClientes_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {
                int idCliente = Convert.ToInt32(gvClientes.DataKeys[e.RowIndex].Value);
                var cliente = connec.Cliente.FirstOrDefault(c => c.ID_Cliente == idCliente);

                if (cliente != null)
                {
                    cliente.DPI = ((TextBox)gvClientes.Rows[e.RowIndex].Cells[1].Controls[0]).Text;
                    cliente.Nombre_Completo = ((TextBox)gvClientes.Rows[e.RowIndex].Cells[2].Controls[0]).Text;
                    cliente.Telefono = ((TextBox)gvClientes.Rows[e.RowIndex].Cells[3].Controls[0]).Text;
                    cliente.Direccion = ((TextBox)gvClientes.Rows[e.RowIndex].Cells[4].Controls[0]).Text;
                    cliente.id_Tipo = Convert.ToInt32(((TextBox)gvClientes.Rows[e.RowIndex].Cells[5].Controls[0]).Text);

                    connec.SubmitChanges();
                    ClientScript.RegisterStartupScript(this.GetType(), "showSuccess", "showSuccessMessageCliente();", true);
                }
                else
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "showError", "showErrorMessageCliente();", true);
                }

                gvClientes.EditIndex = -1;
                CargarClientes();
            }
            catch (Exception)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "showError", "showErrorMessageCliente();", true);
            }
        }

        protected void gvClientes_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvClientes.EditIndex = -1;
            CargarClientes();
        }
    }
}