using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

namespace SmithInventory.PagesAdmin
{
    public partial class Reportes : System.Web.UI.Page
    {
        DB.DCSmithDataContext connec = new DB.DCSmithDataContext(Global.CADENA);
        /*Cargas*/
        private void CargarProducto()
        {
            var product = from pro in connec.Producto
                          select pro;
            gvReportes.DataSource = product;
            gvReportes.DataBind();
        }
        private void CargarMiembros()
        {
            var per = from pers in connec.Personal
                      select pers;
            gvReportes.DataSource = per;
            gvReportes.DataBind();
        }

        public class Item
        {
            public int Id { get; set; }
            public string Name { get; set; }
        }
        public void CargarDrown()
        {
            var repo = from r in connec.Reportes
                       select r;
            ddlReportes.DataSource = repo;
            ddlReportes.DataTextField = "Reporte1";
            ddlReportes.DataValueField = "id_Reporte";
            ddlReportes.DataBind();
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarDrown();
                SeleccionarReportes();
            }
        }
        private void SeleccionarReportes()
        {
            try
            {
                int valor = Convert.ToInt16(ddlReportes.SelectedIndex);
                switch (valor)
                {
                    case 0:
                        TextBoxBuscar.Text = "";
                        break;
                    case 1:
                        TextBoxBuscar.Text = "Buscar por ID Producto o Nombre del Producto";
                        CargarProducto();
                        break;
                    case 2:
                        TextBoxBuscar.Text = "Buscar por ID Personal o Nombre del Personal";
                        CargarMiembros();
                        break;
                }
            }
            catch { }
        }

        protected void ddlReportes_TextChanged(object sender, EventArgs e)
        {
            try
            {
                int valor = Convert.ToInt16(ddlReportes.SelectedIndex);
                switch (valor)
                {
                    case 0:
                        TextBoxBuscar.Text = "";
                        break;
                    case 1:
                        TextBoxBuscar.Text = "Buscar por ID Producto o Nombre del Producto";
                        CargarProducto();
                        break;
                    case 2:
                        TextBoxBuscar.Text = "Buscar por ID Personal o Nombre del Personal";
                        CargarMiembros();
                        break;
                }
            }
            catch { }
        }
    }
}