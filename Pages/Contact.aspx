<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Contact.aspx.cs" Inherits="Pages_Contact" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" Runat="Server">Contact</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <div class="row">
        <div class="col-md-6 mx-auto mt-5 card-custom p-4 bg-white">
            <h2 class="mb-4 text-center">Contact Us</h2>
            <div class="mb-3">
                <label>Name</label>
                <asp:TextBox ID="txtName" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="mb-3">
                <label>Email</label>
                <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="mb-3">
                <label>Message</label>
                <asp:TextBox ID="txtMessage" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="4"></asp:TextBox>
            </div>
            <asp:Button ID="btnSend" runat="server" Text="Send Message" CssClass="btn btn-cyan w-100" OnClick="btnSend_Click" />
            <br /><br />
            <asp:Label ID="lblStatus" runat="server" ForeColor="Green"></asp:Label>
        </div>
    </div>
</asp:Content>
