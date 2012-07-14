using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class _Default : System.Web.UI.Page
{
    DBConnect db;
    DataTable profileData;
    private string userid;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserEmail"] != null)
        {
            db = new DBConnect();
            getDetails();
            fillDetails();
        }
        else
            Response.Redirect("Index.aspx");
    }
    protected void getDetails()
    {
        userid = db.query("SELECT user_id FROM user WHERE user.email='"+Session["UserEmail"].ToString()+"' ").Rows[0]["user_id"].ToString();
        profileData = db.query("SELECT * FROM user INNER JOIN profile ON user.user_id = profile.user_id" +
            " AND user.email='"+Session["UserEmail"].ToString()+"'" );
    }
    protected void fillDetails()
    {
        if (profileData.Rows.Count != 0)
        {
            about_me.Text = profileData.Rows[0]["about_me"].ToString();
            relationship.SelectedIndex = relationStatus();
            looking_for.SelectedIndex = lookingFor();
            phone.Text = profileData.Rows[0]["phone"].ToString();
            interest.Text = profileData.Rows[0]["interests"].ToString();
            education.Text = profileData.Rows[0]["education"].ToString();
            hobbies.Text = profileData.Rows[0]["hobbies"].ToString();
            fav_movies.Text = profileData.Rows[0]["fav_movies"].ToString();
            fav_artists.Text = profileData.Rows[0]["fav_artists"].ToString();
            fav_books.Text = profileData.Rows[0]["fav_books"].ToString();
            fav_animals.Text = profileData.Rows[0]["fav_animals"].ToString();
        }
        else
            createProfile();
    }
    protected void save_modifications_Click(object sender,EventArgs e)
    {
        db.insert("UPDATE profile SET about_me = 'a',relationship = 'x', looking_for='a'" +
        ",phone = 'p',interests = 'i',education = 'e',hobbies = 'h',fav_movies = 'm',fav_artists = 'fa'"+
        ",fav_books = 'fb',fav_animals = 'gg' WHERE user_id = '2'");
       }


    protected void cancel_modifications_Click(object sender, EventArgs e)
    {
      
    }
    protected byte relationStatus()
    {
        switch (profileData.Rows[0]["relationship"].ToString())
        {
            case "Soltero":
                return 0;
            case "En una relación":
                return 1;
            case "Casado":
                return 2;
            case "Viudo":
                return 3;
            case "Concubino":
                return 4;
            case "Arrejuntao'":
                return 5;
            case "Es complicado":
                return 6;
        }
            return 0;
       
    }
    protected byte lookingFor()
    {
        switch (profileData.Rows[0]["looking_for"].ToString())
        {
            case "Mujeres":
                return 0;
            case "Hombres":
                return 1;
            case "Hombres o Mujeres":
                return 2;
        }
        return 0;
    }
    protected void createProfile()
    {
        db.insert("INSERT INTO profile(user_id,about_me,relationship,looking_for,phone,interests,"+
           "education,hobbies,fav_movies,fav_artists,fav_books,fav_animals) VALUES('"+userid+"','','','',"+
           "'','','','','','','','')");

    }
}