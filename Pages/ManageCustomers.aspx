<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" CodeFile="ManageCustomers.aspx.cs" Inherits="Pages_ManageCustomers" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" Runat="Server">Manage Customers</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="HeaderContent" Runat="Server">Customers List</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" Runat="Server">
    <div class="card-custom bg-white p-4 rounded">
        <asp:GridView ID="gvCustomers" runat="server" AutoGenerateColumns="False" CssClass="table table-custom table-hover" GridLines="None">
            <Columns>
                <asp:BoundField DataField="CustomerID" HeaderText="ID" />
                <asp:BoundField DataField="FullName" HeaderText="Name" />
                <asp:BoundField DataField="Email" HeaderText="Email" />
                <asp:BoundField DataField="Phone" HeaderText="Phone" />
                <asp:BoundField DataField="VehicleNumber" HeaderText="Vehicle Number" />
                <asp:BoundField DataField="CreatedAt" HeaderText="Registered On" DataFormatString="{0:d}" />
            </Columns>
            <HeaderStyle CssClass="bg-dark text-white" />
        </asp:GridView>
    </div>
</asp:Content>
