using System;
using SmartWash.DAL;
using SmartWash.Models;

namespace SmartWash.BLL
{
    public class AdminBLL
    {
        private AdminDAL adminDAL = new AdminDAL();

        public Admin LoginAdmin(string username, string password)
        {
            return adminDAL.LoginAdmin(username, password);
        }
    }
}
