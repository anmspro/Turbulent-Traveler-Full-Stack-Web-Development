using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace StudyBlog
{
    public partial class ContactUs : System.Web.UI.Page
    {
        Logic log;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string Name = txtName.Text;
            string Email = txtEmail.Text;
            string Message = txtMessage.Text;
            DateTime dt = DateTime.Now;
            log = new Logic();
            int result = log.InsertMessage(Name,Email,Message,dt);
            if (result > 0)
            {
                string message = "Message Successfully Submitted.";
                string script = "window.onload = function(){ alert('";
                script += message;
                script += "')};";
                ClientScript.RegisterStartupScript(this.GetType(), "SuccessMessage", script, true);
                txtMessage.Text = "";
            }
            else
            {
                string message = "Message Can't Submitted Yet....";
                string script = "window.onload = function(){ alert('";
                script += message;
                script += "')};";
                ClientScript.RegisterStartupScript(this.GetType(), "SuccessMessage", script, true);
            }
        }

        protected void txtName_TextChanged(object sender, EventArgs e)
        {

        }
    }
}