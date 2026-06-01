using System;
using System.Web.UI;
using SmartWash.Models;

public partial class Site : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            CheckLoginStatus();
        }
    }

    private void CheckLoginStatus()
    {
        if (Session["CustomerUser"] != null)
        {
            Customer customer = (Customer)Session["CustomerUser"];
            pnlGuest.Visible = false;
            pnlCustomer.Visible = true;
            lblName.Text = customer.FullName;
        }
        else
        {
            pnlGuest.Visible = true;
            pnlCustomer.Visible = false;
        }
    }

    protected void btnLogout_Click(object sender, EventArgs e)
    {
        Session.Clear();
        Session.Abandon();
        Response.Redirect("~/Pages/Home.aspx");
    }
}
