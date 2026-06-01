using System;
using System.Data;
using SmartWash.DAL;
using SmartWash.Models;

namespace SmartWash.BLL
{
    public class BookingBLL
    {
        private BookingDAL bookingDAL = new BookingDAL();

        public bool CreateBooking(Booking booking)
        {
            if (booking.BookingDate < DateTime.Today)
            {
                throw new Exception("Cannot book a wash in the past.");
            }
            return bookingDAL.CreateBooking(booking);
        }

        public DataTable GetCustomerBookings(int customerId)
        {
            return bookingDAL.GetCustomerBookings(customerId);
        }

        public DataTable GetAllBookings()
        {
            return bookingDAL.GetAllBookings();
        }

        public bool UpdateBookingStatus(int bookingId, string status)
        {
            return bookingDAL.UpdateBookingStatus(bookingId, status);
        }

        public int GetTotalBookingsCount()
        {
            return bookingDAL.GetTotalBookingsCount();
        }

        public int GetPendingBookingsCount()
        {
            return bookingDAL.GetPendingBookingsCount();
        }
    }
}
