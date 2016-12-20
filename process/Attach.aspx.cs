//http://technicalsol.blogspot.my/2009/04/restrict-duplicate-record-insertion-on.html
//http://www.aspsnippets.com/Articles/Retrieve-images-using-a-file-path-stored-in-database-in-ASPNet.aspx
//http://stackoverflow.com/questions/3625304/dont-overwrite-file-uploaded-through-fileupload-control
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.IO;

namespace PrisMegahHRSystem.Particular_Maintenance
{
    public partial class Attach : System.Web.UI.Page
    {
        String connString = System.Configuration.ConfigurationManager.ConnectionStrings["PrisMegahConnString"].ToString();
        SqlConnection conn = null;
        SqlDataReader reader;
        private bool _refreshState;
        private bool _isRefresh;
        public bool IsRefresh
        {
            get
            {
                return _isRefresh;
            }
        }
        protected override void LoadViewState(object savedState)
        {
            object[] allStates = (object[])savedState;
            base.LoadViewState(allStates[0]);
            _refreshState = (bool)allStates[1];
            _isRefresh = _refreshState == (bool)Session["__ISREFRESH"];
        }

        protected override object SaveViewState()
        {
            Session["__ISREFRESH"] = _refreshState;
            object[] allStates = new object[2];
            allStates[0] = base.SaveViewState();
            allStates[1] = !_refreshState;
            return allStates;
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            string position = Session["role"].ToString();
            if (position == "Director" || position == "System Admin" || position == "Administrator")
            {

            }
            else
            {
                Response.Redirect("~/LogoutScreen.aspx");
            }

            ddlPassportNo.Enabled = true;
            Panel1.Enabled = false;
        }

        protected void Page_PreInit(object sender, EventArgs e)
        {
            string userRole = Session["role"].ToString();

            if (userRole == "System Admin" || userRole == "Director")
                this.Page.MasterPageFile = "~/Master page/Director.master";
            else if (userRole == "Administrator")
                this.Page.MasterPageFile = "~/Master page/Admin.master";
        }

