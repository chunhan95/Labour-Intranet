using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Data.SqlTypes;

namespace PrisMegahHRSystem
{
    public partial class AdminAssign : System.Web.UI.Page
    {
        String connString = System.Configuration.ConfigurationManager.ConnectionStrings["PrisMegahConnString"].ToString();
        SqlConnection conn = null;
        SqlDataReader reader;

        protected void Page_Load(object sender, EventArgs e)
        {
            string position = Session["role"].ToString();
            if (position == "Director" || position == "System Admin")
            {

            }
            else
            {
                Response.Redirect("~/LogoutScreen.aspx");
            }
        }

        protected void ibtnAddPIC1_Click(object sender, ImageClickEventArgs e)
        {
            lblPIC1.Text = ddlPICList1.SelectedItem.Text;
        }

        protected void ibtnAddPIC2_Click(object sender, ImageClickEventArgs e)
        {
            lblPIC2.Text = ddlPICList2.SelectedItem.Text;
        }

        protected void ibtnAddPIC3_Click(object sender, ImageClickEventArgs e)
        {
            lblPIC3.Text = ddlPICList3.SelectedItem.Text;
        }

        protected void ibtnAddPIC4_Click(object sender, ImageClickEventArgs e)
        {
            lblPIC4.Text = ddlPICList4.SelectedItem.Text;
        }

        protected void ibtnClearPIC1_Click(object sender, ImageClickEventArgs e)
        {
            lblPIC1.Text = "";
        }

        protected void ibtnClearPIC2_Click(object sender, ImageClickEventArgs e)
        {
            lblPIC2.Text = "";
        }

        protected void ibtnClearPIC3_Click(object sender, ImageClickEventArgs e)
        {
            lblPIC3.Text = "";
        }

        protected void ibtnClearPIC4_Click(object sender, ImageClickEventArgs e)
        {
            lblPIC4.Text = "";
        }

        protected void ibtnSearchByCo_Click(object sender, ImageClickEventArgs e)
        {
            conn = new SqlConnection(connString);
            DataTable dt = new DataTable();
            conn.Open();
            reader = null;
            String queryStr = "";
            queryStr = "SELECT PIC1, PIC2, PIC3, PIC4 " +
                "FROM permitCompany_List WHERE companyName = ('" + ddlPermitCo.Text + "')";
            SqlCommand cmd = new SqlCommand(queryStr, conn);
            reader = cmd.ExecuteReader();

            while (reader.Read())
            {
                lblPIC1.Text = reader["PIC1"].ToString();
                lblPIC2.Text = reader["PIC2"].ToString();
                lblPIC3.Text = reader["PIC3"].ToString();
                lblPIC4.Text = reader["PIC4"].ToString();
            }
            reader.Close();
            conn.Close();
        }

        protected void ibtnSubmit_Click(object sender, ImageClickEventArgs e)
        {
            String none = "";
            conn = new SqlConnection(connString);
            conn.Open();

            String queryStr = "";
            queryStr = "UPDATE permitCompany_List SET PIC1=@PIC1, PIC2=@PIC2, PIC3=@PIC3, PIC4=@PIC4 WHERE companyName = ('" + ddlPermitCo.Text + "')";
            SqlCommand cmd = new SqlCommand(queryStr, conn);
            cmd.Parameters.Add(new SqlParameter("@PIC1", string.IsNullOrEmpty(lblPIC1.Text) ? (object)DBNull.Value : lblPIC1.Text));
            cmd.Parameters.Add(new SqlParameter("@PIC2", string.IsNullOrEmpty(lblPIC2.Text) ? (object)DBNull.Value : lblPIC2.Text));
            cmd.Parameters.Add(new SqlParameter("@PIC3", string.IsNullOrEmpty(lblPIC3.Text) ? (object)DBNull.Value : lblPIC3.Text));
            cmd.Parameters.Add(new SqlParameter("@PIC4", string.IsNullOrEmpty(lblPIC4.Text) ? (object)DBNull.Value : lblPIC4.Text));

            cmd.ExecuteNonQuery();
            ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('Person In Charge assigned successful !!'); window.location='" + ResolveUrl(Request.RawUrl) + "'", true);
            conn.Close();
        }

        protected void ibtnCancel_Click(object sender, ImageClickEventArgs e)
        {
            Page.Response.Redirect("~/Home.aspx");
        }
    }
}