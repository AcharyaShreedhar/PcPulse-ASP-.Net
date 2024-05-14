using System;
using System.Collections.Generic;
using System.Data.SqlClient;
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



using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

namespace PcPulse
{
    /// <summary>
    /// Represents the Categories page 
    /// </summary>
    public partial class Categories: System.Web.UI.Page
    {
        /// <summary>
        /// Handles the loading of the page.
        /// </summary>
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void GridViewCategories_PreRender(object sender, EventArgs e)
        {
            if (GridViewCategories.HeaderRow != null)
            {
                GridViewCategories.HeaderRow.TableSection = TableRowSection.TableHeader;
            }
        }
        protected void btnAddCategory_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                try
                {
                    // Assign input values to the SQL data source parameters
                    var parameters = SqlDataSourceCategories.InsertParameters;
                    parameters["ShortName"].DefaultValue = txtShortName.Text;
                    parameters["LongName"].DefaultValue = txtLongName.Text;
                    // Execute the insert command
                    SqlDataSourceCategories.Insert();

                    // Clear input fields after successful insertion
                    txtShortName.Text = "";
                    txtLongName.Text = "";
                   
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

        protected void GridViewCategories_RowUpdated(object sender, GridViewUpdatedEventArgs e)
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
        protected void GridViewCategories_RowDeleted(object sender,
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