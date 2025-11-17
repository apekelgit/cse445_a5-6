<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master"
    AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="TravelBooking._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <main>
        <section class="row">
            <div class="col-md-12">
                <h1 id="aspnetTitle">Travel Booking – Service Directory</h1>
                <p class="lead">
                    This page summarizes the components for our travel booking
                    application and provides TryIt interfaces to test them.
                </p>
            </div>
        </section>

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
                            <td>Adil Pekel</td>
                            <td>Global.asax</td>
                            <td>Application_Start / Session_Start</td>
                            <td>
                                Parameters: none<br />
                                Return: stores <code>SiteStartTime</code> and <code>TotalSessions</code> in Application state
                            </td>
                            <td>
                                On application start, records the site start time. On each new session,
                                increments a global session counter.
                            </td>
                            <td>
                                <asp:HyperLink ID="lnkGlobalTryIt" runat="server"
                                    NavigateUrl="#GlobalTryItSection" Text="Go to TryIt" />
                            </td>
                        </tr>

                        <tr>
                            <td>Adil Pekel</td>
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
                            <td>Adil Pekel</td>
                            <td>Service</td>
                            <td>GetTripQuote</td>
                            <td>
                                Parameters: Destination (string), Days (int), BasePerDay (double)<br />
                                Return: TotalPrice (double)
                            </td>
                            <td>
                                Calculates an estimated travel cost based on destination, trip length,
                                and base per-day price.
                            </td>
                            <td>
                                <asp:HyperLink ID="lnkServiceTryIt" runat="server"
                                    NavigateUrl="#ServiceTryItSection" Text="Go to TryIt" />
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </section>

        <section class="row" id="GlobalTryItSection">
            <div class="col-md-12">
                <h2>Global.asax</h2>
                <asp:Button ID="btnShowAppInfo" runat="server"
                    CssClass="btn btn-primary"
                    Text="Show application info"
                    OnClick="btnShowAppInfo_Click" />
                <br /><br />
                <strong>Application start:</strong>
                <asp:Label ID="lblStartTime" runat="server" /><br />
                <strong>Total sessions:</strong>
                <asp:Label ID="lblTotalSessions" runat="server" />
            </div>
        </section>

        <hr />

        <section class="row" id="CookieTryItSection">
            <div class="col-md-12">
                <h2>User Profile Cookie</h2>

                <div class="form-group">
                    <asp:Label runat="server" AssociatedControlID="txtName" Text="Name:" CssClass="control-label" />
                    <asp:TextBox ID="txtName" runat="server" CssClass="form-control" />
                </div>

                <div class="form-group">
                    <asp:Label runat="server" AssociatedControlID="txtHomeCity" Text="Home city:" CssClass="control-label" />
                    <asp:TextBox ID="txtHomeCity" runat="server" CssClass="form-control" />
                </div>

                <div class="form-group">
                    <asp:Label runat="server" AssociatedControlID="txtActivity" Text="Favorite activity:" CssClass="control-label" />
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

        <section class="row" id="ServiceTryItSection">
            <div class="col-md-12">
                <h2>Trip Quote</h2>

                <div class="form-group">
                    <asp:Label runat="server" AssociatedControlID="txtDest" Text="Destination:" CssClass="control-label" />
                    <asp:TextBox ID="txtDest" runat="server" CssClass="form-control" />
                </div>

                <div class="form-group">
                    <asp:Label runat="server" AssociatedControlID="txtDays" Text="Days:" CssClass="control-label" />
                    <asp:TextBox ID="txtDays" runat="server" CssClass="form-control" />
                </div>

                <div class="form-group">
                    <asp:Label runat="server" AssociatedControlID="txtBasePerDay" Text="Base price per day:" CssClass="control-label" />
                    <asp:TextBox ID="txtBasePerDay" runat="server" CssClass="form-control" />
                </div>

                <asp:Button ID="btnGetQuote" runat="server"
                    CssClass="btn btn-info"
                    Text="Get quote"
                    OnClick="btnGetQuote_Click" />
                <br /><br />
                <asp:Label ID="lblQuoteResult" runat="server" />
            </div>
        </section>

    </main>

</asp:Content>
