using System;
using System.Data;
using MySql.Data.MySqlClient;
using SmartWash.Models;

namespace SmartWash.DAL
{
    public class ServiceDAL
    {
        public DataTable GetAllServices()
        {
            string query = "SELECT * FROM Services ORDER BY ServiceName";
            return DBHelper.ExecuteQuery(query);
        }

        public Service GetServiceById(int serviceId)
        {
            string query = "SELECT * FROM Services WHERE ServiceID = @ServiceID";
            MySqlParameter[] parameters = new MySqlParameter[] { new MySqlParameter("@ServiceID", serviceId) };
            DataTable dt = DBHelper.ExecuteQuery(query, parameters);
            if (dt.Rows.Count > 0)
            {
                return new Service
                {
                    ServiceID = Convert.ToInt32(dt.Rows[0]["ServiceID"]),
                    ServiceName = dt.Rows[0]["ServiceName"].ToString(),
                    Price = Convert.ToDecimal(dt.Rows[0]["Price"]),
                    Duration = Convert.ToInt32(dt.Rows[0]["Duration"]),
                    Description = dt.Rows[0]["Description"].ToString()
                };
            }
            return null;
        }

        public bool AddService(Service service)
        {
            string query = "INSERT INTO Services (ServiceName, Price, Duration, Description) VALUES (@ServiceName, @Price, @Duration, @Description)";
            MySqlParameter[] parameters = new MySqlParameter[]
            {
                new MySqlParameter("@ServiceName", service.ServiceName),
                new MySqlParameter("@Price", service.Price),
                new MySqlParameter("@Duration", service.Duration),
                new MySqlParameter("@Description", service.Description)
            };
            return DBHelper.ExecuteNonQuery(query, parameters) > 0;
        }

        public bool UpdateService(Service service)
        {
            string query = "UPDATE Services SET ServiceName = @ServiceName, Price = @Price, Duration = @Duration, Description = @Description WHERE ServiceID = @ServiceID";
            MySqlParameter[] parameters = new MySqlParameter[]
            {
                new MySqlParameter("@ServiceID", service.ServiceID),
                new MySqlParameter("@ServiceName", service.ServiceName),
                new MySqlParameter("@Price", service.Price),
                new MySqlParameter("@Duration", service.Duration),
                new MySqlParameter("@Description", service.Description)
            };
            return DBHelper.ExecuteNonQuery(query, parameters) > 0;
        }

        public bool DeleteService(int serviceId)
        {
            string query = "DELETE FROM Services WHERE ServiceID = @ServiceID";
            MySqlParameter[] parameters = new MySqlParameter[] { new MySqlParameter("@ServiceID", serviceId) };
            try
            {
                return DBHelper.ExecuteNonQuery(query, parameters) > 0;
            }
            catch (MySqlException)
            {
                return false; 
            }
        }
        
        public int GetTotalServicesCount()
        {
            string query = "SELECT COUNT(*) FROM Services";
            return Convert.ToInt32(DBHelper.ExecuteScalar(query));
        }
    }
}
