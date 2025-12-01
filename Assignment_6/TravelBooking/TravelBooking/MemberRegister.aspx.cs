using System;
using System.IO;
using System.Web.UI;
using System.Xml.Linq;

namespace TravelBooking
{
    public partial class MemberRegister : Page
    {
        protected void btnRegister_Click(object sender, EventArgs e)
        {
            if (!Page.IsValid)
            {
                lblStatus.Text = "Please fix the validation errors above.";
                lblStatus.ForeColor = System.Drawing.Color.Red;
                return;
            }

            string username = txtUser.Text.Trim();
            string password = txtPass.Text.Trim();

            // NEW: encrypt the password using Cryption instead of hashing
            //AAndrew
            Cryption cryption = new Cryption();
            string encryptedPassword = cryption.Encrypt(password);


            string xmlPath = Server.MapPath("~/App_Data/Member.xml");
            XDocument doc;

            if (File.Exists(xmlPath))
            {
                doc = XDocument.Load(xmlPath);
                if (doc.Root == null)
                {
                    doc.Add(new XElement("members"));
                }
            }
            else
            {
                doc = new XDocument(new XElement("members"));
            }

            bool exists = false;
            foreach (var member in doc.Root.Elements("member"))
            {
                string existingUser = (string)member.Element("username");
                if (string.Equals(existingUser, username, StringComparison.OrdinalIgnoreCase))
                {
                    exists = true;
                    break;
                }
            }

            if (exists)
            {
                lblStatus.Text = "That username is already taken. Please choose another.";
                lblStatus.ForeColor = System.Drawing.Color.Red;
                return;
            }

            string hash = PasswordUtil.Hash(password);

            XElement newMember = new XElement("member",
                new XElement("username", username),
                new XElement("passwordHash", hash)
            );

            doc.Root.Add(newMember);
            doc.Save(xmlPath);

            lblStatus.ForeColor = System.Drawing.Color.Green;
            lblStatus.Text = "Registration successful. You can now log in from the Home page.";

            txtUser.Text = "";
            txtPass.Text = "";
            txtConfirm.Text = "";
        }
    }
}
