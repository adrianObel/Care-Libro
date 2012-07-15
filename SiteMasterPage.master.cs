using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class SiteMasterPage : System.Web.UI.MasterPage
{
    private DataTable userData;
    private DBConnect db = new DBConnect();

    protected void Page_Load(object sender, EventArgs e)
    {
        initSes();
        initStruct();
    }
    protected void initSes()
    {
        if (Session["UserEmail"] != null)
        {
            userData = db.query("SELECT * FROM user LEFT JOIN profile ON user.user_id = "+
                "profile.user_id AND user.email = '" + Session["UserEmail"].ToString() + "'");
        }
        else
            Response.Redirect("Index.aspx");
    }
    protected void initStruct()
    {
        dropdown_menu_button.Text = userData.Rows[0]["name"].ToString() + " " 
                      + userData.Rows[0]["created_at"].ToString();

        profile.NavigateUrl = "profile.aspx?user=0";
    }
  
    protected void logout_Click(object sender,EventArgs e)
    {
        Session.Abandon();
        Response.Redirect("Index.aspx");
    }
}
