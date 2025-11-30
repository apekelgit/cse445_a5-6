<%@ Control Language="C#" AutoEventWireup="true"
    CodeBehind="LoginPanel.ascx.cs"
    Inherits="TravelBooking.LoginPanel" %>

<div class="panel panel-default">
    <div class="panel-heading">
        <h3 class="panel-title">Demo Login (User Control)</h3>
    </div>
    <div class="panel-body">
        <div class="form-group">
            <asp:Label ID="lblUser" runat="server"
                       AssociatedControlID="txtUser"
                       Text="Username:" CssClass="control-label" />
            <asp:TextBox ID="txtUser" runat="server"
                         CssClass="form-control" />
        </div>

        <div class="form-group">
            <asp:Label ID="lblPassword" runat="server"
                       AssociatedControlID="txtPassword"
                       Text="Password:" CssClass="control-label" />
            <asp:TextBox ID="txtPassword" runat="server"
                         TextMode="Password"
                         CssClass="form-control" />
        </div>

        <asp:Button ID="btnLogin" runat="server"
                    CssClass="btn btn-primary"
                    Text="Login (demo)"
                    OnClick="btnLogin_Click" />
        <br /><br />
        <asp:Label ID="lblLoginMessage" runat="server" />
    </div>
</div>
