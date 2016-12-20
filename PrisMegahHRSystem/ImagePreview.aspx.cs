//http://www.dotnetfunda.com/articles/show/2234/upload-pdf-file-and-open-it-in-browser
using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

namespace PrisMegahHRSystem
{
    public partial class ImagePreview : System.Web.UI.Page
    {
        SqlDataReader reader, reader2;

        protected void Page_Load(object sender, EventArgs e)
        {
            imgPersonalPhoto.Visible = false;
            //ltEmbedPassport.Visible = false;
            //ltEmbedSpecialPass.Visible = false;
            //ltEmbedPLKS.Visible = false;
            //ltEmbedInsurans.Visible = false;
        }

        protected void Page_PreInit(object sender, EventArgs e)
        {
            string userRole = Session["role"].ToString();

            if (userRole == "System Admin" || userRole == "Director")
                this.Page.MasterPageFile = "~/Master page/Director.master";
            else if (userRole == "Administrator")
                this.Page.MasterPageFile = "~/Master page/Admin.master";
            else if (userRole == "Accountant")
                this.Page.MasterPageFile = "~/Master page/Account.master";
        }

        protected void ibtnSearchByPPNo_Click(object sender, ImageClickEventArgs e)
        {
            imgPersonalPhoto.ImageUrl = "";
            //if (Request.QueryString["ImageID"] != null)
            //{
            //    reader = null;
            //    string strQuery = "SELECT t.[passportID],t.[passportNo],t.[fileName],t.[contentType],t.[data],t.[attDate] FROM [PrisMegahHR].[dbo].[passportAtt] t INNER JOIN (SELECT passportNo, max(attDate) as MaxDate FROM passportAtt WHERE passportNo = @passportNo GROUP BY passportNo) tm ON t.passportNo = tm.passportNo and t.attDate = tm.MaxDate";
            //    SqlCommand cmd = new SqlCommand(strQuery);
            //    //reader = cmd.ExecuteReader();
            //    //while (reader.Read())
            //    //{
            //        //cmd.Parameters.Add(ddlPPNo.Text, SqlDbType.NVarChar).Value = Request.QueryString["ImageID"];
            //    Request.QueryString["ImageID"] = cmd.Parameters.AddWithValue("@passportNo", ddlPPNo.Text);
            //        //Request.QueryString["ImageID"] = reader["passportID"].ToString();
            //    //}
            //    DataTable dt = GetData(cmd);
            //    if (dt != null)
            //    {
            //        Byte[] bytes = (Byte[])dt.Rows[0]["data"];
            //        Response.Buffer = true;
            //        Response.Charset = "";
            //        Response.Cache.SetCacheability(HttpCacheability.NoCache);
            //        Response.ContentType = dt.Rows[0]["contentType"].ToString();
            //        Response.AddHeader("content-disposition", "attachment;filename=" + dt.Rows[0]["fileName"].ToString());
            //        Response.BinaryWrite(bytes);
            //        Response.Flush();
            //        Response.End();
            //    }
            //}
            ////reader.Close();
            String connString = System.Configuration.ConfigurationManager.ConnectionStrings["PrisMegahConnString"].ToString();
            SqlConnection conn = null, conn2 = null;

            conn2 = new SqlConnection(connString);
            DataTable dt2 = new DataTable();
            conn2.Open();
            reader2 = null;
            String queryStr2 = "";
            queryStr2 = "SELECT workerDetails.* FROM workerDetails WHERE passportNo_New=('" + ddlPPNo.Text + "')";
            SqlCommand cmd2 = new SqlCommand(queryStr2, conn2);
            reader2 = cmd2.ExecuteReader();

            while (reader2.Read())
            {
                lblWorkerNo.Text = reader2["workerNo"].ToString();
            }
            reader2.Close();
            conn2.Close();

            conn = new SqlConnection(connString);
            DataTable dt = new DataTable();
            conn.Open();
            reader = null;
            String queryStr = "";
            queryStr = "SELECT t.[photoID],t.[workerNo],t.[fileName],t.[contentType],t.[attDate],t.[filePath] FROM [personalPhoto_Att] t INNER JOIN (SELECT workerNo, max(attDate) as MaxDate FROM [personalPhoto_Att] WHERE workerNo = ('" + lblWorkerNo.Text + "') GROUP BY workerNo) tm ON t.workerNo = tm.workerNo and t.attDate = tm.MaxDate";
            SqlCommand cmd = new SqlCommand(queryStr, conn);
            reader = cmd.ExecuteReader();
            imgPersonalPhoto.Visible = true;
            while (reader.Read())
            {
                imgPersonalPhoto.ImageUrl = "~/" + reader["filePath"].ToString();
            }
            reader.Close();
            //imgPersonalPhoto.Visible = true;
            //imgPersonalPhoto.ImageUrl = "~/Preview handler/HandlerImage.ashx?passportNo=" + ddlPPNo.Text;

            BindOldPassportGrid();
            BindNewPassportGrid();
            BindOldSpecialPassGrid();
            BindNewSpecialPassGrid();
            BindOldPLKSGrid();
            BindNewPLKSGrid();
            BindOldInsuransGrid();
            BindNewInsuransGrid();
        }