        protected void btnSavePhoto_Click(object sender, EventArgs e)
        {
            if (!IsRefresh)
            {
                // Read the file and convert it to Byte Array
                string filePath = attPhoto.PostedFile.FileName;
                string filename = Path.GetFileName(filePath);
                string ext = Path.GetExtension(filename);
                string contenttype = String.Empty;

                //Set the contenttype based on File Extension
                switch (ext)
                {
                    //case ".doc":
                    //    contenttype = "application/vnd.ms-word";
                    //    break;
                    //case ".docx":
                    //    contenttype = "application/vnd.ms-word";
                    //    break;
                    //case ".xls":
                    //    contenttype = "application/vnd.ms-excel";
                    //    break;
                    //case ".xlsx":
                    //    contenttype = "application/vnd.ms-excel";
                    //    break;
                    case ".jpg":
                        contenttype = "image/jpg";
                        break;
                    case ".png":
                        contenttype = "image/png";
                        break;
                    case ".gif":
                        contenttype = "image/gif";
                        break;
                }
                if (contenttype != String.Empty)
                {
                    //Stream fs = attPhoto.PostedFile.InputStream;
                    //BinaryReader br = new BinaryReader(fs);
                    //Byte[] bytes = br.ReadBytes((Int32)fs.Length);
                    //DateTime currDate = DateTime.Now;

                    ////insert the file into database
                    //string strQuery = "INSERT INTO personalPhoto_Att(passportNo, fileName, contentType, data, attDate)" +
                    //   " VALUES ('" + ddlPassportNo.Text + "', @fileName, @contentType, @data, @attDate)";
                    //SqlCommand cmd = new SqlCommand(strQuery);
                    //cmd.Parameters.Add("@fileName", SqlDbType.VarChar).Value = filename;
                    //cmd.Parameters.Add("@contentType", SqlDbType.VarChar).Value = contenttype;
                    //cmd.Parameters.Add("@data", SqlDbType.Binary).Value = bytes;
                    //cmd.Parameters.Add("@attDate", SqlDbType.DateTime).Value = currDate;

                    //string FileName = Path.GetFileName(attPhoto.PostedFile.FileName);
                    DateTime currDate = DateTime.Now;
                    var fn = attPhoto.FileName;
                    var extension = Path.GetExtension(fn);
                    var nameWithoutExtension = Path.GetFileNameWithoutExtension(fn);
                    var i = 1;
                    while (File.Exists(Server.MapPath("Images/Attachment/" + fn)))
                    {
                        fn = nameWithoutExtension.Trim() + " (" + i + ")" + extension;
                        i++;
                    }
                    //Save files to disk
                    attPhoto.SaveAs(Server.MapPath("Images/Attachment/" + fn));
                    //Add Entry to DataBase                    
                    SqlConnection con = new SqlConnection(connString);
                    string strQuery = "INSERT INTO personalPhoto_Att (workerNo, fileName, contentType, attDate, filePath)" +
                        " VALUES('" + lblWorkerNo.Text + "', @fileName, @contentType, @attDate, @filePath)";
                    SqlCommand cmd = new SqlCommand(strQuery);
                    cmd.Parameters.AddWithValue("@fileName", fn);
                    cmd.Parameters.Add("@contentType", SqlDbType.VarChar).Value = contenttype;
                    cmd.Parameters.Add("@attDate", SqlDbType.DateTime).Value = currDate;
                    cmd.Parameters.AddWithValue("@filePath", "Images/Attachment/" + fn);
                    cmd.CommandType = CommandType.Text;
                    cmd.Connection = con;

                    InsertUpdateData(cmd);
                    lblPhotoErrorMsg.ForeColor = System.Drawing.Color.Green;
                    lblPhotoErrorMsg.Text = "File Uploaded Successfully";
                    ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('File Uploaded Successfully !!'); window.location='" + ResolveUrl("~/Home.aspx") + "'", true);
                }
                else
                {
                    lblPhotoErrorMsg.ForeColor = System.Drawing.Color.Red;
                    lblPhotoErrorMsg.Text = "File format not recognised." +
                      " Upload Image formats";
                }
            }
        }

