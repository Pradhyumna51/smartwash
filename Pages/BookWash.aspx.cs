using System;
using System.Data;
using System.Web.UI.WebControls;
using SmartWash.BLL;
using SmartWash.Models;

public partial class Pages_BookWash : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["CustomerUser"] == null)
        {
            Response.Redirect("Login.aspx");
        }

        if (!IsPostBack)
        {
            LoadServices();
            // Restrict past dates
            // Handled in BLL, but visually we just don't select anything
        }
    }

    private void LoadServices()
    {
        ServiceBLL serviceBLL = new ServiceBLL();
        DataTable dt = serviceBLL.GetAllServices();
        
        ddlServices.DataSource = dt;
        ddlServices.DataTextField = "ServiceName";
        ddlServices.DataValueField = "ServiceID";
        ddlServices.DataBind();
        
        ddlServices.Items.Insert(0, new ListItem("-- Select a Service --", "0"));
    }

    protected void calBookingDate_SelectionChanged(object sender, EventArgs e)
    {
        lblSelectedDate.Text = "Selected Date: " + calBookingDate.SelectedDate.ToShortDateString();
    }

    protected void btnBook_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            if (calBookingDate.SelectedDate.Date == DateTime.MinValue.Date)
            {
                pnlAlert.Visible = true;
                lblError.Text = "Please select a date from the calendar.";
                return;
            }

            try
            {
                Customer customer = (Customer)Session["CustomerUser"];
                BookingBLL bookingBLL = new BookingBLL();

                Booking newBooking = new Booking
                {
                    CustomerID = customer.CustomerID,
                    ServiceID = Convert.ToInt32(ddlServices.SelectedValue),
                    BookingDate = calBookingDate.SelectedDate,
                    BookingTime = ddlTime.SelectedValue,
                    VehicleType = rblVehicleType.SelectedValue,
                    Status = "Pending"
                };

                bool success = bookingBLL.CreateBooking(newBooking);

                if (success)
                {
                    pnlSuccess.Visible = true;
                    pnlAlert.Visible = false;
                    // Reset form
                    ddlServices.SelectedIndex = 0;
                    ddlTime.SelectedIndex = 0;
                    rblVehicleType.SelectedIndex = 0;
                    lblSelectedDate.Text = "";
                    calBookingDate.SelectedDates.Clear();
                }
            }
            catch (Exception ex)
            {
                pnlAlert.Visible = true;
                lblError.Text = ex.Message;
                pnlSuccess.Visible = false;
            }
        }
    }
}
