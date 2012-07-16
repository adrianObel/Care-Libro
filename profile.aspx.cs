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
    DataTable profileData;
    DataTable more_info_table;
    DataTable user_publications;
    private string userid;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserEmail"] != null)
        {
            db = new DBConnect();
            userid = Request["user"].ToString(); ;
            profileData = db.query(String.Format("SELECT user.user_id,user.name,user.lastname,user.gender "+
           " ,user.online,profile.url,profile.relationship,profile.looking_for,profile_photo.file_name"+
            " FROM user LEFT JOIN profile ON (user.user_id = profile.user_id) LEFT JOIN profile_photo"+
            " ON (profile_photo.user_id = user.user_id) WHERE profile.url= '{0}' ",userid));
            if(profileData.Rows.Count == 0 )
                Response.Redirect("newsfeed.aspx");
            else
                initProfile();
            getPublications();
        }
        else
            Response.Redirect("Index.aspx");
       
    }

    protected void initProfile()
    {
        string profile_pic_url = profileData.Rows[0]["file_name"].ToString();
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
    }

    protected void getPublications()
    {
       
        HtmlGenericControl[] div = new HtmlGenericControl[5];
        div[0] = new HtmlGenericControl("li") { ID = "publication" };
        div[0].InnerHtml = String.Format("<div class='well'><h2>{0}</h2> "+
        "<p>test</p></div>",Session["UserEmail"].ToString());
        div[1] = new HtmlGenericControl("li") { ID = "publication" };
        div[1].InnerHtml = String.Format("<div class='well'><h2>{0}</h2> " +
        "<p>test</p></div>", Session["UserEmail"].ToString());
        publish_panel.Controls.Add(div[0]);
        publish_panel.Controls.Add(div[1]);
        
    }
    protected void send_message_Click(object sender, EventArgs e)
    {
       
    }

}