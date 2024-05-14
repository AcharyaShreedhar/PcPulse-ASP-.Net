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
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PcPulse
{
    /// <summary>
    /// Represents the Login Pagehttps://localhost:44318/Login.aspx.cs
    /// </summary>
    public partial class Login : System.Web.UI.Page
    {
        /// <summary>
        /// Handles the loading of the page.
        /// </summary>
        protected void Page_Load(object sender, EventArgs e)
        {

            // Check if the user is already authenticated
            if (User.Identity.IsAuthenticated)
            {
                // Redirect to a different page if the user is already logged in
                Response.Redirect("~/Homepage");
            }
        }

        protected void LoginUser_Authenticate(object sender, EventArgs e)
        {
            string username = LoginUser.UserName;
            string password = LoginUser.Password;
            DropDownList userTypeDropdown = (DropDownList)LoginUser.FindControl("loggedUserType");
            string userType = userTypeDropdown.SelectedValue;



            // Validate user credentials against the database
            if (ValidateUser(username, password, userType))
            {

                Session["Username"] = username;
                Session["UserType"] = userType;
               
                Response.Redirect("~/Homepage");
            }
            else
            {
              
                lblMessage.Text = "Invalid User. Please try again with valid credentials";
            }
        }

        private bool ValidateUser(string username, string password, string userType)
        {
            // Connection string to your database
            string connectionString = ConfigurationManager.ConnectionStrings["SoftByte_PcPulse_ConnectionString"].ConnectionString;


            // Ensure using statement for proper disposal
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                // Use a parameterized query to prevent SQL injection
                string query = "SELECT COUNT(*) FROM Users WHERE Username = @Username AND Password = @Password AND UserType = @UserType";

                // Use a try-catch block for exception handling
                try
                {
                    connection.Open();

                    using (SqlCommand command = new SqlCommand(query, connection))
                    {
                        // Add parameters with proper SqlDbType
                        command.Parameters.Add("@Username", SqlDbType.NVarChar).Value = username;
                        command.Parameters.Add("@Password", SqlDbType.NVarChar).Value = password;
                        command.Parameters.Add("@UserType", SqlDbType.NVarChar).Value = userType;

                        // ExecuteScalar is more efficient for COUNT queries
                        int userCount = (int)command.ExecuteScalar();

                        // If userCount > 0, credentials are valid
                        return userCount > 0;
                    }
                }
                catch (SqlException ex)
                {
                    // Handle the exception (e.g., log it, throw it, or return false)
                    // For simplicity, returning false in case of an exception
                    return false;
                }
            }
        }


        protected void LoginUser_LoggedIn(object sender, EventArgs e)
        {
            // Redirect to a specific page after successful login
            Response.Redirect("~/Homepage");
        }

        protected void LogoutUser_Click(object sender, EventArgs e)
        {
            // Clear the session on logout
            Session.Clear();
            Response.Redirect("~/Login");
        }


    }
}
