using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PrisMegahHRSystem
{
    public partial class Home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void Page_PreInit(object sender, EventArgs e)
        {
            string userRole = Session["role"].ToString();

            if (userRole == "System Admin" || userRole == "Director")
                this.Page.MasterPageFile = "~/Master page/Director.master";
            else if (userRole == "Administrator")
                this.Page.MasterPageFile = "~/Master page/Admin.master";
            else if (userRole == "Accountant")
                this.Page.MasterPageFile = "~/Master page/Account.master";
        }
    }
}