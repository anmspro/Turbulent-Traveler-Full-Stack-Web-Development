using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace StudyBlog.AdminArea
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            HttpCookie cookie = Request.Cookies["UserInfo"];
            if (cookie != null)
            {
                string email = cookie["Email"];
                string password = cookie["Password"];
                Logic log = new Logic();
                int result = log.LoginCheck(email, password);
                if (result > 0)
                {
                    Session["User"] = email;
                    Response.Redirect("AdminArea/Default.aspx");
                    Session.RemoveAll();
                }
                else
                {
                    Response.Redirect("Login.aspx");
                }
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            Logic log = new Logic();
            int result = log.LoginCheck(txtEmail.Text, txtPassword.Text);
            if (result > 0)
            {
                if(Check1.Checked)
                {
                    HttpCookie cookie = new HttpCookie("UserInfo");
                    cookie["Email"] = txtEmail.Text;
                    cookie["Password"] = txtPassword.Text;
                    // Cookie will be persisted for 30 days
                    cookie.Expires = DateTime.Now.AddDays(30);
                    // Add the cookie to the client machine
                    Response.Cookies.Add(cookie);
                }
                Session["User"] = txtEmail.Text;
                Response.Redirect("AdminArea/Default.aspx");
                Session.RemoveAll();
                
            }
            else
            {
                Response.Redirect("Login.aspx");
            }
        }
    }
}