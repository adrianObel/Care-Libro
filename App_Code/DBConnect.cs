using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MySql.Data;
using MySql.Data.MySqlClient;
using System.Data;

public class DBConnect
{
    private MySqlConnection cn;
    private MySqlDataAdapter da;
    private MySqlCommand cmd;
    private DataSet ds;

	public DBConnect()
	{
        cn = new MySqlConnection("server=localhost; user id=root; password=; database=care-libro;");

	}
    private bool openConnection()
    {
        try
        {
            cn.Open();
            return true;
        }
        catch (MySqlException e)
        {
            return false;
        }
    }
    private bool closeConnection()
    {
        try
        {
            cn.Close();
            return true;
        }
        catch (MySqlException e)
        {
            return false;
        }
    }
    public DataSet query(string sql,string table)
    {
        da = new MySqlDataAdapter(sql, cn);
        ds = new DataSet();
        da.Fill(ds,table);
        return ds;
    }
    public void insert(string sql)
    {
        cmd = new MySqlCommand(sql, cn);
        if (openConnection())
        {
            cmd.ExecuteNonQuery();
            cn.Close();
        }
    }

    //Method to retrieve user details and validate to see if exist
    public bool getUser(string id,string pass)
    {
            ds = query("SELECT * FROM user WHERE email ='" + id + "' AND password = '" + pass + "' ", "user");
            if (ds.Tables["user"].Rows.Count != 0)
                return true;
            else 
            return false;
        
    }
}