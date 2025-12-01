using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace A5_WebApp_Andrew_2
{
    using System;
    using System.Linq;
    using System.Xml.Linq;
    using SecurityLib; // <-- DLL reference

    namespace TravelBooking
    {
        public static class AuthHelper
        {
            /// Verifies member or staff credentials from XML using the DLL hashing function.
            /// Returns true if username/password match records.
            public static bool VerifyCredentials(string username, string password)
            {
                if (string.IsNullOrWhiteSpace(username) || string.IsNullOrWhiteSpace(password))
                    return false;

                // First check Member.xml
                if (CheckXmlCredentials("~/App_Data/Member.xml", username, password))
                    return true;

                // Then check Staff.xml
                if (CheckXmlCredentials("~/App_Data/Staff.xml", username, password))
                    return true;

                return false;
            }

            /// Helper method to load XML and compare stored hash using PasswordSecurity.VerifyPassword.
            private static bool CheckXmlCredentials(string xmlPath, string username, string password)
            {
                try
                {
                    string fullPath = System.Web.HttpContext.Current.Server.MapPath(xmlPath);
                    XDocument doc = XDocument.Load(fullPath);

                    var user = doc.Root.Elements("User")
                        .FirstOrDefault(x => string.Equals((string)x.Element("Username"), username, StringComparison.OrdinalIgnoreCase));

                    if (user == null)
                        return false;

                    string storedHash = (string)user.Element("PasswordHash");

                    // Use your DLL to check password
                    return PasswordSecurity.VerifyPassword(password, storedHash);
                }
                catch
                {
                    return false; // safe fallback
                }
            }
        }
    }

}