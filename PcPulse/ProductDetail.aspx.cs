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
    /// Represents the ProductDetail Page
    /// </summary>
    public partial class ProductDetail : System.Web.UI.Page
    {
        /// <summary>
        /// Handles the loading of the page.
        /// </summary>
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["ProductID"] != null)
                {
                    string productId = Request.QueryString["ProductID"].ToString();

                    string connectionString = ConfigurationManager.ConnectionStrings["SoftByte_PcPulse_ConnectionString"].ConnectionString;
                    string query = "SELECT [ProductID], [Name], [ShortDescription], [LongDescription], [Price], [StockQuantity], [ProductImage], [CategoryID] FROM [Products] WHERE [ProductID] = @ProductID";

                    using (SqlConnection connection = new SqlConnection(connectionString))
                    {
                        SqlCommand command = new SqlCommand(query, connection);
                        command.Parameters.AddWithValue("@ProductID", productId);

                        connection.Open();
                        SqlDataReader reader = command.ExecuteReader();

                        if (reader.Read())
                        {
                            lblProductName.Text = reader["Name"].ToString();
                            lblPrice.Text = Convert.ToDecimal(reader["Price"]).ToString("0.00");
                            lblShortDescription.Text = reader["ShortDescription"].ToString();
                            lblStock.Text = Convert.ToInt32(reader["StockQuantity"]).ToString()+"  in Stock";
                            lblLongDescription.Text = reader["LongDescription"].ToString();
                            string productImage = reader["ProductImage"].ToString();

                            Image1.ImageUrl = "Images/" + productImage;
                        }
                        else
                        {
                            // Product not found based on the given ProductID
                            // Handle the scenario accordingly (e.g., show an error message)
                        }

                        reader.Close();
                    }
                }
                else
                {
                    // ProductID parameter is missing in the URL
                    // Handle the scenario accordingly (e.g., redirect to an error page)
                }
            }
        }

        protected void btnIncrement_Click(object sender, EventArgs e)
        {
            // Implement logic to increment the quantity
            int quantity = Convert.ToInt32(txtQuantity.Text);
            txtQuantity.Text = (quantity + 1).ToString();
        }

        protected void btnDecrement_Click(object sender, EventArgs e)
        {
            // Implement logic to decrement the quantity
            int quantity = Convert.ToInt32(txtQuantity.Text);
            if (quantity > 1)
                txtQuantity.Text = (quantity - 1).ToString();
        }

        protected void btnAddToCart_Click(object sender, EventArgs e)
        {
            if (IsValid)
            {
                int productId = Convert.ToInt32(Request.QueryString["ProductID"]); // Assuming ProductID is an integer

                // Retrieve other necessary product details from labels or database if needed
                string productName = lblProductName.Text;
                decimal productPrice = Convert.ToDecimal(lblPrice.Text);

                CartItemList cart = CartItemList.GetCart();
                CartItem cartItem = cart[productId.ToString()]; // Assuming CartItem is identified by ProductID

                int quantity = Convert.ToInt32(txtQuantity.Text);

                if (cartItem == null)
                {
                    // Create a new cart item and add it to the cart
                    Product newProduct = new Product
                    {
                        ProductID = productId,
                        Name = productName,
                        Price = productPrice,
                        ProductImage= Image1.ImageUrl
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