<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master"
    AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="TravelBooking._Default" %>
<%@ Register Src="~/LoginPanel.ascx" TagPrefix="uc" TagName="LoginPanel" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <main>
        <section class="row">
            <div class="col-md-12">
                <h1 id="aspnetTitle">Travel Booking – Service Directory</h1>
                <p class="lead">
                    This page summarizes the components for our travel booking
                    application and provides TryIt interfaces to test them.
                </p>
                <h3>Check out</h3>
<asp:Button ID="btnMember" runat="server" Text="Member Page"
    OnClick="btnMember_Click" />
&nbsp;
<asp:Button ID="btnStaff" runat="server" Text="Staff Page"
    OnClick="btnStaff_Click" />
            </div>
        </section>

        <br />

        <section class="row">
            <div class="col-md-12">
                <h2>Application and Components Summary Table</h2>

                <table class="table table-bordered table-striped">
                    <thead>
                        <tr>
                            <th>Provider</th>
                            <th>Component type</th>
                            <th>Operation / Function</th>
                            <th>Parameters &amp; Return</th>
                            <th>Description</th>
                            <th>TryIt</th>
                        </tr>
                    </thead>
                    <tbody>

                        <tr>
                            <td>Andrew Abarca</td>
                            <td>Cookie</td>
                            <td>SaveUserProfile / LoadUserProfile</td>
                            <td>
                                Parameters: Name (string), HomeCity (string), FavoriteActivity (string)<br />
                                Return: values stored / loaded from HTTP cookie
                            </td>
                            <td>
                                Saves basic user profile data into a browser cookie so it can be
                                reloaded on later visits.
                            </td>
                            <td>
                                <asp:HyperLink ID="lnkCookieTryIt" runat="server"
                                    NavigateUrl="#CookieTryItSection" Text="Go to TryIt" />
                            </td>
                        </tr>

                         <tr>
                             <td>Andrew Abarca</td>
                             <td>User Control</td>
                             <td>LoginPanel (demo login)</td>
                             <td>
                                 Parameters: Username (string), Password (string) – entered in the user control text boxes.
                                 Return: status message (string) displayed in the LoginPanel label (success or error).
                             </td>
                             <td>
                                 Web User Control that collects a username and password, checks that both fields are entered,
                                 and shows either an error or a personalized greeting message. This control will be reused and extended for authentication in Assignment 6.
                             </td>
                             <td>
                                 <asp:HyperLink ID="HyperLink1" runat="server"
                                     NavigateUrl="#UserControlSection" Text="Go to TryIt" />
                             </td>
                         </tr>

                        <tr>
                            <td>Andrew Abarca</td>
                            <td>Service (ASMX)</td>
                            <td>GetHotelCost</td>
                            <td>
                                Parameters: Nights (int), NightlyRate (double)<br />
                                Return: TotalCost (double) – hotel cost including tax and a fixed booking fee
                            </td>
                            <td>
                                Andrew’s HotelCostService Web service. It computes the hotel subtotal
                                (nights × nightly rate), adds 12% tax and a fixed booking fee, and
                                returns the final total cost.
                            </td>
                            <td>
                                <asp:HyperLink ID="lnkAndrewHotelServiceTryIt" runat="server"
                                    NavigateUrl="#AndrewServiceSection" Text="Go to TryIt" />
                            </td>
                        </tr>

                    </tbody>
                </table>
            </div>
        </section>

        <hr />

        <section class="row" id="CookieTryItSection">
            <div class="col-md-12">
                <h2>User Profile Cookie</h2>

                <div class="form-group">
                    <asp:Label runat="server" AssociatedControlID="txtName"
                               Text="Name:" CssClass="control-label" />
                    <asp:TextBox ID="txtName" runat="server" CssClass="form-control" />
                </div>

                <div class="form-group">
                    <asp:Label runat="server" AssociatedControlID="txtHomeCity"
                               Text="Home city:" CssClass="control-label" />
                    <asp:TextBox ID="txtHomeCity" runat="server" CssClass="form-control" />
                </div>

                <div class="form-group">
                    <asp:Label runat="server" AssociatedControlID="txtActivity"
                               Text="Favorite activity:" CssClass="control-label" />
                    <asp:TextBox ID="txtActivity" runat="server" CssClass="form-control" />
                </div>

                <asp:Button ID="btnSaveCookie" runat="server"
                    CssClass="btn btn-success"
                    Text="Save to cookie"
                    OnClick="btnSaveCookie_Click" />
                <asp:Button ID="btnLoadCookie" runat="server"
                    CssClass="btn btn-default"
                    Text="Load from cookie"
                    OnClick="btnLoadCookie_Click" />
                <br /><br />
                <asp:Label ID="lblCookieStatus" runat="server" />
            </div>
        </section>

        <hr />

        
        <section class="row" id="UserControlSection">
            <div class="col-md-12">
                <h2>Login User Control</h2>
                <p>
                    This user control is a reusable login panel and counts as one of my
                    two local components for Assignment 5.
                </p>

                <uc:LoginPanel ID="LoginPanel1" runat="server" />
            </div>
        </section>

        <section class="row" id="AndrewServiceSection">
            <div class="col-md-12">
                <h2>Andrew's Hotel Cost Service</h2>
                <p>
                    This TryIt calls <strong>Andrew's HotelCostService.asmx</strong> Web service
                    to estimate the total hotel cost.
                </p>

                <div class="form-group">
                    <asp:Label runat="server" AssociatedControlID="txtHotelNights"
                               Text="Number of nights:" CssClass="control-label" />
                    <asp:TextBox ID="txtHotelNights" runat="server"
                                 CssClass="form-control" />
                </div>

                <div class="form-group">
                    <asp:Label runat="server" AssociatedControlID="txtNightlyRate"
                               Text="Nightly rate:" CssClass="control-label" />
                    <asp:TextBox ID="txtNightlyRate" runat="server"
                                 CssClass="form-control" />
                </div>

                <asp:Button ID="btnHotelCost" runat="server"
                            CssClass="btn btn-info"
                            Text="Get hotel cost"
                            OnClick="btnHotelCost_Click" />
                <br /><br />
                <asp:Label ID="lblHotelCostResult" runat="server" />
            </div>
        </section>

    </main>

</asp:Content>