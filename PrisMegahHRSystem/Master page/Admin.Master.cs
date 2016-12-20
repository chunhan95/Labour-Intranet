using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Text;

namespace PrisMegahHRSystem.Master_page
{
    public partial class Admin : System.Web.UI.MasterPage
    {
        SqlDataReader reader;
        String connString = System.Configuration.ConfigurationManager.ConnectionStrings["PrisMegahConnString"].ToString();
        SqlConnection conn = null;

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

            have90Days();
            have60Days();
            have30Days();
            expired();
        }

        public void have90Days()
        {
            string user = Session["id"].ToString();
            conn = new SqlConnection(connString);
            conn.Open();

            String queryStr = "";
            queryStr = "SELECT (SELECT COUNT(*) FROM workerDetails INNER JOIN permitCompany_List ON (workerDetails.PLKSCompany=permitCompany_List.companyName)" +
                " INNER JOIN userDetails ON (permitCompany_List.PIC1=userDetails.name OR permitCompany_List.PIC2=userDetails.name OR permitCompany_List.PIC3=userDetails.name OR permitCompany_List.PIC4=userDetails.name) WHERE (DATEDIFF(day, FORMAT(GETDATE(),'yyyy-MM-dd'), FORMAT(passportExp,'yyyy-MM-dd')) <= 90 AND DATEDIFF(day, FORMAT(GETDATE(),'yyyy-MM-dd'), FORMAT(passportExp,'yyyy-MM-dd')) > 60) AND workerStatus='Available' AND userDetails.loginID=('" + user + "'))" +
                " + (SELECT COUNT(*) FROM workerDetails INNER JOIN permitCompany_List ON (workerDetails.PLKSCompany=permitCompany_List.companyName)" +
                " INNER JOIN userDetails ON (permitCompany_List.PIC1=userDetails.name OR permitCompany_List.PIC2=userDetails.name OR permitCompany_List.PIC3=userDetails.name OR permitCompany_List.PIC4=userDetails.name) WHERE (DATEDIFF(day, FORMAT(GETDATE(),'yyyy-MM-dd'), FORMAT(PLKSExp,'yyyy-MM-dd')) <= 90 AND DATEDIFF(day, FORMAT(GETDATE(),'yyyy-MM-dd'), FORMAT(PLKSExp,'yyyy-MM-dd')) > 60) AND workerStatus='Available' AND userDetails.loginID=('" + user + "')) AS rec_count";
            SqlCommand cmd = new SqlCommand(queryStr, conn);
            reader = cmd.ExecuteReader();

            while (reader.Read())
            {
                lbl90days.Text = reader["rec_count"].ToString();
            }
            reader.Close();
            conn.Close();
        }

        public void have60Days()
        {
            string user = Session["id"].ToString();
            conn = new SqlConnection(connString);
            conn.Open();

            String queryStr = "";
            queryStr = "SELECT (SELECT COUNT(*) FROM workerDetails INNER JOIN permitCompany_List ON (workerDetails.PLKSCompany=permitCompany_List.companyName)" +
                " INNER JOIN userDetails ON (permitCompany_List.PIC1=userDetails.name OR permitCompany_List.PIC2=userDetails.name OR permitCompany_List.PIC3=userDetails.name OR permitCompany_List.PIC4=userDetails.name) WHERE (DATEDIFF(day, FORMAT(GETDATE(),'yyyy-MM-dd'), FORMAT(passportExp,'yyyy-MM-dd')) <= 60 AND DATEDIFF(day, FORMAT(GETDATE(),'yyyy-MM-dd'), FORMAT(passportExp,'yyyy-MM-dd')) > 30) AND workerStatus='Available' AND userDetails.loginID=('" + user + "'))" +
                " + (SELECT COUNT(*) FROM workerDetails INNER JOIN permitCompany_List ON (workerDetails.PLKSCompany=permitCompany_List.companyName)" +
                " INNER JOIN userDetails ON (permitCompany_List.PIC1=userDetails.name OR permitCompany_List.PIC2=userDetails.name OR permitCompany_List.PIC3=userDetails.name OR permitCompany_List.PIC4=userDetails.name) WHERE (DATEDIFF(day, FORMAT(GETDATE(),'yyyy-MM-dd'), FORMAT(PLKSExp,'yyyy-MM-dd')) <= 60 AND DATEDIFF(day, FORMAT(GETDATE(),'yyyy-MM-dd'), FORMAT(PLKSExp,'yyyy-MM-dd')) > 30) AND workerStatus='Available' AND userDetails.loginID=('" + user + "')) AS rec_count";
            SqlCommand cmd = new SqlCommand(queryStr, conn);
            reader = cmd.ExecuteReader();

            while (reader.Read())
            {
                lbl60days.Text = (reader["rec_count"].ToString());
            }
            reader.Close();
            conn.Close();
        }

