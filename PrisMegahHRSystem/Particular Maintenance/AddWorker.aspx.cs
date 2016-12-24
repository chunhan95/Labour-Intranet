using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Data.SqlTypes;

//http://www.aspsnippets.com/Articles/Save-Files-to-SQL-Server-Database-using-FileUpload-Control.aspx

namespace PrisMegahHRSystem.Particular_Maintenance
{
    public partial class AddWorker : System.Web.UI.Page
    {
        String connString = System.Configuration.ConfigurationManager.ConnectionStrings["PrisMegahConnString"].ToString();
        SqlConnection conn = null, conn2 = null, conn3 = null, conn4 = null;
        SqlDataReader reader;

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

        protected void ibtnCancel_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("../Home.aspx");
        }

        protected void txtName_TextChanged(object sender, EventArgs e)
        {
            txtName.Text = txtName.Text.ToUpper();
        }

        protected void txtNewNationality_TextChanged(object sender, EventArgs e)
        {
            txtNewNationality.Text = txtNewNationality.Text.ToUpper();
        }

        protected void txtNewSector_TextChanged(object sender, EventArgs e)
        {
            txtNewSector.Text = txtNewSector.Text.ToUpper();
        }

        protected void txtNewService_TextChanged(object sender, EventArgs e)
        {
            txtNewService.Text = txtNewService.Text.ToUpper();
        }

        protected void txtNewSubmitTo_TextChanged(object sender, EventArgs e)
        {
            txtNewSubmitTo.Text = txtNewSubmitTo.Text.ToUpper();
        }

        protected void txtEmpName_TextChanged(object sender, EventArgs e)
        {
            txtEmpName.Text = txtEmpName.Text.ToUpper();
        }

        //protected void txtInvoiceRef_TextChanged(object sender, EventArgs e)
        //{
        //    txtInvoiceRef.Text = txtInvoiceRef.Text.ToUpper();
        //}

        protected void txtNextOfKin_TextChanged(object sender, EventArgs e)
        {
            txtNextOfKin.Text = txtNextOfKin.Text.ToUpper();
        }

        protected void txtEmpCompanyName_TextChanged(object sender, EventArgs e)
        {
            txtEmpCompanyName.Text = txtEmpCompanyName.Text.ToUpper();
        }

        protected void txtAgent_TextChanged(object sender, EventArgs e)
        {
            txtAgent.Text = txtAgent.Text.ToUpper();
        }

        protected void ibtnAddNationality_Click(object sender, ImageClickEventArgs e)
        {
            conn = new SqlConnection(connString);
            conn.Open();

            String queryStr = "";
            queryStr = "INSERT INTO nationality (nationality)" + "VALUES ('" + txtNewNationality.Text + "')";
            SqlCommand cmd = new SqlCommand(queryStr, conn);
            cmd.ExecuteReader();
            conn.Close();

            ddlNationality.DataBind();
            ibtnAddNationality.Visible = false;
            txtNewNationality.Visible = false;
            ibtnEditNationality.Visible = true;
        }

        //protected void ibtnRemoveNationality_Click(object sender, ImageClickEventArgs e)
        //{
        //    conn = new SqlConnection(connString);
        //    conn.Open();

        //    String queryStr = "";
        //    queryStr = "DELETE FROM nationality WHERE nationality = ('" + txtNewNationality.Text + "')";
        //    SqlCommand cmd = new SqlCommand(queryStr, conn);
        //    cmd.ExecuteReader();
        //    conn.Close();

        //    Response.Redirect(Request.RawUrl);
        //}

        protected void ibtnAddSector_Click(object sender, ImageClickEventArgs e)
        {
            conn = new SqlConnection(connString);
            conn.Open();

            String queryStr = "";
            queryStr = "INSERT INTO sectorList (sector)" + "VALUES ('" + txtNewSector.Text + "')";
            SqlCommand cmd = new SqlCommand(queryStr, conn);
            cmd.ExecuteReader();
            conn.Close();

            ddlSector.DataBind();
            ibtnAddSector.Visible = false;
            txtNewSector.Visible = false;
            ibtnEditSector.Visible = true;
        }

