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
    DBConnect db;
    private DataTable profileData;
    private DataTable more_info_table;
    private DataTable user_browsing_dt;
    private DataTable user_publications;
    private DataTable is_followee;
    private string user_id;
    private string user_browsing_name;
    protected void Page_Load(object sender, EventArgs e)
    {
        
        if (Session["UserEmail"] != null)
        {
            db = new DBConnect();
            user_id = Request["user"].ToString();

            //Dataset Storing all Proflie's data
            profileData = db.query(String.Format("SELECT user.user_id,user.name,user.lastname,user.gender "+
           " ,user.online,profile.url,profile.relationship,profile.looking_for,profile_photo.file_name"+
            " FROM user LEFT JOIN profile ON (user.user_id = profile.user_id) LEFT JOIN profile_photo"+
            " ON (profile_photo.user_id = user.user_id) WHERE profile.url= '{0}' ",user_id));

            //Variables to store Current Browser's name,last name 
            user_browsing_dt = db.query(String.Format("SELECT user.user_id,user.name,user.lastname"+
                " FROM user  WHERE user.email = '{0}'", Session["UserEmail"].ToString()));
            user_browsing_name = String.Format("{0} {1}", user_browsing_dt.Rows[0]["name"].ToString()
            , user_browsing_dt.Rows[0]["lastname"].ToString());
            if(profileData.Rows.Count == 0 )
                Response.Redirect("newsfeed.aspx");
            else
                initProfile();
            if(!IsPostBack)
            getPublications();
        }
        else
            Response.Redirect("Index.aspx");

        friendprof1.ToolTip = "@nombre del amigo";
        friendprof2.ToolTip = "@nombre del amigo";
        friendprof3.ToolTip = "@nombre del amigo";
        friendprof4.ToolTip = "@nombre del amigo";
        friendprof5.ToolTip = "@nombre del amigo";
        friendprof6.ToolTip = "@nombre del amigo";
        friendprof7.ToolTip = "@nombre del amigo";
        friendprof8.ToolTip = "@nombre del amigo";
       
    }

    ///<sumary>
    ///Method Initializing Proflie Data
    ///Profile Avatar, Name, Last name etc.
    ///</sumary>
    protected void initProfile()
    {
        string profile_pic_url = profileData.Rows[0]["file_name"].ToString();
        follow_link.NavigateUrl = "followers.aspx?user="+profileData.Rows[0]["url"].ToString();
        profilepic.ImageUrl = "~/upimage/"+ profile_pic_url;
        name.Text = profileData.Rows[0]["name"].ToString() +" "+ profileData.Rows[0]["lastname"].ToString();
        relationship.Text = profileData.Rows[0]["relationship"].ToString();
        looking_for.Text = profileData.Rows[0]["looking_for"].ToString();
        if (more_info_table == null)
        {
            more_info_table = db.query(String.Format("SELECT about_me,phone,interests,education,hobbies," +
         "fav_movies,fav_artists,fav_books,fav_animals FROM profile WHERE user_id = {0}", profileData.Rows[0]["user_id"].ToString()));
            about_me_modal.Text = more_info_table.Rows[0]["about_me"].ToString();
            phone_modal.Text = more_info_table.Rows[0]["phone"].ToString();
            interests_modal.Text = more_info_table.Rows[0]["interests"].ToString();
            edutacion_modal.Text = more_info_table.Rows[0]["education"].ToString();
            hobbies_modal.Text = more_info_table.Rows[0]["hobbies"].ToString();
            favmovies_modal.Text = more_info_table.Rows[0]["fav_movies"].ToString();
            favartists_modal.Text = more_info_table.Rows[0]["fav_artists"].ToString();
            favbooks_modal.Text = more_info_table.Rows[0]["fav_books"].ToString();
            favanimals_modal.Text = more_info_table.Rows[0]["fav_animals"].ToString();
        }
        areWeFriends();
    }

    /// <summary>
    ///Method that retrieves publications
    ///Then inserting these into placeholder 
    /// </summary>
    protected void getPublications()
    {
        user_publications = db.query(String.Format("SELECT user_id,made_by,message,created_at "+
        "FROM `user_publication` WHERE user_publication.user_id = '{0}' ORDER BY created_at DESC LIMIT 10",profileData.Rows[0]["user_id"].ToString()));
        HtmlGenericControl[] div = new HtmlGenericControl[user_publications.Rows.Count];
        for (int i = 0; i < div.Length; i++)
        {
            div[i] = new HtmlGenericControl("li") { ID = "publication"+i };
            div[i].InnerHtml = String.Format("<div class='well'><h2>{0}</h2><p>{1}</p> " +
             "<p>{2}</p></div>", user_publications.Rows[i]["made_by"].ToString()
             ,user_publications.Rows[i]["created_at"].ToString(),user_publications.Rows[i]["message"].ToString());
            publish_panel.Controls.Add(div[i]);
        }
        
    }
   
    /// <summary>
    /// Method in charge of sending publication into database
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void send_message_Click(object sender, EventArgs e)
    {
        string time_sent = DateTime.Now.ToString("yyyy-MM-dd hh:mm:ss");
        db.insert(string.Format("INSERT INTO user_publication(user_id,made_by,message,created_at) VALUES" +
            "('{0}','{1}','{2}','{3}')", profileData.Rows[0]["user_id"].ToString()
            , user_browsing_name, write_wall.Text, time_sent));
        getPublications();
    }
    protected void areWeFriends()
    {
        is_followee = db.query(String.Format("SELECT * FROM follow WHERE user_id = '{0}' AND follow_id = '{1}'"
            ,user_browsing_dt.Rows[0]["user_id"].ToString(),profileData.Rows[0]["user_id"].ToString()));
        if (is_followee.Rows.Count == 0 && profileData.Rows[0]["user_id"].ToString() != user_browsing_dt.Rows[0]["user_id"].ToString())
        {
            LinkButton add_friend = new LinkButton() { ID = "add_follower", CssClass = "btn btn-success btn-large friendbutton" };
            add_friend.Text = "follow";
            add_friend.Click += new EventHandler(add_Friend);
            are_friends.Controls.Add(add_friend);
        }
        else
            if (is_followee.Rows.Count != 0 && is_followee.Rows[0]["follow_id"].ToString() == profileData.Rows[0]["user_id"].ToString()
               && is_followee.Rows[0]["follow_id"].ToString() != user_browsing_dt.Rows[0]["user_id"].ToString())
        {
            LinkButton add_friend = new LinkButton() { ID = "add_follower", CssClass = "btn btn-success btn-large friendbutton" };
            add_friend.Text = "following";
            are_friends.Controls.Add(add_friend);
        }
    
    }
    protected void add_Friend(object sender,EventArgs e)
    {
        db.insert(string.Format("INSERT INTO follow(follow_id,user_id) VALUES('{0}','{1}')"
            , profileData.Rows[0]["user_id"].ToString(), user_browsing_dt.Rows[0]["user_id"].ToString()));
       
    }

}