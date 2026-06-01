using System;
using System.Data;
using SmartWash.DAL;
using SmartWash.Models;

namespace SmartWash.BLL
{
    public class ServiceBLL
    {
        private ServiceDAL serviceDAL = new ServiceDAL();

        public DataTable GetAllServices()
        {
            return serviceDAL.GetAllServices();
        }

        public Service GetServiceById(int serviceId)
        {
            return serviceDAL.GetServiceById(serviceId);
        }

        public bool AddService(Service service)
        {
            if (service.Price < 0)
                throw new Exception("Price cannot be negative.");
            
            return serviceDAL.AddService(service);
        }

        public bool UpdateService(Service service)
        {
            if (service.Price < 0)
                throw new Exception("Price cannot be negative.");

            return serviceDAL.UpdateService(service);
        }

        public bool DeleteService(int serviceId)
        {
            return serviceDAL.DeleteService(serviceId);
        }

        public int GetTotalServicesCount()
        {
            return serviceDAL.GetTotalServicesCount();
        }
    }
}
