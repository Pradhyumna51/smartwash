using System;
using System.Data;
using System.Web.UI.WebControls;
using SmartWash.BLL;
using SmartWash.Models;

public partial class Pages_BookingHistory : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["CustomerUser"] == null)
        {
            Response.Redirect("Login.aspx");
        }

        if (!IsPostBack)
        {
            BindGrid();
        }
    }

    private void BindGrid()
    {
        Customer customer = (Customer)Session["CustomerUser"];
        BookingBLL bookingBLL = new BookingBLL();
        DataTable dt = bookingBLL.GetCustomerBookings(customer.CustomerID);
        
        gvBookings.DataSource = dt;
        gvBookings.DataBind();
    }

    protected string GetStatusBadgeClass(string status)
    {
        switch (status.ToLower())
        {
            case "pending": return "badge bg-warning text-dark";
            case "approved": return "badge bg-info text-dark";
            case "completed": return "badge bg-success";
            case "rejected": return "badge bg-danger";
            default: return "badge bg-secondary";
        }
    }
}
