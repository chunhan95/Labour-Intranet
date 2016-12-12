//http://stackoverflow.com/questions/17903092/check-if-record-in-a-table-exist-in-a-database-through-executenonquery
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
    public partial class Login : System.Web.UI.Page
    {
        SqlDataReader reader, reader1;
        String connString = System.Configuration.ConfigurationManager.ConnectionStrings["PrisMegahConnString"].ToString();
        SqlConnection conn = null, conn1 = null, conn2 = null;

        protected void Page_Load(object sender, EventArgs e)
        {
            Label3.Text = DateTime.Today.ToString("dd/MM/yyyy");
        }

        protected void ibtnLogin_Click(object sender, ImageClickEventArgs e)
        {
            conn1 = new SqlConnection(connString);
            conn1.Open();

            String queryStr1 = "";
            queryStr1 = "SELECT * FROM systemState";
            SqlCommand cmd1 = new SqlCommand(queryStr1, conn1);
            reader1 = cmd1.ExecuteReader();

            while (reader1.Read())
            {
                if (reader1["status"].ToString() == "1")
                {
                    searchUser();
                }
                else
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('System is currently under maintenance, please try again later !!');", true);
                    Label4.Text = "Sorry, system is under maintenance !!";
                }
            }
            conn1.Close();
            reader1.Close();
        }

        public void searchUser()
        {
            Session["id"] = txtLoginID.Text;

            conn = new SqlConnection(connString);
            conn.Open();

            String queryStr = "";
            queryStr = "SELECT COUNT(*) FROM userDetails WHERE loginID LIKE ('" + txtLoginID.Text + "')";
            SqlCommand cmd = new SqlCommand(queryStr, conn);
            int userCount = (int)cmd.ExecuteScalar();

            //while (reader.Read())
            //{
            if (userCount > 0)
            {
                verifyUser();
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('User not exist !!');", true);
            }
            conn.Close();
            //}
            //reader.Close();
        }

        public void verifyUser()
        {
            conn2 = new SqlConnection(connString);
            conn2.Open();

            String queryStr2 = "";
            queryStr2 = "SELECT * FROM userDetails WHERE loginID = ('" + txtLoginID.Text + "')";
            SqlCommand cmd2 = new SqlCommand(queryStr2, conn2);
            reader = cmd2.ExecuteReader();

            while (reader.Read())
            {
                if (reader["password"].ToString() == txtLoginPw.Text && reader["loginID"].ToString() == txtLoginID.Text)
                {
                    if (reader["status"].ToString() == "Available")
                    {
                        Session["role"] = reader["position"].ToString();
                        Session["editPay"] = reader["editPayment"].ToString();
                        reader.Close();
                        Response.Redirect("~/Home.aspx");
                    }
                    else if (reader["status"].ToString() == "Resign")
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('User no longer have the right to access !!');", true);
                    }
                }
                else
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('Invalid password !!');", true);
                }
            }
            reader.Close();
            conn2.Close();            
        }
    }
}