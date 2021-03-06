﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Security.Cryptography;
using System.Text;

public partial class Index : System.Web.UI.Page
{
    private DBConnect db;
    private string pass;
    protected void Page_Load(object sender, EventArgs e)
    {
        initMain();
        if (Session["UserEmail"] != null)
        {
            Response.Redirect("newsfeed.aspx");
        }
    }


    protected void initMain()
    {
        db = new DBConnect();
        fillDate();

    }
    protected void fillDate()
    {
        for (int i = (DateTime.Now.Year); i > 1950; i--)
            year.Items.Add(Convert.ToString(i));
        for (int i = 1; i < 31; i++)
            day.Items.Add(Convert.ToString(i));
        for (int i = 1; i < 13; i++)
            month.Items.Add(Convert.ToString(i));
    }
    public string encrypt(string strChange)
    {
        byte[] pass = Encoding.UTF8.GetBytes(strChange);
        MD5 md5 = new MD5CryptoServiceProvider();
        string strPassword = Encoding.UTF8.GetString(md5.ComputeHash(pass));
        return strPassword;
    }
    #region Event Handlers
    protected void login_Click(object sender, EventArgs e)
    {
        pass = encrypt(password.Text);
        if (db.getUser(email.Text, pass))
        {
            Session["UserEmail"] = email.Text.ToLowerInvariant();
            Session.Timeout = 40;
            Response.Redirect("newsfeed.aspx");

        }
        else
        {
            exists_label.Visible = false;
            registration_succes_label.Visible = false;
            no_login.Visible = true; 
        }
    }
    protected void register_Click(object sender, EventArgs e)
    {
        no_login.Visible=false;
        exists_label.Visible = false;
        registration_succes_label.Visible = true;

        this.pass = encrypt(password_field.Text);
        string gender = sex.SelectedItem.Text;
        string bdate = day.SelectedItem + "/" + month.SelectedItem + "/" + year.SelectedItem;
        string crated = DateTime.Now.ToString();
        string sql = "'" + name.Text + "','" + lstname.Text +
         "','" + mail.Text + "','" + pass +
         "','" + gender + "','" + bdate +
         "', 'false','" + crated + "'";
        if (db.getUser(mail.Text, pass))
        {
            registration_succes_label.Visible = false;
            no_login.Visible = false;
            exists_label.Visible=true;
        }
        else
        {
            db.insert("INSERT INTO user (name,lastname,email,password,gender,dob,online,created_at)  VALUES(" + sql + ")");
        }
    }
    protected void remember_CheckedChanged(object sender, EventArgs e)
    {
        

    }
    #endregion
}