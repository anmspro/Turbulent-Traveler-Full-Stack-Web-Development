using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace StudyBlog
{
    public partial class MasterPage : System.Web.UI.MasterPage
    {
        Logic log = new Logic();

        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                GetDestinations();
            }
        }

        public void GetDestinations()
        {
            DataTable dt = log.FetchCategories();
            repMenu.DataSource = dt;
            repMenu.DataBind();
        }

    }
}