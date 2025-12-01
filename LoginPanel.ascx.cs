using A5_WebApp_Andrew_2.TravelBooking;
using System;
using System.Web;
using System.Web.Security;
using System.Web.UI;

namespace TravelBooking
{
    public partial class LoginPanel : UserControl
    {
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string username = txtUser.Text.Trim();
            string password = txtPassword.Text;

            bool isValid = AuthHelper.VerifyCredentials(username, password);

            if (isValid)
            {
                FormsAuthentication.SetAuthCookie(username, false);

                string returnUrl = HttpContext.Current.Session["ReturnUrl"] as string;

                if (!string.IsNullOrEmpty(returnUrl))
                {
                    HttpContext.Current.Session["ReturnUrl"] = null;
                    Response.Redirect(returnUrl);
                }
                else
                {
                    Response.Redirect("~/Default.aspx");
                }
            }
            else
            {
                lblLoginMessage.Text = "Invalid username or password.";
            }
        }
    }
}
