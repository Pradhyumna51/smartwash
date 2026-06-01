<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" CodeFile="ManageServices.aspx.cs" Inherits="Pages_ManageServices" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" Runat="Server">Manage Services</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="HeaderContent" Runat="Server">Manage Services</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" Runat="Server">
    <div class="row">
        <!-- List of Services -->
        <div class="col-md-7 mb-4">
            <div class="card-custom bg-white p-4 rounded">
                <h4>Existing Services</h4>
                <asp:GridView ID="gvServices" runat="server" AutoGenerateColumns="False" CssClass="table table-custom table-hover mt-3" GridLines="None" OnRowCommand="gvServices_RowCommand" DataKeyNames="ServiceID">
                    <Columns>
                        <asp:BoundField DataField="ServiceID" HeaderText="ID" />
                        <asp:BoundField DataField="ServiceName" HeaderText="Service Name" />
                        <asp:BoundField DataField="Price" HeaderText="Price ($)" DataFormatString="{0:N2}" />
                        <asp:BoundField DataField="Duration" HeaderText="Duration (mins)" />
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:LinkButton ID="btnEdit" runat="server" CommandName="EditService" CommandArgument='<%# Eval("ServiceID") %>' CssClass="btn btn-sm btn-outline-primary"><i class="bi bi-pencil"></i></asp:LinkButton>
                                <asp:LinkButton ID="btnDelete" runat="server" CommandName="DeleteService" CommandArgument='<%# Eval("ServiceID") %>' CssClass="btn btn-sm btn-outline-danger" OnClientClick="return confirm('Are you sure you want to delete this service?');"><i class="bi bi-trash"></i></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <HeaderStyle CssClass="bg-dark text-white" />
                </asp:GridView>
            </div>
        </div>

        <!-- Add/Edit Service -->
        <div class="col-md-5">
            <div class="card-custom bg-white p-4 rounded">
                <h4><asp:Label ID="lblFormTitle" runat="server" Text="Add New Service"></asp:Label></h4>
                
                <asp:Panel ID="pnlMsg" runat="server" Visible="false" CssClass="alert alert-info mt-2">
                    <asp:Label ID="lblMsg" runat="server"></asp:Label>
                </asp:Panel>

                <asp:HiddenField ID="hfServiceID" runat="server" />
                
                <div class="mb-3 mt-3">
                    <label>Service Name</label>
                    <asp:TextBox ID="txtServiceName" runat="server" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvName" runat="server" ControlToValidate="txtServiceName" ErrorMessage="*" CssClass="text-danger"></asp:RequiredFieldValidator>
                </div>
                <div class="mb-3">
                    <label>Price</label>
                    <asp:TextBox ID="txtPrice" runat="server" CssClass="form-control" TextMode="Number" step="0.01"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvPrice" runat="server" ControlToValidate="txtPrice" ErrorMessage="*" CssClass="text-danger"></asp:RequiredFieldValidator>
                </div>
                <div class="mb-3">
                    <label>Duration (minutes)</label>
                    <asp:TextBox ID="txtDuration" runat="server" CssClass="form-control" TextMode="Number"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvDuration" runat="server" ControlToValidate="txtDuration" ErrorMessage="*" CssClass="text-danger"></asp:RequiredFieldValidator>
                </div>
                <div class="mb-3">
                    <label>Description</label>
                    <asp:TextBox ID="txtDescription" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="3"></asp:TextBox>
                </div>

                <asp:Button ID="btnSave" runat="server" Text="Save Service" CssClass="btn btn-success" OnClick="btnSave_Click" />
                <asp:Button ID="btnCancel" runat="server" Text="Cancel" CssClass="btn btn-secondary ms-2" OnClick="btnCancel_Click" CausesValidation="false" Visible="false" />
            </div>
        </div>
    </div>
</asp:Content>
