using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace A5_WebApp_Andrew_1
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Optional: prefill dates to avoid empty form
                ArrivalDate.Text = DateTime.Today.ToString("yyyy-MM-dd");
                DepartureDate.Text = DateTime.Today.AddDays(1).ToString("yyyy-MM-dd");
            }

        }
        protected void OnCalculate(object sender, EventArgs e)
        {
            // TextMode="Date" posts values like "yyyy-MM-dd" — parse that first, then fall back
            if (!TryParseDate(ArrivalDate.Text, out var arrive) ||
                !TryParseDate(DepartureDate.Text, out var depart))
            {
                Summary.Text = "Please enter valid dates.";
                return;
            }

            var nights = (depart - arrive).Days;
            if (nights <= 0)
            {
                Summary.Text = "Departure must be after arrival.";
                return;
            }

            // Dropdown values are simple numbers ("100","150","200")
            if (!decimal.TryParse(hotelSelect.SelectedValue, NumberStyles.Number, CultureInfo.InvariantCulture, out var nightly))
            {
                Summary.Text = "Please select a hotel.";
                return;
            }

            var subtotal = nightly * nights;
            const decimal taxRate = 0.12m;
            var taxes = Math.Round(subtotal * taxRate, 2);
            var total = Math.Round(subtotal + taxes, 2);

            Summary.Text =
                $"Nights: {nights} × ${nightly:0.00} = ${subtotal:0.00} | " +
                $"Taxes: ${taxes:0.00} | Total: ${total:0.00}";
        }

        private static bool TryParseDate(string value, out DateTime date)
        {
            // Prefer ISO format from date inputs, then general parse as fallback
            return DateTime.TryParseExact(value, "yyyy-MM-dd", CultureInfo.InvariantCulture,
                                          DateTimeStyles.None, out date)
                   || DateTime.TryParse(value, out date);
        }

        protected void btnSetCookie_Click(object sender, EventArgs e)
        {
            var c = new HttpCookie("theme", "dark")
            {
                HttpOnly = true,
                Secure = true,            // requires HTTPS to be fully effective
                SameSite = SameSiteMode.Lax,
                Expires = DateTime.UtcNow.AddDays(7)
            };
            Response.Cookies.Add(c);
        }

        // Reads the "theme" cookie from the incoming request (what the browser sent)
        // and shows its value on the page; if the cookie doesn't exist, shows a placeholder.
        protected void btnReadCookie_Click(object sender, EventArgs e)
        {
            lblCookie.Text = Request.Cookies["theme"]?.Value ?? "(no cookie)";
        }

        // Uses ASP.NET Session (server-side key/value store) to track a simple counter.
        // Each click reads the current value, increments it, stores it back, and displays it.
        protected void btnAddToSession_Click(object sender, EventArgs e)
        {
            int count = (int?)Session["Count"] ?? 0;
            count++;
            Session["Count"] = count;
            lblSession.Text = count.ToString();
        }

        // Removes the count item from session and updates the UI to show it's cleared.
        protected void btnClearSession_Click(object sender, EventArgs e)
        {
            Session.Remove("Count");
            lblSession.Text = "(cleared)";
        }
    }
}