        protected void btnSavePassport_Click(object sender, EventArgs e)
        {
            if (!IsRefresh)
            {
                // Read the file and convert it to Byte Array
                string filePath1 = attPassport1.PostedFile.FileName;
                string filename1 = Path.GetFileName(filePath1);
                string ext1 = Path.GetExtension(filename1);
                string contenttype1 = String.Empty;
                string filePath2 = attPassport2.PostedFile.FileName;
                string filename2 = Path.GetFileName(filePath2);
                string ext2 = Path.GetExtension(filename2);
                string contenttype2 = String.Empty;
                string filePath3 = attPassport3.PostedFile.FileName;
                string filename3 = Path.GetFileName(filePath3);
                string ext3 = Path.GetExtension(filename3);
                string contenttype3 = String.Empty;
                string filePath4 = attPassport4.PostedFile.FileName;
                string filename4 = Path.GetFileName(filePath4);
                string ext4 = Path.GetExtension(filename4);
                string contenttype4 = String.Empty;

                //Set the contenttype based on File Extension
                switch (ext1)
                {
                    case ".jpg":
                        contenttype1 = "image/jpg";
                        break;
                    case ".png":
                        contenttype1 = "image/png";
                        break;
                    case ".gif":
                        contenttype1 = "image/gif";
                        break;
                    case ".pdf":
                        contenttype1 = "application/pdf";
                        break;
                }
                switch (ext2)
                {
                    case ".jpg":
                        contenttype2 = "image/jpg";
                        break;
                    case ".png":
                        contenttype2 = "image/png";
                        break;
                    case ".gif":
                        contenttype2 = "image/gif";
                        break;
                    case ".pdf":
                        contenttype2 = "application/pdf";
                        break;
                }
                switch (ext3)
                {
                    case ".jpg":
                        contenttype3 = "image/jpg";
                        break;
                    case ".png":
                        contenttype3 = "image/png";
                        break;
                    case ".gif":
                        contenttype3 = "image/gif";
                        break;
                    case ".pdf":
                        contenttype3 = "application/pdf";
                        break;
                }
                switch (ext4)
                {
                    case ".jpg":
                        contenttype4 = "image/jpg";
                        break;
                    case ".png":
                        contenttype4 = "image/png";
                        break;
                    case ".gif":
                        contenttype4 = "image/gif";
                        break;
                    case ".pdf":
                        contenttype4 = "application/pdf";
                        break;
                }
                if (contenttype1 != String.Empty || contenttype2 != String.Empty || contenttype3 != String.Empty || contenttype4 != String.Empty)
                {
                    DateTime currDate = DateTime.Now;
                    var fn1 = attPassport1.FileName;
                    var fn2 = attPassport2.FileName;
                    var fn3 = attPassport3.FileName;
                    var fn4 = attPassport4.FileName;
                    var extension1 = Path.GetExtension(fn1);
                    var extension2 = Path.GetExtension(fn2);
                    var extension3 = Path.GetExtension(fn3);
                    var extension4 = Path.GetExtension(fn4);
                    var nameWithoutExtension1 = Path.GetFileNameWithoutExtension(fn1);
                    var nameWithoutExtension2 = Path.GetFileNameWithoutExtension(fn2);
                    var nameWithoutExtension3 = Path.GetFileNameWithoutExtension(fn3);
                    var nameWithoutExtension4 = Path.GetFileNameWithoutExtension(fn4);
                    var i = 1;
                    while (File.Exists(Server.MapPath("PDFs/" + fn1)))
                    {
                        fn1 = nameWithoutExtension1.Trim() + " (" + i + ")" + extension1;
                        i++;
                    }
                    while (File.Exists(Server.MapPath("PDFs/" + fn2)))
                    {
                        fn2 = nameWithoutExtension2.Trim() + " (" + i + ")" + extension2;
                        i++;
                    }
                    while (File.Exists(Server.MapPath("PDFs/" + fn3)))
                    {
                        fn3 = nameWithoutExtension3.Trim() + " (" + i + ")" + extension3;
                        i++;
                    }
                    while (File.Exists(Server.MapPath("PDFs/" + fn4)))
                    {
                        fn4 = nameWithoutExtension4.Trim() + " (" + i + ")" + extension4;
                        i++;
                    }
                    //Save files to disk
                    if (attPassport1.HasFile)
                        attPassport1.SaveAs(Server.MapPath("PDFs/" + fn1));
                    if (attPassport2.HasFile)
                        attPassport2.SaveAs(Server.MapPath("PDFs/" + fn2));
                    if (attPassport3.HasFile)
                        attPassport3.SaveAs(Server.MapPath("PDFs/" + fn3));
                    if (attPassport4.HasFile)
                        attPassport4.SaveAs(Server.MapPath("PDFs/" + fn4));
                    //Add Entry to DataBase                    
                    SqlConnection con = new SqlConnection(connString);
                    string strQuery = "INSERT INTO passportAtt (workerNo, fileName1, filePath1, contentType1, fileName2, filePath2, contentType2, fileName3, filePath3, contentType3, fileName4, filePath4, contentType4, attDate)" +
                        " VALUES('" + lblWorkerNo.Text + "', @fileName1, @filePath1, @contentType1, @fileName2, @filePath2, @contentType2, @fileName3, @filePath3, @contentType3, @fileName4, @filePath4, @contentType4, @attDate)";
                    SqlCommand cmd = new SqlCommand(strQuery);

                    if (attPassport1.HasFile)
                    {
                        cmd.Parameters.AddWithValue("@fileName1", fn1);
                        cmd.Parameters.AddWithValue("@filePath1", "PDFs/" + fn1);
                        cmd.Parameters.Add("@contentType1", SqlDbType.VarChar).Value = contenttype1;
                    }
                    else
                    {
                        cmd.Parameters.AddWithValue("@fileName1", DBNull.Value);
                        cmd.Parameters.AddWithValue("@filePath1", DBNull.Value);
                        cmd.Parameters.Add("@contentType1", SqlDbType.VarChar).Value = DBNull.Value;
                    }
                    
                    if (attPassport2.HasFile)
                    {
                        cmd.Parameters.AddWithValue("@fileName2", fn2);
                        cmd.Parameters.AddWithValue("@filePath2", "PDFs/" + fn2);
                        cmd.Parameters.Add("@contentType2", SqlDbType.VarChar).Value = contenttype2;
                    }
                    else
                    {
                        cmd.Parameters.AddWithValue("@fileName2", DBNull.Value);
                        cmd.Parameters.AddWithValue("@filePath2", DBNull.Value);
                        cmd.Parameters.Add("@contentType2", SqlDbType.VarChar).Value = DBNull.Value;
                    }
                    if (attPassport3.HasFile)
                    {
                        cmd.Parameters.AddWithValue("@fileName3", fn3);
                        cmd.Parameters.AddWithValue("@filePath3", "PDFs/" + fn3);
                        cmd.Parameters.Add("@contentType3", SqlDbType.VarChar).Value = contenttype3;
                    }
                    else
                    {
                        cmd.Parameters.AddWithValue("@fileName3", DBNull.Value);
                        cmd.Parameters.AddWithValue("@filePath3", DBNull.Value);
                        cmd.Parameters.Add("@contentType3", SqlDbType.VarChar).Value = DBNull.Value;
                    }
                    if (attPassport4.HasFile)
                    {
                        cmd.Parameters.AddWithValue("@fileName4", fn4);
                        cmd.Parameters.AddWithValue("@filePath4", "PDFs/" + fn4);
                        cmd.Parameters.Add("@contentType4", SqlDbType.VarChar).Value = contenttype4;
                    }
                    else
                    {
                        cmd.Parameters.AddWithValue("@fileName4", DBNull.Value);
                        cmd.Parameters.AddWithValue("@filePath4", DBNull.Value);
                        cmd.Parameters.Add("@contentType4", SqlDbType.VarChar).Value = DBNull.Value;
                    }
                    cmd.Parameters.Add("@attDate", SqlDbType.DateTime).Value = currDate;
                    cmd.CommandType = CommandType.Text;
                    cmd.Connection = con;

                    InsertUpdateData(cmd);
                    lblPhotoErrorMsg.ForeColor = System.Drawing.Color.Green;
                    lblPhotoErrorMsg.Text = "File Uploaded Successfully";
                    ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('File Uploaded Successfully !!'); window.location='" + ResolveUrl("~/Home.aspx") + "'", true);
                }
                else
                {
                    lblPassportErrorMsg.ForeColor = System.Drawing.Color.Red;
                    lblPassportErrorMsg.Text = "File format not recognised." +
                      " Upload Image/PDF formats";
                }
            }
        }

