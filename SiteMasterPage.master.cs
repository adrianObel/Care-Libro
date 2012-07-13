﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class SiteMasterPage : System.Web.UI.MasterPage
{
    private DataSet userData;
    private DBConnect db = new DBConnect();

    protected void Page_Load(object sender, EventArgs e)
    {
        initSes();
    }
    protected void initSes()
    {
        if (Session["UserEmail"] != null)
        {
            userData = db.query("SELECT * FROM user WHERE email = '" + Session["UserEmail"].ToString() + "'", "user");
            initStruct();
        }
        else
            Response.Redirect("Index.aspx");
    }
    protected void initStruct()
    {
        
    }
    protected void logout_Click(object sender,EventArgs e)
    {
        Session.Abandon();
        Response.Redirect("Index.aspx");
    }
}
