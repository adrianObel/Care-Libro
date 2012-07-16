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
    private DataTable dt;

    /// <summary>
    /// Initialize Connection with Care-Libro Database
    /// </summary>
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
    /// <summary>
    /// Method in charge of all queries to database
    /// </summary>
    /// <param name="sql"></param>
    /// <returns>DataTable</returns>
    public DataTable query(string sql)
    {
        da = new MySqlDataAdapter(sql, cn);
        dt = new DataTable();
        da.Fill(dt);
        return dt;
    }
    /// <summary>
    /// method in charge of all insertion to database
    /// </summary>
    /// <param name="sql"></param>
    public void insert(string sql)
    {
        cmd = new MySqlCommand(sql, cn);
        if (openConnection())
        {
            cmd.ExecuteNonQuery();
            cn.Close();
        }
    }

    /// <summary>
    /// Method to retrieve user details and validate to see if exist
    /// </summary>
    /// <param name="id"></param>
    /// <param name="pass"></param>
    /// <returns>boolean</returns>
    public bool getUser(string id,string pass)
    {
            dt = query("SELECT * FROM user WHERE email ='" + id + "' AND password = '" + pass + "' ");
            if (dt.Rows.Count != 0)
                return true;
            else 
            return false;
        
    }
}