        protected void btnSaveSpecialPass_Click(object sender, EventArgs e)
        {
            if (!IsRefresh)
            {
                // Read the file and convert it to Byte Array
                string filePath1 = attSpecialPass1.PostedFile.FileName;
                string filename1 = Path.GetFileName(filePath1);
                string ext1 = Path.GetExtension(filename1);
                string contenttype1 = String.Empty;
                string filePath2 = attSpecialPass2.PostedFile.FileName;
                string filename2 = Path.GetFileName(filePath2);
                string ext2 = Path.GetExtension(filename2);
                string contenttype2 = String.Empty;
                string filePath3 = attSpecialPass3.PostedFile.FileName;
                string filename3 = Path.GetFileName(filePath3);
                string ext3 = Path.GetExtension(filename3);
                string contenttype3 = String.Empty;
                string filePath4 = attSpecialPass4.PostedFile.FileName;
                string filename4 = Path.GetFileName(filePath4);
                string ext4 = Path.GetExtension(filename4);
                string contenttype4 = String.Empty;

                //Set the contenttype based on File Extension
                switch (ext1)
                {
                    case ".jpg":
                        contenttype1 = "image/jpg";
                        break;
                    case ".png":
                        contenttype1 = "image/png";
                        break;
                    case ".gif":
                        contenttype1 = "image/gif";
                        break;
                    case ".pdf":
                        contenttype1 = "application/pdf";
                        break;
                }
                switch (ext2)
                {
                    case ".jpg":
                        contenttype2 = "image/jpg";
                        break;
                    case ".png":
                        contenttype2 = "image/png";
                        break;
                    case ".gif":
                        contenttype2 = "image/gif";
                        break;
                    case ".pdf":
                        contenttype2 = "application/pdf";
                        break;
                }
                switch (ext3)
                {
                    case ".jpg":
                        contenttype3 = "image/jpg";
                        break;
                    case ".png":
                        contenttype3 = "image/png";
                        break;
                    case ".gif":
                        contenttype3 = "image/gif";
                        break;
                    case ".pdf":
                        contenttype3 = "application/pdf";
                        break;
                }
                switch (ext4)
                {
                    case ".jpg":
                        contenttype4 = "image/jpg";
                        break;
                    case ".png":
                        contenttype4 = "image/png";
                        break;
                    case ".gif":
                        contenttype4 = "image/gif";
                        break;
                    case ".pdf":
                        contenttype4 = "application/pdf";
                        break;
                }
                if (contenttype1 != String.Empty || contenttype2 != String.Empty || contenttype3 != String.Empty || contenttype4 != String.Empty)
                {
                    DateTime currDate = DateTime.Now;
                    var fn1 = attSpecialPass1.FileName;
                    var fn2 = attSpecialPass2.FileName;
                    var fn3 = attSpecialPass3.FileName;
                    var fn4 = attSpecialPass4.FileName;
                    var extension1 = Path.GetExtension(fn1);
                    var extension2 = Path.GetExtension(fn2);
                    var extension3 = Path.GetExtension(fn3);
                    var extension4 = Path.GetExtension(fn4);
                    var nameWithoutExtension1 = Path.GetFileNameWithoutExtension(fn1);
                    var nameWithoutExtension2 = Path.GetFileNameWithoutExtension(fn2);
                    var nameWithoutExtension3 = Path.GetFileNameWithoutExtension(fn3);
                    var nameWithoutExtension4 = Path.GetFileNameWithoutExtension(fn4);
                    var i = 1;

                    while (File.Exists(Server.MapPath("PDFs/" + fn1)))
                    {
                        fn1 = nameWithoutExtension1.Trim() + " (" + i + ")" + extension1;
                        i++;
                    }
                    while (File.Exists(Server.MapPath("PDFs/" + fn2)))
                    {
                        fn2 = nameWithoutExtension2.Trim() + " (" + i + ")" + extension2;
                        i++;
                    }
                    while (File.Exists(Server.MapPath("PDFs/" + fn3)))
                    {
                        fn3 = nameWithoutExtension3.Trim() + " (" + i + ")" + extension3;
                        i++;
                    }
                    while (File.Exists(Server.MapPath("PDFs/" + fn4)))
                    {
                        fn4 = nameWithoutExtension4.Trim() + " (" + i + ")" + extension4;
                        i++;
                    }

                    //Save files to disk
                    if (attSpecialPass1.HasFile)
                        attSpecialPass1.SaveAs(Server.MapPath("PDFs/" + fn1));
                    if (attSpecialPass2.HasFile)
                        attSpecialPass2.SaveAs(Server.MapPath("PDFs/" + fn2));
                    if (attSpecialPass3.HasFile)
                        attSpecialPass3.SaveAs(Server.MapPath("PDFs/" + fn3));
                    if (attSpecialPass4.HasFile)
                        attSpecialPass4.SaveAs(Server.MapPath("PDFs/" + fn4));

                    //Add Entry to DataBase                    
                    SqlConnection con = new SqlConnection(connString);
                    string strQuery = "INSERT INTO specialPassAtt (workerNo, fileName1, filePath1, contentType1, fileName2, filePath2, contentType2, fileName3, filePath3, contentType3, fileName4, filePath4, contentType4, attDate)" +
                        " VALUES('" + lblWorkerNo.Text + "', @fileName1, @filePath1, @contentType1, @fileName2, @filePath2, @contentType2, @fileName3, @filePath3, @contentType3, @fileName4, @filePath4, @contentType4, @attDate)";
                    SqlCommand cmd = new SqlCommand(strQuery);
                    if (attSpecialPass1.HasFile)
                    {
                        cmd.Parameters.AddWithValue("@fileName1", fn1);
                        cmd.Parameters.AddWithValue("@filePath1", "PDFs/" + fn1);
                        cmd.Parameters.Add("@contentType1", SqlDbType.VarChar).Value = contenttype1;
                    }
                    else
                    {
                        cmd.Parameters.AddWithValue("@fileName1", DBNull.Value);
                        cmd.Parameters.AddWithValue("@filePath1", DBNull.Value);
                        cmd.Parameters.Add("@contentType1", SqlDbType.VarChar).Value = DBNull.Value;
                    }
                    if (attSpecialPass2.HasFile)
                    {
                        cmd.Parameters.AddWithValue("@fileName2", fn2);
                        cmd.Parameters.AddWithValue("@filePath2", "PDFs/" + fn2);
                        cmd.Parameters.Add("@contentType2", SqlDbType.VarChar).Value = contenttype2;
                    }
                    else
                    {
                        cmd.Parameters.AddWithValue("@fileName2", DBNull.Value);
                        cmd.Parameters.AddWithValue("@filePath2", DBNull.Value);
                        cmd.Parameters.Add("@contentType2", SqlDbType.VarChar).Value = DBNull.Value;
                    }
                    if (attSpecialPass3.HasFile)
                    {
                        cmd.Parameters.AddWithValue("@fileName3", fn3);
                        cmd.Parameters.AddWithValue("@filePath3", "PDFs/" + fn3);
                        cmd.Parameters.Add("@contentType3", SqlDbType.VarChar).Value = contenttype3;
                    }
                    else
                    {
                        cmd.Parameters.AddWithValue("@fileName3", DBNull.Value);
                        cmd.Parameters.AddWithValue("@filePath3", DBNull.Value);
                        cmd.Parameters.Add("@contentType3", SqlDbType.VarChar).Value = DBNull.Value;
                    }
                    if (attSpecialPass4.HasFile)
                    {
                        cmd.Parameters.AddWithValue("@fileName4", fn4);
                        cmd.Parameters.AddWithValue("@filePath4", "PDFs/" + fn4);
                        cmd.Parameters.Add("@contentType4", SqlDbType.VarChar).Value = contenttype4;
                    }
                    else
                    {
                        cmd.Parameters.AddWithValue("@fileName4", DBNull.Value);
                        cmd.Parameters.AddWithValue("@filePath4", DBNull.Value);
                        cmd.Parameters.Add("@contentType4", SqlDbType.VarChar).Value = DBNull.Value;
                    }
                    cmd.Parameters.Add("@attDate", SqlDbType.DateTime).Value = currDate;
                    cmd.CommandType = CommandType.Text;
                    cmd.Connection = con;

                    InsertUpdateData(cmd);
                    lblPassErrorMsg.ForeColor = System.Drawing.Color.Green;
                    lblPassErrorMsg.Text = "File Uploaded Successfully";
                    ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('File Uploaded Successfully !!'); window.location='" + ResolveUrl("~/Home.aspx") + "'", true);
                }
                else
                {
                    lblPassErrorMsg.ForeColor = System.Drawing.Color.Red;
                    lblPassErrorMsg.Text = "File format not recognised." +
                      " Upload Image/PDF formats";
                }
            }
        }

