using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace StudyBlog
{
    public class Logic
    {
        SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\v11.0;AttachDbFilename=G:\Tamzid\StudyBlog\StudyBlog\App_Data\BlogDB.mdf;Integrated Security=True");
        SqlCommand cmd;

        //---------------Function FetchCategories Start ----------------
        public DataTable FetchCategories()
        {
            cmd = new SqlCommand("FetchCategories",con);
            cmd.CommandType = CommandType.StoredProcedure;
            con.Open();
            DataTable dt = new DataTable();
            dt.Load(cmd.ExecuteReader());
            con.Close();
            return dt;
        }
        //---------------Function FetchCategories End ----------------




        //---------------Function FetchBlogPost Start ----------------
        public DataTable FetchBlogPost()
        {
            cmd = new SqlCommand("FetchBlogData", con);
            cmd.CommandType = CommandType.StoredProcedure;
            con.Open();
            DataTable dt = new DataTable();
            dt.Load(cmd.ExecuteReader());
            con.Close();
            return dt;
        }
        //---------------Function FetchBlogPost End ----------------




        //---------------Function FetchArchives Start ----------------
        public DataTable FetchArchive()
        {
            cmd = new SqlCommand("FetchArchives", con);
            cmd.CommandType = CommandType.StoredProcedure;
            con.Open();
            DataTable dt = new DataTable();
            dt.Load(cmd.ExecuteReader());
            con.Close();
            return dt;
        }
        //---------------Function FetchArchives End ----------------




        //---------------Function FetchBlogByCategories Start ----------------
        public DataTable FetchBlogByCategorie(int id)
        {
            cmd = new SqlCommand("FetchBlogByCategories", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Categorie_Id", id);
            con.Open();
            DataTable dt = new DataTable();
            dt.Load(cmd.ExecuteReader());
            con.Close();
            return dt;
        }
        //---------------Function FetchBlogByCategories End ----------------



        //---------------Function FetchSingleBlog Start ----------------
        public DataTable FetchSingleBlog(int id)
        {
            cmd = new SqlCommand("FetchSingleBlog", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Blog_Id", id);
            con.Open();
            DataTable dt = new DataTable();
            dt.Load(cmd.ExecuteReader());
            con.Close();
            return dt;
        }
        //---------------Function FetchSingleBlog End ----------------



        //---------------Function LoginCheck Start ----------------
        public int LoginCheck(string email,string password)
        {
            cmd = new SqlCommand("LoginCheck", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Email", email);
            cmd.Parameters.AddWithValue("@Password", password);
            con.Open();
            object value = cmd.ExecuteScalar();
            con.Close();
            int output = Convert.ToInt32(value);
            return output;
        }
        //---------------Function LoginCheck End ----------------



        //---------------Function Fetch user using Session Start ----------------
        public SqlDataReader FetchUserInfo(string user)
        {
            cmd = new SqlCommand("FetchUserInfo", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@User", user);
            con.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            //con.Close();
            return dr;
        }
        //---------------Function Fetch user using Session End ----------------



        //---------------Function Insert Categories Start ----------------
        public int InsertCategories(string categorie)
        {
            cmd = new SqlCommand("InsertCategories", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Categorie_Name", categorie);
            con.Open();
            object value = cmd.ExecuteNonQuery();
            con.Close();
            int output = Convert.ToInt32(value);
            return output;
        }
        //---------------Function Insert Categories End ----------------


        //---------------Function Insert Message Start ----------------
        public int InsertMessage(string name,string email,string message,DateTime dt)
        {
            cmd = new SqlCommand("InsertMessage", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Name", name);
            cmd.Parameters.AddWithValue("@Email", email);
            cmd.Parameters.AddWithValue("@Message", message);
            cmd.Parameters.AddWithValue("@Date", dt);
            con.Open();
            object value = cmd.ExecuteNonQuery();
            con.Close();
            int output = Convert.ToInt32(value);
            return output;
        }
        //---------------Function Insert Message End ----------------




        //---------------Function FetchCommentByBlogId Start ----------------
        public DataTable FetchCommentByBlogId(int id)
        {
            cmd = new SqlCommand("FetchCommentByBlogId", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@BlogId", id);
            con.Open();
            DataTable dt = new DataTable();
            dt.Load(cmd.ExecuteReader());
            con.Close();
            return dt;
        }
        //---------------Function FetchCommentByBlogId End ----------------




        //---------------Function Insert Comment Start ----------------
        public int InsertComment(string email, string content, int blogid, DateTime dt)
        {
            cmd = new SqlCommand("InsertComment", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Email", email);
            cmd.Parameters.AddWithValue("@Comment_content", content);
            cmd.Parameters.AddWithValue("@BlogId", blogid);
            cmd.Parameters.AddWithValue("@Date", dt);
            con.Open();
            object value = cmd.ExecuteNonQuery();
            con.Close();
            int output = Convert.ToInt32(value);
            return output;
        }
        //---------------Function Insert Comment End ----------------




        //---------------Function FetchBlogByArchives Start ----------------
        public DataTable FetchBlogByArchives(string month,string year)
        {
            cmd = new SqlCommand("FetchBlogByArchives", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@BlogMonth", month);
            cmd.Parameters.AddWithValue("@BlogYear", year);
            con.Open();
            DataTable dt = new DataTable();
            dt.Load(cmd.ExecuteReader());
            con.Close();
            return dt;
        }
        //---------------Function FetchBlogByArchives End ----------------



        //---------------Function Delete Categories Start ----------------
        public int DeleteCategories(int categorieId)
        {
            cmd = new SqlCommand("DeleteCategories", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@CategorieId", categorieId);
            con.Open();
            object value = cmd.ExecuteNonQuery();
            con.Close();
            int output = Convert.ToInt32(value);
            return output;
        }
        //---------------Function Delete Categories End ----------------



        //---------------Function Update Categories Start ----------------
        public int UpdateCategories(int categorieId,string categorieName)
        {
            cmd = new SqlCommand("UpdateCategories", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@CategorieId", categorieId);
            cmd.Parameters.AddWithValue("@CategorieName", categorieName);
            con.Open();
            object value = cmd.ExecuteNonQuery();
            con.Close();
            int output = Convert.ToInt32(value);
            return output;
        }
        //---------------Function Update Categories End ----------------



        //---------------Function FetchUserId Start ----------------
        public int FetchUserId(string email)
        {
            cmd = new SqlCommand("FetchUserId", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Email", email);
            con.Open();
            object val = cmd.ExecuteScalar();
            con.Close();
            int userid = Convert.ToInt32(val);
            return userid;
        }
        //---------------Function FetchUserId End ----------------



        //---------------Function FetchCategorieId Start ----------------
        public int FetchCategorieId(string categorieName)
        {
            cmd = new SqlCommand("FetchCategorieId", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@CategorieName", categorieName);
            con.Open();
            object val = cmd.ExecuteScalar();
            con.Close();
            int categorieId = Convert.ToInt32(val);
            return categorieId;
        }
        //---------------Function FetchCategorieId End ----------------




        //---------------Function InsertBlog Start ----------------
        public int InsertBlog(string title, string image, string content, DateTime dt, string month, string year, int userid,int CategorieId)
        {
            cmd = new SqlCommand("InsertBlog", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@BlogTitle", title);
            cmd.Parameters.AddWithValue("@BlogImage", image);
            cmd.Parameters.AddWithValue("@BlogContent", content);
            cmd.Parameters.AddWithValue("@BlogDate", dt);
            cmd.Parameters.AddWithValue("@BlogMonth", month);
            cmd.Parameters.AddWithValue("@BlogYear", year);
            cmd.Parameters.AddWithValue("@UserId", userid);
            cmd.Parameters.AddWithValue("@CategorieId", CategorieId);
            con.Open();
            object value = cmd.ExecuteNonQuery();
            con.Close();
            int output = Convert.ToInt32(value);
            return output;
        }
        //---------------Function InsertBlog End ----------------



        //---------------Function FetchBlogView Start ----------------
        public DataTable FetchBlogView()
        {
            cmd = new SqlCommand("FetchBlogView", con);
            cmd.CommandType = CommandType.StoredProcedure;
            con.Open();
            DataTable dt = new DataTable();
            dt.Load(cmd.ExecuteReader());
            con.Close();
            return dt;
        }
        //---------------Function FetchBlogView End ----------------



        //---------------Function Delete Blog Start ----------------
        public int DeleteBlog(int blogId)
        {
            cmd = new SqlCommand("DeleteBlog", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@BlogId", blogId);
            con.Open();
            object value = cmd.ExecuteNonQuery();
            con.Close();
            int output = Convert.ToInt32(value);
            return output;
        }
        //---------------Function Delete Blog End ----------------



        //---------------Function UpdateBlog Start ----------------
        public int UpdateBlog(int blogId,string blogTitle, string blogImage, string blogContent,int categorieId)
        {
            cmd = new SqlCommand("UpdateBlog", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@BlogId", blogId);
            cmd.Parameters.AddWithValue("@BlogTitle", blogTitle);
            cmd.Parameters.AddWithValue("@BlogImage", blogImage);
            cmd.Parameters.AddWithValue("@BlogContent", blogContent);
            cmd.Parameters.AddWithValue("@CategorieId", categorieId);
            con.Open();
            object value = cmd.ExecuteNonQuery();
            con.Close();
            int output = Convert.ToInt32(value);
            return output;
        }
        //---------------Function UpdateBlog End ----------------



        //---------------Function FetchBlogViewCategories Start ----------------
        public DataSet FetchBlogViewCategories()
        {
            con.Open();
            DataSet ds = new DataSet();
            SqlDataAdapter da = new SqlDataAdapter("FetchCategories", con);
            da.Fill(ds);
            con.Close();
            return ds;
        }
        //---------------Function FetchBlogViewCategories End ----------------




        //---------------Function FetchMessageData Start ----------------
        public DataTable FetchMessageData()
        {
            cmd = new SqlCommand("FetchMessageData", con);
            cmd.CommandType = CommandType.StoredProcedure;
            con.Open();
            DataTable dt = new DataTable();
            dt.Load(cmd.ExecuteReader());
            con.Close();
            return dt;
        }
        //---------------Function FetchMessageData End ----------------



        //---------------Function DeleteMessage Start ----------------
        public int DeleteMessage(int messageId)
        {
            cmd = new SqlCommand("DeleteMessage", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@MessageId", messageId);
            con.Open();
            object value = cmd.ExecuteNonQuery();
            con.Close();
            int output = Convert.ToInt32(value);
            return output;
        }
        //---------------Function DeleteMessage End ----------------



        //---------------Function FetchSingleMessage Start ----------------
        public DataTable FetchSingleMessage(int id)
        {
            cmd = new SqlCommand("FetchSingleMessage", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@MessageId", id);
            con.Open();
            DataTable dt = new DataTable();
            dt.Load(cmd.ExecuteReader());
            con.Close();
            return dt;
        }
        //---------------Function FetchSingleMessage End ----------------





        //---------------Function FetchCommentData Start ----------------
        public DataTable FetchCommentData()
        {
            cmd = new SqlCommand("FetchCommentData", con);
            cmd.CommandType = CommandType.StoredProcedure;
            con.Open();
            DataTable dt = new DataTable();
            dt.Load(cmd.ExecuteReader());
            con.Close();
            return dt;
        }
        //---------------Function FetchCommentData End ----------------


        //---------------Function DeleteComment Start ----------------
        public int DeleteComment(int commentId)
        {
            cmd = new SqlCommand("DeleteComment", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@CommentId", commentId);
            con.Open();
            object value = cmd.ExecuteNonQuery();
            con.Close();
            int output = Convert.ToInt32(value);
            return output;
        }
        //---------------Function DeleteComment End ----------------



        //---------------Function CountBlog Start ----------------
        public int CountBlog()
        {
            cmd = new SqlCommand("Select Count(*) from Blog", con);
            cmd.CommandType = CommandType.Text;
            con.Open();
            object value = cmd.ExecuteScalar();
            con.Close();
            int output = Convert.ToInt32(value);
            return output;
        }
        //---------------Function CountBlog End ----------------



        //---------------Function CountComment Start ----------------
        public int CountComment()
        {
            cmd = new SqlCommand("Select Count(*) from Comment", con);
            cmd.CommandType = CommandType.Text;
            con.Open();
            object value = cmd.ExecuteScalar();
            con.Close();
            int output = Convert.ToInt32(value);
            return output;
        }
        //---------------Function CountComment End ----------------




        //---------------Function CountMessage Start ----------------
        public int CountMessage()
        {
            cmd = new SqlCommand("Select Count(*) from Message", con);
            cmd.CommandType = CommandType.Text;
            con.Open();
            object value = cmd.ExecuteScalar();
            con.Close();
            int output = Convert.ToInt32(value);
            return output;
        }
        //---------------Function CountMessage End ----------------





        //---------------Function FetchUserData Start ----------------
        public DataTable FetchUserData(string email)
        {
            cmd = new SqlCommand("FetchUserInfo", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@User", email);
            con.Open();
            DataTable dt = new DataTable();
            dt.Load(cmd.ExecuteReader());
            con.Close();
            return dt;
        }
        //---------------Function FetchUserData End ----------------




        //---------------Function DeleteUser Start ----------------
        public int DeleteUser(string email)
        {
            cmd = new SqlCommand("DeleteUser", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Email", email);
            con.Open();
            object value = cmd.ExecuteNonQuery();
            con.Close();
            int output = Convert.ToInt32(value);
            return output;
        }
        //---------------Function DeleteUser End ----------------




        //---------------Function UpdateUserInfo Start ----------------
        public int UpdateUserInfo(int userId, string userName,string email,string password,string mobileNo ,string profilrPic)
        {
            cmd = new SqlCommand("UpdateUserInfo", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@UserId", userId);
            cmd.Parameters.AddWithValue("@UserName", userName);
            cmd.Parameters.AddWithValue("@Email", email);
            cmd.Parameters.AddWithValue("@Password", password);
            cmd.Parameters.AddWithValue("@MobileNo", mobileNo);
            cmd.Parameters.AddWithValue("@ProfilePic", profilrPic);
            con.Open();
            object value = cmd.ExecuteNonQuery();
            con.Close();
            int output = Convert.ToInt32(value);
            return output;
        }
        //---------------Function UpdateUserInfo End ----------------




        //---------------Function InsertUserInfo Start ----------------
        public int InsertUserInfo(string username, string email, string password, string mobileno, string profilepic, string usertype)
        {
            cmd = new SqlCommand("InsertUserInfo", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@UserName", username);
            cmd.Parameters.AddWithValue("@Email", email);
            cmd.Parameters.AddWithValue("@Password", password);
            cmd.Parameters.AddWithValue("@MobileNo", mobileno);
            cmd.Parameters.AddWithValue("@ProfilePic", profilepic);
            cmd.Parameters.AddWithValue("@UserType", usertype);
            con.Open();
            object value = cmd.ExecuteNonQuery();
            con.Close();
            int output = Convert.ToInt32(value);
            return output;
        }
        //---------------Function InsertUserInfo End ----------------
    }
}