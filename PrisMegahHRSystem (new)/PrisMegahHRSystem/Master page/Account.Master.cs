using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PrisMegahHRSystem.Master_page
{
    public partial class Account : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["id"] == null)
                Response.Redirect("LogoutScreen.aspx");
            else
            {
                string user = Session["id"].ToString();
                string position = Session["role"].ToString();
                lblUserID.Text = user + " (" + position + ")";
            }
        }

        protected void ibtnLogout_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("~/LogoutScreen.aspx");
        }
    }
}