        protected void btnSavePLKS_Click(object sender, EventArgs e)
        {
            if (!IsRefresh)
            {
                // Read the file and convert it to Byte Array
                string filePath = attPermit.PostedFile.FileName;
                string filename = Path.GetFileName(filePath);
                string ext = Path.GetExtension(filename);
                string contenttype = String.Empty;

                //Set the contenttype based on File Extension
                switch (ext)
                {
                    //case ".doc":
                    //    contenttype = "application/vnd.ms-word";
                    //    break;
                    //case ".docx":
                    //    contenttype = "application/vnd.ms-word";
                    //    break;
                    //case ".xls":
                    //    contenttype = "application/vnd.ms-excel";
                    //    break;
                    //case ".xlsx":
                    //    contenttype = "application/vnd.ms-excel";
                    //    break;
                    case ".jpg":
                        contenttype = "image/jpg";
                        break;
                    case ".png":
                        contenttype = "image/png";
                        break;
                    case ".gif":
                        contenttype = "image/gif";
                        break;
                    case ".pdf":
                        contenttype = "application/pdf";
                        break;
                }
                if (contenttype != String.Empty)
                {
                    DateTime currDate = DateTime.Now;
                    var fn = attPermit.FileName;
                    var extension = Path.GetExtension(fn);
                    var nameWithoutExtension = Path.GetFileNameWithoutExtension(fn);
                    var i = 1;

                    while (File.Exists(Server.MapPath("PDFs/" + fn)))
                    {
                        fn = nameWithoutExtension.Trim() + " (" + i + ")" + extension;
                        i++;
                    }

                    //Save files to disk
                    if (attPermit.HasFile)
                        attPermit.SaveAs(Server.MapPath("PDFs/" + fn));

                    //add entry into database
                    SqlConnection con = new SqlConnection(connString);
                    string strQuery = "INSERT INTO PLKSAtt(workerNo, fileName, filePath, contentType, attDate)" +
                       " VALUES ('" + lblWorkerNo.Text + "', @fileName, @filePath, @contentType, @attDate)";
                    SqlCommand cmd = new SqlCommand(strQuery);
                    if (attPermit.HasFile)
                    {
                        cmd.Parameters.AddWithValue("@fileName", fn);
                        cmd.Parameters.AddWithValue("@filePath", "PDFs/" + fn);
                        cmd.Parameters.Add("@contentType", SqlDbType.VarChar).Value = contenttype;
                    }
                    else
                    {
                        cmd.Parameters.AddWithValue("@fileName", DBNull.Value);
                        cmd.Parameters.AddWithValue("@filePath", DBNull.Value);
                        cmd.Parameters.Add("@contentType", SqlDbType.VarChar).Value = DBNull.Value;
                    }
                    cmd.Parameters.Add("@attDate", SqlDbType.DateTime).Value = currDate;
                    cmd.CommandType = CommandType.Text;
                    cmd.Connection = con;

                    InsertUpdateData(cmd);
                    lblPLKSErrorMsg.ForeColor = System.Drawing.Color.Green;
                    lblPLKSErrorMsg.Text = "File Uploaded Successfully";
                    ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('File Uploaded Successfully !!'); window.location='" + ResolveUrl("~/Home.aspx") + "'", true);
                }
                else
                {
                    lblPLKSErrorMsg.ForeColor = System.Drawing.Color.Red;
                    lblPLKSErrorMsg.Text = "File format not recognised." +
                      " Upload Image/PDF formats";
                }
            }
        }

