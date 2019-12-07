using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Collections;

namespace StudyBlog
{
    public partial class Single : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["BlogId"] == null)
                {
                    Response.Redirect("~/Default.aspx");

                }
                else
                {
                    GetBlogById();
                    GetCommentByBlogId();
                }
            }
           
        }

        public void GetBlogById()
        {
            int id = int.Parse(Request.QueryString["BlogId"]);
            Logic log = new Logic();
            DataTable dt = log.FetchSingleBlog(id);
            repBlogPost.DataSource = dt;
            repBlogPost.DataBind();
        }

        public void GetCommentByBlogId()
        {
            int id = int.Parse(Request.QueryString["BlogId"]);
            Logic log = new Logic();
            DataTable dt = log.FetchCommentByBlogId(id);
            PagedDataSource pds = new PagedDataSource();
            DataView dv = new DataView(dt);
            pds.DataSource = dv;
            pds.AllowPaging = true;
            pds.PageSize = 4;
            pds.CurrentPageIndex = PageNumber;
            if (pds.PageCount > 1)
            {
                rptPaging.Visible = true;
                ArrayList arraylist = new ArrayList();
                for (int i = 0; i < pds.PageCount; i++)
                    arraylist.Add((i + 1).ToString());
                rptPaging.DataSource = arraylist;
                rptPaging.DataBind();
            }
            else
            {
                rptPaging.Visible = false;
            }
            repComment.DataSource = pds;
            repComment.DataBind();
        
        }

        protected void btn_Submit_Click(object sender, EventArgs e)
        {
            string Email = txtEmail.Text;
            string Content = txtComment.Text;
            int blogid = int.Parse(Request.QueryString["BlogId"]);
            DateTime dt = DateTime.Now;
            Logic log = new Logic();
            int result = log.InsertComment(Email, Content, blogid, dt);
            //Displaying Javascript alert Comment Posted Successfully
            if (result > 0)
            {
                Response.Write(@"<script language='javascript'>alart('Comment Successfully Post...');</script>");
            }
            else
            {
                Response.Write(@"<script language='javascript'>alart('Comment Cann't Posted Yet...')</script>");
            }
            GetCommentByBlogId();
            txtEmail.Text = "";
            txtComment.Text = "";
        }

        public int PageNumber
        {
            get
            {
                if (ViewState["PageNumber"] != null)
                    return Convert.ToInt32(ViewState["PageNumber"]);
                else
                    return 0;
            }
            set
            {
                ViewState["PageNumber"] = value;
            }
        }
        protected void rptPaging_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            PageNumber = Convert.ToInt32(e.CommandArgument) - 1;
            GetCommentByBlogId();
        }
    }
}