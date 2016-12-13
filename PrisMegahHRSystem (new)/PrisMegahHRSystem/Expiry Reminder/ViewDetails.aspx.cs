using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PrisMegahHRSystem
{
    public partial class ViewDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string position = Session["role"].ToString();
            if (position == "Director" || position == "System Admin" || position == "Administrator")
            {

            }
            else
            {
                Response.Redirect("../LogoutScreen.aspx");
            }
        }
    }
}