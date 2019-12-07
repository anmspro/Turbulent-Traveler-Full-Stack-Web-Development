using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

namespace StudyBlog.AdminArea
{
    public partial class UserAdd : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["User"] == null)
                {
                    Response.Redirect("http://localhost:3754/Login.aspx");
                }
            }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx");
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            Logic log = new Logic();
            string username = txtUserName.Text;
            string email = txtEmail.Text;
            string password = txtPassword.Text;
            string mobileNo = txtMobileNo.Text;
            string usertype = "Admin";

            string imgFile = Path.GetFileName(fuNewPhoto.PostedFile.FileName);
            fuNewPhoto.SaveAs("F:/project/webpage/blog/StudyBlog/StudyBlog/AdminArea/images/" + imgFile);
            string userImage = "/AdminArea/images/" + imgFile;
            int result = log.InsertUserInfo(username,email,password,mobileNo,userImage,usertype);
            if (result > 0)
            {
                Response.Redirect("Default.aspx");
            }
        }
    }
}