        protected void btnSaveInsPolicy_Click(object sender, EventArgs e)
        {
            if (!IsRefresh)
            {
                // Read the file and convert it to Byte Array
                string filePath = attInsurans.PostedFile.FileName;
                string filename = Path.GetFileName(filePath);
                string ext = Path.GetExtension(filename);
                string contenttype = String.Empty;

                //Set the contenttype based on File Extension
                switch (ext)
                {
                    //case ".doc":
                    //    contenttype = "application/vnd.ms-word";
                    //    break;
                    //case ".docx":
                    //    contenttype = "application/vnd.ms-word";
                    //    break;
                    //case ".xls":
                    //    contenttype = "application/vnd.ms-excel";
                    //    break;
                    //case ".xlsx":
                    //    contenttype = "application/vnd.ms-excel";
                    //    break;
                    //case ".jpg":
                    //    contenttype = "image/jpg";
                    //    break;
                    //case ".png":
                    //    contenttype = "image/png";
                    //    break;
                    //case ".gif":
                    //    contenttype = "image/gif";
                    //    break;
                    case ".pdf":
                        contenttype = "application/pdf";
                        break;
                }
                if (contenttype != String.Empty)
                {
                    DateTime currDate = DateTime.Now;
                    var fn = attInsurans.FileName;
                    var extension = Path.GetExtension(fn);
                    var nameWithoutExtension = Path.GetFileNameWithoutExtension(fn);
                    var i = 1;

                    while (File.Exists(Server.MapPath("PDFs/" + fn)))
                    {
                        fn = nameWithoutExtension.Trim() + " (" + i + ")" + extension;
                        i++;
                    }

                    //Save files to disk
                    if (attInsurans.HasFile)
                        attInsurans.SaveAs(Server.MapPath("PDFs/" + fn));

                    //add entry into database
                    SqlConnection con = new SqlConnection(connString);
                    string strQuery = "INSERT INTO insPolicyAtt(workerNo, fileName, filePath, contentType, attDate)" +
                       " VALUES ('" + lblWorkerNo.Text + "', @fileName, @filePath, @contentType, @attDate)";
                    SqlCommand cmd = new SqlCommand(strQuery);
                    if (attInsurans.HasFile)
                    {
                        cmd.Parameters.AddWithValue("@fileName", fn);
                        cmd.Parameters.AddWithValue("@filePath", "PDFs/" + fn);
                        cmd.Parameters.Add("@contentType", SqlDbType.VarChar).Value = contenttype;
                    }
                    else
                    {
                        cmd.Parameters.AddWithValue("@fileName", DBNull.Value);
                        cmd.Parameters.AddWithValue("@filePath", DBNull.Value);
                        cmd.Parameters.Add("@contentType", SqlDbType.VarChar).Value = DBNull.Value;
                    }
                    cmd.Parameters.Add("@attDate", SqlDbType.DateTime).Value = currDate;
                    cmd.CommandType = CommandType.Text;
                    cmd.Connection = con;

                    InsertUpdateData(cmd);
                    lblInsuransErrorMsg.ForeColor = System.Drawing.Color.Green;
                    lblInsuransErrorMsg.Text = "File Uploaded Successfully";
                    ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('File Uploaded Successfully !!'); window.location='" + ResolveUrl("~/Home.aspx") + "'", true);
                }
                else
                {
                    lblInsuransErrorMsg.ForeColor = System.Drawing.Color.Red;
                    lblInsuransErrorMsg.Text = "File format not recognised." +
                      " Upload PDF formats";
                }
            }
        }

        private Boolean InsertUpdateData(SqlCommand cmd)
        {
            SqlConnection con = new SqlConnection(connString);
            cmd.CommandType = CommandType.Text;
            cmd.Connection = con;
            try
            {
                con.Open();
                cmd.ExecuteNonQuery();
                return true;
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
                return false;
            }
            finally
            {
                con.Close();
                con.Dispose();
            }
        }

        protected void ibtnSearchByPPNo_Click(object sender, ImageClickEventArgs e)
        {
            ddlPassportNo.Enabled = false;
            Panel1.Enabled = true;
            conn = new SqlConnection(connString);
            DataTable dt = new DataTable();
            conn.Open();
            reader = null;
            String queryStr = "";
            queryStr = "SELECT workerDetails.* FROM workerDetails WHERE passportNo_New=('" + ddlPassportNo.Text + "')";
            SqlCommand cmd = new SqlCommand(queryStr, conn);
            reader = cmd.ExecuteReader();

            while (reader.Read())
            {
                lblWorkerNo.Text = reader["workerNo"].ToString();
            }
            reader.Close();
            conn.Close();
        }
    }
}