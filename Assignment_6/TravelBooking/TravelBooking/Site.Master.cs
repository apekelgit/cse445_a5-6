using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

namespace TravelBooking
{
    public partial class SiteMaster : MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["Username"] != null)
                {
                    lblUserStatus.Text = "Logged in as: " + Session["Username"] +
                                         " (" + (string)Session["Role"] + ")";
                    btnLogout.Visible = true;
                }
                else
                {
                    lblUserStatus.Text = "Not logged in.";
                    btnLogout.Visible = false;
                }
            }
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();
            FormsAuthentication.SignOut();

            if (Request.Cookies["LoginInfo"] != null)
            {
                HttpCookie c = new HttpCookie("LoginInfo");
                c.Expires = DateTime.Now.AddDays(-1);
                Response.Cookies.Add(c);
            }

            if (Request.Cookies[FormsAuthentication.FormsCookieName] != null)
            {
                HttpCookie auth = new HttpCookie(FormsAuthentication.FormsCookieName);
                auth.Expires = DateTime.Now.AddDays(-1);
                Response.Cookies.Add(auth);
            }

            Response.Redirect("~/Default.aspx");
        }

    }
}