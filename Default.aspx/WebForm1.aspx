<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="A5_WebApp_Andrew_1.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Assignment 5 CSE445 Hotel booking page</title>
    <meta charset="utf-8" />
    <style>
        body { font-family: Segoe UI, Arial, sans-serif; margin: 24px; }
        header { margin-bottom: 16px; }
        .grid { display: grid; grid-template-columns: 1fr 1fr; gap: 16px; }
        table { border-collapse: collapse; width: 100%; }
        th, td { border: 1px solid #ccc; padding: 8px; }
        th { background: #f5f5f5; text-align: left; }
        .card { border: 1px solid #e1e1e1; padding: 16px; border-radius: 8px; }
        .muted { color: #666; }
        .actions { margin-top: 8px; }
    </style>
</head>
<body>
    <form id="form1" runat="server">
     <asp:ScriptManager runat="server" />
         <h1> Choose hotel </h1>
             <div class = "form group">
                 <label for="hotelSelect"> Select a hotel: </label>
                 <asp:DropDownList ID="hotelSelect" runat="server">
                     <asp:ListItem Text="Holday inn - $100/night" Value="100"></asp:ListItem>
                     <asp:ListItem Text="Motel 6 - $150/night" Value="150"></asp:ListItem>
                     <asp:ListItem Text="Hilton - $200/night" Value="200"></asp:ListItem>
                     <asp:ListItem Text="The Hamptons - $200/night" Value="200"></asp:ListItem>
                     <asp:ListItem Text="Marriott - $200/night" Value="200"></asp:ListItem>
                     <asp:ListItem Text="Best westren - $200/night" Value="200"></asp:ListItem>
                 </asp:DropDownList>
             </div>
             <div class="grid">
                 <div class="row">
                     <label for="ArrivalDate">Arrival date</label>
                     <asp:TextBox ID="ArrivalDate" runat="server" TextMode="Date" />
                     <asp:RequiredFieldValidator runat="server" ControlToValidate="ArrivalDate"
                         CssClass="error" ErrorMessage="Arrival date is required." Display="Dynamic" />
                 </div>

                 <div class="row">
                     <label for="DepartureDate">Departure date</label>
                     <asp:TextBox ID="DepartureDate" runat="server" TextMode="Date" />
                     <asp:RequiredFieldValidator runat="server" ControlToValidate="DepartureDate"
                         CssClass="error" ErrorMessage="Departure date is required." Display="Dynamic" />
                     <asp:CompareValidator runat="server" ControlToValidate="DepartureDate"
                         ControlToCompare="ArrivalDate" Operator="GreaterThan"
                         Type="Date" CssClass="error"
                         ErrorMessage="Departure must be after arrival." Display="Dynamic" />
                 </div>
             </div>

             <div class="row">
                 <asp:Button ID="btnCalculate" runat="server" Text="Calculate total" OnClick="OnCalculate" />
                 <asp:ValidationSummary runat="server" CssClass="error" />
             </div>

             <div class="row total">
                 <asp:Label ID="Summary" runat="server" />
             </div>

             <p class="muted">* Taxes/fees applied in total. Prices are demo values.</p>
 </form>

    <!-- Try it section -->
    <section class="card" id="tryit-state">
    <h3>TryIt – Cookie & Session</h3>
    <div class="actions">
        <asp:Button ID="btnSetCookie" runat="server" Text="Set Cookie (theme=dark, 7 days)" OnClick="btnSetCookie_Click" />
        <asp:Button ID="btnReadCookie" runat="server" Text="Read Cookie" OnClick="btnReadCookie_Click" />
    </div>
    <p><strong>Cookie Value:</strong> <asp:Label ID="lblCookie" runat="server" /></p>
    <hr />
    <div class="actions">
        <asp:Button ID="btnAddToSession" runat="server" Text="Add to Session Counter" OnClick="btnAddToSession_Click" />
        <asp:Button ID="btnClearSession" runat="server" Text="Clear Session" OnClick="btnClearSession_Click" />
    </div>
    <p><strong>Session Count:</strong> <asp:Label ID="lblSession" runat="server" /></p>
</section>

</body>
</html>
