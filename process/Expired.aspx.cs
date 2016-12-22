using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace PrisMegahHRSystem.Expiry_Reminder
{
    public partial class Expired : System.Web.UI.Page
    {
        SqlDataReader reader, reader2, reader3;
        String connString = System.Configuration.ConfigurationManager.ConnectionStrings["PrisMegahConnString"].ToString();
        SqlConnection conn = null, conn2 = null;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["id"] != null)
            {
                string position = Session["role"].ToString();
                if (position == "Director" || position == "System Admin" || position == "Administrator")
                {

                }
                else
                {
                    Response.Redirect("../LogoutScreen.aspx");
                }

                string user = Session["id"].ToString();
                gvPassport.Visible = false;
                gvPLKS.Visible = false;
                gvPassport2.Visible = false;
                gvPLKS2.Visible = false;

                conn = new SqlConnection(connString);
                conn.Open();
                String queryStr = "";
                queryStr = "SELECT * FROM userDetails WHERE loginID=('" + user + "')";
                SqlCommand cmd = new SqlCommand(queryStr, conn);
                reader2 = cmd.ExecuteReader();
                while (reader2.Read())
                {
                    if (reader2["position"].ToString() == "Administrator")
                    {
                        readPassportRecord();
                        readPLKSRecord();
                    }
                    else
                    {
                        readPassportRecord2();
                        readPLKSRecord2();
                    }
                }
                reader2.Close();
                conn.Close();
            }
            else
                Response.Redirect("~/LogoutScreen.aspx");
        }

        public void readPassportRecord()
        {
            string user = Session["id"].ToString();
            conn = new SqlConnection(connString);
            conn.Open();

            String queryStr = "";
            queryStr = "SELECT COUNT(*) AS rec_count FROM workerDetails " +
                        "INNER JOIN permitCompany_List ON (workerDetails.PLKSCompany=permitCompany_List.companyName) " +
                        "INNER JOIN userDetails ON (permitCompany_List.PIC1=userDetails.name OR permitCompany_List.PIC2=userDetails.name OR permitCompany_List.PIC3=userDetails.name OR permitCompany_List.PIC4=userDetails.name) " +
                        "WHERE (DATEDIFF(day, FORMAT(GETDATE(),'yyyy-MM-dd'), FORMAT(passportExp,'yyyy-MM-dd')) <= 0) AND workerStatus='Available' AND userDetails.loginID=('" + user + "')";
            SqlCommand cmd = new SqlCommand(queryStr, conn);
            reader = cmd.ExecuteReader();

            while (reader.Read())
            {
                Label2.Text = reader["rec_count"].ToString() + " passport expired,";
            }
            reader.Close();
            conn.Close();
        }

        public void readPLKSRecord()
        {
            string user = Session["id"].ToString();
            conn = new SqlConnection(connString);
            conn.Open();

            String queryStr = "";
            queryStr = "SELECT COUNT(*) AS rec_count FROM workerDetails " + 
                        "INNER JOIN permitCompany_List ON (workerDetails.PLKSCompany=permitCompany_List.companyName) " +  
                        "INNER JOIN userDetails ON (permitCompany_List.PIC1=userDetails.name OR permitCompany_List.PIC2=userDetails.name OR permitCompany_List.PIC3=userDetails.name OR permitCompany_List.PIC4=userDetails.name) " +
                        "WHERE (DATEDIFF(day, FORMAT(GETDATE(),'yyyy-MM-dd'), FORMAT(PLKSExp,'yyyy-MM-dd')) <= 0) AND workerStatus='Available' AND userDetails.loginID=('" + user + "')";
            SqlCommand cmd = new SqlCommand(queryStr, conn);
            reader = cmd.ExecuteReader();

            while (reader.Read())
            {
                Label3.Text = reader["rec_count"].ToString() + " PLKS expired";
            }
            reader.Close();
            conn.Close();
        }

        public void readPassportRecord2()
        {
            conn = new SqlConnection(connString);
            conn.Open();

            String queryStr = "";
            queryStr = "SELECT COUNT(*) AS rec_count FROM workerDetails WHERE (DATEDIFF(day, FORMAT(GETDATE(),'yyyy-MM-dd'), FORMAT(passportExp,'yyyy-MM-dd')) <= 0) AND workerStatus='Available'";
            SqlCommand cmd = new SqlCommand(queryStr, conn);
            reader = cmd.ExecuteReader();

            while (reader.Read())
            {
                Label2.Text = reader["rec_count"].ToString() + " passport expired,";
            }
            reader.Close();
            conn.Close();
        }

        public void readPLKSRecord2()
        {
            conn = new SqlConnection(connString);
            conn.Open();

            String queryStr = "";
            queryStr = "SELECT COUNT(*) AS rec_count FROM workerDetails WHERE (DATEDIFF(day, FORMAT(GETDATE(),'yyyy-MM-dd'), FORMAT(PLKSExp,'yyyy-MM-dd')) <= 0) AND workerStatus='Available'";
            SqlCommand cmd = new SqlCommand(queryStr, conn);
            reader = cmd.ExecuteReader();

            while (reader.Read())
            {
                Label3.Text = reader["rec_count"].ToString() + " PLKS expired";
            }
            reader.Close();
            conn.Close();
        }

        protected void btnFilter_Click(object sender, EventArgs e)
        {
            string user = Session["id"].ToString();
            conn = new SqlConnection(connString);
            conn.Open();
            String queryStr = "";
            queryStr = "SELECT * FROM userDetails WHERE loginID=('" + user + "')";
            SqlCommand cmd = new SqlCommand(queryStr, conn);
            reader3 = cmd.ExecuteReader();
            while (reader3.Read())
            {
                if (reader3["position"].ToString() == "Administrator" && ddlFilter.SelectedItem.Text == "Passport Expired")
                {
                    bindgvPassport2();
                    gvPassport.Visible = false;
                    gvPassport2.Visible = true;
                    gvPLKS.Visible = false;
                    gvPLKS2.Visible = false;
                }
                else if(reader3["position"].ToString() != "Administrator" && ddlFilter.SelectedItem.Text == "Passport Expired")
                {
                    gvPassport.Visible = true;
                    gvPassport2.Visible = false;
                    gvPLKS.Visible = false;
                    gvPLKS2.Visible = false;
                }
                else if (reader3["position"].ToString() == "Administrator" && ddlFilter.SelectedItem.Text == "PLKS Expired")
                {
                    bindgvPLKS2();
                    gvPassport.Visible = false;
                    gvPassport2.Visible = false;
                    gvPLKS.Visible = false;
                    gvPLKS2.Visible = true;
                }
                else if (reader3["position"].ToString() != "Administrator" && ddlFilter.SelectedItem.Text == "PLKS Expired")
                {
                    gvPassport.Visible = false;
                    gvPassport2.Visible = false;
                    gvPLKS.Visible = true;
                    gvPLKS2.Visible = false;
                }
            }
            reader3.Close();
            conn.Close();
        }

        public void bindgvPassport2()
        {
            string user = Session["id"].ToString();
            conn2 = new SqlConnection(connString);
            conn2.Open();

            String queryStr = "";
            queryStr = "SELECT workerDetails.name AS [Name],workerDetails.gender AS [Gender],nationality AS [Nationality],workerDetails.contactNo AS [Contact No],passportNo_New AS [New Passport No],FORMAT(passportExp,'yyyy-MM-dd') AS [Passport Expiry],PLKSCompany AS [PLKS Company],employerName As [EmployerName],employerCompany As [Employer Company],sector As [Sector],adminIncharge As [Admin Incharge] FROM workerDetails " +
                        "INNER JOIN permitCompany_List ON (workerDetails.PLKSCompany=permitCompany_List.companyName) " +
                        "INNER JOIN userDetails ON (permitCompany_List.PIC1=userDetails.name OR permitCompany_List.PIC2=userDetails.name OR permitCompany_List.PIC3=userDetails.name OR permitCompany_List.PIC4=userDetails.name) " +
                        "WHERE (DATEDIFF(day, FORMAT(GETDATE(),'yyyy-MM-dd'), FORMAT(passportExp,'yyyy-MM-dd')) <= 0) AND workerStatus='Available' AND userDetails.loginID=('" + user + "')";
            SqlCommand cmd = new SqlCommand(queryStr, conn2);
            gvPassport2.DataSource = cmd.ExecuteReader();
            gvPassport2.DataBind();
            conn2.Close();
        }

        public void bindgvPLKS2()
        {
            string user = Session["id"].ToString();
            conn2 = new SqlConnection(connString);
            conn2.Open();

            String queryStr = "";
            queryStr = "SELECT workerDetails.name AS [Name],workerDetails.gender AS [Gender],nationality AS [Nationality],workerDetails.contactNo AS [Contact No],passportNo_New AS [New Passport No],FORMAT(PLKSExp,'yyyy-MM-dd') AS [PLKS Expiry],PLKSCompany AS [PLKS Company],employerName As [EmployerName],employerCompany As [Employer Company],sector As [Sector],adminIncharge As [Admin Incharge] FROM workerDetails " +
                        "INNER JOIN permitCompany_List ON (workerDetails.PLKSCompany=permitCompany_List.companyName) " +
                        "INNER JOIN userDetails ON (permitCompany_List.PIC1=userDetails.name OR permitCompany_List.PIC2=userDetails.name OR permitCompany_List.PIC3=userDetails.name OR permitCompany_List.PIC4=userDetails.name) " +
                        "WHERE (DATEDIFF(day, FORMAT(GETDATE(),'yyyy-MM-dd'), FORMAT(PLKSExp,'yyyy-MM-dd')) <= 0) AND workerStatus='Available' AND userDetails.loginID=('" + user + "')";
            SqlCommand cmd = new SqlCommand(queryStr, conn2);
            gvPLKS2.DataSource = cmd.ExecuteReader();
            gvPLKS2.DataBind();
            conn2.Close();
        }

        protected void gvPassport_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            Response.Redirect("~/Expiry Reminder/ViewDetails.aspx?worker=" + e.CommandArgument);
        }

        protected void gvPLKS_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            Response.Redirect("~/Expiry Reminder/ViewDetails.aspx?worker=" + e.CommandArgument);
        }

        protected void gvPassport2_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            Response.Redirect("~/Expiry Reminder/ViewDetails.aspx?worker=" + e.CommandArgument);
        }

        protected void gvPLKS2_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            Response.Redirect("~/Expiry Reminder/ViewDetails.aspx?worker=" + e.CommandArgument);
        }
    }
}