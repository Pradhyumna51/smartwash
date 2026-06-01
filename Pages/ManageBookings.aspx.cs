using System;
using System.Web.UI.WebControls;
using SmartWash.BLL;

public partial class Pages_ManageBookings : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["AdminUser"] == null)
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
        BookingBLL bll = new BookingBLL();
        gvBookings.DataSource = bll.GetAllBookings();
        gvBookings.DataBind();
    }

    protected void gvBookings_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        int bookingId = Convert.ToInt32(e.CommandArgument);
        BookingBLL bll = new BookingBLL();

        if (e.CommandName == "ApproveBooking")
        {
            bll.UpdateBookingStatus(bookingId, "Approved");
            ShowMessage("Booking Approved.");
        }
        else if (e.CommandName == "CompleteBooking")
        {
            bll.UpdateBookingStatus(bookingId, "Completed");
            ShowMessage("Booking Marked as Completed.");
        }
        else if (e.CommandName == "RejectBooking")
        {
            bll.UpdateBookingStatus(bookingId, "Rejected");
            ShowMessage("Booking Rejected.");
        }

        BindGrid();
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

    private void ShowMessage(string msg)
    {
        pnlMsg.Visible = true;
        lblMsg.Text = msg;
    }
}
