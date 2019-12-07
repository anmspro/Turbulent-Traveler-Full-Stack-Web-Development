using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace StudyBlog
{
    public partial class CategorieView : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                if (Session["User"] == null)
                {
                    Response.Redirect("http://localhost:3754/Login.aspx");
                }
                else
                {
                    GetCategorieData();
                }
            }
                
        }

        public void GetCategorieData()
        {
            Logic log = new Logic();
            DataTable dt = log.FetchCategories();
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            GetCategorieData();
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            Logic log = new Logic();
            Label lbldeleteID = (Label)GridView1.Rows[e.RowIndex].FindControl("lblCategorieId");
            int id = int.Parse(lbldeleteID.Text);
            int result = log.DeleteCategories(id);
            if (result > 0)
            {
                string message = "Your Data have been Deleted successfully.";
                string script = "window.onload = function(){ alert('";
                script += message;
                script += "')};";
                ClientScript.RegisterStartupScript(this.GetType(), "SuccessMessage", script, true);
                GetCategorieData();
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

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            GetCategorieData();
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            Logic log = new Logic();
            Label lblcategorieid = (Label)GridView1.Rows[e.RowIndex].FindControl("lblCategorieId");
            TextBox txtname = (TextBox)GridView1.Rows[e.RowIndex].FindControl("txtName");
            int id = int.Parse(lblcategorieid.Text);
            string categorieName = txtname.Text;
            int result = log.UpdateCategories(id, categorieName);
            if (result > 0)
            {
                string message = "Your Data have been Updated successfully.";
                string script = "window.onload = function(){ alert('";
                script += message;
                script += "')};";
                ClientScript.RegisterStartupScript(this.GetType(), "SuccessMessage", script, true);
                GridView1.EditIndex = -1;
                GetCategorieData();
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

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            GetCategorieData();
        }
    }
}