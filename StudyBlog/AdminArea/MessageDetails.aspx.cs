using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace StudyBlog.AdminArea
{
    public partial class MessageDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["User"] == null)
                {
                    Response.Redirect("http://localhost:3754/Login.aspx");
                }
                else if(Request.QueryString["MessageId"] == null)
                {
                    Response.Redirect("~/Default.aspx");

                }
                else
                {

                    GetMessageDetails();
                }
            }
        }

        public void GetMessageDetails()
        {
            int id = int.Parse(Request.QueryString["MessageId"]);
            Logic log = new Logic();
            DataTable dt = log.FetchSingleMessage(id);
            repMsgDetails.DataSource = dt;
            repMsgDetails.DataBind();
        }

        protected void btndelete_Click(object sender, EventArgs e)
        {
            int id = int.Parse(Request.QueryString["MessageId"]);
            Logic log = new Logic();
            int result = log.DeleteMessage(id);
            if (result > 0)
            {
                string message = "Your Data have been Deleted successfully.";
                string script = "window.onload = function(){ alert('";
                script += message;
                script += "')};";
                ClientScript.RegisterStartupScript(this.GetType(), "SuccessMessage", script, true);
                Response.Redirect("Message.aspx");
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

        protected string FixCrLf(string value)
        {

            if (string.IsNullOrEmpty(value))
            {

                return string.Empty;

            }

            return value.Replace(Environment.NewLine, "<br />");

        }

    }
}