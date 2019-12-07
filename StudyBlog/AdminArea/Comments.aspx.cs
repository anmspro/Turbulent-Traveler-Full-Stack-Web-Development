using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace StudyBlog.AdminArea
{
    public partial class Comments : System.Web.UI.Page
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

                    GetCommentData();
                }
            }
        }

        public void GetCommentData()
        {
            Logic log = new Logic();
            DataTable dt = log.FetchCommentData();
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            Logic log = new Logic();
            Label lbldeleteID = (Label)GridView1.Rows[e.RowIndex].FindControl("lblCId");
            int id = int.Parse(lbldeleteID.Text);
            int result = log.DeleteComment(id);
            if (result > 0)
            {
                string message = "Your Data have been Deleted successfully.";
                string script = "window.onload = function(){ alert('";
                script += message;
                script += "')};";
                ClientScript.RegisterStartupScript(this.GetType(), "SuccessMessage", script, true);
                GetCommentData();
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

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            GetCommentData();
        }
    }
}