        public void have30Days()
        {
            string user = Session["id"].ToString();
            conn = new SqlConnection(connString);
            conn.Open();

            String queryStr = "";
            queryStr = "SELECT (SELECT COUNT(*) FROM workerDetails INNER JOIN permitCompany_List ON (workerDetails.PLKSCompany=permitCompany_List.companyName)" +
                " INNER JOIN userDetails ON (permitCompany_List.PIC1=userDetails.name OR permitCompany_List.PIC2=userDetails.name OR permitCompany_List.PIC3=userDetails.name OR permitCompany_List.PIC4=userDetails.name) WHERE (DATEDIFF(day, FORMAT(GETDATE(),'yyyy-MM-dd'), FORMAT(passportExp,'yyyy-MM-dd')) <= 30 AND DATEDIFF(day, FORMAT(GETDATE(),'yyyy-MM-dd'), FORMAT(passportExp,'yyyy-MM-dd')) > 0) AND workerStatus='Available' AND userDetails.loginID=('" + user + "'))" +
                " + (SELECT COUNT(*) FROM workerDetails INNER JOIN permitCompany_List ON (workerDetails.PLKSCompany=permitCompany_List.companyName)" +
                " INNER JOIN userDetails ON (permitCompany_List.PIC1=userDetails.name OR permitCompany_List.PIC2=userDetails.name OR permitCompany_List.PIC3=userDetails.name OR permitCompany_List.PIC4=userDetails.name) WHERE (DATEDIFF(day, FORMAT(GETDATE(),'yyyy-MM-dd'), FORMAT(PLKSExp,'yyyy-MM-dd')) <= 30 AND DATEDIFF(day, FORMAT(GETDATE(),'yyyy-MM-dd'), FORMAT(PLKSExp,'yyyy-MM-dd')) > 0) AND workerStatus='Available' AND userDetails.loginID=('" + user + "')) AS rec_count";
            SqlCommand cmd = new SqlCommand(queryStr, conn);
            reader = cmd.ExecuteReader();

            while (reader.Read())
            {
                lbl30days.Text = (reader["rec_count"].ToString());
            }
            reader.Close();
            conn.Close();
        }

        public void expired()
        {
            string user = Session["id"].ToString();
            conn = new SqlConnection(connString);
            conn.Open();

            String queryStr = "";
            queryStr = "SELECT (SELECT COUNT(*) FROM workerDetails INNER JOIN permitCompany_List ON (workerDetails.PLKSCompany=permitCompany_List.companyName)" +
                " INNER JOIN userDetails ON (permitCompany_List.PIC1=userDetails.name OR permitCompany_List.PIC2=userDetails.name OR permitCompany_List.PIC3=userDetails.name OR permitCompany_List.PIC4=userDetails.name) WHERE (DATEDIFF(day, FORMAT(GETDATE(),'yyyy-MM-dd'), FORMAT(passportExp,'yyyy-MM-dd')) <= 0) AND workerStatus='Available' AND userDetails.loginID=('" + user + "'))" + 
                " + (SELECT COUNT(*) FROM workerDetails INNER JOIN permitCompany_List ON (workerDetails.PLKSCompany=permitCompany_List.companyName)" +
                " INNER JOIN userDetails ON (permitCompany_List.PIC1=userDetails.name OR permitCompany_List.PIC2=userDetails.name OR permitCompany_List.PIC3=userDetails.name OR permitCompany_List.PIC4=userDetails.name) WHERE (DATEDIFF(day, FORMAT(GETDATE(),'yyyy-MM-dd'), FORMAT(PLKSExp,'yyyy-MM-dd')) <= 0) AND workerStatus='Available' AND userDetails.loginID=('" + user + "')) AS rec_count";
            SqlCommand cmd = new SqlCommand(queryStr, conn);
            reader = cmd.ExecuteReader();

            while (reader.Read())
            {
                lblExpired.Text = (reader["rec_count"].ToString());
            }
            reader.Close();
            conn.Close();
        }

        protected void ibtnLogout_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("~/LogoutScreen.aspx");
        }

        protected void ibtn90days_Click(object sender, ImageClickEventArgs e)
        {
            string url = "Expiry Reminder/90days.aspx";
            StringBuilder sb = new StringBuilder();
            sb.Append("<script type = 'text/javascript'>");
            sb.Append("window.open('");
            sb.Append(url);
            sb.Append("');");
            sb.Append("</script>");
            Page.ClientScript.RegisterStartupScript(this.GetType(), "script", sb.ToString());
        }

        protected void ibtn60days_Click(object sender, ImageClickEventArgs e)
        {
            string url = "Expiry Reminder/60days.aspx";
            StringBuilder sb = new StringBuilder();
            sb.Append("<script type = 'text/javascript'>");
            sb.Append("window.open('");
            sb.Append(url);
            sb.Append("');");
            sb.Append("</script>");
            Page.ClientScript.RegisterStartupScript(this.GetType(), "script", sb.ToString());
        }

        protected void ibtn30days_Click(object sender, ImageClickEventArgs e)
        {
            string url = "Expiry Reminder/30days.aspx";
            StringBuilder sb = new StringBuilder();
            sb.Append("<script type = 'text/javascript'>");
            sb.Append("window.open('");
            sb.Append(url);
            sb.Append("');");
            sb.Append("</script>");
            Page.ClientScript.RegisterStartupScript(this.GetType(), "script", sb.ToString());
        }

        protected void ibtnExpired_Click(object sender, ImageClickEventArgs e)
        {
            string url = "Expiry Reminder/Expired.aspx";
            StringBuilder sb = new StringBuilder();
            sb.Append("<script type = 'text/javascript'>");
            sb.Append("window.open('");
            sb.Append(url);
            sb.Append("');");
            sb.Append("</script>");
            Page.ClientScript.RegisterStartupScript(this.GetType(), "script", sb.ToString());
        }
    }
}