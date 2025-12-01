using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Optimization;
using System.Web.Routing;
using System.Web.Security;
using System.Web.SessionState;

namespace TravelBooking
{
    public class Global : HttpApplication
    {
        void Application_Start(object sender, EventArgs e)
        {
            RouteConfig.RegisterRoutes(RouteTable.Routes);
            BundleConfig.RegisterBundles(BundleTable.Bundles);

            Application["SiteStartTime"] = DateTime.Now;
            Application["TotalSessions"] = 0;
        }
        void Session_Start(object sender, EventArgs e)
        {
            int current = (int)(Application["TotalSessions"] ?? 0);
            Application["TotalSessions"] = current + 1;
        }
    }
}