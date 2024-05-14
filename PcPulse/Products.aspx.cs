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

using PcPulse.Model;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PcPulse
{
    /// <summary>
    /// Represents the Products
    /// </summary>
    public partial class Products : System.Web.UI.Page
    {
        /// <summary>
        /// Handles the loading of the page.
        /// </summary>
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnAddToCart_Click(object sender, EventArgs e)
        {
            Button btnAddToCart = (Button)sender;
            String productID = btnAddToCart.CommandArgument;

            string connectionString = ConfigurationManager.ConnectionStrings["SoftByte_PcPulse_ConnectionString"].ConnectionString;
            string query = "SELECT [ProductID], [Name], [ShortDescription], [LongDescription], [Price], [StockQuantity], [ProductImage], [CategoryID] FROM [Products] WHERE [ProductID] = @ProductID";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand(query, connection);
                command.Parameters.AddWithValue("@ProductID", productID);

                connection.Open();
                SqlDataReader reader = command.ExecuteReader();

                if (reader.Read())
                {
                    CartItemList cart = CartItemList.GetCart();
                    CartItem cartItem = cart[productID.ToString()]; // Assuming CartItem is identified by ProductID

                    int quantity = 1;

                    if (cartItem == null)
                    {
                        // Create a new cart item and add it to the cart
                        Product newProduct = new Product
                        {
                            ProductID = Convert.ToInt32(productID),
                            Name = reader["Name"].ToString(),
                            Price = Convert.ToDecimal(reader["Price"]),
                            ProductImage = "Images/" + reader["ProductImage"].ToString()
                            // Add other properties as needed
                        };
                        cart.AddItem(newProduct, quantity);
                    }
                    else
                    {
                        // If the item exists in the cart, increase its quantity
                        cartItem.AddQuantity(quantity);
                    }

                    Response.Redirect("~/Cart");

                }
            }
        }
    }
}