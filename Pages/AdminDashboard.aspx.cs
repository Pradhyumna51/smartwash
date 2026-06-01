using System;
using SmartWash.BLL;

public partial class Pages_AdminDashboard : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["AdminUser"] == null)
        {
            Response.Redirect("Login.aspx");
        }

        if (!IsPostBack)
        {
            LoadDashboardStats();
        }
    }

    private void LoadDashboardStats()
    {
        CustomerBLL customerBLL = new CustomerBLL();
        BookingBLL bookingBLL = new BookingBLL();
        ServiceBLL serviceBLL = new ServiceBLL();

        lblTotalCustomers.Text = customerBLL.GetTotalCustomersCount().ToString();
        lblTotalBookings.Text = bookingBLL.GetTotalBookingsCount().ToString();
        lblPendingBookings.Text = bookingBLL.GetPendingBookingsCount().ToString();
        lblTotalServices.Text = serviceBLL.GetTotalServicesCount().ToString();
    }
}
