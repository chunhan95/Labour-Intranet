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
    public partial class EditEmployee : System.Web.UI.Page
    {
        SqlDataReader reader;

        protected void Page_Load(object sender, EventArgs e)
        {
            string position = Session["role"].ToString();
            if (position == "Director" || position == "System Admin")
            {
                
            }
            else
            {
                Response.Redirect("../LogoutScreen.aspx");
            }

            rbtnGender.Visible = false;
            ddlPosition.Visible = false;
            ddlStatus.Visible = false;
            txtLoginID.Enabled = false;
            txtPassword.Enabled = false;
            txtPassword.Attributes["type"] = "password";
        }

        protected void ibtnCancel_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("../Home.aspx");
        }

        protected void ibtnEditGender_Click(object sender, ImageClickEventArgs e)
        {
            rbtnGender.Visible = true;
        }
        
        protected void ibtnEditPosition_Click(object sender, ImageClickEventArgs e)
        {
            ddlPosition.Visible = true;
            ddlPosition.SelectedValue = lblPosition.Text;
        }

        protected void ibtnEditStatus_Click(object sender, ImageClickEventArgs e)
        {
            ddlStatus.Visible = true;
            ddlStatus.SelectedValue = lblStatus.Text;
        }

        protected void ibtnEditID_Click(object sender, ImageClickEventArgs e)
        {
            txtLoginID.Enabled = true;
        }

        protected void ibtnEditPw_Click(object sender, ImageClickEventArgs e)
        {
            txtPassword.Enabled = true;
        }

        protected void ibtnSearchByName_Click(object sender, ImageClickEventArgs e)
        {
            String connString = System.Configuration.ConfigurationManager.ConnectionStrings["PrisMegahConnString"].ToString();
            SqlConnection conn = null;

            conn = new SqlConnection(connString);
            DataTable dt = new DataTable();
            conn.Open();
            reader = null;
            String queryStr = "";
            queryStr = "SELECT userDetails.* FROM userDetails WHERE loginID=('" + ddlIDSearch.Text + "')";
            SqlCommand cmd = new SqlCommand(queryStr, conn);
            reader = cmd.ExecuteReader();

            while (reader.Read())
            {
                lblStaffNo.Text = reader["staffNo"].ToString();
                txtName.Text = reader["name"].ToString();
                txtAge.Text = reader["age"].ToString();
                lblGender.Text = reader["gender"].ToString();
                lblPosition.Text = reader["position"].ToString();
                lblPaymentState.Text = reader["editPayment"].ToString();
                lblStatus.Text = reader["status"].ToString();
                txtPhoneNo.Text = reader["contactNo"].ToString();
                txtAddress.Text = reader["address"].ToString();
                txtLoginID.Text = reader["loginID"].ToString();
                txtPassword.Text = reader["password"].ToString();
            }
            reader.Close();

            if (lblPosition.Text == "Accountant")
            {
                Label13.Visible = true;
                Label14.Visible = true;
                lblPaymentState.Visible = true;
                ddlEditPaymentRight.Visible = false;
                ibtnEditPaymentState.Visible = true;
            }
            else
            {
                Label13.Visible = false;
                Label14.Visible = false;
                lblPaymentState.Visible = false;
                ddlEditPaymentRight.Visible = false;
                ibtnEditPaymentState.Visible = false;
            }
        }

        protected void rbtnGender_SelectedIndexChanged(object sender, EventArgs e)
        {
            lblGender.Text = rbtnGender.SelectedItem.Text;
        }

        protected void ddlPosition_SelectedIndexChanged(object sender, EventArgs e)
        {
            lblPosition.Text = ddlPosition.SelectedItem.Text;

            if (ddlPosition.SelectedItem.Text == "Accountant")
            {
                Label13.Visible = true;
                Label14.Visible = true;
                lblPaymentState.Visible = true;
                ddlEditPaymentRight.Visible = false;
                ibtnEditPaymentState.Visible = true;
            }
            else
            {
                Label13.Visible = false;
                Label14.Visible = false;
                lblPaymentState.Visible = false;
                ddlEditPaymentRight.Visible = false;
                ibtnEditPaymentState.Visible = false;
            }
        }

        protected void ddlStatus_SelectedIndexChanged(object sender, EventArgs e)
        {
            lblStatus.Text = ddlStatus.SelectedItem.Text;
        }

        protected void ibtnConfirm_Click(object sender, ImageClickEventArgs e)
        {
            String connString = System.Configuration.ConfigurationManager.ConnectionStrings["PrisMegahConnString"].ToString();
            SqlConnection conn = null;

            conn = new SqlConnection(connString);
            conn.Open();

            String queryStr = "";
            queryStr = "UPDATE userDetails SET name=@name, age=@age, gender=@gender, position=@position, status=@status, contactNo=@contactNo, address=@address, loginID=@loginID, password=@password, editPayment=@editPayment WHERE staffNo = ('" + lblStaffNo.Text + "')";
            SqlCommand cmd = new SqlCommand(queryStr, conn);
            cmd.Parameters.AddWithValue("@name", txtName.Text);
            cmd.Parameters.AddWithValue("@age", txtAge.Text);
            cmd.Parameters.AddWithValue("@gender", lblGender.Text);
            cmd.Parameters.AddWithValue("@position", lblPosition.Text);
            cmd.Parameters.AddWithValue("@status", lblStatus.Text);
            cmd.Parameters.AddWithValue("@contactNo", txtPhoneNo.Text);
            cmd.Parameters.AddWithValue("@address", txtAddress.Text);
            cmd.Parameters.AddWithValue("@loginID", txtLoginID.Text);
            cmd.Parameters.AddWithValue("@password", txtPassword.Text);
            if (lblPosition.Text == "Accountant")
            {
                cmd.Parameters.Add("@editPayment", SqlDbType.NVarChar).Value = lblPaymentState.Text;
            }
            else
            {
                cmd.Parameters.Add("@editPayment", SqlDbType.NVarChar).Value = "No";
            }
            cmd.ExecuteNonQuery();
            conn.Close();

            ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('Staff updated successfully !!'); window.location='" + ResolveUrl(Request.RawUrl) + "'", true);
        }

        protected void txtName_TextChanged(object sender, EventArgs e)
        {
            txtName.Text = txtName.Text.ToUpper();
        }

        protected void ibtnEditPaymentState_Click(object sender, ImageClickEventArgs e)
        {
            ddlEditPaymentRight.Visible = true;
            ibtnEditPaymentState.Visible = false;
            ddlEditPaymentRight.SelectedValue = lblPaymentState.Text;
        }

        protected void ddlEditPaymentRight_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddlEditPaymentRight.Visible = false;
            lblPaymentState.Text = ddlEditPaymentRight.SelectedValue;
            ibtnEditPaymentState.Visible = true;
        }
    }
}
