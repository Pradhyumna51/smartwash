using System;
using SmartWash.BLL;
using SmartWash.Models;

public partial class Pages_Register : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["CustomerUser"] != null)
        {
            Response.Redirect("CustomerDashboard.aspx");
        }
    }

    protected void btnRegister_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            try
            {
                CustomerBLL customerBLL = new CustomerBLL();
                Customer customer = new Customer
                {
                    FullName = txtFullName.Text.Trim(),
                    Email = txtEmail.Text.Trim(),
                    Phone = txtPhone.Text.Trim(),
                    VehicleNumber = txtVehicle.Text.Trim(),
                    Password = txtPassword.Text // Ideally hashed
                };

                bool isRegistered = customerBLL.RegisterCustomer(customer);
                if (isRegistered)
                {
                    Response.Redirect("Login.aspx?registered=true");
                }
            }
            catch (Exception ex)
            {
                pnlAlert.Visible = true;
                lblError.Text = ex.Message;
            }
        }
    }
}
