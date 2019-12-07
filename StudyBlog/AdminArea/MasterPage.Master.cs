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
    public partial class MasterPage : System.Web.UI.MasterPage
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
                    GetUserDetails();
                }
            }
        }

        public void GetUserDetails()
        {
            string user = Session["User"].ToString();
            Logic log = new Logic();
            SqlDataReader dr = log.FetchUserInfo(user);
            while (dr.Read())
            {
                lblUser.Text = dr[1].ToString();
                UserImage.ImageUrl = dr[5].ToString();
                if (dr[6].ToString() == "Admin")
                {
                    lblUserType.Text = "Administrator";
                }
                else
                {
                    lblUserType.Text = "User";
                }
            }
        }

        protected void lbLogout_Click(object sender, EventArgs e)
        {
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
    }
}