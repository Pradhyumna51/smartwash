<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" CodeFile="AdminDashboard.aspx.cs" Inherits="Pages_AdminDashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" Runat="Server">Dashboard</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="HeaderContent" Runat="Server">Dashboard</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" Runat="Server">
    <div class="row">
        <div class="col-md-3 mb-4">
            <div class="card card-custom text-center py-4">
                <i class="bi bi-people-fill text-primary" style="font-size: 2.5rem;"></i>
                <h2 class="mt-2"><asp:Label ID="lblTotalCustomers" runat="server" Text="0"></asp:Label></h2>
                <p class="text-muted mb-0">Total Customers</p>
            </div>
        </div>
        
        <div class="col-md-3 mb-4">
            <div class="card card-custom text-center py-4 border-info">
                <i class="bi bi-calendar-check text-info" style="font-size: 2.5rem;"></i>
                <h2 class="mt-2"><asp:Label ID="lblTotalBookings" runat="server" Text="0"></asp:Label></h2>
                <p class="text-muted mb-0">Total Bookings</p>
            </div>
        </div>

        <div class="col-md-3 mb-4">
            <div class="card card-custom text-center py-4 border-warning">
                <i class="bi bi-hourglass-split text-warning" style="font-size: 2.5rem;"></i>
                <h2 class="mt-2"><asp:Label ID="lblPendingBookings" runat="server" Text="0"></asp:Label></h2>
                <p class="text-muted mb-0">Pending Bookings</p>
            </div>
        </div>

        <div class="col-md-3 mb-4">
            <div class="card card-custom text-center py-4 border-success">
                <i class="bi bi-tools text-success" style="font-size: 2.5rem;"></i>
                <h2 class="mt-2"><asp:Label ID="lblTotalServices" runat="server" Text="0"></asp:Label></h2>
                <p class="text-muted mb-0">Total Services</p>
            </div>
        </div>
    </div>
</asp:Content>
