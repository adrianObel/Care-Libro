using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.IO;

public partial class _Default : System.Web.UI.Page
{
    DBConnect db;
    DataTable profileData;
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
        profileData = db.query("SELECT * FROM user INNER JOIN profile ON user.user_id = profile.user_id" +
            " AND user.email='"+Session["UserEmail"].ToString()+"'" );
    }
    protected void fillDetails()
    {
            if (!IsPostBack)
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
    }
    protected void save_modifications_Click(object sender,EventArgs e)
    {
        db.insert("UPDATE profile SET about_me = '"+about_me.Text+"',relationship = '"+relationship.SelectedItem+"'"+
        ", looking_for='"+looking_for.SelectedItem+"',phone = '"+phone.Text+"',interests = '"+interest.Text+"'"+
        ",education = '"+education.Text+"',hobbies = '"+hobbies.Text+"',fav_movies = '"+fav_movies.Text+"'"+
        ",fav_artists = '"+fav_artists.Text+"',fav_books = '"+fav_books.Text+"',fav_animals = '"+fav_animals.Text+"'"+
        "WHERE user_id = '"+profileData.Rows[0]["user_id"].ToString()+"'");
       }


    protected void cancel_modifications_Click(object sender, EventArgs e)
    {
        Response.Write("<script type='text/javascript'>alert('"+about_me.Text+"') </script>");
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

    
    protected void UploadButton_Click(object sender, EventArgs e)
    {
        if (FileUploadControl.HasFile)
        {
            try
            {
                if (FileUploadControl.PostedFile.ContentType == "image/jpeg" || FileUploadControl.PostedFile.ContentType == "image/png")
                {
                    if (FileUploadControl.PostedFile.ContentLength < 512000)
                    {
                        string filename = Path.GetFileName(FileUploadControl.FileName);
                        FileUploadControl.SaveAs(Server.MapPath("~/upimage/") + filename);
                        db.insert("INSERT INTO photos(user_id,file_name,title) VALUES('"+profileData.Rows[0]["user_id"].ToString()+
                            "','"+FileUploadControl.FileName+"','')");
                        StatusLabel.Text = "Estatus de la subida: ¡Archivo subido!";
                    }
                    else
                        StatusLabel.Text = "Estatus de la subida: ¡La imagen debe pesar menos de 500kb!";
                }
                else
                    StatusLabel.Text = "Estatus de la subida: ¡Solo imagenes PNG o JPEG soportadas!";
            }
            catch (Exception ex)
            {
                StatusLabel.Text = "Estatus de la subida: El siguiente error ha ocurrido: " + ex.Message;
            }
        }
    }
}