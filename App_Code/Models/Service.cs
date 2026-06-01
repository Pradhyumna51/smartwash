using System;

namespace SmartWash.Models
{
    public class Service
    {
        public int ServiceID { get; set; }
        public string ServiceName { get; set; }
        public decimal Price { get; set; }
        public int Duration { get; set; } // Duration in minutes
        public string Description { get; set; }
    }
}
