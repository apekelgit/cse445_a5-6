using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TravelBooking
{
    public partial class _Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                HttpCookie profile = Request.Cookies["UserProfile"];
                if (profile != null)
                {
                    txtName.Text = profile["Name"];
                    txtHomeCity.Text = profile["HomeCity"];
                    txtActivity.Text = profile["Activity"];
                }
            }
        }
        protected void btnShowAppInfo_Click(object sender, EventArgs e)
        {
            object start = Application["SiteStartTime"];
            object sessions = Application["TotalSessions"];

            lblStartTime.Text = (start == null) ? "Unknown" : start.ToString();
            lblTotalSessions.Text = (sessions == null) ? "0" : sessions.ToString();
        }

        protected void btnSaveCookie_Click(object sender, EventArgs e)
        {
            HttpCookie profile = new HttpCookie("UserProfile");

            profile["Name"] = txtName.Text;
            profile["HomeCity"] = txtHomeCity.Text;
            profile["Activity"] = txtActivity.Text;

            profile.Expires = DateTime.Now.AddDays(7);

            Response.Cookies.Add(profile);

            lblCookieStatus.Text = "Profile saved to cookie.";
        }

        protected void btnLoadCookie_Click(object sender, EventArgs e)
        {
            HttpCookie profile = Request.Cookies["UserProfile"];

            if (profile != null)
            {
                txtName.Text = profile["Name"];
                txtHomeCity.Text = profile["HomeCity"];
                txtActivity.Text = profile["Activity"];
                lblCookieStatus.Text = "Profile loaded from cookie.";
            }
            else
            {
                lblCookieStatus.Text = "No UserProfile cookie found.";
            }
        }
        protected void btnGetQuote_Click(object sender, EventArgs e)
        {
            try
            {
                string dest = txtDest.Text;
                int days = int.Parse(txtDays.Text);
                double basePerDay = double.Parse(txtBasePerDay.Text);
                TripService.TripQuoteService client = new TripService.TripQuoteService();

                double quote = client.GetTripQuote(dest, days, basePerDay);

                lblQuoteResult.Text = $"Estimated trip cost (from Web service): {quote:C}";
            }
            catch (Exception ex)
            {
                lblQuoteResult.Text = "Error calling service: " + ex.Message;
            }
        }
    }
}