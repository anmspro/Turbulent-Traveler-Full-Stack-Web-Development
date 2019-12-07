using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.IO;

namespace StudyBlog.AdminArea
{
    public partial class UserEdit : System.Web.UI.Page
    {
        string imgEditPath;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["User"] == null)
                {
                    Response.Redirect("http://localhost:3754/Login.aspx");
                }
                else
                {
                    GetUserDetails();
                }
            }
        }

        public void GetUserDetails()
        {
            string user = Session["User"].ToString();
            Logic log = new Logic();
            DataTable dt = log.FetchUserData(user);
            txtUserName.Text = dt.Rows[0]["UserName"].ToString();
            txtEmail.Text = dt.Rows[0]["Email"].ToString();
            txtPassword.Text = dt.Rows[0]["Password"].ToString();
            txtMobileNo.Text = dt.Rows[0]["MobileNo"].ToString();
            imgPhoto.ImageUrl = dt.Rows[0]["ProfilePic"].ToString();
            imgEditPath = imgPhoto.ImageUrl;
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            Logic log = new Logic();
            string user = Session["User"].ToString();
            int id = log.FetchUserId(user);
            string imgFile = Path.GetFileName(fuNewPhoto.PostedFile.FileName);
            if (imgFile != null)
            {
                fuNewPhoto.SaveAs("F:/project/webpage/blog/StudyBlog/StudyBlog/AdminArea/images/" + imgFile);
                //File.Delete(Server.MapPath(imgEditPath));
            }
            else
            {
                imgFile = imgEditPath;
            }
            


            string UserImage = "/AdminArea/images/" + imgFile;
            string UserName = txtUserName.Text;
            string Email = txtEmail.Text;
            string Password = txtPassword.Text;
            string MobileNo = txtMobileNo.Text;

            int result = log.UpdateUserInfo(id, UserName, Email, Password, MobileNo, UserImage);
            if (result > 0)
            {
                string message = "Your Data have been Updated successfully.";
                string script = "window.onload = function(){ alert('";
                script += message;
                script += "')};";
                ClientScript.RegisterStartupScript(this.GetType(), "SuccessMessage", script, true);
                Response.Redirect("Default.aspx");
            }
            else
            {
                string message = "No Data Updated !!!";
                string script = "window.onload = function(){ alert('";
                script += message;
                script += "')};";
                ClientScript.RegisterStartupScript(this.GetType(), "SuccessMessage", script, true);
            }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx");
        }

    }
}