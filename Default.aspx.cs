using System;
using System.Web;
using TravelBooking.Services;   // for HotelCostService

namespace TravelBooking
{
    public partial class _Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // If a profile cookie exists, preload it.
                HttpCookie profile = Request.Cookies["UserProfile"];
                if (profile != null)
                {
                    txtName.Text = profile["Name"];
                    txtHomeCity.Text = profile["HomeCity"];
                    txtActivity.Text = profile["Activity"];
                    lblCookieStatus.Text = "Profile loaded from cookie.";
                }
            }
        }

        // Member and Staff buttons redirection
        protected void btnMember_Click(object sender, EventArgs e)
        {
            if (Context.User.Identity.IsAuthenticated)
            {
                Response.Redirect("~/Member.aspx");
            }
            else
            {
                Session["ReturnUrl"] = "~/Member.aspx";
                Response.Redirect("~/Login.aspx");
            }
        }

        protected void btnStaff_Click(object sender, EventArgs e)
        {
            if (Context.User.Identity.IsAuthenticated)
            {
                Response.Redirect("~/Staff.aspx");
            }
            else
            {
                Session["ReturnUrl"] = "~/Staff.aspx";
                Response.Redirect("~/Login.aspx");
            }
        }

        // Cookie component 
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

        // Andrew's HotelCostService component 
        protected void btnHotelCost_Click(object sender, EventArgs e)
        {
            try
            {
                int nights = int.Parse(txtHotelNights.Text);
                double nightlyRate = double.Parse(txtNightlyRate.Text);

                // Call YOUR HotelCostService Web service (in the same app)
                HotelCostService svc = new HotelCostService();
                double total = svc.GetHotelCost(nights, nightlyRate);

                lblHotelCostResult.Text =
                    $"Estimated hotel cost (from Andrew's Web service): {total:C}";
            }
            catch (Exception ex)
            {
                lblHotelCostResult.Text = "Error calling service: " + ex.Message;
            }
        }
    }
}
