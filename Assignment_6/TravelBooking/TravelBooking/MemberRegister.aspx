<%@ Page Title="Member Signup" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MemberRegister.aspx.cs" Inherits="TravelBooking.MemberRegister" %>


<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Member Signup</h2>
    <p>
        Create a member account
    </p>

    <asp:ValidationSummary ID="ValidationSummary1" runat="server"
        CssClass="text-danger" />

    <div class="form-group">
        <asp:Label ID="lblUser" runat="server" AssociatedControlID="txtUser"
                   Text="Choose a username:" />
        <asp:TextBox ID="txtUser" runat="server" CssClass="form-control" />
        <asp:RequiredFieldValidator ID="rfvUser" runat="server"
            ControlToValidate="txtUser"
            ErrorMessage="Username is required."
            Display="Dynamic" CssClass="text-danger" />
    </div>

    <div class="form-group">
        <asp:Label ID="lblPass" runat="server" AssociatedControlID="txtPass"
                   Text="Password:" />
        <asp:TextBox ID="txtPass" runat="server" TextMode="Password"
                     CssClass="form-control" />
        <asp:RequiredFieldValidator ID="rfvPass" runat="server"
            ControlToValidate="txtPass"
            ErrorMessage="Password is required."
            Display="Dynamic" CssClass="text-danger" />
    </div>

    <div class="form-group">
        <asp:Label ID="lblConfirm" runat="server" AssociatedControlID="txtConfirm"
                   Text="Confirm password:" />
        <asp:TextBox ID="txtConfirm" runat="server" TextMode="Password"
                     CssClass="form-control" />
        <asp:CompareValidator ID="cvPass" runat="server"
            ControlToValidate="txtConfirm" ControlToCompare="txtPass"
            ErrorMessage="Passwords must match."
            Display="Dynamic" CssClass="text-danger" />
    </div>

    <asp:Button ID="btnRegister" runat="server" Text="Sign Up"
                CssClass="btn btn-primary"
                OnClick="btnRegister_Click" />

    <br /><br />
    <asp:Label ID="lblStatus" runat="server" />
</asp:Content>
