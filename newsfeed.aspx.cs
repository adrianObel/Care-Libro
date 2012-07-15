using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class _Default : System.Web.UI.Page
{
    private DataTable userData;
    private string userid;
    private DBConnect db;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserEmail"] != null)
        {
            db = new DBConnect();
            initSes();
        }
        else
            Response.Redirect("Index.aspx");
      
    }
    protected void initSes()    
    {
        userData = db.query("SELECT * FROM user LEFT OUTER JOIN profile ON " +
            "(user.user_id = profile.user_id) WHERE  user.email = "+
            "'" + Session["UserEmail"].ToString() +"'  ");
        if (userData.Rows[0]["profile_id"] == DBNull.Value)
        {
            createProfile();
        }
        else TextBox1.Text = "wadafak";// userData.Rows[0]["url"].ToString();
    }
    protected void createProfile()
    {
        string profile_url = userData.Rows[0]["name"].ToString() + "." + userData.Rows[0]["lastname"].ToString() +
            userData.Rows[0]["user_id"].ToString(); 

        db.insert("INSERT INTO profile(user_id,url,about_me,relationship,looking_for,phone,interests," +
          "education,hobbies,fav_movies,fav_artists,fav_books,fav_animals) VALUES('" + 
          userData.Rows[0]["user_id"].ToString()+ "','"+profile_url+"','','',''," +
          "'','','','','','','','')");
    }

}