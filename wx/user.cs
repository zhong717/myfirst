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
    public class user
    {
        public user()
        {
        }
        private string m_LoginName; //用户名
        private string m_BuMen;//部门
        private string m_QuanXian;//权限

        public string LoginName
        {
            get { return m_LoginName; }
        }
        public string BuMen
        {
            get { return m_BuMen; }
        }
        public string QuanXian
        {
            get { return m_QuanXian; }
        }
        public user(string LoginName, string BuMen, string QuanXian)
        {
            this.m_LoginName = LoginName;
            this.m_BuMen = BuMen;
            this.m_QuanXian = QuanXian;
        }
        public SqlDataReader GetUserLogin(string sUserName, string sPassword)
        {
            SqlConnection con = db.conn();
            con.Open();
            SqlCommand comm = new SqlCommand("liul_shenpi_admin", con);
            comm.CommandType = CommandType.StoredProcedure;
            comm.Parameters.Add("@LoginName", SqlDbType.NChar, 20);
            comm.Parameters["@LoginName"].Value = sUserName;
            comm.Parameters["@LoginName"].Direction = ParameterDirection.Input;
            comm.Parameters.Add("@Password", SqlDbType.VarChar, 21);
            comm.Parameters["@Password"].Value = sPassword;
            comm.Parameters["@Password"].Direction = ParameterDirection.Input;
            SqlDataReader sdr = comm.ExecuteReader();
            return (sdr);
        }
        public bool RegUser(string loginName, string password, string bumen, string quanxian)
        {
            string strsql = "insert into liul_admin" +
                "VALUES (" + "'" + loginName + "'," + "'" + bumen + "'," + "'" + quanxian + "'," + "'" + password + "')";
            return db.insert(strsql);
        }
    }
}