using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

namespace wx
{
    public class db
    {
        public static SqlConnection conn()
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.AppSettings["conn"]);
            return conn;
        }
        public static bool insert(string que)
        {
            SqlConnection conn = db.conn();

            conn.Open();
            SqlCommand cmd = new SqlCommand(que, conn);
            try
            {
                int count = Convert.ToInt32(cmd.ExecuteNonQuery());
                if (count > 0)
                { return true; }
                else
                { return false; }
            }
            catch (SqlException )
            { return false; }
            finally
            {
                conn.Close();
            }
        }
        public static DataTable ds(string que)
        {
            SqlConnection conn = db.conn();
            conn.Open();
            SqlDataAdapter sda = new SqlDataAdapter(que, conn);
            DataSet ds = new DataSet();
            sda.Fill(ds, "product");
            conn.Close();
            return ds.Tables["product"];

        }
    }
}