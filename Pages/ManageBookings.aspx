<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" CodeFile="ManageBookings.aspx.cs" Inherits="Pages_ManageBookings" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" Runat="Server">Manage Bookings</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="HeaderContent" Runat="Server">All Bookings</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" Runat="Server">
    <div class="card-custom bg-white p-4 rounded">
        <asp:Panel ID="pnlMsg" runat="server" Visible="false" CssClass="alert alert-success">
            <asp:Label ID="lblMsg" runat="server"></asp:Label>
        </asp:Panel>

        <asp:GridView ID="gvBookings" runat="server" AutoGenerateColumns="False" CssClass="table table-custom table-hover" GridLines="None" OnRowCommand="gvBookings_RowCommand">
            <Columns>
                <asp:BoundField DataField="BookingID" HeaderText="ID" />
                <asp:BoundField DataField="CustomerName" HeaderText="Customer" />
                <asp:BoundField DataField="VehicleNumber" HeaderText="Vehicle No." />
                <asp:BoundField DataField="ServiceName" HeaderText="Service" />
                <asp:BoundField DataField="BookingDate" HeaderText="Date" DataFormatString="{0:d}" />
                <asp:BoundField DataField="BookingTime" HeaderText="Time" />
                
                <asp:TemplateField HeaderText="Status">
                    <ItemTemplate>
                        <asp:Label ID="lblStatus" runat="server" Text='<%# Eval("Status") %>' CssClass='<%# GetStatusBadgeClass(Eval("Status").ToString()) %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Actions">
                    <ItemTemplate>
                        <asp:LinkButton ID="btnApprove" runat="server" CommandName="ApproveBooking" CommandArgument='<%# Eval("BookingID") %>' CssClass="btn btn-sm btn-outline-info" ToolTip="Approve" Visible='<%# Eval("Status").ToString() == "Pending" %>'><i class="bi bi-check-circle"></i></asp:LinkButton>
                        <asp:LinkButton ID="btnComplete" runat="server" CommandName="CompleteBooking" CommandArgument='<%# Eval("BookingID") %>' CssClass="btn btn-sm btn-outline-success" ToolTip="Complete" Visible='<%# Eval("Status").ToString() == "Approved" %>'><i class="bi bi-check2-all"></i></asp:LinkButton>
                        <asp:LinkButton ID="btnReject" runat="server" CommandName="RejectBooking" CommandArgument='<%# Eval("BookingID") %>' CssClass="btn btn-sm btn-outline-danger" ToolTip="Reject" Visible='<%# Eval("Status").ToString() == "Pending" || Eval("Status").ToString() == "Approved" %>'><i class="bi bi-x-circle"></i></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <HeaderStyle CssClass="bg-dark text-white" />
        </asp:GridView>
    </div>
</asp:Content>
