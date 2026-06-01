using System;
using SmartWash.BLL;
using SmartWash.Models;

public partial class Pages_Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Request.QueryString["registered"] == "true")
            {
                pnlSuccess.Visible = true;
            }
        }
    }

    protected void btnLogin_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            string usernameOrEmail = txtEmail.Text.Trim();
            string password = txtPassword.Text;

            if (chkIsAdmin.Checked)
            {
                AdminBLL adminBLL = new AdminBLL();
                SmartWash.Models.Admin admin = adminBLL.LoginAdmin(usernameOrEmail, password);

                if (admin != null)
                {
                    Session["AdminUser"] = admin;
                    Response.Redirect("AdminDashboard.aspx");
                }
                else
                {
                    pnlAlert.Visible = true;
                    lblError.Text = "Invalid Admin Credentials.";
                }
            }
            else
            {
                CustomerBLL customerBLL = new CustomerBLL();
                Customer customer = customerBLL.LoginCustomer(usernameOrEmail, password);

                if (customer != null)
                {
                    Session["CustomerUser"] = customer;
                    Response.Redirect("CustomerDashboard.aspx");
                }
                else
                {
                    pnlAlert.Visible = true;
                    lblError.Text = "Invalid Email or Password.";
                }
            }
        }
    }
}
