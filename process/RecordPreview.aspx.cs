//http://www.aspsnippets.com/Articles/Export-data-from-SQL-Server-to-Excel-in-ASPNet-using-C-and-VBNet.aspx
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace PrisMegahHRSystem
{
    public partial class RecordPreview : System.Web.UI.Page
    {
        private static int PageSize = 10;
        String connString = System.Configuration.ConfigurationManager.ConnectionStrings["PrisMegahConnString"].ToString();
        SqlConnection conn = null;
        SqlDataReader reader;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["id"] != null)
            {
                string role = Session["role"].ToString();
                string user = Session["id"].ToString();
                conn = new SqlConnection(connString);
                DataTable dt = new DataTable();
                conn.Open();
                reader = null;
                String queryStr = "";
                if (role == "System Admin" || role == "Director")
                {
                    queryStr = "SELECT DISTINCT PLKSCompany FROM workerDetails WHERE (workerStatus = 'Available')";
                }
                else if (role == "Administrator")
                {
                    queryStr = "SELECT DISTINCT PLKSCompany FROM workerDetails INNER JOIN permitCompany_List ON (workerDetails.PLKSCompany=permitCompany_List.companyName)" +
                        " INNER JOIN userDetails ON (permitCompany_List.PIC1=userDetails.name OR permitCompany_List.PIC2=userDetails.name OR permitCompany_List.PIC3=userDetails.name OR permitCompany_List.PIC4=userDetails.name)" +
                        " WHERE (workerStatus = 'Available') AND userDetails.loginID=('" + user + "')";
                }
                SqlCommand cmd = new SqlCommand(queryStr, conn);
                reader = cmd.ExecuteReader();
                ddlSearchByCo.DataSource = reader;
                ddlSearchByCo.DataValueField = "PLKSCompany";
                ddlSearchByCo.DataTextField = "PLKSCompany";
                if (!IsPostBack)
                {
                    ddlSearchByCo.DataBind();
                }
                reader.Close();
                conn.Close();
            }
            else
                Response.Redirect("~/LogoutScreen.aspx");
        }

        [WebMethod]
        public static string GetWorkers(string searchTerm, int pageIndex)
        {
            string query = "[GetWorkers_Pager]";
            SqlCommand cmd = new SqlCommand(query);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@SearchTerm", searchTerm);
            cmd.Parameters.AddWithValue("@PageIndex", pageIndex);
            cmd.Parameters.AddWithValue("@PageSize", PageSize);
            cmd.Parameters.Add("@RecordCount", SqlDbType.Int, 4).Direction = ParameterDirection.Output;
            return GetData(cmd, pageIndex).GetXml();
        }

        private static DataSet GetData(SqlCommand cmd, int pageIndex)
        {
            string strConnString = ConfigurationManager.ConnectionStrings["PrisMegahConnString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(strConnString))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter())
                {
                    cmd.Connection = con;
                    sda.SelectCommand = cmd;
                    using (DataSet ds = new DataSet())
                    {
                        sda.Fill(ds, "workerDetails");
                        DataTable dt = new DataTable("Pager");
                        dt.Columns.Add("PageIndex");
                        dt.Columns.Add("PageSize");
                        dt.Columns.Add("RecordCount");
                        dt.Rows.Add();
                        dt.Rows[0]["PageIndex"] = pageIndex;
                        dt.Rows[0]["PageSize"] = PageSize;
                        dt.Rows[0]["RecordCount"] = cmd.Parameters["@RecordCount"].Value;
                        ds.Tables.Add(dt);
                        return ds;
                    }
                }
            }
        }

        public void setUserLog()
        {
            string user = Session["id"].ToString();
            string strConnString = ConfigurationManager.ConnectionStrings["PrisMegahConnString"].ConnectionString;
            SqlConnection conn = null;
            conn = new SqlConnection(strConnString);
            conn.Open();

            String queryStr = "";
            queryStr = "INSERT INTO downloadLog (loginID,downloadTime)" + "VALUES ('" + user + "',GETDATE())";
            SqlCommand cmd = new SqlCommand(queryStr, conn);
            cmd.ExecuteReader();
            conn.Close();
        }

        protected void txtSearchByName_TextChanged(object sender, EventArgs e)
        {
            txtSearchByName.Text = txtSearchByName.Text.ToUpper();
        }

        protected void ibtnByName_Click(object sender, ImageClickEventArgs e)
        {
            string role = Session["role"].ToString();
            string user = Session["id"].ToString();
            conn = new SqlConnection(connString);
            DataTable dt = new DataTable();
            conn.Open();
            String queryStr = "";
            if (role == "System Admin" || role == "Director")
            {
                queryStr = "SELECT FORMAT([receivedDate],'dd/MM/yyyy') AS [Received Date], [name] AS [Worker Name], [passportNo_New] AS [New Passport No], [passportNo_Old] AS [Old Passport No]," +
                    " [nationality] AS [Nationality], FORMAT([passportExp],'dd/MM/yyyy') AS [Passport Expiry], FORMAT([PLKSExp],'dd/MM/yyyy') AS [PLKS Expiry]," +
                    " [PLKSCompany] AS [Permit Company Name], [sector] AS [Sector], [employerName] AS [Client], [employerCompany] AS [Client Company]," +
                    " [employerContact_No] AS [Client Tel], [agent] AS [Marketing], [adminIncharge] AS [Admin], [serviceType] AS [Service Type], [servicePhase] AS [Service Phase]," +
                    " [submitBy] As [Submit By], [submitTo] AS [Submit To], [invoiceNo] AS [Invoice], FORMAT([submitDate],'dd/MM/yyyy') AS [Submit Date], [workerDetails].[policyIG] AS [Policy IG]," +
                    " [nextOfKin] AS [Next Of Kin], [nextOfKinAddress] AS [Next Of Kin Address],  [remark] AS [Remarks] FROM [workerDetails]" +
                    " LEFT JOIN [workerInsurans] ON workerDetails.passportNo_New=workerInsurans.passportNo" +
                    " WHERE name LIKE ('%" + txtSearchByName.Text + "%') AND workerStatus = 'Available'";
            }
            else if (role == "Administrator")
            {
                queryStr = "SELECT FORMAT([receivedDate],'dd/MM/yyyy') AS [Received Date], workerDetails.name AS [Worker Name], [passportNo_New] AS [New Passport No], [passportNo_Old] AS [Old Passport No]," +
                    " [nationality] AS [Nationality], FORMAT([passportExp],'dd/MM/yyyy') AS [Passport Expiry], FORMAT([PLKSExp],'dd/MM/yyyy') AS [PLKS Expiry]," +
                    " [PLKSCompany] AS [Permit Company Name], [sector] AS [Sector], [employerName] AS [Client], [employerCompany] AS [Client Company]," +
                    " [employerContact_No] AS [Client Tel], [agent] AS [Marketing], [adminIncharge] AS [Admin], [serviceType] AS [Service Type], [servicePhase] AS [Service Phase]," +
                    " [submitBy] As [Submit By], [submitTo] AS [Submit To], [invoiceNo] AS [Invoice], FORMAT([submitDate],'dd/MM/yyyy') AS [Submit Date], [workerDetails].[policyIG] AS [Policy IG]," +
                    " [nextOfKin] AS [Next Of Kin], [nextOfKinAddress] AS [Next Of Kin Address],  [remark] AS [Remarks] FROM (workerDetails" +
                    " INNER JOIN permitCompany_List ON (workerDetails.PLKSCompany=permitCompany_List.companyName)" +
                    " INNER JOIN userDetails ON (permitCompany_List.PIC1=userDetails.name OR permitCompany_List.PIC2=userDetails.name OR permitCompany_List.PIC3=userDetails.name OR permitCompany_List.PIC4=userDetails.name))" +
                    " LEFT JOIN [workerInsurans] ON workerDetails.passportNo_New=workerInsurans.passportNo" +
                    " WHERE workerDetails.name LIKE ('%" + txtSearchByName.Text + "%') AND workerStatus = 'Available' AND userDetails.loginID=('" + user + "')";
            }            
            SqlCommand cmd = new SqlCommand(queryStr, conn);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            sda.Fill(dt);
            gvWorkers.DataSource = dt;
            gvWorkers.DataBind();            
            conn.Close();
        }

        protected void btnTop_Click(object sender, EventArgs e)
        {
            Page.ClientScript.RegisterClientScriptBlock(btnTop.GetType(), "OnClick", "<script>window.scroll(0,0); </script>");
        }
    }
}