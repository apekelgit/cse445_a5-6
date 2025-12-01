using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;

namespace TravelServices
{
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    public class TripQuoteService : WebService
    {
        public TripQuoteService()
        {
        }

        [WebMethod(Description = "Calculates an estimated trip cost based on destination, days, and base per-day price.")]
        public double GetTripQuote(string destination, int days, double basePerDay)
        {
            if (days <= 0 || basePerDay < 0)
            {
                return 0.0;
            }

            double multiplier = 1.0;
            if (!string.IsNullOrWhiteSpace(destination))
            {
                string d = destination.ToLower();

                if (d.Contains("hawaii") || d.Contains("europe"))
                {
                    multiplier = 1.3;
                }
                else if (d.Contains("local"))
                {
                    multiplier = 0.9;
                }
            }

            return days * basePerDay * multiplier;
        }
    }
}