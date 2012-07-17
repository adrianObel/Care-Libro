using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Data;
public partial class search : System.Web.UI.Page
{
    private DBConnect db;
    private DataTable search_friend;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserEmail"] != null)
        {
            db = new DBConnect();
            if(Request["search"]!="")
            {
                searchFriend();
                fillSearch();
            }
            else
            Response.Redirect("newsfeed.aspx");

        }
        else
            Response.Redirect("Index.aspx");
   
        
    }
    protected void logout_Click(object sender, EventArgs e)
    {
        Session.Abandon();
        Response.Redirect("Index.aspx");
    }
    protected void search_Click(object sender, EventArgs e)
    {
        Response.Redirect("search.aspx?search=" + search_box.Text);
    }
    protected void searchFriend()
    {
        search_friend = db.query(String.Format("SELECT CONCAT(user.name,' ',user.lastname) "+
            "AS fullname ,profile.url,profile_photo.file_name  FROM user LEFT JOIN profile "+
            "on(`user`.user_id = `profile`.user_id) LEFT JOIN profile_photo "+
            "ON(profile_photo.user_id = user.user_id)  HAVING fullname LIKE '%{0}%'",Request["search"].ToString()));
    }
    protected void fillSearch()
    {
        search_label.Text = String.Format("Tu busqueda fue sobre @{0}, aqui estan los resultados: ",Request["search"]);
        if (search_friend.Rows.Count != 0)
        {
            int n = search_friend.Rows.Count;
            HtmlGenericControl[] search_a = new HtmlGenericControl[n];
            HtmlGenericControl[] search_img = new HtmlGenericControl[n];
            for (int i = 0; i < n; i++)
            {
                search_a[i] = new HtmlGenericControl("a") { ID = "image_link" };
                search_img[i] = new HtmlGenericControl("img");
                search_a[i].Attributes.Add("href","profile.aspx?user="+search_friend.Rows[i]["url"]);
                search_img[i].Attributes.Add("class", "searched_img");
                search_img[i].Attributes.Add("src", String.Format("upimage/{0}", search_friend.Rows[i]["file_name"]));
                search_a[i].Controls.Add(search_img[i]);
                search_place_holder.Controls.Add(search_a[i]);
            }
            
        }
    }
}