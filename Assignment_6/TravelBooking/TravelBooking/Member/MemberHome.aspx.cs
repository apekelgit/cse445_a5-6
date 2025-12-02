using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TravelBooking.Member
{
    public partial class MemberHome : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Username"] == null || (string)Session["Role"] != "Member")
            {
                Response.Redirect("~/Default.aspx");
                return;
            }

            if (!IsPostBack)
            {
                lblWelcome.Text = "Welcome, " + (string)Session["Username"] + " (Member).";
            }
        }

        protected void btnQuote_Click(object sender, EventArgs e)
        {
            try
            {
                string dest = txtDest.Text.Trim();
                int days = int.Parse(txtDays.Text.Trim());
                double basePerDay = double.Parse(txtBase.Text.Trim());

                TripService.TripQuoteService client = new TripService.TripQuoteService();
                double quote = client.GetTripQuote(dest, days, basePerDay);

                lblQuoteResult.Text = "Estimated trip cost (from Web service): " + quote.ToString("C");
            }
            catch (Exception ex)
            {
                lblQuoteResult.Text = "Error calling TripQuoteService: " + ex.Message;
            }
        }

        protected void btnHotelCost_Click(object sender, EventArgs e)
        {
            try
            {
                // Read from your hotel TryIt controls
                int hotelNights = int.Parse(txtHotelNights.Text.Trim());
                double nightlyRate = double.Parse(txtNightlyRate.Text.Trim());

                // HotelService = Web Reference name you added
                HotelService.HotelCostService svc = new HotelService.HotelCostService();

                double total = svc.GetHotelCost(hotelNights, nightlyRate);

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