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
        Label1.Text = flw_det.Rows[0]["file_name"].ToString();
    }
}