        //protected void ibtnRemoveSector_Click(object sender, ImageClickEventArgs e)
        //{
        //    conn = new SqlConnection(connString);
        //    conn.Open();

        //    String queryStr = "";
        //    queryStr = "DELETE FROM sectorList WHERE sector = ('" + txtNewSector.Text + "')";
        //    SqlCommand cmd = new SqlCommand(queryStr, conn);
        //    cmd.ExecuteReader();
        //    conn.Close();

        //    Response.Redirect(Request.RawUrl);
        //}

        protected void ibtnAddService_Click(object sender, ImageClickEventArgs e)
        {
            conn = new SqlConnection(connString);
            conn.Open();

            String queryStr = "";
            queryStr = "INSERT INTO serviceType_List (serviceType)" + "VALUES ('" + txtNewService.Text + "')";
            SqlCommand cmd = new SqlCommand(queryStr, conn);
            cmd.ExecuteReader();
            conn.Close();

            ddlServiceType.DataBind();
            ibtnAddService.Visible = false;
            txtNewService.Visible = false;
            ibtnEditService.Visible = true;
        }

        protected void ibtnAddSubmitTo_Click(object sender, ImageClickEventArgs e)
        {
            conn = new SqlConnection(connString);
            conn.Open();

            String queryStr = "";
            queryStr = "INSERT INTO submitTo (coName)" + "VALUES ('" + txtNewSubmitTo.Text + "')";
            SqlCommand cmd = new SqlCommand(queryStr, conn);
            cmd.ExecuteReader();
            conn.Close();

            ddlSubmitTo.DataBind();
            ibtnAddSubmitTo.Visible = false;
            txtNewSubmitTo.Visible = false;
            ibtnEditSubmitTo.Visible = true;
        }

        //protected void ibtnRemoveService_Click(object sender, ImageClickEventArgs e)
        //{
        //    conn = new SqlConnection(connString);
        //    conn.Open();

        //    String queryStr = "";
        //    queryStr = "DELETE FROM serviceType_List WHERE serviceType = ('" + txtNewService.Text + "')";
        //    SqlCommand cmd = new SqlCommand(queryStr, conn);
        //    cmd.ExecuteReader();
        //    conn.Close();

        //    Response.Redirect(Request.RawUrl);
        //}

