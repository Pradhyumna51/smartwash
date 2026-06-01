using System;
using System.Data;
using MySql.Data.MySqlClient;
using SmartWash.Models;

namespace SmartWash.DAL
{
    public class AdminDAL
    {
        public Admin LoginAdmin(string username, string password)
        {
            string query = "SELECT * FROM Admins WHERE Username = @Username AND Password = @Password";
            MySqlParameter[] parameters = new MySqlParameter[]
            {
                new MySqlParameter("@Username", username),
                new MySqlParameter("@Password", password)
            };

            DataTable dt = DBHelper.ExecuteQuery(query, parameters);
            if (dt.Rows.Count > 0)
            {
                return new Admin
                {
                    AdminID = Convert.ToInt32(dt.Rows[0]["AdminID"]),
                    Username = dt.Rows[0]["Username"].ToString()
                };
            }
            return null;
        }
    }
}
