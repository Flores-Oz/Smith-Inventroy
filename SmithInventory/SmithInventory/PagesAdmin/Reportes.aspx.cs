using SmithInventory.PagesAdmin.PDFs;
using System;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SmithInventory.PagesAdmin
{
    public partial class Reportes : System.Web.UI.Page
    {
        DB.DCSmithDataContext connec = new DB.DCSmithDataContext(Global.CADENA);

        /* Cargar productos en el GridView */
        private void CargarProducto()
        {
            var product = from pro in connec.Vista_Productos
                          select pro;
            gvReportes.DataSource = product;
            gvReportes.DataBind();
        }

        /* Cargar personal en el GridView */
        private void CargarMiembros()
        {
            var per = from pers in connec.Personal
                      select pers;
            gvReportes.DataSource = per;
            gvReportes.DataBind();
        }

        /*HistorialIngresoLotes*/
        private void CargarHistorialIngrsoLotes()
        {
            var per = from pers in connec.Vista_HistorialIngresoLotes
                      select pers;
            gvReportes.DataSource = per;
            gvReportes.DataBind();
        }

        /*HistorialVentaCliente*/
        private void CargarHistorialVentaClientes()
        {
            var per = from pers in connec.Vista_HistorialVentaClientes
                      select pers;
            gvReportes.DataSource = per;
            gvReportes.DataBind();
        }

        /*LoteIng*/
        private void CargarLoteIng()
        {
            var per = from pers in connec.Vista_LoteIngs
                      select pers;
            gvReportes.DataSource = per;
            gvReportes.DataBind();
        }

        /*VentaDetalle*/
        private void CargarVentaDetalle()
        {
            var per = from pers in connec.Vista_VentaDetalles
                      select pers;
            gvReportes.DataSource = per;
            gvReportes.DataBind();
        }

        /* Cargar datos en DropDownList */
        public void CargarDropDown()
        {
            var repo = from r in connec.Reportes
                       select r;
            ddlReportes.DataSource = repo;
            ddlReportes.DataTextField = "Reporte1";
            ddlReportes.DataValueField = "id_Reporte";
            ddlReportes.DataBind();

            // Añadir un primer ítem vacío o de selección predeterminada
            ddlReportes.Items.Insert(0, new ListItem("-- Seleccione un reporte --", "0"));
        }

        /* Manejo al cargar la página */
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarDropDown();
                SeleccionarReportes();
            }
        }

        /* Selección de reportes y carga en GridView */
        private void SeleccionarReportes()
        {
            try
            {
                int valor = Convert.ToInt32(ddlReportes.SelectedValue);

                // Dependiendo del valor seleccionado en el DropDownList, muestra los datos
                switch (valor)
                {
                    case 0:
                        TextBoxBuscar.Text = "";
                        gvReportes.DataSource = null;
                        gvReportes.DataBind();
                        break;
                    case 1:
                        TextBoxBuscar.Text = "Buscar por ID Producto o Nombre del Producto";
                        CargarProducto();
                        break;
                    case 2:
                        TextBoxBuscar.Text = "Buscar por ID Personal o Nombre del Personal";
                        CargarMiembros();
                        break;
                    case 3:
                        TextBoxBuscar.Text = "Buscar";
                        CargarHistorialIngrsoLotes();
                        break;
                    case 4:
                        TextBoxBuscar.Text = "Buscar";
                        CargarHistorialVentaClientes();
                        break;
                    case 5:
                        TextBoxBuscar.Text = "Buscar";
                        CargarLoteIng();
                        break;
                    case 6:
                        TextBoxBuscar.Text = "Buscar";
                        CargarVentaDetalle();
                        break;
                    default:
                        TextBoxBuscar.Text = "";
                        gvReportes.DataSource = null;
                        gvReportes.DataBind();
                        break;
                }
            }
            catch (Exception ex)
            {
                // Manejo de excepciones (puedes agregar un log si es necesario)
                TextBoxBuscar.Text = "Error al cargar los reportes.";
            }
        }

        /* Evento cuando cambia la selección del DropDownList */
        protected void ddlReportes_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                SeleccionarReportes();
            }
            catch (Exception ex)
            {
                // Manejo de excepciones
                TextBoxBuscar.Text = "Error al cambiar el reporte.";
            }
        }

        protected void btnEnviar_Click(object sender, EventArgs e)
        {
            string reporte = ddlReportes.SelectedItem.ToString();
            string nombreArchivo = reporte.Replace(" ", "") + DateTime.Now.ToString("yyyyMMdd") + ".pdf";

            // Pasar el GridView actual y generar el PDF
            MenuPDF menuPDF = new MenuPDF(reporte, nombreArchivo, gvReportes);
            menuPDF.DescargarPDF();
        }
    }
}
