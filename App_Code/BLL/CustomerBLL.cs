using System;
using System.Data;
using SmartWash.DAL;
using SmartWash.Models;

namespace SmartWash.BLL
{
    public class CustomerBLL
    {
        private CustomerDAL customerDAL = new CustomerDAL();

        public bool RegisterCustomer(Customer customer)
        {
            if (customerDAL.CheckEmailExists(customer.Email))
            {
                throw new Exception("Email already exists.");
            }
            return customerDAL.RegisterCustomer(customer);
        }

        public Customer LoginCustomer(string email, string password)
        {
            return customerDAL.LoginCustomer(email, password);
        }

        public DataTable GetAllCustomers()
        {
            return customerDAL.GetAllCustomers();
        }

        public int GetTotalCustomersCount()
        {
            return customerDAL.GetTotalCustomersCount();
        }
    }
}
