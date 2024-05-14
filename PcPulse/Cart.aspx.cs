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
using System.Web.UI.WebControls;
using PcPulse.Model;

namespace PcPulse
{
    /// <summary>
    /// Represents the Cart page where users can view and manage their cart items.
    /// </summary>
    public partial class Cart : System.Web.UI.Page
    {
        private CartItemList cart;

        /// <summary>
        /// Handles the loading of the page.
        /// </summary>
        protected void Page_Load(object sender, EventArgs e)
        {
            cart = CartItemList.GetCart();

            if (!IsPostBack)
            {
                BindCartItems();
                CalculateAndDisplayTotal();
            }
        }
        /// <summary>
        /// Binds the cart items to the repeater.
        /// </summary>

        private void BindCartItems()
        {
            rptCartItems.DataSource = cart;
            rptCartItems.DataBind();
        }

        /// <summary>
        /// Calculates the total price for a cart item.
        /// </summary>
        /// <param name="cartItem">The cart item to calculate the total price for.</param>
        /// <returns>The total price as a string.</returns>
        protected string CalculateTotalPrice(PcPulse.Model.CartItem cartItem)
        {
            decimal totalPrice = cartItem.Product.Price * cartItem.Quantity;
            return totalPrice.ToString("0.00");
        }

        /// <summary>
        /// Calculates and displays the subtotal, tax, and total amounts.
        /// </summary>
        private void CalculateAndDisplayTotal()
        {
            decimal taxRate = 0.13m; // Tax rate as a decimal (13% = 0.13)
            decimal subtotal = 0;
            decimal taxAmount = 0;
            decimal totalAmount = 0;

            // Calculate subtotal
            foreach (var item in cart)
            {
                subtotal += (item.Product.Price * item.Quantity);
            }

            // Calculate tax amount
            taxAmount = subtotal * taxRate;

            // Calculate total amount (subtotal + tax)
            totalAmount = subtotal + taxAmount;

            // Display values
            lblSubtotal.Text = "$" + subtotal.ToString("0.00");
            lblTax.Text = " $" + taxAmount.ToString("0.00");
            lblTotal.Text = "$" + totalAmount.ToString("0.00");
        }

        /// <summary>
        /// Handles the click event for emptying the cart.
        /// </summary>

        protected void btnEmpty_Click(object sender, EventArgs e)
        {
            CartItemList cart = CartItemList.GetCart();

            // Check if the cart has items
            if (cart.Count > 0)
            {
                cart.Clear(); // Clear the cart items
                rptCartItems.DataSource = null; // Clear the Repeater data source
                rptCartItems.DataBind(); // Rebind the Repeater to update the view

                // Clear the cart totals
                lblSubtotal.Text = "";
                lblTax.Text = "";
                lblTotal.Text = "";
            }
            else
            {
                lblMessage.Text ="Your Cart is already Empty";
            }
        }

        /// <summary>
        /// Handles the click event for removing a cart item.
        /// </summary>
        /// <param name="sender">The sender of the event.</param>
        /// <param name="e">The event arguments.</param>
        protected void RemoveCartItem(object sender, EventArgs e)
        {
            Button btnRemoveItem = (Button)sender;
            string productID = btnRemoveItem.CommandArgument;

            // Use this productID to remove the item from the cart
            // Your removal logic goes here based on the productID
            // For example:
            CartItemList cart = CartItemList.GetCart();
            cart.RemoveItem(productID);

            // Rebind the repeater to reflect the updated cart
            rptCartItems.DataSource = cart; // Assuming your cart provides items as a data source
            rptCartItems.DataBind();

            // Update the cart totals if needed
            UpdateCartTotals();
        }

        /// <summary>
        /// Updates the cart totals after a modification.
        /// </summary>
        private void UpdateCartTotals()
        {
            CalculateAndDisplayTotal(); // Recalculate totals after cart modification
        }



    }
}
