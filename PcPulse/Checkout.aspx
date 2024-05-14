<%@ Page Title="" Language="C#" MasterPageFile="~/PcPulse.Master" AutoEventWireup="true" CodeBehind="Checkout.aspx.cs" Inherits="PcPulse.Checkout" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="server">


    <main>
        <h2>Check Out Page</h2>
        <div class="validation-summary">
            <asp:ValidationSummary ID="ValidationSummary1" runat="server" CssClass="alert alert-danger" ValidationGroup="CheckoutValidation" />
        </div>

        <div class="row">
            <div>
                <h3>Contact Information</h3>
                <div class="form-group">
                    <asp:Label runat="server" CssClass="text-center" Text="Your Email Address"></asp:Label>
                    <asp:TextBox runat="server" ID="email" CssClass="form-control" placeholder="Enter your email"></asp:TextBox>
                    <div class="error-div">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorEmail" CssClass="alert alert-danger" runat="server" ControlToValidate="email" ErrorMessage="Email is required." ValidationGroup="CheckoutValidation"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidatorEmail" CssClass="alert alert-danger" runat="server" ControlToValidate="email" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ErrorMessage="Your email address is not valid" ValidationGroup="CheckoutValidation"></asp:RegularExpressionValidator>
                    </div>
                </div>
                <div class="form-group">
                    <asp:Label runat="server" CssClass="text-center" Text="Email Re-entry"></asp:Label>
                    <asp:TextBox runat="server" ID="reenterEmail" CssClass="form-control" placeholder="Reenter your email"></asp:TextBox>
                    <div class="error-div">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorReenterEmail" CssClass="alert alert-danger" runat="server" ControlToValidate="reenterEmail" ErrorMessage="Please reenter your email." ValidationGroup="CheckoutValidation"></asp:RequiredFieldValidator>
                        <asp:CompareValidator ID="CompareValidatorEmail" runat="server" CssClass="alert alert-danger" ControlToCompare="email" ControlToValidate="reenterEmail" Operator="Equal" ErrorMessage="Must match first email address" ValidationGroup="CheckoutValidation"></asp:CompareValidator>

                    </div>
                </div>
                <div class="form-group">
                    <asp:Label runat="server" CssClass="text-center" Text="F Name"></asp:Label>
                    <asp:TextBox runat="server" ID="firstName" CssClass="form-control" placeholder="Enter your first name"></asp:TextBox>
                    <div class="error-div">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorFirstName" CssClass="alert alert-danger" runat="server" ControlToValidate="firstName" ErrorMessage="First Name is required." ValidationGroup="CheckoutValidation"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="form-group">
                    <asp:Label runat="server" CssClass="text-center" Text="L Name"></asp:Label>
                    <asp:TextBox runat="server" ID="lastName" CssClass="form-control" placeholder="Enter your last name"></asp:TextBox>
                    <div class="error-div">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorLastName" CssClass="alert alert-danger" runat="server" ControlToValidate="lastName" ErrorMessage="Last Name is required." ValidationGroup="CheckoutValidation"></asp:RequiredFieldValidator>

                    </div>
                </div>
                <div class="form-group">
                    <asp:Label runat="server" CssClass="text-center" Text="Phone Number"></asp:Label>
                    <asp:TextBox runat="server" ID="phoneNumber" CssClass="form-control" placeholder="Enter your phone number"></asp:TextBox>
                    <div class="error-div">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorPhoneNumber" CssClass="alert alert-danger" runat="server" ControlToValidate="phoneNumber" ErrorMessage="Phone Number is required." ValidationGroup="CheckoutValidation"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidatorPhoneNumber" CssClass="alert alert-danger" runat="server"
                            ControlToValidate="phoneNumber"
                            ValidationExpression="\d{3}-\d{3}-\d{4}"
                            ErrorMessage="Use this format: 123-456-7890."
                            ValidationGroup="CheckoutValidation"></asp:RegularExpressionValidator>
                    </div>
                </div>

            </div>
        </div>
        <hr class="section_divider" />
        <!-- Section 2: Billing Address -->
        <div class="row">
            <div>
                <h2>Billing Address</h2>
                <!-- Address -->
                <div class="form-group">
                    <asp:Label runat="server" CssClass="text-center" Text="Address"></asp:Label>
                    <asp:TextBox runat="server" ID="address" CssClass="form-control" placeholder="Enter your address"></asp:TextBox>
                    <div class="error-div">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorAddress" CssClass="alert alert-danger" runat="server" ControlToValidate="address" ErrorMessage="Address is required." ValidationGroup="CheckoutValidation"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <!-- City -->
                <div class="form-group">
                    <asp:Label runat="server" CssClass="text-center" Text="City"></asp:Label>
                    <asp:TextBox runat="server" ID="city" CssClass="form-control" placeholder="Enter your city"></asp:TextBox>
                    <div class="error-div">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorCity" CssClass="alert alert-danger" runat="server" ControlToValidate="city" ErrorMessage="City is required." ValidationGroup="CheckoutValidation"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <!-- State -->
                <div class="form-group">
                    <asp:Label runat="server" CssClass="text-center" Text="State"></asp:Label>
                    <asp:DropDownList runat="server" ID="ddlState" CssClass="form-control" placeholder="Select your state">
                        <asp:ListItem Text="-- Select State --" Value=""></asp:ListItem>
                        <asp:ListItem Text="Alberta" Value="AB"></asp:ListItem>
                        <asp:ListItem Text="British Columbia" Value="BC"></asp:ListItem>
                        <asp:ListItem Text="Manitoba" Value="MB"></asp:ListItem>
                        <asp:ListItem Text="New Brunswick" Value="NB"></asp:ListItem>
                        <asp:ListItem Text="Newfoundland and Labrador" Value="NL"></asp:ListItem>
                        <asp:ListItem Text="Northwest Territories" Value="NT"></asp:ListItem>
                        <asp:ListItem Text="Nova Scotia" Value="NS"></asp:ListItem>
                        <asp:ListItem Text="Nunavut" Value="NU"></asp:ListItem>
                        <asp:ListItem Text="Ontario" Value="ON"></asp:ListItem>
                        <asp:ListItem Text="Prince Edward Island" Value="PE"></asp:ListItem>
                        <asp:ListItem Text="Quebec" Value="QC"></asp:ListItem>
                        <asp:ListItem Text="Saskatchewan" Value="SK"></asp:ListItem>
                        <asp:ListItem Text="Yukon" Value="YT"></asp:ListItem>
                    </asp:DropDownList>
                    <div class="error-div">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorState" CssClass="alert alert-danger" runat="server" ControlToValidate="ddlState" ErrorMessage="State is required." ValidationGroup="CheckoutValidation"></asp:RequiredFieldValidator>
                    </div>
                </div>

                <!-- Zip -->
                <div class="form-group">
                    <asp:Label runat="server" CssClass="text-center" Text="Zip Code"></asp:Label>
                    <asp:TextBox runat="server" ID="zip" CssClass="form-control" placeholder="Enter your zip"></asp:TextBox>
                    <div class="error-div">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorZip" CssClass="alert alert-danger" runat="server" ControlToValidate="zip" ErrorMessage="Zip Code is required." ValidationGroup="CheckoutValidation"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidatorZip" CssClass="alert alert-danger" runat="server" ControlToValidate="zip" ValidationExpression="^\d{5}(-\d{4})?$" ErrorMessage="Use this format 99999 or 99999-9999." ValidationGroup="CheckoutValidation"></asp:RegularExpressionValidator>
                    </div>
                </div>

            </div>
        </div>
        <hr class="section_divider" />

        <!-- Section 3: Optional Data -->
        <div class="row">
            <div class="optional-section">
                <h2>Optional Data</h2>
                <h4>Please Let me know about</h4>
                <!-- Checkboxes -->
                <div class="form-check-inline">
                    <asp:CheckBox runat="server" ID="newProducts" Text="New Products" CssClass="form-check-input" />
                    <asp:CheckBox runat="server" ID="newEditions" Text="New Editions" CssClass="form-check-input" />
                </div>
                <div class="form-check-inline">
                    <asp:CheckBox runat="server" ID="specialOffers" Text="Special Offers" CssClass="form-check-input" />
                    <asp:CheckBox runat="server" ID="localEvents" Text="Local Events" CssClass="form-check-input" />
                </div>
                <hr class="section_divider" />
                <!-- Radio Buttons -->
                <h4>Please get in touch via</h4>
                <div class="form-check-inline">
                    <asp:RadioButton runat="server" ID="twitter" Text="Twitter" CssClass="form-check-input" GroupName="contactMethod" />
                    <asp:RadioButton runat="server" ID="facebook" Text="Facebook" CssClass="form-check-input" GroupName="contactMethod" />
                    <asp:RadioButton runat="server" ID="emailRadio" Text="Email" CssClass="form-check-input" GroupName="contactMethod" />
                    <asp:RadioButton runat="server" ID="sms" Text="SMS" CssClass="form-check-input" GroupName="contactMethod" />

                </div>
            </div>
        </div>
        <hr class="section_divider" />

        <!-- Section 4: Checkout Buttons -->
        <div class="row">
            <div>
                <!-- Checkout Button -->
                <asp:Button runat="server" ID="checkoutButton" Text="Check Out" CssClass="btn btn-primary" ValidationGroup="CheckoutValidation" OnClick="CheckoutButtonClick" />
                <!-- Cancel Order Button -->
                <asp:Button runat="server" ID="cancelButton" Text="Cancel Order" CssClass="btn btn-secondary" OnClick="CancelButtonClick" />
                <!-- Continue Shopping Button -->
                <asp:Button runat="server" ID="continueShoppingButton" Text="Continue Shopping" PostBackUrl="~/Products" CssClass="btn btn-success" />
            </div>
        </div>
    </main>
</asp:Content>
