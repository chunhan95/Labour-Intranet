using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

namespace PrisMegahHRSystem.Employee
{
    public partial class AddEmployee : System.Web.UI.Page
    {
        String connString = System.Configuration.ConfigurationManager.ConnectionStrings["PrisMegahConnString"].ToString();
        SqlConnection conn = null;

        protected void Page_Load(object sender, EventArgs e)
        {
            string position = Session["role"].ToString();
            if (position == "Director" || position == "System Admin")
            {
                //Response.Redirect("../LogoutScreen.aspx");
            }
            else
            {
                Response.Redirect("../LogoutScreen.aspx");
            }

        }

        protected void ibtnCancel_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("../Home.aspx");
        }

        protected void ibtnConfirm_Click(object sender, ImageClickEventArgs e)
        {
            if(txtName.Text != "" && txtLoginID.Text != "" && txtPassword.Text != "")
            {
                conn = new SqlConnection(connString);
                conn.Open();
                String queryStr = "";
                queryStr = "SELECT COUNT(*) FROM userDetails WHERE loginID LIKE ('" + txtLoginID.Text + "')";
                SqlCommand cmd = new SqlCommand(queryStr, conn);
                int userCount = (int)cmd.ExecuteScalar();

                if (userCount > 0)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('User already exist in database, please insert another user details !!');", true);
                }
                else
                {
                    insertUser();
                }

                conn.Close();
            }
            else
                ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('Name, Login ID, and Password must not be blank !!');", true);
        }

        public void insertUser()
        {
            conn = new SqlConnection(connString);
            conn.Open();

            String queryStr = "";
            queryStr = "INSERT INTO userDetails (name, age, gender, position, status, contactNo, address, loginID, password, editPayment)" +
                "VALUES ('" + txtName.Text + "','" + txtAge.Text + "','" + rbtnGender.SelectedItem.Text + "','" + ddlPosition.Text + "','" + ddlStatus.Text + "','" + txtPhoneNo1.Text + txtPhoneNo2.Text + "','" + txtAddress.Text + "','" + txtLoginID.Text + "','" + txtPassword.Text + "', @editPayment)";
            SqlCommand cmd = new SqlCommand(queryStr, conn);
            if (ddlPosition.SelectedItem.Text == "Accountant")
            {
                cmd.Parameters.Add("@editPayment", SqlDbType.NVarChar).Value = ddlEditPaymentRight.SelectedItem.Text;
            }
            else
            {
                cmd.Parameters.Add("@editPayment", SqlDbType.NVarChar).Value = "No";
            }
            cmd.ExecuteReader();
            conn.Close();

            ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('Staff added successfully !!'); window.location='" + ResolveUrl(Request.RawUrl) + "'", true);
        }

        protected void txtName_TextChanged(object sender, EventArgs e)
        {
            txtName.Text = txtName.Text.ToUpper();
        }

        protected void ddlPosition_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlPosition.SelectedItem.Text == "Accountant")
            {
                Label13.Visible = true;
                Label14.Visible = true;
                ddlEditPaymentRight.Visible = true;
            }
            else
            {
                Label13.Visible = false;
                Label14.Visible = false;
                ddlEditPaymentRight.Visible = false;
            }
        }
    }
}