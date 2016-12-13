using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace PrisMegahHRSystem
{
    public partial class EditPay : System.Web.UI.Page
    {
        String connString = System.Configuration.ConfigurationManager.ConnectionStrings["PrisMegahConnString"].ToString();
        SqlConnection conn = null, conn2 = null;
        SqlDataReader reader;

        protected void Page_Load(object sender, EventArgs e)
        {
            string position = Session["role"].ToString();
            string editPay = Session["editPay"].ToString();

            if (position == "Accountant" && editPay == "Yes")
            {

            }
            else
            {
                Response.Redirect("~/LogoutScreen.aspx");
            }
        }

        protected void Calendar1_SelectionChanged(object sender, EventArgs e)
        {
            lblPayDay.Text = Calendar1.SelectedDate.ToString("yyyy-MM-dd");
            Calendar1.Visible = false;
        }

        protected void ibtnEditDate_Click(object sender, ImageClickEventArgs e)
        {
            Calendar1.Visible = true;
        }

        protected void ibtnSearchByPPNo_Click(object sender, ImageClickEventArgs e)
        {
            conn = new SqlConnection(connString);
            DataTable dt = new DataTable();
            conn.Open();
            reader = null;
            String queryStr = "";
            queryStr = "SELECT DISTINCT paymentNo FROM workerDetails LEFT OUTER JOIN payment ON workerDetails.workerNo=payment.workerNo WHERE passportNo_New = ('" + ddlPPNo.SelectedValue + "')";
            SqlCommand cmd = new SqlCommand(queryStr, conn);
            reader = cmd.ExecuteReader();
            ddlPaymentNo.DataSource = reader;
            ddlPaymentNo.DataValueField = "paymentNo";
            ddlPaymentNo.DataTextField = "paymentNo";
            ddlPaymentNo.DataBind();
            reader.Close();
            conn.Close();
        }

        protected void ibtnSearchByInvNo_Click(object sender, ImageClickEventArgs e)
        {
            conn = new SqlConnection(connString);
            DataTable dt = new DataTable();
            conn.Open();
            reader = null;
            String queryStr = "";
            queryStr = "SELECT *,FORMAT(paymentDate,'yyyy-MM-dd') AS payDate FROM workerDetails LEFT OUTER JOIN payment ON workerDetails.workerNo=payment.workerNo WHERE passportNo_New = ('" + ddlPPNo.SelectedValue + "') AND paymentNo= ('" + ddlPaymentNo.SelectedValue + "')";
            SqlCommand cmd = new SqlCommand(queryStr, conn);
            reader = cmd.ExecuteReader();
            ddlPayDate.DataSource = reader;
            ddlPayDate.DataValueField = "payDate";
            ddlPayDate.DataTextField = "payDate";
            ddlPayDate.DataBind();
            reader.Close();
            conn.Close();
        }

        protected void ibtnSearchByDate_Click(object sender, ImageClickEventArgs e)
        {
            txtPaymentTotal.Enabled = true;
            txtCurrentPayment.Enabled = true;
            txtPaymentRemark.Enabled = true;
            conn = new SqlConnection(connString);
            DataTable dt = new DataTable();
            conn.Open();
            reader = null;
            String queryStr = "";
            queryStr = "SELECT *,FORMAT(paymentDate,'yyyy-MM-dd') AS payDate,paymentTotal-paymentOutstanding AS 'current' FROM payment WHERE paymentNo = ('" + ddlPaymentNo.SelectedValue + "') AND paymentDate = ('" + ddlPayDate.SelectedValue + "')";
            SqlCommand cmd = new SqlCommand(queryStr, conn);
            reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                lblPayID.Text = reader["paymentID"].ToString();
                txtPaymentTotal.Text = reader["paymentTotal"].ToString();
                txtCurrentPayment.Text = reader["current"].ToString();
                lblOutstanding.Text = reader["paymentOutstanding"].ToString();
                txtPaymentRemark.Text = reader["paymentRemark"].ToString();
                lblPayDay.Text = reader["payDate"].ToString();
            }
            reader.Close();
            conn.Close();
        }

        protected void btnCalculateOutstanding_Click(object sender, EventArgs e)
        {
            if (txtPaymentTotal.Text != "" && txtCurrentPayment.Text != "")
            {
                btnSubmit.Enabled = true;
                decimal total = 0, payment = 0, outstanding = 0;
                total = decimal.Parse(txtPaymentTotal.Text);
                payment = decimal.Parse(txtCurrentPayment.Text);
                outstanding = total - payment;
                lblOutstanding.Text = outstanding.ToString();
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('Invalid payment total or payment paid !!');", true);
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            conn = new SqlConnection(connString);
            conn.Open();

            String queryStr = "";
            queryStr = "UPDATE payment SET paymentTotal=@paymentTotal, paymentOutstanding=@paymentOutstanding, paymentRemark=@paymentRemark, paymentDate=@paymentDate WHERE paymentID = ('" + lblPayID.Text + "')";
            SqlCommand cmd = new SqlCommand(queryStr, conn);
            cmd.Parameters.Add("@paymentTotal", SqlDbType.Decimal).Value = txtPaymentTotal.Text;
            cmd.Parameters.Add("@paymentOutstanding", SqlDbType.Decimal).Value = lblOutstanding.Text;
            cmd.Parameters.Add("@paymentRemark", SqlDbType.NVarChar).Value = txtPaymentRemark.Text;
            cmd.Parameters.Add("@paymentDate", SqlDbType.DateTime).Value = lblPayDay.Text;
            cmd.ExecuteNonQuery();
            conn.Close();

            ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('Payment Edited Successful !!'); window.location='" + ResolveUrl(Request.RawUrl) + "'", true);
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Home.aspx");
        }
    }
}