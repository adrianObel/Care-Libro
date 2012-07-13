using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Security.Cryptography;
using System.Text;

public partial class Index : System.Web.UI.Page
{
    
   private HttpCookie cookie;
   private DBConnect db;
   private string pass;
    protected void Page_Load(object sender, EventArgs e)
    {
        initMain();
    }


    private void initMain()
    {
        db = new DBConnect();/*
        cookie = Request.Cookies["user_details"];
        if (cookie != null)
        {
            email.Text = cookie["user_email"];
            password.Text = cookie["user_pass"];
        }*/
    }

    public string encrypt(string strChange)
    {
        byte[] pass = Encoding.UTF8.GetBytes(strChange);
        MD5 md5 = new MD5CryptoServiceProvider();
        string strPassword = Encoding.UTF8.GetString(md5.ComputeHash(pass));
        return strPassword;
    }
    #region Event Handlers
    /*protected void login_Click(object sender, EventArgs e)
    {
        pass = encrypt(password.Text);
        if (db.getUser(email.Text, pass))
        {
            email.Text = "yup";

        }
        else email.Text = "nope";
    }*/
    protected void register_Click(object sender, EventArgs e)
    {
        this.pass = encrypt(password_field.Text);
        string gender = sex.SelectedItem.Text;
        string bdate = day.SelectedItem + "/" + month.SelectedItem + "/" + year.SelectedItem;
        string crated = DateTime.Now.ToString();
        string sql = "'" + name.Text + "','" + lstname.Text +
         "','" + mail.Text + "','" + pass +
         "','" + gender + "','" + bdate +
         "', 'false','"+ crated + "'" ;
        if (db.getUser(mail.Text,pass))
        {
            Response.Write("<script type='text/javascript'>alert('already exists')</script>");
        }
        else
        {
            db.insert("INSERT INTO user (name,lastname,email,password,gender,dob,online,created_at)  VALUES(" + sql + ")");
        }
    }
    protected void remember_CheckedChanged(object sender, EventArgs e)
    {
        /*
        if (remember.Checked)
        {
            if (email.Text != null && password.Text != null)
            {
                cookie = Request.Cookies["user_details"];
                if (cookie == null)
                {
                    cookie = new HttpCookie("user_details");
                }
                cookie["user_email"] = email.Text;
                cookie["user_pass"] = password.Text;
                cookie.Expires = DateTime.Now.AddYears(1);
                Response.Cookies.Add(cookie);
            }
        }*/
    }
    #endregion
}