using System;
using System.Data;
using MySql.Data.MySqlClient;
using SmartWash.Models;

namespace SmartWash.DAL
{
    public class CustomerDAL
    {
        public bool RegisterCustomer(Customer customer)
        {
            string query = "INSERT INTO Customers (FullName, Email, Phone, VehicleNumber, Password) VALUES (@FullName, @Email, @Phone, @VehicleNumber, @Password)";
            MySqlParameter[] parameters = new MySqlParameter[]
            {
                new MySqlParameter("@FullName", customer.FullName),
                new MySqlParameter("@Email", customer.Email),
                new MySqlParameter("@Phone", customer.Phone),
                new MySqlParameter("@VehicleNumber", customer.VehicleNumber),
                new MySqlParameter("@Password", customer.Password)
            };

            int rowsAffected = DBHelper.ExecuteNonQuery(query, parameters);
            return rowsAffected > 0;
        }

        public Customer LoginCustomer(string email, string password)
        {
            string query = "SELECT * FROM Customers WHERE Email = @Email AND Password = @Password";
            MySqlParameter[] parameters = new MySqlParameter[]
            {
                new MySqlParameter("@Email", email),
                new MySqlParameter("@Password", password)
            };

            DataTable dt = DBHelper.ExecuteQuery(query, parameters);
            if (dt.Rows.Count > 0)
            {
                return new Customer
                {
                    CustomerID = Convert.ToInt32(dt.Rows[0]["CustomerID"]),
                    FullName = dt.Rows[0]["FullName"].ToString(),
                    Email = dt.Rows[0]["Email"].ToString(),
                    Phone = dt.Rows[0]["Phone"].ToString(),
                    VehicleNumber = dt.Rows[0]["VehicleNumber"].ToString()
                };
            }
            return null;
        }

        public bool CheckEmailExists(string email)
        {
            string query = "SELECT COUNT(*) FROM Customers WHERE Email = @Email";
            MySqlParameter[] parameters = new MySqlParameter[] { new MySqlParameter("@Email", email) };
            int count = Convert.ToInt32(DBHelper.ExecuteScalar(query, parameters));
            return count > 0;
        }

        public DataTable GetAllCustomers()
        {
            string query = "SELECT * FROM Customers ORDER BY CreatedAt DESC";
            return DBHelper.ExecuteQuery(query);
        }

        public int GetTotalCustomersCount()
        {
            string query = "SELECT COUNT(*) FROM Customers";
            return Convert.ToInt32(DBHelper.ExecuteScalar(query));
        }
    }
}
