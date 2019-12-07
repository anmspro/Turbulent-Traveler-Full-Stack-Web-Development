using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.IO;
using System.Diagnostics;

namespace StudyBlog.AdminArea
{
    public partial class BlogView : System.Web.UI.Page
    {
        public static string imgEditPath;
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
                    
                    GetBlogData();
                }
            }
        }

        public void GetBlogData()
        {
            Logic log = new Logic();
            DataTable dt = log.FetchBlogView();
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }

        

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            GetBlogData();
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            Logic log = new Logic();
            Label lbldeleteID = (Label)GridView1.Rows[e.RowIndex].FindControl("lblId");
            int id = int.Parse(lbldeleteID.Text);
            int result = log.DeleteBlog(id);
            if (result > 0)
            {
                string message = "Your Data have been Deleted successfully.";
                string script = "window.onload = function(){ alert('";
                script += message;
                script += "')};";
                ClientScript.RegisterStartupScript(this.GetType(), "SuccessMessage", script, true);
                GetBlogData();
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

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            GetBlogData();
        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            Image imgEditPhoto = GridView1.Rows[e.NewEditIndex].FindControl("imgPhoto") as Image;
            imgEditPath = imgEditPhoto.ImageUrl;


            GridView1.EditIndex = e.NewEditIndex;
            GetBlogData();
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            Logic log = new Logic();
            Label lblId = (Label)GridView1.Rows[e.RowIndex].FindControl("lblId");
            TextBox txtTitle = (TextBox)GridView1.Rows[e.RowIndex].FindControl("txtTitle");
            TextBox txtContent = (TextBox)GridView1.Rows[e.RowIndex].FindControl("txtContent");
            DropDownList DropDownCategories = (GridView1.Rows[e.RowIndex].FindControl("DropDownCategories") as DropDownList);

            Control ctrl = GridView1.Rows[e.RowIndex].FindControl("fuPhoto");
            FileUpload fuPhoto = ctrl as FileUpload;
            
            string imgFile = Path.GetFileName(fuPhoto.PostedFile.FileName);
            fuPhoto.SaveAs("G:/Tamzid/StudyBlog/StudyBlog/images/" + imgFile);
            File.Delete(Server.MapPath(imgEditPath));


            string blogImage = "/images/" + imgFile;
            string cat = DropDownCategories.SelectedItem.ToString();
            int categorieId = log.FetchCategorieId(cat);
            int id = int.Parse(lblId.Text);
            string blogTitle = txtTitle.Text;
            string blogContent = txtContent.Text;

            int result = log.UpdateBlog(id, blogTitle,blogImage,blogContent,categorieId);
            if (result > 0)
            {
                string message = "Your Data have been Updated successfully.";
                string script = "window.onload = function(){ alert('";
                script += message;
                script += "')};";
                ClientScript.RegisterStartupScript(this.GetType(), "SuccessMessage", script, true);
                GridView1.EditIndex = -1;
                GetBlogData();
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

        protected void DropDownCategories_SelectedIndexChanged(object sender, EventArgs e)
        {
            
        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {

                Control ctrl = e.Row.FindControl("DropDownCategories");
                if (ctrl != null)
                {
                    Logic log = new Logic();
                    DataSet dtt = log.FetchBlogViewCategories();
                    DropDownList dd = ctrl as DropDownList;
                    
                    dd.DataSource = dtt;
                    dd.DataBind();
                }
                
                
            }
            
        }
    }
}