<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="BookingHistory.aspx.cs" Inherits="Pages_BookingHistory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" Runat="Server">Booking History</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <div class="row mt-4">
        <div class="col-12">
            <h2 class="mb-4" style="color: var(--primary-blue);">Your Booking History</h2>
            
            <div class="card-custom bg-white p-4 rounded">
                <asp:GridView ID="gvBookings" runat="server" AutoGenerateColumns="False" CssClass="table table-custom table-hover" GridLines="None" EmptyDataText="You have no bookings yet.">
                    <Columns>
                        <asp:BoundField DataField="BookingID" HeaderText="Booking ID" />
                        <asp:BoundField DataField="ServiceName" HeaderText="Service" />
                        <asp:BoundField DataField="VehicleType" HeaderText="Vehicle Type" />
                        <asp:BoundField DataField="BookingDate" HeaderText="Date" DataFormatString="{0:d}" />
                        <asp:BoundField DataField="BookingTime" HeaderText="Time" />
                        <asp:TemplateField HeaderText="Status">
                            <ItemTemplate>
                                <asp:Label ID="lblStatus" runat="server" Text='<%# Eval("Status") %>' 
                                    CssClass='<%# GetStatusBadgeClass(Eval("Status").ToString()) %>'>
                                </asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="CreatedAt" HeaderText="Booked On" DataFormatString="{0:g}" />
                    </Columns>
                    <HeaderStyle CssClass="bg-dark text-white" />
                </asp:GridView>
            </div>
            
            <div class="mt-4">
                <a href="CustomerDashboard.aspx" class="btn btn-outline-cyan">&larr; Back to Dashboard</a>
            </div>
        </div>
    </div>
</asp:Content>
