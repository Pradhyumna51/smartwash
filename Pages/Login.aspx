<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Pages_Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" Runat="Server">Login</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <div class="row justify-content-center mt-5">
        <div class="col-md-5 card-custom bg-white p-4 rounded">
            <h3 class="text-center mb-4" style="color: var(--primary-blue);">Login</h3>
            
            <asp:Panel ID="pnlSuccess" runat="server" Visible="false" CssClass="alert alert-success">
                Registration successful! Please login.
            </asp:Panel>

            <asp:Panel ID="pnlAlert" runat="server" Visible="false" CssClass="alert alert-danger">
                <asp:Label ID="lblError" runat="server"></asp:Label>
            </asp:Panel>

            <div class="mb-3">
                <label>Email / Username (Admin)</label>
                <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="txtEmail" ErrorMessage="Email/Username is required" CssClass="error-msg" Display="Dynamic"></asp:RequiredFieldValidator>
            </div>

            <div class="mb-3">
                <label>Password</label>
                <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ControlToValidate="txtPassword" ErrorMessage="Password is required" CssClass="error-msg" Display="Dynamic"></asp:RequiredFieldValidator>
            </div>

            <div class="mb-3 form-check">
                <asp:CheckBox ID="chkIsAdmin" runat="server" CssClass="form-check-input" />
                <label class="form-check-label" for="chkIsAdmin">Login as Admin</label>
            </div>

            <asp:Button ID="btnLogin" runat="server" Text="Login" CssClass="btn btn-cyan w-100 mt-2" OnClick="btnLogin_Click" />
            
            <div class="text-center mt-3">
                Don't have an account? <a href="Register.aspx">Register here</a>
            </div>
        </div>
    </div>
</asp:Content>