        protected void ibtnConfirm_Click(object sender, ImageClickEventArgs e)
        {
            if (txtNewPassportNo.Text == "")
            {
                ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('Invalid new passport number !!');", true);
            }
            else
            {
                conn = new SqlConnection(connString);
                conn.Open();
                String queryStr = "";
                queryStr = "SELECT COUNT(*) FROM workerDetails WHERE passportNo_New LIKE ('" + txtNewPassportNo.Text + "')";
                SqlCommand cmd = new SqlCommand(queryStr, conn);
                int workerCount = (int)cmd.ExecuteScalar();

                if (workerCount > 0)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('Worker already exist in database, please insert another worker details !!');", true);
                }
                else
                {
                    insertWorkers();
                }

                conn.Close();
            }
        }

        public void insertWorkers()
        {
            SqlDateTime defaultDate = SqlDateTime.Null;

            conn = new SqlConnection(connString);
            conn.Open();
            String queryStr = "";
            queryStr = "INSERT INTO workerDetails (receivedDate,name,gender,nationality,DOB,contactNo,address,workerStatus,passportNo_New,passportNo_Old,passportExp,PLKSExp,PLKSCompany,employerName,employerCompany,employerContact_No,sector,agent,adminIncharge,serviceType,submitBy,submitTo,submitDate,policyIG,remark,callingVISANo)" +
                "VALUES (@receivedDate,'" + txtName.Text + "','" + rbtnGender.SelectedItem + "','" + ddlNationality.Text + "',@dob,'" + txtPhoneNo1.Text + txtPhoneNo2.Text + "','" + txtAddress.Text + "','" + rbtnWorkerStatus.SelectedItem + "','" + txtNewPassportNo.Text + "','" + txtOldPassportNo.Text + "',@passportExp,@PLKSExp,'" + ddlPermitCompany.Text + "','" + txtEmpName.Text + "','" + txtEmpCompanyName.Text + "','" + txtEmpTel1.Text + txtEmpTel2.Text + "','" + ddlSector.Text + "','" + txtAgent.Text + "','" + ddlAdminIncharge.Text + "','" + ddlServiceType.Text + "','" + ddlSubmitBy.Text + "','" + ddlSubmitTo.Text + "',@submitDate,'" + txtPolicyIG.Text + "','" + txtRemarks.Text + "','" + txtCallingVISANo.Text + "')";
            SqlCommand cmd = new SqlCommand(queryStr, conn);
            if (txtReceivedDate.Text == "")
            {
                cmd.Parameters.AddWithValue("@receivedDate", defaultDate);
            }
            else
            {
                cmd.Parameters.AddWithValue("@receivedDate", txtReceivedDate.Text);
            }

            if (txtDOB.Text == "")
            {
                cmd.Parameters.AddWithValue("@dob", defaultDate);
            }
            else
            {
                cmd.Parameters.AddWithValue("@dob", txtDOB.Text);
            }

            if (txtPPExpiryDate.Text == "")
            {
                cmd.Parameters.AddWithValue("@passportExp", defaultDate);
            }
            else
            {
                cmd.Parameters.AddWithValue("@passportExp", txtPPExpiryDate.Text);
            }

            if (txtPLKSExpiryDate.Text == "")
            {
                cmd.Parameters.AddWithValue("@PLKSExp", defaultDate);
            }
            else
            {
                cmd.Parameters.AddWithValue("@PLKSExp", txtPLKSExpiryDate.Text);
            }

            if (txtSubmitDate.Text == "")
            {
                cmd.Parameters.AddWithValue("@submitDate", defaultDate);
            }
            else
            {
                cmd.Parameters.AddWithValue("@submitDate", txtSubmitDate.Text);
            }
            cmd.ExecuteReader();
            conn.Close();

            //conn2 = new SqlConnection(connString);
            //conn2.Open();
            //String queryStr2 = "";
            //queryStr2 = "INSERT INTO workerInsurans (policyIG,passportNo,nextOfKin,nextOfKinAddress)" +
            //    "VALUES ('" + txtPolicyIG.Text + "','" + txtNewPassportNo.Text + "','" + txtNextOfKin.Text + "','" + txtNextOfKinAddr.Text + "')";
            //SqlCommand cmd2 = new SqlCommand(queryStr2, conn2);
            //cmd2.ExecuteReader();
            //conn2.Close();

            conn3 = new SqlConnection(connString);
            DataTable dt2 = new DataTable();
            conn3.Open();
            String queryStr3 = "";
            queryStr3 = "SELECT COUNT(*) FROM workerInsurans WHERE passportNo = ('" + txtNewPassportNo.Text + "')";
            SqlCommand cmd3 = new SqlCommand(queryStr3, conn3);
            int workerCount = (int)cmd3.ExecuteScalar();

            if (workerCount > 0)
            {
                conn2 = new SqlConnection(connString);
                conn2.Open();
                String queryStr2 = "";
                queryStr2 = "UPDATE workerInsurans SET policyIG=@policyIG, nextOfKin=@nextOfKin, nextOfKinAddress=@nextOfKinAddress WHERE passportNo = ('" + txtNewPassportNo.Text + "')";
                SqlCommand cmd2 = new SqlCommand(queryStr2, conn2);
                cmd2.Parameters.AddWithValue("@policyIG", txtPolicyIG.Text);
                cmd2.Parameters.AddWithValue("@nextOfKin", txtNextOfKin.Text);
                cmd2.Parameters.AddWithValue("@nextOfKinAddress", txtNextOfKinAddr.Text);
                cmd2.ExecuteNonQuery();
                conn2.Close();
            }
            else
            {
                conn4 = new SqlConnection(connString);
                conn4.Open();
                String queryStr4 = "";
                queryStr4 = "INSERT INTO workerInsurans (policyIG,passportNo,nextOfKin,nextOfKinAddress)" +
                    "VALUES ('" + txtPolicyIG.Text + "','" + txtNewPassportNo.Text + "','" + txtNextOfKin.Text + "','" + txtNextOfKinAddr.Text + "')";
                SqlCommand cmd4 = new SqlCommand(queryStr4, conn4);
                cmd4.ExecuteReader();
                conn4.Close();
            }

            ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('Record saved !!'); window.location='" + ResolveUrl(Request.RawUrl) + "'", true);
        }

        protected void ibtnEditNationality_Click(object sender, ImageClickEventArgs e)
        {
            ibtnAddNationality.Visible = true;
            txtNewNationality.Visible = true;
            ibtnEditNationality.Visible = false;
        }

        protected void ibtnEditSector_Click(object sender, ImageClickEventArgs e)
        {
            ibtnAddSector.Visible = true;
            txtNewSector.Visible = true;
            ibtnEditSector.Visible = false;
        }

        protected void ibtnEditService_Click(object sender, ImageClickEventArgs e)
        {
            ibtnAddService.Visible = true;
            txtNewService.Visible = true;
            ibtnEditService.Visible = false;
        }

        protected void ibtnEditSubmitTo_Click(object sender, ImageClickEventArgs e)
        {
            ibtnAddSubmitTo.Visible = true;
            txtNewSubmitTo.Visible = true;
            ibtnEditSubmitTo.Visible = false;
        }

        protected void ddlPermitCompany_SelectedIndexChanged(object sender, EventArgs e)
        {
            conn = new SqlConnection(connString);
            DataTable dt = new DataTable();
            conn.Open();
            reader = null;
            String queryStr = "";
            queryStr = "SELECT * FROM permitCompany_List WHERE companyName = ('" + ddlPermitCompany.SelectedValue + "')";
            SqlCommand cmd = new SqlCommand(queryStr, conn);
            reader = cmd.ExecuteReader();

            while (reader.Read())
            {
                txtEmpName.Text = reader["empName"].ToString();
                txtEmpTel1.Text = reader["empCont_No1"].ToString();
                txtEmpTel2.Text = reader["empCont_No2"].ToString();
                if (reader["compSector"].ToString() != "")
                {
                    ddlSector.SelectedValue = reader["compSector"].ToString();
                }
                else
                {
                    
                }
            }
            reader.Close();
            conn.Close();
        }

        //protected void btnGetAge_Click(object sender, EventArgs e)
        //{
        //    DateTime dob = Convert.ToDateTime(txtDOB.Text);
        //    DateTime PresentYear = DateTime.Now;
        //    TimeSpan ts = PresentYear - dob;
        //    DateTime Age = DateTime.MinValue.AddDays(ts.Days);
        //    txtAge.Text = (Age.Year-1).ToString();
        //}

        //protected void Calendar1_DayRender(object sender, DayRenderEventArgs e)
        //{
        //    string ctrl = Request.QueryString["ctl"];
        //    HyperLink hpl = new HyperLink();
        //    hpl.Text = ((LiteralControl)e.Cell.Controls[0]).Text;
        //    hpl.NavigateUrl = "javascript:SetDate('" + e.Day.Date.ToShortDateString() + "','" + ctrl + "');";
        //    e.Cell.Controls.Clear();
        //    e.Cell.Controls.Add(hpl);
        //}
    }
    
}