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
    public partial class Payment : System.Web.UI.Page
    {
        String connString = System.Configuration.ConfigurationManager.ConnectionStrings["PrisMegahConnString"].ToString();
        SqlConnection conn = null, conn2 = null;
        SqlDataReader reader;

        protected void Page_Load(object sender, EventArgs e)
        {
            string position = Session["role"].ToString();
            if (position == "Accountant")
            {

            }
            else
            {
                Response.Redirect("~/LogoutScreen.aspx");
            }
        }

        protected void ibtnSearchByPPNo_Click(object sender, ImageClickEventArgs e)
        {
            btnSubmitPay.Enabled = false;
            txtInvoiceNo.Enabled = true;
            txtPaymentTotal.Enabled = true;
            txtCurrentPayment.Enabled = true;
            txtPaymentRemark.Enabled = true;
            Calendar1.Visible = true;
            txtInvoiceNo.Text = "";
            txtPaymentTotal.Text = "";
            txtCurrentPayment.Text = "";
            lblOutstanding.Text = "";
            lblPaymentDate.Text = "";
            txtPaymentRemark.Text = "";
            conn = new SqlConnection(connString);
            DataTable dt = new DataTable();
            conn.Open();
            reader = null;
            String queryStr = "";
            //queryStr = "SELECT wd.workerNo, FORMAT(wd.passportExp,'dd/MM/yyyy') AS passportExp, wd.invoiceNo, p.paymentOutstanding, p.paymentRemark " +
            //        "FROM workerDetails wd LEFT OUTER JOIN" +
            //        "(SELECT t.[workerNo],t.[paymentTotal],t.[paymentOutstanding],t.[paymentRemark],t.[paymentDate] " +
            //        "FROM payment t INNER JOIN( " +
            //        "SELECT workerNo, max(paymentDate) as MaxDate " +
            //        "FROM payment GROUP BY workerNo " +
            //        ") tm ON t.workerNo = tm.workerNo and t.paymentDate = tm.MaxDate " +
            //        ")p ON wd.workerNo=p.workerNo WHERE wd.passportNo_New=('" + ddlPPNo.Text + "')";
            queryStr = "SELECT workerNo, FORMAT(passportExp,'dd/MM/yyyy') AS passportExp FROM workerDetails WHERE passportNo_New = ('" + ddlPPNo.Text + "')";
            SqlCommand cmd = new SqlCommand(queryStr, conn);
            reader = cmd.ExecuteReader();

            while (reader.Read())
            {
                lblWorkerNo.Text = reader["workerNo"].ToString();
                //txtInvoiceNo.Text = reader["invoiceNo"].ToString();
                lblPPExpiry.Text = reader["passportExp"].ToString();
                //txtPaymentTotal.Text = reader["paymentOutstanding"].ToString();
                //txtPaymentRemark.Text = reader["paymentRemark"].ToString();
            }
            reader.Close();
            conn.Close();
        }

        protected void btnCalculateOutstanding_Click(object sender, EventArgs e)
        {
            if (txtPaymentTotal.Text != "" && txtCurrentPayment.Text != "")
            {
                btnSubmitPay.Enabled = true;
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

        protected void btnSubmitPay_Click(object sender, EventArgs e)
        {
            if (lblPaymentDate.Text != "")
            {
                if (txtInvoiceNo.Text != "")
                {
                    //DateTime currDate = DateTime.Now;
                    conn = new SqlConnection(connString);
                    conn.Open();
                    String queryStr = "";
                    queryStr = "INSERT INTO payment (workerNo,paymentNo,paymentTotal,paymentOutstanding,paymentRemark,paymentDate)" +
                        " VALUES(@workerNo,@paymentNo,@paymentTotal,@paymentOutstanding,@paymentRemark,@paymentDate)";
                    SqlCommand cmd = new SqlCommand(queryStr, conn);
                    cmd.Parameters.AddWithValue("@workerNo", SqlDbType.NVarChar).Value = lblWorkerNo.Text;
                    cmd.Parameters.AddWithValue("@paymentNo", SqlDbType.NVarChar).Value = txtInvoiceNo.Text;
                    cmd.Parameters.AddWithValue("@paymentTotal", SqlDbType.Decimal).Value = txtPaymentTotal.Text;
                    cmd.Parameters.AddWithValue("@paymentOutstanding", SqlDbType.Decimal).Value = lblOutstanding.Text;
                    cmd.Parameters.AddWithValue("@paymentRemark", SqlDbType.NVarChar).Value = txtPaymentRemark.Text;
                    cmd.Parameters.Add("@paymentDate", SqlDbType.DateTime).Value = lblPaymentDate.Text;
                    cmd.ExecuteReader();
                    conn.Close();

                    conn2 = new SqlConnection(connString);
                    conn2.Open();
                    String queryStr2 = "";
                    queryStr2 = "UPDATE workerDetails SET invoiceNo=@invoiceNo WHERE workerNo = ('" + lblWorkerNo.Text + "')";
                    SqlCommand cmd2 = new SqlCommand(queryStr2, conn2);
                    cmd2.Parameters.AddWithValue("@invoiceNo", SqlDbType.NVarChar).Value = txtInvoiceNo.Text;
                    cmd2.ExecuteNonQuery();
                    conn2.Close();

                    lblWorkerNo.Text = "";
                    txtInvoiceNo.Text = "";
                    lblPPExpiry.Text = "";
                    txtPaymentTotal.Text = "";
                    txtCurrentPayment.Text = "";
                    lblOutstanding.Text = "";
                    txtPaymentRemark.Text = "";
                    //btnSubmitPay.Enabled = false;
                    gvPaymentDetails.DataBind();
                    ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('Payment record saved !!'); window.location='" + ResolveUrl(Request.RawUrl) + "'", true);
                }
                else
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('Please enter a valid invoice number !!');", true);
                }
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('Please select a payment date !!');", true);
            }
        }

        protected void Calendar1_SelectionChanged(object sender, EventArgs e)
        {
            lblPaymentDate.Text = Calendar1.SelectedDate.ToString("yyyy-MM-dd");
            Calendar1.Visible = false;
        }

        protected void btnEditPayment_Click(object sender, EventArgs e)
        {
            string editPay = Session["editPay"].ToString();

            if (editPay == "Yes")
                Response.Redirect("~/EditPay.aspx");
            else
                ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('You ae not allowed to edit payment !!'); window.location='" + ResolveUrl("~/Home.aspx") + "'", true);
        }
    }
}