using System;
using System.Data;
using MySql.Data.MySqlClient;
using SmartWash.Models;

namespace SmartWash.DAL
{
    public class BookingDAL
    {
        public bool CreateBooking(Booking booking)
        {
            string query = "INSERT INTO Bookings (CustomerID, ServiceID, BookingDate, BookingTime, VehicleType, Status) VALUES (@CustomerID, @ServiceID, @BookingDate, @BookingTime, @VehicleType, @Status)";
            MySqlParameter[] parameters = new MySqlParameter[]
            {
                new MySqlParameter("@CustomerID", booking.CustomerID),
                new MySqlParameter("@ServiceID", booking.ServiceID),
                new MySqlParameter("@BookingDate", booking.BookingDate),
                new MySqlParameter("@BookingTime", booking.BookingTime),
                new MySqlParameter("@VehicleType", booking.VehicleType),
                new MySqlParameter("@Status", booking.Status)
            };
            return DBHelper.ExecuteNonQuery(query, parameters) > 0;
        }

        public DataTable GetCustomerBookings(int customerId)
        {
            string query = @"SELECT b.BookingID, s.ServiceName, b.BookingDate, b.BookingTime, b.VehicleType, b.Status, b.CreatedAt 
                             FROM Bookings b 
                             INNER JOIN Services s ON b.ServiceID = s.ServiceID 
                             WHERE b.CustomerID = @CustomerID 
                             ORDER BY b.BookingDate DESC, b.BookingTime DESC";
            MySqlParameter[] parameters = new MySqlParameter[] { new MySqlParameter("@CustomerID", customerId) };
            return DBHelper.ExecuteQuery(query, parameters);
        }

        public DataTable GetAllBookings()
        {
            string query = @"SELECT b.BookingID, c.FullName as CustomerName, c.VehicleNumber, s.ServiceName, b.BookingDate, b.BookingTime, b.VehicleType, b.Status, b.CreatedAt 
                             FROM Bookings b 
                             INNER JOIN Customers c ON b.CustomerID = c.CustomerID
                             INNER JOIN Services s ON b.ServiceID = s.ServiceID 
                             ORDER BY b.BookingDate DESC, b.BookingTime DESC";
            return DBHelper.ExecuteQuery(query);
        }

        public bool UpdateBookingStatus(int bookingId, string status)
        {
            string query = "UPDATE Bookings SET Status = @Status WHERE BookingID = @BookingID";
            MySqlParameter[] parameters = new MySqlParameter[]
            {
                new MySqlParameter("@BookingID", bookingId),
                new MySqlParameter("@Status", status)
            };
            return DBHelper.ExecuteNonQuery(query, parameters) > 0;
        }
        
        public int GetTotalBookingsCount()
        {
            string query = "SELECT COUNT(*) FROM Bookings";
            return Convert.ToInt32(DBHelper.ExecuteScalar(query));
        }

        public int GetPendingBookingsCount()
        {
            string query = "SELECT COUNT(*) FROM Bookings WHERE Status = 'Pending'";
            return Convert.ToInt32(DBHelper.ExecuteScalar(query));
        }
    }
}