        private void BindOldPassportGrid()
        {
            string constr = ConfigurationManager.ConnectionStrings["PrisMegahConnString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.CommandText = "SELECT t.[passportID],t.[workerNo],t.[fileName1],t.[filePath1],t.[contentType1],t.[fileName2],t.[filePath2],t.[contentType2],t.[fileName3],t.[filePath3],t.[contentType3],t.[fileName4],t.[filePath4],t.[contentType4],t.[attDate] FROM [passportAtt] t INNER JOIN (SELECT TOP 1 * FROM (SELECT TOP 2 workerNo, attDate FROM [passportAtt] WHERE workerNo = ('" + lblWorkerNo.Text + "') ORDER BY attdate DESC)a ORDER BY a.attDate ASC) tm ON t.workerNo = tm.workerNo and t.attDate = tm.attDate";
                    cmd.Connection = con;
                    con.Open();
                    gvPassportOld1.DataSource = cmd.ExecuteReader();
                    gvPassportOld1.DataBind();
                    con.Close();
                    con.Open();
                    gvPassportOld2.DataSource = cmd.ExecuteReader();
                    gvPassportOld2.DataBind();
                    con.Close();
                }
            }
        }

        private void BindNewPassportGrid()
        {
            string constr = ConfigurationManager.ConnectionStrings["PrisMegahConnString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.CommandText = "SELECT t.[passportID],t.[workerNo],t.[fileName1],t.[filePath1],t.[contentType1],t.[fileName2],t.[filePath2],t.[contentType2],t.[fileName3],t.[filePath3],t.[contentType3],t.[fileName4],t.[filePath4],t.[contentType4],t.[attDate] FROM [passportAtt] t INNER JOIN (SELECT TOP 1 * FROM (SELECT TOP 2 workerNo, attDate FROM [passportAtt] WHERE workerNo = ('" + lblWorkerNo.Text + "') ORDER BY attdate DESC)a ORDER BY a.attDate DESC) tm ON t.workerNo = tm.workerNo and t.attDate = tm.attDate";
                    cmd.Connection = con;
                    con.Open();
                    gvPassportNew1.DataSource = cmd.ExecuteReader();
                    gvPassportNew1.DataBind();
                    con.Close();
                    con.Open();
                    gvPassportNew2.DataSource = cmd.ExecuteReader();
                    gvPassportNew2.DataBind();
                    con.Close();
                }
            }
        }

        private void BindOldSpecialPassGrid()
        {
            string constr = ConfigurationManager.ConnectionStrings["PrisMegahConnString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.CommandText = "SELECT t.[specialPassID],t.[workerNo],t.[fileName1],t.[filePath1],t.[contentType1],t.[fileName2],t.[filePath2],t.[contentType2],t.[fileName3],t.[filePath3],t.[contentType3],t.[fileName4],t.[filePath4],t.[contentType4],t.[attDate] FROM [specialPassAtt] t INNER JOIN (SELECT TOP 1 * FROM (SELECT TOP 2 workerNo, attDate FROM [specialPassAtt] WHERE workerNo = ('" + lblWorkerNo.Text + "') ORDER BY attdate DESC)a	ORDER BY a.attDate ASC) tm ON t.workerNo = tm.workerNo and t.attDate = tm.attDate";
                    cmd.Connection = con;
                    con.Open();
                    gvSpecialPassOld1.DataSource = cmd.ExecuteReader();
                    gvSpecialPassOld1.DataBind();
                    con.Close();
                    con.Open();
                    gvSpecialPassOld2.DataSource = cmd.ExecuteReader();
                    gvSpecialPassOld2.DataBind();
                    con.Close();
                }
            }
        }

        private void BindNewSpecialPassGrid()
        {
            string constr = ConfigurationManager.ConnectionStrings["PrisMegahConnString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.CommandText = "SELECT t.[specialPassID],t.[workerNo],t.[fileName1],t.[filePath1],t.[contentType1],t.[fileName2],t.[filePath2],t.[contentType2],t.[fileName3],t.[filePath3],t.[contentType3],t.[fileName4],t.[filePath4],t.[contentType4],t.[attDate] FROM [specialPassAtt] t INNER JOIN (SELECT TOP 1 * FROM (SELECT TOP 2 workerNo, attDate FROM [specialPassAtt] WHERE workerNo = ('" + lblWorkerNo.Text + "') ORDER BY attdate DESC)a	ORDER BY a.attDate DESC) tm ON t.workerNo = tm.workerNo and t.attDate = tm.attDate";
                    cmd.Connection = con;
                    con.Open();
                    gvSpecialPassNew1.DataSource = cmd.ExecuteReader();
                    gvSpecialPassNew1.DataBind();
                    con.Close();
                    con.Open();
                    gvSpecialPassNew2.DataSource = cmd.ExecuteReader();
                    gvSpecialPassNew2.DataBind();
                    con.Close();
                }
            }
        }

        private void BindOldPLKSGrid()
        {
            string constr = ConfigurationManager.ConnectionStrings["PrisMegahConnString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.CommandText = "SELECT t.[PLKSID],t.[workerNo],t.[fileName],t.[filePath],t.[contentType],t.[attDate] FROM [PLKSAtt] t INNER JOIN (SELECT TOP 1 * FROM (SELECT TOP 2 workerNo, attDate FROM [PLKSAtt] WHERE workerNo = ('" + lblWorkerNo.Text + "') ORDER BY attdate DESC)a	ORDER BY a.attDate ASC) tm ON t.workerNo = tm.workerNo and t.attDate = tm.attDate";
                    cmd.Connection = con;
                    con.Open();
                    gvPLKSOld1.DataSource = cmd.ExecuteReader();
                    gvPLKSOld1.DataBind();
                    con.Close();
                    con.Open();
                    gvPLKSOld2.DataSource = cmd.ExecuteReader();
                    gvPLKSOld2.DataBind();
                    con.Close();
                }
            }
        }

        private void BindNewPLKSGrid()
        {
            string constr = ConfigurationManager.ConnectionStrings["PrisMegahConnString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.CommandText = "SELECT t.[PLKSID],t.[workerNo],t.[fileName],t.[filePath],t.[contentType],t.[attDate] FROM [PLKSAtt] t INNER JOIN (SELECT TOP 1 * FROM (SELECT TOP 2 workerNo, attDate FROM [PLKSAtt] WHERE workerNo = ('" + lblWorkerNo.Text + "') ORDER BY attdate DESC)a	ORDER BY a.attDate DESC) tm ON t.workerNo = tm.workerNo and t.attDate = tm.attDate";
                    cmd.Connection = con;
                    con.Open();
                    gvPLKSNew1.DataSource = cmd.ExecuteReader();
                    gvPLKSNew1.DataBind();
                    con.Close();
                    con.Open();
                    gvPLKSNew2.DataSource = cmd.ExecuteReader();
                    gvPLKSNew2.DataBind();
                    con.Close();
                }
            }
        }

        private void BindOldInsuransGrid()
        {
            string constr = ConfigurationManager.ConnectionStrings["PrisMegahConnString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.CommandText = "SELECT t.[InsPolicyID],t.[workerNo],t.[fileName],t.[filePath],t.[contentType],t.[attDate] FROM [insPolicyAtt] t INNER JOIN (SELECT TOP 1 * FROM (SELECT TOP 2 workerNo, attDate FROM [insPolicyAtt] WHERE workerNo = ('" + lblWorkerNo.Text + "') ORDER BY attdate DESC)a	ORDER BY a.attDate ASC) tm ON t.workerNo = tm.workerNo and t.attDate = tm.attDate";
                    cmd.Connection = con;
                    con.Open();
                    gvInsuransOld1.DataSource = cmd.ExecuteReader();
                    gvInsuransOld1.DataBind();
                    con.Close();
                }
            }
        }

        private void BindNewInsuransGrid()
        {
            string constr = ConfigurationManager.ConnectionStrings["PrisMegahConnString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.CommandText = "SELECT t.[InsPolicyID],t.[workerNo],t.[fileName],t.[filePath],t.[contentType],t.[attDate] FROM [insPolicyAtt] t INNER JOIN (SELECT TOP 1 * FROM (SELECT TOP 2 workerNo, attDate FROM [insPolicyAtt] WHERE workerNo = ('" + lblWorkerNo.Text + "') ORDER BY attdate DESC)a	ORDER BY a.attDate DESC) tm ON t.workerNo = tm.workerNo and t.attDate = tm.attDate";
                    cmd.Connection = con;
                    con.Open();
                    gvInsuransNew1.DataSource = cmd.ExecuteReader();
                    gvInsuransNew1.DataBind();
                    con.Close();
                }
            }
        }

        protected void gvPassportOld1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            string[] commandArgs = e.CommandArgument.ToString().Split(new char[] { ',' });
            string desc = "0";
            string filename = commandArgs[0];
            string filepath = commandArgs[1];
            string path = MapPath(filepath);
            if (filename != "")
            {
                byte[] bts = System.IO.File.ReadAllBytes(path);
            }

            try
            {
                switch (e.CommandName)
                {
                    case "ViewPassport1":
                        if (filename != "")
                        {
                            Response.Clear();
                            Response.ClearHeaders();
                            Response.ContentType = "application/pdf";
                            Response.Headers.Add("Content-disposition", "inline; filename=" + filename);
                            Response.WriteFile(path);
                            Response.Flush();
                            Response.End();
                        }
                        break;
                    case "DownloadPassport1":
                        if (filename != "")
                        {
                            Response.Clear();
                            Response.ClearHeaders();
                            Response.ContentType = "application/pdf";
                            Response.AppendHeader("Content-Disposition", "attachment; filename=" + filename);
                            Response.WriteFile(path);
                            Response.Flush();
                            Response.End();
                        }
                        break;
                }
            }
            catch (Exception ex)
            {
                desc = ex.Message;

            }
        }

        protected void gvPassportNew1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            string[] commandArgs = e.CommandArgument.ToString().Split(new char[] { ',' });
            string desc = "0";
            string filename = commandArgs[0];
            string filepath = commandArgs[1];
            string path = MapPath(filepath);
            if (filename != "")
            {
                byte[] bts = System.IO.File.ReadAllBytes(path);
            }

            try
            {
                switch (e.CommandName)
                {
                    case "ViewPassport1":
                        if (filename != "")
                        {
                            Response.Clear();
                            Response.ClearHeaders();
                            Response.ContentType = "application/pdf";
                            Response.Headers.Add("Content-disposition", "inline; filename=" + filename);
                            Response.WriteFile(path);
                            Response.Flush();
                            Response.End();
                        }
                        break;
                    case "DownloadPassport1":
                        if (filename != "")
                        {
                            Response.Clear();
                            Response.ClearHeaders();
                            Response.ContentType = "application/pdf";
                            Response.AppendHeader("Content-Disposition", "attachment; filename=" + filename);
                            Response.WriteFile(path);
                            Response.Flush();
                            Response.End();
                        }
                        break;
                }
            }
            catch (Exception ex)
            {
                desc = ex.Message;

            }
        }

        protected void gvSpecialPassOld1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            string[] commandArgs = e.CommandArgument.ToString().Split(new char[] { ',' });
            string desc = "0";
            string filename = commandArgs[0];
            string filepath = commandArgs[1];
            string path = MapPath(filepath);
            if (filename != "")
            {
                byte[] bts = System.IO.File.ReadAllBytes(path);
            }

            try
            {
                switch (e.CommandName)
                {
                    case "ViewSpecialPass1":
                        if (filename != "")
                        {
                            Response.Clear();
                            Response.ClearHeaders();
                            Response.ContentType = "application/pdf";
                            Response.Headers.Add("Content-disposition", "inline; filename=" + filename);
                            Response.WriteFile(path);
                            Response.Flush();
                            Response.End();
                        }
                        break;
                    case "DownloadSpecialPass1":
                        if (filename != "")
                        {
                            Response.Clear();
                            Response.ClearHeaders();
                            Response.ContentType = "application/pdf";
                            Response.AppendHeader("Content-Disposition", "attachment; filename=" + filename);
                            Response.WriteFile(path);
                            Response.Flush();
                            Response.End();
                        }
                        break;
                }
            }
            catch (Exception ex)
            {
                desc = ex.Message;
            }
        }

        protected void gvSpecialPassNew1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            string[] commandArgs = e.CommandArgument.ToString().Split(new char[] { ',' });
            string desc = "0";
            string filename = commandArgs[0];
            string filepath = commandArgs[1];
            string path = MapPath(filepath);
            if (filename != "")
            {
                byte[] bts = System.IO.File.ReadAllBytes(path);
            }

            try
            {
                switch (e.CommandName)
                {
                    case "ViewSpecialPass1":
                        if (filename != "")
                        {
                            Response.Clear();
                            Response.ClearHeaders();
                            Response.ContentType = "application/pdf";
                            Response.Headers.Add("Content-disposition", "inline; filename=" + filename);
                            Response.WriteFile(path);
                            Response.Flush();
                            Response.End();
                        }
                        break;
                    case "DownloadSpecialPass1":
                        if (filename != "")
                        {
                            Response.Clear();
                            Response.ClearHeaders();
                            Response.ContentType = "application/pdf";
                            Response.AppendHeader("Content-Disposition", "attachment; filename=" + filename);
                            Response.WriteFile(path);
                            Response.Flush();
                            Response.End();
                        }
                        break;
                }
            }
            catch (Exception ex)
            {
                desc = ex.Message;
            }
        }

        protected void gvPLKSOld1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            string[] commandArgs = e.CommandArgument.ToString().Split(new char[] { ',' });
            string desc = "0";
            string filename = commandArgs[0];
            string filepath = commandArgs[1];
            string path = MapPath(filepath);
            if (filename != "")
            {
                byte[] bts = System.IO.File.ReadAllBytes(path);
            }

            try
            {
                switch (e.CommandName)
                {
                    case "ViewPLKS":
                        if (filename != "")
                        {
                            Response.Clear();
                            Response.ClearHeaders();
                            Response.ContentType = "application/pdf";
                            Response.Headers.Add("Content-disposition", "inline; filename=" + filename);
                            Response.WriteFile(path);
                            Response.Flush();
                            Response.End();
                        }
                        break;
                    case "DownloadPLKS":
                        if (filename != "")
                        {
                            Response.Clear();
                            Response.ClearHeaders();
                            Response.ContentType = "application/pdf";
                            Response.AppendHeader("Content-Disposition", "attachment; filename=" + filename);
                            Response.WriteFile(path);
                            Response.Flush();
                            Response.End();
                        }
                        break;
                }
            }
            catch (Exception ex)
            {
                desc = ex.Message;
            }
        }

        protected void gvPLKSNew1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            string[] commandArgs = e.CommandArgument.ToString().Split(new char[] { ',' });
            string desc = "0";
            string filename = commandArgs[0];
            string filepath = commandArgs[1];
            string path = MapPath(filepath);
            if (filename != "")
            {
                byte[] bts = System.IO.File.ReadAllBytes(path);
            }

            try
            {
                switch (e.CommandName)
                {
                    case "ViewPLKS":
                        if (filename != "")
                        {
                            Response.Clear();
                            Response.ClearHeaders();
                            Response.ContentType = "application/pdf";
                            Response.Headers.Add("Content-disposition", "inline; filename=" + filename);
                            Response.WriteFile(path);
                            Response.Flush();
                            Response.End();
                        }
                        break;
                    case "DownloadPLKS":
                        if (filename != "")
                        {
                            Response.Clear();
                            Response.ClearHeaders();
                            Response.ContentType = "application/pdf";
                            Response.AppendHeader("Content-Disposition", "attachment; filename=" + filename);
                            Response.WriteFile(path);
                            Response.Flush();
                            Response.End();
                        }
                        break;
                }
            }
            catch (Exception ex)
            {
                desc = ex.Message;
            }
        }

        protected void gvInsuransOld1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            string[] commandArgs = e.CommandArgument.ToString().Split(new char[] { ',' });
            string desc = "0";
            string filename = commandArgs[0];
            string filepath = commandArgs[1];
            string path = MapPath(filepath);
            if (filename != "")
            {
                byte[] bts = System.IO.File.ReadAllBytes(path);
            }

            try
            {
                switch (e.CommandName)
                {
                    case "ViewInsurans":
                        if (filename != "")
                        {
                            Response.Clear();
                            Response.ClearHeaders();
                            Response.ContentType = "application/pdf";
                            Response.Headers.Add("Content-disposition", "inline; filename=" + filename);
                            Response.WriteFile(path);
                            Response.Flush();
                            Response.End();
                        }
                        break;
                    case "DownloadInsurans":
                        if (filename != "")
                        {
                            Response.Clear();
                            Response.ClearHeaders();
                            Response.ContentType = "application/pdf";
                            Response.AppendHeader("Content-Disposition", "attachment; filename=" + filename);
                            Response.WriteFile(path);
                            Response.Flush();
                            Response.End();
                        }
                        break;
                }
            }
            catch (Exception ex)
            {
                desc = ex.Message;
            }
        }

        protected void gvInsuransNew1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            string[] commandArgs = e.CommandArgument.ToString().Split(new char[] { ',' });
            string desc = "0";
            string filename = commandArgs[0];
            string filepath = commandArgs[1];
            string path = MapPath(filepath);
            if (filename != "")
            {
                byte[] bts = System.IO.File.ReadAllBytes(path);
            }

            try
            {
                switch (e.CommandName)
                {
                    case "ViewInsurans":
                        if (filename != "")
                        {
                            Response.Clear();
                            Response.ClearHeaders();
                            Response.ContentType = "application/pdf";
                            Response.Headers.Add("Content-disposition", "inline; filename=" + filename);
                            Response.WriteFile(path);
                            Response.Flush();
                            Response.End();
                        }
                        break;
                    case "DownloadInsurans":
                        if (filename != "")
                        {
                            Response.Clear();
                            Response.ClearHeaders();
                            Response.ContentType = "application/pdf";
                            Response.AppendHeader("Content-Disposition", "attachment; filename=" + filename);
                            Response.WriteFile(path);
                            Response.Flush();
                            Response.End();
                        }
                        break;
                }
            }
            catch (Exception ex)
            {
                desc = ex.Message;
            }
        }

        //protected void ViewPassport(object sender, EventArgs e)
        //{
            //ltEmbedPassport.Visible = true;
            //string id = (sender as LinkButton).CommandArgument;
            //string embed = "<object data=\"{0}{1}\" type=\"application/pdf\" width=\"500px\" height=\"600px\">";
            //embed += "If you are unable to view file, you can download from <a href = \"{0}{1}&download=1\">here</a>";
            //embed += " or download <a target = \"_blank\" href = \"http://get.adobe.com/reader/\">Adobe PDF Reader</a> to view the file.";
            //embed += "</object>";
            //ltEmbedPassport.Text = string.Format(embed, ResolveUrl("~/Preview handler/FileCS.ashx?passportNo="), id);
        //}

        //protected void ViewSpecialPass(object sender, EventArgs e)
        //{
        //    ltEmbedSpecialPass.Visible = true;
        //    string id = (sender as LinkButton).CommandArgument;
        //    string embed = "<object data=\"{0}{1}\" type=\"application/pdf\" width=\"500px\" height=\"600px\">";
        //    embed += "If you are unable to view file, you can download from <a href = \"{0}{1}&download=1\">here</a>";
        //    embed += " or download <a target = \"_blank\" href = \"http://get.adobe.com/reader/\">Adobe PDF Reader</a> to view the file.";
        //    embed += "</object>";
        //    ltEmbedSpecialPass.Text = string.Format(embed, ResolveUrl("~/Preview handler/PassCS.ashx?passportNo="), id);
        //}

        //protected void ViewPLKS(object sender, EventArgs e)
        //{
        //    ltEmbedPLKS.Visible = true;
        //    string id = (sender as LinkButton).CommandArgument;
        //    string embed = "<object data=\"{0}{1}\" type=\"application/pdf\" width=\"500px\" height=\"600px\">";
        //    embed += "If you are unable to view file, you can download from <a href = \"{0}{1}&download=1\">here</a>";
        //    embed += " or download <a target = \"_blank\" href = \"http://get.adobe.com/reader/\">Adobe PDF Reader</a> to view the file.";
        //    embed += "</object>";
        //    ltEmbedPLKS.Text = string.Format(embed, ResolveUrl("~/Preview handler/PLKSCS.ashx?passportNo="), id);
        //}

        //protected void ViewInsurans(object sender, EventArgs e)
        //{
        //    ltEmbedInsurans.Visible = true;
        //    string id = (sender as LinkButton).CommandArgument;
        //    string embed = "<object data=\"{0}{1}\" type=\"application/pdf\" width=\"500px\" height=\"600px\">";
        //    embed += "If you are unable to view file, you can download from <a href = \"{0}{1}&download=1\">here</a>";
        //    embed += " or download <a target = \"_blank\" href = \"http://get.adobe.com/reader/\">Adobe PDF Reader</a> to view the file.";
        //    embed += "</object>";
        //    ltEmbedInsurans.Text = string.Format(embed, ResolveUrl("~/Preview handler/InsuransCS.ashx?passportNo="), id);
        //}

        //private DataTable GetData(SqlCommand cmd)
        //{
        //    DataTable dt = new DataTable();
        //    String strConnString = System.Configuration.ConfigurationManager.ConnectionStrings["PrisMegahConnString"].ToString();
        //    SqlConnection con = new SqlConnection(strConnString);
        //    SqlDataAdapter sda = new SqlDataAdapter();
        //    cmd.CommandType = CommandType.Text;
        //    cmd.Connection = con;
        //    try
        //    {
        //        con.Open();
        //        sda.SelectCommand = cmd;
        //        sda.Fill(dt);
        //        return dt;
        //    }
        //    catch
        //    {
        //        return null;
        //    }
        //    finally
        //    {
        //        con.Close();
        //        sda.Dispose();
        //        con.Dispose();
        //    }
        //}
    }
}