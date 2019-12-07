using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Collections;

namespace StudyBlog
{
    public partial class Pages : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["PageId"] == null && Request.QueryString["PageMonth"] == null)
                {
                    Response.Redirect("~/Default.aspx");

                }
                else if (Request.QueryString["PageMonth"] == null)
                {
                    //string req = Request.QueryString["PageId"];
                    int id = int.Parse(Request.QueryString["PageId"]);
                    GetBlogByCategories(id);
                }
                else
                {
                    string month = Request.QueryString["PageMonth"];
                    string year = Request.QueryString["PageYear"];
                    GetBlogByArchives(month,year);
                }
            }
            else
            {
                if (Request.QueryString["PageId"] == null && Request.QueryString["PageMonth"] == null)
                {
                    Response.Redirect("~/Default.aspx");

                }
                else if (Request.QueryString["PageMonth"] == null)
                {
                    //string req = Request.QueryString["PageId"];
                    int id = int.Parse(Request.QueryString["PageId"]);
                    GetBlogByCategories(id);
                }
                else
                {
                    string month = Request.QueryString["PageMonth"];
                    string year = Request.QueryString["PageYear"];
                    GetBlogByArchives(month, year);
                }
            }
        }

        public void GetBlogByCategories(int id)
        {
            Logic log = new Logic();
            DataTable dt = log.FetchBlogByCategorie(id);
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
            repBlogPost.DataSource = pds;
            repBlogPost.DataBind();
        }

        public void GetBlogByArchives(string month,string year)
        {
            Logic log = new Logic();
            DataTable dt = log.FetchBlogByArchives(month,year);
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
            repBlogPost.DataSource = pds;
            repBlogPost.DataBind();
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
            int id = int.Parse(Request.QueryString["PageId"]);
            GetBlogByCategories(id);
        }
    }
}