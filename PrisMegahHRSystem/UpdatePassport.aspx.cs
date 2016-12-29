//http://tympanus.net/codrops/2012/10/04/custom-drop-down-list-styling/
//http://stackoverflow.com/questions/18952736/how-to-style-asp-net-dropdownlist
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
    public partial class UpdatePassport : System.Web.UI.Page
    {
        String connString = System.Configuration.ConfigurationManager.ConnectionStrings["PrisMegahConnString"].ToString();
        SqlConnection conn = null, conn2 = null;
        SqlDataReader reader;

        protected void Page_Load(object sender, EventArgs e)
        {
            string position = Session["role"].ToString();
            if (position == "Director" || position == "System Admin" || position == "Administrator")
            {
                string user = Session["id"].ToString();
                conn = new SqlConnection(connString);
                DataTable dt = new DataTable();
                conn.Open();
                reader = null;
                String queryStr = "";
                if (position == "System Admin" || position == "Director")
                {
                    queryStr = "SELECT passportNo_New FROM workerDetails WHERE workerStatus = 'Available'";
                }
                else if (position == "Administrator")
                {
                    queryStr = "SELECT passportNo_New FROM workerDetails INNER JOIN permitCompany_List ON (workerDetails.PLKSCompany=permitCompany_List.companyName)" +
                        " INNER JOIN userDetails ON (permitCompany_List.PIC1=userDetails.name OR permitCompany_List.PIC2=userDetails.name OR permitCompany_List.PIC3=userDetails.name OR permitCompany_List.PIC4=userDetails.name)" +
                        " WHERE workerStatus = 'Available' AND userDetails.loginID=('" + user + "')";
                }
                SqlCommand cmd = new SqlCommand(queryStr, conn);
                reader = cmd.ExecuteReader();
                ddlSearchPPNo.DataSource = reader;
                ddlSearchPPNo.DataValueField = "passportNo_New";
                ddlSearchPPNo.DataTextField = "passportNo_New";
                if (!IsPostBack)
                {
                    ddlSearchPPNo.DataBind();
                }
                reader.Close();
                conn.Close();
            }
            else
            {
                Response.Redirect("~/LogoutScreen.aspx");
            }

            ddlAdminIncharge.Visible = false;
            ddlServiceType.Visible = false;
            ddlSubmitBy.Visible = false;
            ddlSubmitTo.Visible = false;
            //lblName.Text = "";
        }

        protected void Page_PreInit(object sender, EventArgs e)
        {
            string userRole = Session["role"].ToString();

            if (userRole == "System Admin" || userRole == "Director")
                this.Page.MasterPageFile = "~/Master page/Director.master";
            else if (userRole == "Administrator")
                this.Page.MasterPageFile = "~/Master page/Admin.master";
        }

        protected void Calendar1_SelectionChanged(object sender, EventArgs e)
        {
            lblPPExpired.ForeColor = System.Drawing.Color.Green;
            Label26.ForeColor = System.Drawing.Color.Green;
            lblPPExpired.Text = Calendar1.SelectedDate.ToString("yyyy-MM-dd");
            Label26.Text = "(new)";
            Calendar1.Visible = false;
            ibtnEditPPExp.Visible = true;
        }

        protected void Calendar2_SelectionChanged(object sender, EventArgs e)
        {
            lblPLKSExpired.ForeColor = System.Drawing.Color.Green;
            Label27.ForeColor = System.Drawing.Color.Green;
            lblPLKSExpired.Text = Calendar2.SelectedDate.ToString("yyyy-MM-dd");
            Label27.Text = "(new)";
            Calendar2.Visible = false;
            ibtnEditPLKSExp.Visible = true;
        }

        protected void Calendar3_SelectionChanged(object sender, EventArgs e)
        {
            lblSubmit.ForeColor = System.Drawing.Color.Green;
            Label38.ForeColor = System.Drawing.Color.Green;
            lblSubmit.Text = Calendar3.SelectedDate.ToString("yyyy-MM-dd");
            Label38.Text = "(new)";
            Calendar3.Visible = false;
            ibtnEditSubmit.Visible = true;
        }

        protected void Calendar4_SelectionChanged(object sender, EventArgs e)
        {
            lblSPExpired.ForeColor = System.Drawing.Color.Green;
            Label39.ForeColor = System.Drawing.Color.Green;
            lblSPExpired.Text = Calendar4.SelectedDate.ToString("yyyy-MM-dd");
            Label39.Text = "(new)";
            Calendar4.Visible = false;
            ibtnEditSPExpiry.Visible = true;
        }

        protected void Calendar5_SelectionChanged(object sender, EventArgs e)
        {
            lblProcess.ForeColor = System.Drawing.Color.Green;
            Label40.ForeColor = System.Drawing.Color.Green;
            lblProcess.Text = Calendar5.SelectedDate.ToString("yyyy-MM-dd");
            Label40.Text = "(new)";
            Calendar5.Visible = false;
            ibtnEditProcess.Visible = true;
        }

        protected void Calendar6_SelectionChanged(object sender, EventArgs e)
        {
            lblReturn.ForeColor = System.Drawing.Color.Green;
            Label41.ForeColor = System.Drawing.Color.Green;
            lblReturn.Text = Calendar6.SelectedDate.ToString("yyyy-MM-dd");
            Label41.Text = "(new)";
            Calendar6.Visible = false;
            ibtnEditReturn.Visible = true;
        }

        protected void Calendar7_SelectionChanged(object sender, EventArgs e)
        {
            lblEmpDelivery.ForeColor = System.Drawing.Color.Green;
            Label42.ForeColor = System.Drawing.Color.Green;
            lblEmpDelivery.Text = Calendar7.SelectedDate.ToString("yyyy-MM-dd");
            Label42.Text = "(new)";
            Calendar7.Visible = false;
            ibtnEditEmpDelivery.Visible = true;
        }

        protected void ibtnEditAdmin_Click(object sender, ImageClickEventArgs e)
        {
            ddlAdminIncharge.Visible = true;
            //ddlAdminIncharge.SelectedValue = lblAdminIncharge.Text;
        }

        protected void ibtnEditService_Click(object sender, ImageClickEventArgs e)
        {
            ddlServiceType.Visible = true;
        }

        protected void ibtnEditSB_Click(object sender, ImageClickEventArgs e)
        {
            ddlSubmitBy.Visible = true;
        }

        protected void ibtnEditST_Click(object sender, ImageClickEventArgs e)
        {
            ddlSubmitTo.Visible = true;
        }

        protected void ibtnSearchBy_Click(object sender, ImageClickEventArgs e)
        {
            conn = new SqlConnection(connString);
            DataTable dt = new DataTable();
            conn.Open();
            reader = null;
            String queryStr = "";
            queryStr = "SELECT name,gender,nationality,PLKSCompany,employerName,employerCompany," + 
                "employerContact_No,sector,agent,adminIncharge,serviceType,servicePhase,submitBy," + 
                "submitTo,passportNo_Old,passportNo_New,FORMAT(passportExp,'yyyy-MM-dd') AS ppExp,FORMAT(PLKSExp,'yyyy-MM-dd') AS plksExp," + 
                "FORMAT(submitDate,'yyyy-MM-dd') AS submitDate,FORMAT(specialPassExp,'yyyy-MM-dd') AS specialPassExp," + 
                "FORMAT(processDate,'yyyy-MM-dd') AS processDate,FORMAT(returnDate,'yyyy-MM-dd') AS returnDate," + 
                "FORMAT(deliverToEmpDate,'yyyy-MM-dd') AS deliverToEmpDate,remark " + 
                "FROM [PrisMegahHR].[dbo].[workerDetails] WHERE passportNo_New = ('" + ddlSearchPPNo.Text + "')";
            SqlCommand cmd = new SqlCommand(queryStr, conn);
            reader = cmd.ExecuteReader();

            while (reader.Read())
            {
                lblName.Text = reader["name"].ToString();
                lblGender.Text = reader["gender"].ToString();
                lblNationality.Text = reader["nationality"].ToString();
                lblPLKSCo.Text = reader["PLKSCompany"].ToString();
                lblEmpName.Text = reader["employerName"].ToString();
                lblEmpCo.Text = reader["employerCompany"].ToString();
                lblEmpContact.Text = reader["employerContact_No"].ToString();
                lblSector.Text = reader["sector"].ToString();
                lblAgent.Text = reader["agent"].ToString();
                lblAdminIncharge.Text = reader["adminIncharge"].ToString();
                lblServiceType.Text = reader["serviceType"].ToString();
                txtServicePhase.Text = reader["servicePhase"].ToString();
                lblSubmitBy.Text = reader["submitBy"].ToString();
                lblSubmitTo.Text = reader["submitTo"].ToString();
                txtOldPPNo.Text = reader["passportNo_Old"].ToString();
                txtNewPPNo.Text = reader["passportNo_New"].ToString();
                lblPPExpired.Text = reader["ppExp"].ToString();
                Label26.ForeColor = System.Drawing.Color.Red;
                Label26.Text = "(old)";
                lblPLKSExpired.Text = reader["plksExp"].ToString();
                Label27.ForeColor = System.Drawing.Color.Red;
                Label27.Text = "(old)";
                lblSubmit.Text = reader["submitDate"].ToString();
                Label38.ForeColor = System.Drawing.Color.Red;
                Label38.Text = "(old)";
                lblSPExpired.Text = reader["specialPassExp"].ToString();
                Label39.ForeColor = System.Drawing.Color.Red;
                Label39.Text = "(old)";
                lblProcess.Text = reader["processDate"].ToString();
                Label40.ForeColor = System.Drawing.Color.Red;
                Label40.Text = "(old)";
                lblReturn.Text = reader["returnDate"].ToString();
                Label41.ForeColor = System.Drawing.Color.Red;
                Label41.Text =  "(old)";
                lblEmpDelivery.Text = reader["deliverToEmpDate"].ToString();
                Label42.ForeColor = System.Drawing.Color.Red;
                Label42.Text = "(old)";
                txtRemark.Text = reader["remark"].ToString();
            }
            reader.Close();
            conn.Close();
        }

        public void displayDetails()
        {
            ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('Update successful !!'); window.location='" + ResolveUrl(Request.RawUrl) + "'", true);
        }

        protected void ddlServiceType_SelectedIndexChanged(object sender, EventArgs e)
        {
            lblServiceType.Text = ddlServiceType.SelectedItem.Text;
        }

        protected void ddlSubmitBy_SelectedIndexChanged(object sender, EventArgs e)
        {
            lblSubmitBy.Text = ddlSubmitBy.SelectedItem.Text;
        }

        protected void ddlAdminIncharge_SelectedIndexChanged(object sender, EventArgs e)
        {
            lblAdminIncharge.Text = ddlAdminIncharge.SelectedItem.Text;
        }

        protected void ddlSubmitTo_SelectedIndexChanged(object sender, EventArgs e)
        {
            lblSubmitTo.Text = ddlSubmitTo.SelectedItem.Text;
        }

        protected void txtServicePhase_TextChanged(object sender, EventArgs e)
        {
            txtServicePhase.Text = txtServicePhase.Text.ToUpper();
        }

        protected void txtNewPPNo_TextChanged(object sender, EventArgs e)
        {
            txtNewPPNo.Text = txtNewPPNo.Text.ToUpper();
        }

        protected void ibtnEditPPExp_Click(object sender, ImageClickEventArgs e)
        {
            Calendar1.Visible = true;
            ibtnEditPPExp.Visible = false;
        }

        protected void ibtnEditPLKSExp_Click(object sender, ImageClickEventArgs e)
        {
            Calendar2.Visible = true;
            ibtnEditPLKSExp.Visible = false;
        }

        protected void ibtnEditSubmit_Click(object sender, ImageClickEventArgs e)
        {
            Calendar3.Visible = true;
            ibtnEditSubmit.Visible = false;
        }

        protected void ibtnEditSPExpiry_Click(object sender, ImageClickEventArgs e)
        {
            Calendar4.Visible = true;
            ibtnEditSPExpiry.Visible = false;
        }

        protected void ibtnEditProcess_Click(object sender, ImageClickEventArgs e)
        {
            Calendar5.Visible = true;
            ibtnEditProcess.Visible = false;
        }

        protected void ibtnEditReturn_Click(object sender, ImageClickEventArgs e)
        {
            Calendar6.Visible = true;
            ibtnEditReturn.Visible = false;
        }

        protected void ibtnEditEmpDelivery_Click(object sender, ImageClickEventArgs e)
        {
            Calendar7.Visible = true;
            ibtnEditEmpDelivery.Visible = false;
        }

        protected void btnUpdateDate_Click(object sender, EventArgs e)
        {
            SqlDateTime defaultDate = SqlDateTime.Null;

            if (txtNewPPNo.Text == "")
            {
                lblError.Text = "* new passport number required";
            }
            else
            {
                conn = new SqlConnection(connString);
                conn.Open();
                String queryStr = "";
                queryStr = "UPDATE workerDetails SET adminIncharge=@adminIncharge, serviceType=@serviceType, servicePhase=@servicePhase, submitBy=@submitBy, submitTo=@submitTo, passportNo_Old=@passportNo_Old, passportNo_New=@passportNo_New, passportExp=@passportExp, PLKSExp=@PLKSExp, submitDate=@submitDate, specialPassExp=@specialPassExp, processDate=@processDate, returnDate=@returnDate, deliverToEmpDate=@deliverToEmpDate, remark=@remark WHERE passportNo_New = ('" + ddlSearchPPNo.Text + "')";
                SqlCommand cmd = new SqlCommand(queryStr, conn);
                cmd.Parameters.AddWithValue("@adminIncharge", lblAdminIncharge.Text);
                cmd.Parameters.AddWithValue("@serviceType", lblServiceType.Text);
                cmd.Parameters.AddWithValue("@servicePhase", txtServicePhase.Text);
                cmd.Parameters.AddWithValue("@submitBy", lblSubmitBy.Text);
                cmd.Parameters.AddWithValue("@submitTo", lblSubmitTo.Text);
                cmd.Parameters.AddWithValue("@passportNo_Old", txtOldPPNo.Text);
                cmd.Parameters.AddWithValue("@passportNo_New", txtNewPPNo.Text);
                cmd.Parameters.AddWithValue("@remark", txtRemark.Text);

                if (lblPPExpired.Text == "")
                {
                    cmd.Parameters.AddWithValue("@passportExp", defaultDate);
                }
                else
                {
                    cmd.Parameters.AddWithValue("@passportExp", lblPPExpired.Text);
                }

                if (lblPLKSExpired.Text == "")
                {
                    cmd.Parameters.AddWithValue("@PLKSExp", defaultDate);
                }
                else
                {
                    cmd.Parameters.AddWithValue("@PLKSExp", lblPLKSExpired.Text);
                }

                if (lblSubmit.Text == "")
                {
                    cmd.Parameters.AddWithValue("@submitDate", defaultDate);
                }
                else
                {
                    cmd.Parameters.AddWithValue("@submitDate", lblSubmit.Text);
                }

                if (lblSPExpired.Text == "")
                {
                    cmd.Parameters.AddWithValue("@specialPassExp", defaultDate);
                }
                else
                {
                    cmd.Parameters.AddWithValue("@specialPassExp", lblSPExpired.Text);
                }

                if (lblProcess.Text == "")
                {
                    cmd.Parameters.AddWithValue("@processDate", defaultDate);
                }
                else
                {
                    cmd.Parameters.AddWithValue("@processDate", lblProcess.Text);
                }

                if (lblReturn.Text == "")
                {
                    cmd.Parameters.AddWithValue("@returnDate", defaultDate);
                }
                else
                {
                    cmd.Parameters.AddWithValue("@returnDate", lblReturn.Text);
                }

                if (lblEmpDelivery.Text == "")
                {
                    cmd.Parameters.AddWithValue("@deliverToEmpDate", defaultDate);
                }
                else
                {
                    cmd.Parameters.AddWithValue("@deliverToEmpDate", lblEmpDelivery.Text);
                }
                cmd.ExecuteNonQuery();
                conn.Close();

                conn2 = new SqlConnection(connString);
                conn2.Open();
                String queryStr2 = "";
                queryStr2 = "UPDATE workerInsurans SET passportNo=@passportNo WHERE passportNo = ('" + ddlSearchPPNo.Text + "')";
                SqlCommand cmd2 = new SqlCommand(queryStr2, conn2);
                cmd2.Parameters.AddWithValue("@passportNo", txtNewPPNo.Text);
                cmd2.ExecuteNonQuery();
                conn2.Close();

                ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('Updated successfull !!'); window.location='" + ResolveUrl(Request.RawUrl) + "'", true);
                
            }
        }
    }
}