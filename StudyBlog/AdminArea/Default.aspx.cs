using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace StudyBlog.AdminArea
{
    public partial class Default : System.Web.UI.Page
    {
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
                    GetCountData();
                    GetUserDetails();
                }
            }
        }

        public void GetCountData()
        {
            Logic log = new Logic();
            int blogNumber = log.CountBlog();
            lblblog.Text = blogNumber.ToString();
            int commentNumber = log.CountComment();
            lblcmt.Text = commentNumber.ToString();
            int msgNumber = log.CountMessage();
            lblmsg.Text = msgNumber.ToString();
        }

        public void GetUserDetails()
        {
            string user = Session["User"].ToString();
            Logic log = new Logic();
            DataTable dt = log.FetchUserData(user);
            repUserInfo.DataSource = dt;
            repUserInfo.DataBind();
        }

        protected void btnEdit_Click(object sender, EventArgs e)
        {
            Response.Redirect("UserEdit.aspx");
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            Response.Redirect("UserAdd.aspx");
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            string user = Session["User"].ToString();
            Logic log = new Logic();
            int result = log.DeleteUser(user);
            if (result > 0)
            {
                string message = "Your Data have been Deleted successfully.";
                string script = "window.onload = function(){ alert('";
                script += message;
                script += "')};";
                ClientScript.RegisterStartupScript(this.GetType(), "SuccessMessage", script, true);
                Session.Abandon();
                Session.RemoveAll();
                HttpCookie cookie = Request.Cookies["UserInfo"];
                if (cookie != null)
                {
                    cookie.Expires = DateTime.Now.AddDays(-1);
                    Response.Cookies.Add(cookie);
                }
                Response.Redirect("http://localhost:3754/Login.aspx");
            }
            else
            {
                string message = "No Data Deleted !!!!";
                string script = "window.onload = function(){ alert('";
                script += message;
                script += "')};";
                ClientScript.RegisterStartupScript(this.GetType(), "SuccessMessage", script, true);
            }
        }
    }
}