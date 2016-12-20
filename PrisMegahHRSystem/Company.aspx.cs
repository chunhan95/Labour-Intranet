using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace PrisMegahHRSystem.Particular_Maintenance
{
    public partial class Company : System.Web.UI.Page
    {
        String connString = System.Configuration.ConfigurationManager.ConnectionStrings["PrisMegahConnString"].ToString();
        SqlConnection conn = null, conn1 = null;
        SqlDataReader reader;

        protected void Page_Load(object sender, EventArgs e)
        {
            string position = Session["role"].ToString();
            if (position == "Director" || position == "System Admin" || position == "Administrator")
            {
                //ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('This page is still under maintenance !!'); window.location='" + ResolveUrl("../Home.aspx") + "'", true);
                conn = new SqlConnection(connString);
                DataTable dt = new DataTable();
                conn.Open();
                reader = null;
                String queryStr = "";                
                queryStr = "SELECT companyName FROM permitCompany_List";                
                SqlCommand cmd = new SqlCommand(queryStr, conn);
                reader = cmd.ExecuteReader();
                gvPLKSCo.DataSource = reader;
                if (!IsPostBack)
                {
                    gvPLKSCo.DataBind();
                }
                reader.Close();
                conn.Close();
            }
            else
            {
                Response.Redirect("~/LogoutScreen.aspx");
            }
        }

        protected void Page_PreInit(object sender, EventArgs e)
        {
            string userRole = Session["role"].ToString();

            if (userRole == "System Admin" || userRole == "Director")
                this.Page.MasterPageFile = "~/Master page/Director.master";
            else if (userRole == "Administrator")
                this.Page.MasterPageFile = "~/Master page/Admin.master";
        }

        protected void txtPLKSCoName_TextChanged(object sender, EventArgs e)
        {
            txtPLKSCoName.Text = txtPLKSCoName.Text.ToUpper();
        }

        protected void txtEmpName_TextChanged(object sender, EventArgs e)
        {
            txtEmpName.Text = txtEmpName.Text.ToUpper();
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (txtPLKSCoName.Text != "")
            {
                conn = new SqlConnection(connString);
                conn.Open();
                String queryStr = "";
                queryStr = "SELECT COUNT(*) FROM permitCompany_List WHERE companyName = ('" + txtPLKSCoName.Text + "')";
                SqlCommand cmd = new SqlCommand(queryStr, conn);
                int companyCount = (int)cmd.ExecuteScalar();

                if (companyCount > 0)
                {
                    updateCompany();
                }
                else
                {
                    insertCompany();
                }
                conn.Close();
            }
            else
                Label14.Text = "*company name should not leave blank";
        }

        public void updateCompany()
        {
            conn1 = new SqlConnection(connString);
            conn1.Open();

            String queryStr1 = "";
            queryStr1 = "UPDATE permitCompany_List SET empName=@empName,empCont_No1=@empCont_No1,empCont_No2=@empCont_No2,compSector=@compSector" +
                " WHERE companyName = ('" + txtPLKSCoName.Text + "')";
            SqlCommand cmd1 = new SqlCommand(queryStr1, conn1);
            cmd1.Parameters.Add("@empName", SqlDbType.NVarChar).Value = txtEmpName.Text;
            cmd1.Parameters.Add("@empCont_No1", SqlDbType.NVarChar).Value = txtEmpTel1.Text;
            cmd1.Parameters.Add("@empCont_No2", SqlDbType.NVarChar).Value = txtEmpTel2.Text;
            cmd1.Parameters.Add("@compSector", SqlDbType.NVarChar).Value = ddlSector.SelectedValue;
            cmd1.ExecuteNonQuery();
            conn1.Close();

            ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('Current PLKS company updated !!'); window.location='" + ResolveUrl(Request.RawUrl) + "'", true);
        }

        public void insertCompany()
        {
            conn1 = new SqlConnection(connString);
            conn1.Open();

            String queryStr1 = "";
            queryStr1 = "INSERT INTO permitCompany_List (companyName,empName,empCont_No1,empCont_No2,compSector)" +
                " VALUES ('" + txtPLKSCoName.Text + "','" + txtEmpName.Text + "','" + txtEmpTel1.Text + "','" + txtEmpTel2.Text + "','" + ddlSector.SelectedValue + "')";
            SqlCommand cmd1 = new SqlCommand(queryStr1, conn1);
            cmd1.ExecuteReader();
            conn1.Close();

            ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('New PLKS company added !!'); window.location='" + ResolveUrl(Request.RawUrl) + "'", true);
        }

        //protected void gvPLKSCo_RowDataBound(object sender, GridViewRowEventArgs e)
        //{
        //    if (e.Row.RowType == DataControlRowType.DataRow)
        //    {
        //        if (e.Row.RowIndex == 0)
        //            e.Row.Style.Add("height", "50px");
        //    }
        //} 
    }
}