using System;

public partial class Pages_Contact : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnSend_Click(object sender, EventArgs e)
    {
        lblStatus.Text = "Message sent successfully! We will get back to you soon.";
        txtName.Text = "";
        txtEmail.Text = "";
        txtMessage.Text = "";
    }
}
