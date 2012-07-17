using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Data;
public partial class _Default : System.Web.UI.Page
{
    DBConnect db;
    DataTable flw_det;
    private string uid;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserEmail"] != null)
        {
            db = new DBConnect();
            if (Request["search"] != "")
            {
                getFollowers();
            }
            else
                Response.Redirect("newsfeed.aspx");

        }
        else
            Response.Redirect("Index.aspx");

    }

    protected void getFollowers()
    {
        uid = db.query(String.Format("SELECT user_id FROM profile WHERE url='{0}'"
            , Request["user"].ToString())).Rows[0]["user_id"].ToString();
        flw_det = db.query(String.Format("SELECT `profile`.url,follow.user_id,profile_photo.file_name "+
                                         "FROM profile LEFT JOIN follow ON(profile.user_id = follow.follow_id) "+
                                         " LEFT JOIN profile_photo ON(`profile`.user_id = profile_photo.user_id) " +
                                         "WHERE follow.user_id = '{0}'",uid));
        if (flw_det.Rows.Count != 0)
        {
            int n = flw_det.Rows.Count;
            HtmlGenericControl[] search_a = new HtmlGenericControl[n];
            HtmlGenericControl[] search_img = new HtmlGenericControl[n];
            for (int i = 0; i < n; i++)
            {
                search_a[i] = new HtmlGenericControl("a") { ID = "image_link" };
                search_img[i] = new HtmlGenericControl("img");
                search_a[i].Attributes.Add("href", "profile.aspx?user=" + flw_det.Rows[i]["url"]);
                search_img[i].Attributes.Add("class", "searched_img");
                search_img[i].Attributes.Add("src", String.Format("upimage/{0}", flw_det.Rows[i]["file_name"]));
                search_a[i].Controls.Add(search_img[i]);
                follow_list.Controls.Add(search_a[i]);
            }

        }

    }
}