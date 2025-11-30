using System;
using System.Web.Services;

namespace TravelBooking.Services
{
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    public class HotelCostService : WebService
    {
        // Andrew's Web service for Assignment 5.
        // Calculates estimated hotel cost with tax and a fixed fee.
        [WebMethod(Description = "Calculates an estimated hotel cost.")]
        public double GetHotelCost(int nights, double nightlyRate)
        {
            if (nights <= 0 || nightlyRate < 0)
                return 0;

            double subtotal = nights * nightlyRate;
            double tax = subtotal * 0.12;   // 12% tax
            double fees = 25.0;             // flat booking fee

            double total = subtotal + tax + fees;
            return Math.Round(total, 2);
        }
    }
}
