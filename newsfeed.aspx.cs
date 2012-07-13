using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class _Default : System.Web.UI.Page
{
    private DataSet userData;
    private DBConnect db = new DBConnect();

    protected void Page_Load(object sender, EventArgs e)
    {
        initSes();
    }
    protected void initSes()
    {
        
    }
}