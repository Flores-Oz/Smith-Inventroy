using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SmithInventory.MasterPages
{
    public partial class SiteEnfermera : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Label2.Text = Session["id_Usuario"].ToString();
            Label1.Text = Session["Usuario"].ToString();
        }

        protected void ButtonLogOut_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("../default.aspx");
        }
    }
}