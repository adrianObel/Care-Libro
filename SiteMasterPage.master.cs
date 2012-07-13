using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class SiteMasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserEmail"] != null)
            Label1.Text = Session["UserEmail"].ToString();
        else
            Response.Redirect("Index.aspx");
    }
    protected void logout_Click(object sender,EventArgs e)
    {
        Session.Abandon();
        Response.Redirect("Index.aspx");
    }
    
}
