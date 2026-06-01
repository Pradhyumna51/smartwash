using System;
using System.Web.UI;
using SmartWash.Models;

public partial class Admin : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            CheckAdminLogin();
        }
    }

    private void CheckAdminLogin()
    {
        if (Session["AdminUser"] != null)
        {
            SmartWash.Models.Admin admin = (SmartWash.Models.Admin)Session["AdminUser"];
            lblAdminName.Text = admin.Username;
        }
        else
        {
            Response.Redirect("~/Pages/Login.aspx");
        }
    }

    protected void btnLogoutAdmin_Click(object sender, EventArgs e)
    {
        Session.Clear();
        Session.Abandon();
        Response.Redirect("~/Pages/Login.aspx");
    }
}
