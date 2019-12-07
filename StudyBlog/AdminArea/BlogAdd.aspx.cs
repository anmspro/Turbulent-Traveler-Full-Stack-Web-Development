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
    public partial class BlogAdd : System.Web.UI.Page
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
                    GetCategories();
                }
            }
        }

        public void GetCategories()
        {
            Logic log = new Logic();
            DataTable dt = log.FetchCategories();
            DropDownList1.DataSource = dt;
            DropDownList1.DataBind();
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            string blogName = txtName.Text;
            string blogContent = txtContent.Text;
            string imgFile = Path.GetFileName(fuNewPhoto.PostedFile.FileName);
            fuNewPhoto.SaveAs("G:/Tamzid/StudyBlog/StudyBlog/images/" + imgFile);
            string blogImage = "/images/" + imgFile;
            DateTime dt = DateTime.Now;
            string blogMonth = DateTime.Now.ToString("MMM");
            string blogYear = DateTime.Now.Year.ToString();
            Logic log = new Logic();
            string email = Session["User"].ToString();
            int userId = log.FetchUserId(email);
            string cat = DropDownList1.SelectedItem.ToString();
            int categorieId = log.FetchCategorieId(cat);
            int result = log.InsertBlog(blogName,blogImage,blogContent,dt,blogMonth,blogYear,userId,categorieId);
            if (result > 0)
            {
                string message = "Your Blog have been saved successfully.";
                string script = "window.onload = function(){ alert('";
                script += message;
                script += "')};";
                ClientScript.RegisterStartupScript(this.GetType(), "SuccessMessage", script, true);
            }
            else
            {
                string message = "No Data Saved.";
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

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }


        
    }
}