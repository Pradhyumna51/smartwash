<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="CustomerDashboard.aspx.cs" Inherits="Pages_CustomerDashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" Runat="Server">Customer Dashboard</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <div class="row mt-4">
        <div class="col-12 mb-4">
            <h2 style="color: var(--primary-blue);">Welcome back, <asp:Label ID="lblName" runat="server"></asp:Label>!</h2>
            <p class="text-muted">Manage your car wash bookings easily from your dashboard.</p>
        </div>

        <div class="col-md-6 mb-4">
            <div class="card card-custom h-100">
                <div class="card-body text-center py-5">
                    <i class="bi bi-calendar-plus" style="font-size: 3rem; color: var(--accent-cyan);"></i>
                    <h4 class="mt-3">Book a Wash</h4>
                    <p class="text-muted">Schedule your next car wash appointment.</p>
                    <a href="BookWash.aspx" class="btn btn-cyan mt-2">Book Now</a>
                </div>
            </div>
        </div>

        <div class="col-md-6 mb-4">
            <div class="card card-custom h-100">
                <div class="card-body text-center py-5">
                    <i class="bi bi-clock-history" style="font-size: 3rem; color: var(--accent-cyan);"></i>
                    <h4 class="mt-3">Booking History</h4>
                    <p class="text-muted">View your previous and upcoming appointments.</p>
                    <a href="BookingHistory.aspx" class="btn btn-outline-cyan mt-2">View History</a>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
