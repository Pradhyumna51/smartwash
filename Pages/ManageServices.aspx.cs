using System;
using System.Data;
using System.Web.UI.WebControls;
using SmartWash.BLL;
using SmartWash.Models;

public partial class Pages_ManageServices : System.Web.UI.Page
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
        ServiceBLL bll = new ServiceBLL();
        gvServices.DataSource = bll.GetAllServices();
        gvServices.DataBind();
    }

    protected void gvServices_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        int serviceId = Convert.ToInt32(e.CommandArgument);
        ServiceBLL bll = new ServiceBLL();

        if (e.CommandName == "EditService")
        {
            Service service = bll.GetServiceById(serviceId);
            if (service != null)
            {
                hfServiceID.Value = service.ServiceID.ToString();
                txtServiceName.Text = service.ServiceName;
                txtPrice.Text = service.Price.ToString();
                txtDuration.Text = service.Duration.ToString();
                txtDescription.Text = service.Description;

                lblFormTitle.Text = "Edit Service";
                btnSave.Text = "Update Service";
                btnCancel.Visible = true;
                pnlMsg.Visible = false;
            }
        }
        else if (e.CommandName == "DeleteService")
        {
            bool result = bll.DeleteService(serviceId);
            if (result)
            {
                ShowMessage("Service deleted successfully.");
                BindGrid();
            }
            else
            {
                ShowMessage("Cannot delete service. It might be used in bookings.");
            }
        }
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            ServiceBLL bll = new ServiceBLL();
            Service service = new Service
            {
                ServiceName = txtServiceName.Text.Trim(),
                Price = Convert.ToDecimal(txtPrice.Text),
                Duration = Convert.ToInt32(txtDuration.Text),
                Description = txtDescription.Text.Trim()
            };

            if (string.IsNullOrEmpty(hfServiceID.Value))
            {
                // Add
                bll.AddService(service);
                ShowMessage("Service added successfully.");
            }
            else
            {
                // Update
                service.ServiceID = Convert.ToInt32(hfServiceID.Value);
                bll.UpdateService(service);
                ShowMessage("Service updated successfully.");
                ResetForm();
            }

            BindGrid();
        }
    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        ResetForm();
    }

    private void ResetForm()
    {
        hfServiceID.Value = "";
        txtServiceName.Text = "";
        txtPrice.Text = "";
        txtDuration.Text = "";
        txtDescription.Text = "";
        
        lblFormTitle.Text = "Add New Service";
        btnSave.Text = "Save Service";
        btnCancel.Visible = false;
    }

    private void ShowMessage(string msg)
    {
        pnlMsg.Visible = true;
        lblMsg.Text = msg;
    }
}
