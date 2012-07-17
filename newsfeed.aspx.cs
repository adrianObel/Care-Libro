using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Web.UI.HtmlControls;
public partial class _Default : System.Web.UI.Page
{
    private DataTable profileData;
    private DataTable more_info_table;
    private DataTable user_browsing_dt;
    private DataTable user_publications;
    private DataTable is_followee;
    private string user_id;
    private string user_browsing_name;
    private DataTable userData;
    private string userid;
    private DBConnect db;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserEmail"] != null)
        {
            db = new DBConnect();
            initSes();
            getPublications();
        }
        else
            Response.Redirect("Index.aspx");

    }
    protected void initSes()
    {

        userData = db.query("SELECT * FROM user LEFT OUTER JOIN profile ON " +
            "(user.user_id = profile.user_id) WHERE  user.email = "+
            "'" + Session["UserEmail"].ToString() +"'  ");
        followers.NavigateUrl = "followers.aspx?user=" + userData.Rows[0]["url"].ToString(); ;

        if (userData.Rows[0]["profile_id"] == DBNull.Value)
        {
            createProfile();
        }

    }
    protected void createProfile()
    {
        string profile_url = userData.Rows[0]["name"].ToString() + "." + userData.Rows[0]["lastname"].ToString() +
            userData.Rows[0]["user_id"].ToString();

        db.insert("INSERT INTO profile(user_id,url,about_me,relationship,looking_for,phone,interests," +
          "education,hobbies,fav_movies,fav_artists,fav_books,fav_animals) VALUES('" +
          userData.Rows[0]["user_id"].ToString() + "','" + profile_url + "','','',''," +
          "'','','','','','','','')");
        db.insert(String.Format("INSERT INTO profile_photo(user_id,file_name) VALUES('{0}','{1}')", userData.Rows[0]["user_id"].ToString()
            , "default.png"));
    }
    protected void getPublications()
    {
        user_publications = db.query(String.Format("SELECT user_id,made_by,message,created_at " +
        "FROM `user_publication` ORDER BY created_at DESC LIMIT 30"));
        HtmlGenericControl[] div = new HtmlGenericControl[user_publications.Rows.Count];
        for (int i = 0; i < div.Length; i++)
        {
            div[i] = new HtmlGenericControl("li") { ID = "publication" + i };
            div[i].InnerHtml = String.Format("<div class='well'><h2>{0}</h2><p>{1}</p> " +
             "<p>{2}</p></div>", user_publications.Rows[i]["made_by"].ToString()
             , user_publications.Rows[i]["created_at"].ToString(), user_publications.Rows[i]["message"].ToString());
            publish_panel.Controls.Add(div[i]);
        }

    }

}