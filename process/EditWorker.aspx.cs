using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Data.SqlTypes;

namespace PrisMegahHRSystem.Particular_Maintenance
{
    public partial class EditWorker : System.Web.UI.Page
    {
        String connString = System.Configuration.ConfigurationManager.ConnectionStrings["PrisMegahConnString"].ToString();
        SqlConnection conn = null, conn2 = null, conn3 = null, conn4 = null;
        SqlDataReader reader, reader2;

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

        protected void ibtnSearchBy_Click(object sender, ImageClickEventArgs e)
        {
            ibtnSearchBy.Visible = false;
            ddlPPNo.Enabled = false;
            conn = new SqlConnection(connString);
            DataTable dt = new DataTable();
            conn.Open();
            reader = null;
            String queryStr = "";
            queryStr = "SELECT FORMAT(receivedDate,'yyyy-MM-dd') AS receivedDate, name, contactNo, gender, nationality, FORMAT(DOB,'yyyy-MM-dd') AS DOB, workerStatus, address, PLKSCompany," +
                " employerName, employerCompany, employerContact_No, sector, agent, policyIG" + 
                " FROM workerDetails WHERE passportNo_New=('" + ddlPPNo.SelectedItem.Text + "') ";
            SqlCommand cmd = new SqlCommand(queryStr, conn);
            reader = cmd.ExecuteReader();

            while (reader.Read())
            {
                txtReceivedDate.Text = reader["receivedDate"].ToString();
                txtName.Text = reader["name"].ToString();
                txtPhoneNo.Text = reader["contactNo"].ToString();
                lblGender.Text = reader["gender"].ToString();
                lblNationality.Text = reader["nationality"].ToString();
                txtDOB.Text = reader["DOB"].ToString();
                lblWorkerStatus.Text = reader["workerStatus"].ToString();
                txtAddress.Text = reader["address"].ToString();
                lblPLKSCo.Text = reader["PLKSCompany"].ToString();
                txtEmpName.Text = reader["employerName"].ToString();
                txtEmpCompName.Text = reader["employerCompany"].ToString();
                txtEmpTel.Text = reader["employerContact_No"].ToString();
                lblSector.Text = reader["sector"].ToString();
                txtAgent.Text = reader["agent"].ToString();
                //txtInvoiceRef.Text = reader["invoiceNo"].ToString();
                txtPolicyIG.Text = reader["policyIG"].ToString();
            }
            reader.Close();
            conn.Close();

            conn2 = new SqlConnection(connString);
            DataTable dt2 = new DataTable();
            conn2.Open();
            reader2 = null;
            String queryStr2 = "";
            queryStr2 = "SELECT nextOfKin, nextOfKinAddress FROM workerInsurans WHERE passportNo=('" + ddlPPNo.SelectedItem.Text + "')";
            SqlCommand cmd2 = new SqlCommand(queryStr2, conn2);
            reader2 = cmd2.ExecuteReader();

            while (reader2.Read())
            {
                txtNextOfKin.Text = reader2["nextOfKin"].ToString();
                txtNextOfKinAddr.Text = reader2["nextOfKinAddress"].ToString();
            }
            reader2.Close();
            conn2.Close();
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

        protected void txtEmpName_TextChanged(object sender, EventArgs e)
        {
            txtEmpName.Text = txtEmpName.Text.ToUpper();
        }

        protected void txtAgent_TextChanged(object sender, EventArgs e)
        {
            txtAgent.Text = txtAgent.Text.ToUpper();
        }

        //protected void txtInvoiceRef_TextChanged(object sender, EventArgs e)
        //{
        //    txtInvoiceRef.Text = txtInvoiceRef.Text.ToUpper();
        //}

        protected void txtNextOfKin_TextChanged(object sender, EventArgs e)
        {
            txtNextOfKin.Text = txtNextOfKin.Text.ToUpper();
        }

        protected void txtEmpCompName_TextChanged(object sender, EventArgs e)
        {
            txtEmpCompName.Text = txtEmpCompName.Text.ToUpper();
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

        protected void ibtnEditGender_Click(object sender, ImageClickEventArgs e)
        {
            ibtnEditGender.Visible = false;
            rbtnGender.Visible = true;
        }

        protected void ibtnEditWorkerStatus_Click(object sender, ImageClickEventArgs e)
        {
            ibtnEditWorkerStatus.Visible = false;
            rbtnWorkerStatus.Visible = true;
        }

        protected void ibtnConfirm_Click(object sender, ImageClickEventArgs e)
        {
            SqlDateTime defaultDate = SqlDateTime.Null;

            ibtnSearchBy.Visible = true;
            ddlPPNo.Enabled = true;
            conn = new SqlConnection(connString);
            conn.Open();
            String queryStr = "";
            queryStr = "UPDATE workerDetails SET receivedDate=@receivedDate, name=@name, contactNo=@contactNo, gender=@gender, nationality=@nationality, DOB=@dob, workerStatus=@workerStatus, address=@address," +
                " PLKSCompany=@PLKSCompany, employerName=@employerName, employerCompany=@employerCompany, employerContact_No=@employerContact_No, sector=@sector, agent=@agent, policyIG=@policyIG" + 
                " WHERE passportNo_New = ('" + ddlPPNo.SelectedItem.Text + "')";
            SqlCommand cmd = new SqlCommand(queryStr, conn);
            if (txtReceivedDate.Text == "")
            {
                cmd.Parameters.AddWithValue("@receivedDate", defaultDate);
            }
            else
            {
                cmd.Parameters.AddWithValue("@receivedDate", txtReceivedDate.Text);
            }
            cmd.Parameters.AddWithValue("@name", txtName.Text);
            cmd.Parameters.AddWithValue("@contactNo", txtPhoneNo.Text);
            cmd.Parameters.AddWithValue("@gender", lblGender.Text);
            cmd.Parameters.AddWithValue("@nationality", lblNationality.Text);
            if (txtDOB.Text == "")
            {
                cmd.Parameters.AddWithValue("@dob", defaultDate);
            }
            else
            {
                cmd.Parameters.AddWithValue("@dob", txtDOB.Text);
            }
            cmd.Parameters.AddWithValue("@workerStatus", lblWorkerStatus.Text);
            cmd.Parameters.AddWithValue("@address", txtAddress.Text);
            cmd.Parameters.AddWithValue("@PLKSCompany", lblPLKSCo.Text);
            cmd.Parameters.AddWithValue("@employerName", txtEmpName.Text);
            cmd.Parameters.AddWithValue("@employerCompany", txtEmpCompName.Text);
            cmd.Parameters.AddWithValue("@employerContact_No", txtEmpTel.Text);
            cmd.Parameters.AddWithValue("@sector", lblSector.Text);
            cmd.Parameters.AddWithValue("@agent", txtAgent.Text);
            //cmd.Parameters.AddWithValue("@invoiceNo", txtInvoiceRef.Text);
            cmd.Parameters.AddWithValue("@policyIG", txtPolicyIG.Text);
            cmd.ExecuteNonQuery();
            conn.Close();

            conn3 = new SqlConnection(connString);
            DataTable dt2 = new DataTable();
            conn3.Open();
            String queryStr3 = "";
            queryStr3 = "SELECT COUNT(*) FROM workerInsurans WHERE passportNo = ('" + ddlPPNo.Text + "')";
            SqlCommand cmd3 = new SqlCommand(queryStr3, conn3);
            int workerCount = (int) cmd3.ExecuteScalar();            

            if (workerCount > 0)
            {
                conn2 = new SqlConnection(connString);
                conn2.Open();
                String queryStr2 = "";
                queryStr2 = "UPDATE workerInsurans SET policyIG=@policyIG, nextOfKin=@nextOfKin, nextOfKinAddress=@nextOfKinAddress WHERE passportNo = ('" + ddlPPNo.SelectedItem.Text + "')";
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
                    "VALUES ('" + txtPolicyIG.Text + "','" + ddlPPNo.SelectedItem.Text + "','" + txtNextOfKin.Text + "','" + txtNextOfKinAddr.Text + "')";
                SqlCommand cmd4 = new SqlCommand(queryStr4, conn4);
                cmd4.ExecuteReader();
                conn4.Close();
            }          

            ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('Worker updated successful !!'); window.location='" + ResolveUrl(Request.RawUrl) + "'", true);
        }

        protected void ibtnCancel_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("../Home.aspx");
        }

        protected void rbtnGender_SelectedIndexChanged(object sender, EventArgs e)
        {
            lblGender.Text = rbtnGender.SelectedItem.Text;
            ibtnEditGender.Visible = true;
            rbtnGender.Visible = false;
        }

        protected void rbtnWorkerStatus_SelectedIndexChanged(object sender, EventArgs e)
        {
            lblWorkerStatus.Text = rbtnWorkerStatus.SelectedItem.Text;
            ibtnEditWorkerStatus.Visible = true;
            rbtnWorkerStatus.Visible = false;
        }

        protected void ibtnMoveNation_Click(object sender, ImageClickEventArgs e)
        {
            lblNationality.Text = ddlNationality.SelectedValue;
        }

        protected void ibtnMovePLKSCo_Click(object sender, ImageClickEventArgs e)
        {
            lblPLKSCo.Text = ddlPermitCompany.SelectedValue;
            conn = new SqlConnection(connString);
            DataTable dt = new DataTable();
            conn.Open();
            reader = null;
            String queryStr = "";
            queryStr = "SELECT * FROM permitCompany_List WHERE companyName = ('" + lblPLKSCo.Text + "')";
            SqlCommand cmd = new SqlCommand(queryStr, conn);
            reader = cmd.ExecuteReader();

            while (reader.Read())
            {
                txtEmpName.Text = reader["empName"].ToString();
                txtEmpTel.Text = reader["empCont_No1"].ToString() + reader["empCont_No2"].ToString();
                if (reader["compSector"].ToString() != "")
                {
                    lblSector.Text = reader["compSector"].ToString();
                }
                else
                {

                }
            }
            reader.Close();
            conn.Close();
        }

        protected void ibtnMoveSector_Click(object sender, ImageClickEventArgs e)
        {
            lblSector.Text = ddlSector.SelectedValue;
        }
    }
}