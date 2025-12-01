using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.IO;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

namespace TravelBooking
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["Username"] != null)
                {
                    pnlLogin.Visible = false;
                    pnlAlreadyLoggedIn.Visible = true;
                    phSignUpLink.Visible = false;
                    lblAlreadyLoggedIn.Text =
                        "You are logged in as: " + Session["Username"] +
                        " (" + (string)Session["Role"] + "). " +
                        "Use the navbar above to access the " + (string)Session["Role"] + " page.";
                }
                else
                {
                    pnlLogin.Visible = true;
                    phSignUpLink.Visible = true;
                    pnlAlreadyLoggedIn.Visible = false;
                }
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            if (!Page.IsValid)
            {
                lblLoginMessage.Text = "Please fill in all fields.";
                lblLoginMessage.ForeColor = System.Drawing.Color.Red;
                return;
            }

            string username = txtUser.Text.Trim();
            string password = txtPass.Text.Trim();

            string role;
            if (!TryAuthenticate(username, password, out role))
            {
                lblLoginMessage.Text = "Invalid username or password.";
                lblLoginMessage.ForeColor = System.Drawing.Color.Red;
                return;
            }

            Session["Username"] = username;
            Session["Role"] = role;

            FormsAuthentication.SetAuthCookie(username, false);

            HttpCookie loginCookie = new HttpCookie("LoginInfo");
            loginCookie["Username"] = username;
            loginCookie["Role"] = role;
            loginCookie.Expires = DateTime.Now.AddMinutes(30);
            Response.Cookies.Add(loginCookie);

            string returnUrl = Request.QueryString["ReturnUrl"];
            if (!string.IsNullOrEmpty(returnUrl))
            {
                Response.Redirect(returnUrl);
            }
            else
            {
                if (role == "Staff")
                {
                    Response.Redirect("~/Staff/StaffHome.aspx");
                }
                else
                {
                    Response.Redirect("~/Member/MemberHome.aspx");
                }
            }
        }

        private bool TryAuthenticate(string username, string password, out string role)
        {
            role = null;

            if (AuthenticateFromXml("~/App_Data/Staff.xml", "staff", username, password))
            {
                role = "Staff";
                return true;
            }

            if (AuthenticateFromXml("~/App_Data/Member.xml", "member", username, password))
            {
                role = "Member";
                return true;
            }

            return false;
        }

        private bool AuthenticateFromXml(string virtualPath, string elementName,
                                         string username, string password)
        {
            string path = Server.MapPath(virtualPath);
            if (!File.Exists(path))
                return false;

            XDocument doc = XDocument.Load(path);

            foreach (var node in doc.Root.Elements(elementName))
            {
                string storedUser = (string)node.Element("username");
                string storedHash = (string)node.Element("passwordHash");

                if (string.Equals(storedUser, username, StringComparison.OrdinalIgnoreCase) &&
                    PasswordUtil.Verify(password, storedHash))
                {
                    return true;
                }
            }

            return false;
        }

        protected void btnAutoMemberTest_Click(object sender, EventArgs e)
        {
            string username = "testMember";
            string role = "Member";

            Session["Username"] = username;
            Session["Role"] = role;

            FormsAuthentication.SetAuthCookie(username, false);

            HttpCookie loginCookie = new HttpCookie("LoginInfo");
            loginCookie["Username"] = username;
            loginCookie["Role"] = role;
            loginCookie.Expires = DateTime.Now.AddMinutes(30);
            Response.Cookies.Add(loginCookie);

            Response.Redirect("~/Member/MemberHome.aspx");
        }

        protected void btnAutoStaffTest_Click(object sender, EventArgs e)
        {
            string username = "TA";
            string role = "Staff";

            Session["Username"] = username;
            Session["Role"] = role;

            FormsAuthentication.SetAuthCookie(username, false);

            HttpCookie loginCookie = new HttpCookie("LoginInfo");
            loginCookie["Username"] = username;
            loginCookie["Role"] = role;
            loginCookie.Expires = DateTime.Now.AddMinutes(30);
            Response.Cookies.Add(loginCookie);

            Response.Redirect("~/Staff/StaffHome.aspx");
        }
    }
}