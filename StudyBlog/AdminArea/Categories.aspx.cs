using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace StudyBlog.AdminArea
{
    public partial class Categories : System.Web.UI.Page
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
                    FetchAllCategories();
                }
            }
        }

        public void FetchAllCategories()
        {
            Logic log = new Logic();
            DataTable dt = log.FetchCategories();
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            string categorieName = txtName.Text;
            Logic log = new Logic();
            int result = log.InsertCategories(categorieName);
            if (result > 0)
            {
                string message = "Your Categorie have been saved successfully.";
                string script = "window.onload = function(){ alert('";
                script += message;
                script += "')};";
                ClientScript.RegisterStartupScript(this.GetType(), "SuccessMessage", script, true);
                FetchAllCategories();
            }
            else
            {
                string message = "No Data Saved !!!!";
                string script = "window.onload = function(){ alert('";
                script += message;
                script += "')};";
                ClientScript.RegisterStartupScript(this.GetType(), "SuccessMessage", script, true);
            }
        }
    }
}