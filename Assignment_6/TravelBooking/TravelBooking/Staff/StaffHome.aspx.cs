using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TravelBooking.Staff
{
    public partial class StaffHome : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Username"] == null || (string)Session["Role"] != "Staff")
            {
                Response.Redirect("~/Default.aspx");
                return;
            }

            if (!IsPostBack)
            {
                lblWelcome.Text = "Welcome, " + (string)Session["Username"] + " (Staff).";

                int totalSessions = 0;
                DateTime? startTime = null;

                if (Application["TotalSessions"] != null)
                    totalSessions = (int)Application["TotalSessions"];

                if (Application["SiteStartTime"] != null)
                    startTime = (DateTime)Application["SiteStartTime"];

                lblSessionInfo.Text = $"Total sessions since app started: {totalSessions}. " +
                                      $"App started at: {startTime}.";
            }
        }
    }
}