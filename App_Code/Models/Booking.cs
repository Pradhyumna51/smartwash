using System;

namespace SmartWash.Models
{
    public class Booking
    {
        public int BookingID { get; set; }
        public int CustomerID { get; set; }
        public int ServiceID { get; set; }
        public DateTime BookingDate { get; set; }
        public string BookingTime { get; set; }
        public string VehicleType { get; set; }
        public string Status { get; set; }
        public DateTime CreatedAt { get; set; }

        // Additional fields for displaying details
        public string CustomerName { get; set; }
        public string ServiceName { get; set; }
        public string VehicleNumber { get; set; }
    }
}
