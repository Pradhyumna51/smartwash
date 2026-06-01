using System;
using System.Data;
using SmartWash.BLL;

public partial class Pages_ManageCustomers : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["AdminUser"] == null)
        {
            Response.Redirect("Login.aspx");
        }

        if (!IsPostBack)
        {
            BindCustomers();
        }
    }

    private void BindCustomers()
    {
        CustomerBLL customerBLL = new CustomerBLL();
        DataTable dt = customerBLL.GetAllCustomers();
        gvCustomers.DataSource = dt;
        gvCustomers.DataBind();
    }
}
