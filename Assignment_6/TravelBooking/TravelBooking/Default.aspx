<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="TravelBooking._Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <h1>Travel Booking Web Application</h1>
    <p class="lead">
        This application lets users request travel quotes and access Member and Staff pages.
    </p>

    <asp:Panel ID="pnlLogin" runat="server">
        <h2>Login</h2>

        <asp:ValidationSummary ID="ValidationSummary1" runat="server"
            CssClass="text-danger" />

        <div class="form-group">
            <asp:Label ID="lblUser" runat="server" AssociatedControlID="txtUser"
                Text="Username:" />
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

        <div class="form-group" style="margin-top: 8px;">
            <asp:Button ID="btnLogin" runat="server" Text="Login"
                CssClass="btn btn-primary"
                OnClick="btnLogin_Click" />
            &nbsp;
            <asp:Button ID="Button1" runat="server"
                Text="TryIt: Auto login as Member"
                CssClass="btn btn-primary"
                OnClick="btnAutoMemberTest_Click" />
            &nbsp;
            <asp:Button ID="Button2" runat="server"
                Text="TryIt: Auto login as Staff"
                CssClass="btn btn-primary"
                OnClick="btnAutoStaffTest_Click" />
        </div>

        <asp:Label ID="lblLoginMessage" runat="server" />

    </asp:Panel>

    <asp:Panel ID="pnlAlreadyLoggedIn" runat="server" Visible="false">
        <asp:Label ID="lblAlreadyLoggedIn" runat="server" />
    </asp:Panel>

    <asp:PlaceHolder ID="phSignUpLink" runat="server">
        <p>
            New user? <a runat="server" href="~/MemberRegister.aspx">Sign up as Member</a>
        </p>
    </asp:PlaceHolder>

    <section class="row">
        <div class="col-md-12">
            <h2>Application and Components Summary Table</h2>
            <p class="lead">
                Percentage of contribution: Adil Pekel: 33%
            </p>
            <table class="table table-bordered table-striped">
                <thead>
                    <tr>
                        <th>Provider</th>
                        <th>Component type</th>
                        <th>Operation / Function</th>
                        <th>Description</th>
                        <th>TryIt</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>Adil Pekel</td>
                        <td>Global.asax</td>
                        <td>Application_Start / Session_Start</td>
                        <td>On application start, records the site start time. On each new session,
                        increments a global session counter.
                        </td>
                        <td>
                            <asp:HyperLink ID="lnkGlobalTryIt" runat="server"
                                NavigateUrl="#GlobalTryItSection" Text="TryIt" />
                        </td>
                    </tr>

                    <tr>
                        <td>Adil Pekel</td>
                        <td>Cookie</td>
                        <td>SaveUserProfile / LoadUserProfile</td>
                        <td>Saves basic user profile data into a browser cookie so it can be
                        reloaded on later visits.
                        </td>
                        <td>
                            <asp:HyperLink ID="lnkCookieTryIt" runat="server"
                                NavigateUrl="#CookieTryItSection" Text="TryIt" />
                        </td>
                    </tr>

                    <tr>
                        <td>Adil Pekel</td>
                        <td>Service</td>
                        <td>GetTripQuote</td>
                        <td>Calculates an estimated travel cost based on destination, trip length,
                        and base daily price.
                        </td>
                        <td>
                            <asp:HyperLink ID="lnkServiceTryIt" runat="server"
                                NavigateUrl="#ServiceTryItSection" Text="TryIt" />
                        </td>
                    </tr>

                    <tr>
                        <td>Adil Pekel</td>
                        <td>Web Form</td>
                        <td>Member Login / Member Registration / Member Home Page Redirection</td>
                        <td>Implemented the Member GUI page. Enforces member only access, shows a personalized welcome message, and provides a TryIt interface for the TripQuote web service.</td>
                        <td>
                            <a runat="server" href="~/Member/MemberHome.aspx">TryIt</a>
                        </td>
                    </tr>

                    <tr>
                        <td>Adil Pekel</td>
                        <td>Web Form</td>
                        <td>Staff Login / Staff Home Page Redirection</td>
                        <td>Implemented the Staff GUI page. Enforces staff only access and provides a TryIt interface to view the global session counter and application start time set in Global.asax.</td>
                        <td>
                            <a runat="server" href="~/Staff/StaffHome.aspx">TryIt</a>
                        </td>
                    </tr>

                    <tr>
                        <td>Andrew Abarca</td>
                        <td>Web Form</td>
                        <td>encryption and decryption</td>
                        <td>Implemented password encryption and decryption for member login and registration using the Cryption/PasswordUtil classes, so passwords are stored encrypted in Member.xml and verified on login.</td>
                        <td>
                            <a runat="server" href="~/Staff/StaffHome.aspx">TryIt</a>
                        </td>
                    </tr>

                </tbody>
            </table>
        </div>
    </section>

</asp:Content>

