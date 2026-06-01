using System;
using SmartWash.Models;

public partial class Pages_CustomerDashboard : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["CustomerUser"] == null)
        {
            Response.Redirect("Login.aspx");
        }
        else if (!IsPostBack)
        {
            Customer customer = (Customer)Session["CustomerUser"];
            lblName.Text = customer.FullName;
        }
    }
}
