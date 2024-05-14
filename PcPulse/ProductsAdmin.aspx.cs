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
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PcPulse
{
    /// <summary>
    /// Represents the ProductsAdmin
    /// </summary>
    public partial class ProductsAdmin : System.Web.UI.Page
    {
        /// <summary>
        /// Handles the loading of the page.
        /// </summary>
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void GridView_Products_PreRender(object sender, EventArgs e)
        {
            if (GridView_Products.HeaderRow != null)
            {
                GridView_Products.HeaderRow.TableSection = TableRowSection.TableHeader;
            }
        }
        protected void btnAddProduct_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                try
                {
                    // Assign input values to the SQL data source parameters
                    var parameters = SqlDataSource1.InsertParameters;
                    parameters["Name"].DefaultValue = txtName.Text;
                    parameters["ShortDescription"].DefaultValue = txtShortDescription.Text;
                    parameters["LongDescription"].DefaultValue = txtLongDescription.Text;
                    parameters["Price"].DefaultValue = txtPrice.Text;
                    parameters["StockQuantity"].DefaultValue = txtStockQuantity.Text;
                    parameters["ProductImage"].DefaultValue = txtProductImage.Text;
                    parameters["CategoryID"].DefaultValue = txtCategoryID.Text;

                    // Execute the insert command
                    SqlDataSource1.Insert();

                    // Clear input fields after successful insertion
                    txtName.Text = "";
                    txtShortDescription.Text = "";
                    txtLongDescription.Text = "";
                    txtPrice.Text = "";
                    txtStockQuantity.Text = "";
                    txtProductImage.Text = "";
                    txtCategoryID.Text = "";
                }
                catch (Exception ex)
                {
                    lblError.Text = DatabaseErrorMessage(ex.Message);
                }
            }
        }
        private string DatabaseErrorMessage(string errorMsg)
        {
            return $"<b>A database error has occurred:</b> {errorMsg}";
        }

        protected void GridView_Products_RowUpdated(object sender, GridViewUpdatedEventArgs e)
        {
            if (e.Exception != null)
            {
                lblError.Text =
                DatabaseErrorMessage(e.Exception.Message);
                e.ExceptionHandled = true;
                e.KeepInEditMode = true;
            }
            else if (e.AffectedRows == 0)
            {
                lblError.Text = ConcurrencyErrorMessage();
            }
        }
        protected void GridView_Products_RowDeleted(object sender,
        GridViewDeletedEventArgs e)
        {

            if (e.Exception != null)
            {
                lblError.Text =
                DatabaseErrorMessage(e.Exception.Message);
                e.ExceptionHandled = true;
            }
            else if (e.AffectedRows == 0)
            {
                lblError.Text = "Hi 8899288," + ConcurrencyErrorMessage();
            }
        }

        private string ConcurrencyErrorMessage()
        {
            return "Another user may have updated that category. " +
            "Please try again";
        }



    }
}