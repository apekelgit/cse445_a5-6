<%@ Page Title="Member Home" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MemberHome.aspx.cs" Inherits="TravelBooking.Member.MemberHome" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Member Page</h2>

    <asp:Label ID="lblWelcome" runat="server" />
    <br />

    <h3>Trip Quote TryIt</h3>
    <p>Enter parameters and click the button to call the remote TripQuoteService.</p>

    <asp:Label ID="Label1" runat="server" Text="Destination:" />
    <asp:TextBox ID="txtDest" runat="server" />
    <br />
    <asp:Label ID="Label2" runat="server" Text="Days:" />
    <asp:TextBox ID="txtDays" runat="server" />
    <br />
    <asp:Label ID="Label3" runat="server" Text="Base price per day:" />
    <asp:TextBox ID="txtBase" runat="server" />
    <br />
    <asp:Button ID="btnQuote" runat="server" Text="Get Quote"
                OnClick="btnQuote_Click" />
    <br />
    <asp:Label ID="lblQuoteResult" runat="server" />
</asp:Content>

