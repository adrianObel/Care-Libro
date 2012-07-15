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
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserEmail"] != null)
        {
            db = new DBConnect();
            profileData = db.query("SELECT * FROM user INNER JOIN profile ON user.user_id = profile.user_id" +
               " AND user.email='" + Session["UserEmail"].ToString() + "'");
            name.Text = Request.PathInfo.ToString();
        }
        else
            Response.Redirect("Index.aspx");
    }
}