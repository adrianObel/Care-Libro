using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class search : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        person1.ToolTip = "@nombre de la persona";
        person2.ToolTip = "@nombre de la persona";
        person3.ToolTip = "@nombre de la persona";
        person4.ToolTip = "@nombre de la persona";
        person5.ToolTip = "@nombre de la persona";
        person6.ToolTip = "@nombre de la persona";
        person7.ToolTip = "@nombre de la persona";
        person8.ToolTip = "@nombre de la persona";
        person9.ToolTip = "@nombre de la persona";
        person10.ToolTip = "@nombre de la persona";
        person11.ToolTip = "@nombre de la persona";
        person12.ToolTip = "@nombre de la persona";
        person13.ToolTip = "@nombre de la persona";
        person14.ToolTip = "@nombre de la persona";
        person15.ToolTip = "@nombre de la persona";
        person16.ToolTip = "@nombre de la persona";
        person17.ToolTip = "@nombre de la persona";
        person18.ToolTip = "@nombre de la persona";
        person19.ToolTip = "@nombre de la persona";
        person20.ToolTip = "@nombre de la persona";
        person21.ToolTip = "@nombre de la persona";
        person22.ToolTip = "@nombre de la persona";
        person23.ToolTip = "@nombre de la persona";
        person24.ToolTip = "@nombre de la persona";
        person25.ToolTip = "@nombre de la persona";
        person26.ToolTip = "@nombre de la persona";
        person27.ToolTip = "@nombre de la persona";
        person28.ToolTip = "@nombre de la persona";
        person29.ToolTip = "@nombre de la persona";
        person30.ToolTip = "@nombre de la persona";
        person31.ToolTip = "@nombre de la persona";
        person32.ToolTip = "@nombre de la persona";
        person33.ToolTip = "@nombre de la persona";

    }
    protected void logout_Click(object sender, EventArgs e)
    {
        Session.Abandon();
        Response.Redirect("Index.aspx");
    }
}