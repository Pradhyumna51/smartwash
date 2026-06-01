<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="BookWash.aspx.cs" Inherits="Pages_BookWash" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" Runat="Server">Book a Wash</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <div class="row justify-content-center mt-4">
        <div class="col-md-8 card-custom bg-white p-4 rounded">
            <h3 class="mb-4" style="color: var(--primary-blue);">Book a Wash Appointment</h3>
            
            <asp:Panel ID="pnlSuccess" runat="server" Visible="false" CssClass="alert alert-success">
                Booking successful! You can view it in your <a href="BookingHistory.aspx" class="alert-link">Booking History</a>.
            </asp:Panel>

            <asp:Panel ID="pnlAlert" runat="server" Visible="false" CssClass="alert alert-danger">
                <asp:Label ID="lblError" runat="server"></asp:Label>
            </asp:Panel>

            <div class="row">
                <div class="col-md-6 mb-3">
                    <label class="form-label fw-bold">Select Service</label>
                    <asp:DropDownList ID="ddlServices" runat="server" CssClass="form-select">
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="rfvService" runat="server" ControlToValidate="ddlServices" InitialValue="0" ErrorMessage="Please select a service" CssClass="error-msg" Display="Dynamic"></asp:RequiredFieldValidator>
                </div>
                
                <div class="col-md-6 mb-3">
                    <label class="form-label fw-bold">Vehicle Type</label>
                    <asp:RadioButtonList ID="rblVehicleType" runat="server" RepeatDirection="Horizontal" CssClass="form-control border-0 px-0">
                        <asp:ListItem Text=" Sedan" Value="Sedan" Selected="True"></asp:ListItem>
                        <asp:ListItem Text=" SUV" Value="SUV"></asp:ListItem>
                        <asp:ListItem Text=" Hatchback" Value="Hatchback"></asp:ListItem>
                        <asp:ListItem Text=" Truck" Value="Truck"></asp:ListItem>
                    </asp:RadioButtonList>
                </div>
            </div>

            <div class="row">
                <div class="col-md-6 mb-3">
                    <label class="form-label fw-bold">Select Date</label>
                    <div class="border rounded p-2">
                        <asp:Calendar ID="calBookingDate" runat="server" BackColor="White" BorderColor="#999999" CellPadding="4" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="Black" Height="180px" Width="100%" OnSelectionChanged="calBookingDate_SelectionChanged">
                            <DayHeaderStyle BackColor="#CCCCCC" Font-Bold="True" Font-Size="7pt" />
                            <NextPrevStyle VerticalAlign="Bottom" />
                            <OtherMonthDayStyle ForeColor="#808080" />
                            <SelectedDayStyle BackColor="#666666" Font-Bold="True" ForeColor="White" />
                            <SelectorStyle BackColor="#CCCCCC" />
                            <TitleStyle BackColor="#112240" BorderColor="Black" Font-Bold="True" ForeColor="White" />
                            <TodayDayStyle BackColor="#CCCCCC" ForeColor="Black" />
                            <WeekendDayStyle BackColor="#FFFFCC" />
                        </asp:Calendar>
                    </div>
                    <asp:Label ID="lblSelectedDate" runat="server" CssClass="text-info mt-2 d-block"></asp:Label>
                </div>
                
                <div class="col-md-6 mb-3">
                    <label class="form-label fw-bold">Select Time</label>
                    <asp:DropDownList ID="ddlTime" runat="server" CssClass="form-select">
                        <asp:ListItem Text="-- Select Time --" Value=""></asp:ListItem>
                        <asp:ListItem Text="09:00 AM" Value="09:00 AM"></asp:ListItem>
                        <asp:ListItem Text="10:00 AM" Value="10:00 AM"></asp:ListItem>
                        <asp:ListItem Text="11:00 AM" Value="11:00 AM"></asp:ListItem>
                        <asp:ListItem Text="12:00 PM" Value="12:00 PM"></asp:ListItem>
                        <asp:ListItem Text="01:00 PM" Value="01:00 PM"></asp:ListItem>
                        <asp:ListItem Text="02:00 PM" Value="02:00 PM"></asp:ListItem>
                        <asp:ListItem Text="03:00 PM" Value="03:00 PM"></asp:ListItem>
                        <asp:ListItem Text="04:00 PM" Value="04:00 PM"></asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="rfvTime" runat="server" ControlToValidate="ddlTime" ErrorMessage="Please select a time" CssClass="error-msg" Display="Dynamic"></asp:RequiredFieldValidator>
                </div>
            </div>

            <hr />
            <asp:Button ID="btnBook" runat="server" Text="Confirm Booking" CssClass="btn btn-cyan w-100 py-2 fs-5 mt-2" OnClick="btnBook_Click" />
        </div>
    </div>
</asp:Content>
