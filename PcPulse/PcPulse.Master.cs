/*
    Group Information
    Group Name: SoftByte
    Project Name: PcPulse

    Group Members
    - Shree Dhar Acharya | ID: 8899288
    - Prashant Sahu | ID: 8877584
    - Abhijit Singh | ID: 488865227
    - Karamjot Singh | ID: 8869324

*/

using System;
using System.Web.UI;

namespace PcPulse
{
    /// <summary>
    /// Represents the Master Page
    /// </summary>
    public partial class Site1 : System.Web.UI.MasterPage
    {
        /// <summary>
        /// Handles the loading of the page.
        /// </summary>
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                UpdateUI();
            }
        }

        private void UpdateUI()
        {
            if (Session["Username"] != null && Session["UserType"] != null)
            {
                string userType = Session["UserType"].ToString();

                if (userType == "Admin")
                {
                    CustomerNavigation.Visible = false;
                    AdminNavigation.Visible = true;
                }
                else
                {
                    CustomerNavigation.Visible = true;
                    AdminNavigation.Visible = false;
                }
                string username = Session["Username"].ToString();
                UsernameLabel.Text = $"Welcome, {username}"; // Modify the text as needed
                UsernameLabel.Visible = true;
                LogoutButton.Visible = true;
                LoginLink.Visible = false;
            }
            else
            {
                // User is not logged in
                CustomerNavigation.Visible = true;
                AdminNavigation.Visible = false;
                UsernameLabel.Visible = false;
                LogoutButton.Visible = false;
                LoginLink.Visible = true;
            }
        }

        protected void LogoutButton_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("~/Login");
        }
    }
}
