using System;
using System.Web.UI;

namespace TravelBooking
{
    public partial class LoginPanel : UserControl
    {
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrWhiteSpace(txtUser.Text) ||
                string.IsNullOrWhiteSpace(txtPassword.Text))
            {
                lblLoginMessage.Text = "Please enter both username and password.";
                return;
            }

            lblLoginMessage.Text =
                $"[UserControl] Hello, {txtUser.Text}. This demonstrates the login user control component.";
        }
    }
}
