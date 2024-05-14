<%@ Page Title="" Language="C#" MasterPageFile="~/PcPulse.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="PcPulse.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="server">
    <main class="login_container">
        <h2>Login Form</h2>
        <div class="form-group">
            <asp:Label ID="lblMessage" runat="server"
                EnableViewState="False"
                CssClass="text-danger col-sm-12">
            </asp:Label>
        </div>
        <hr />
        <div class="login">
            <asp:Login ID="LoginUser" runat="server">
                <LayoutTemplate>
                    <div class="row form-group col-sm-12">
                        <label class="col-sm-4" for="UserName">Username:</label>
                        <div class="col-sm-8">
                            <asp:TextBox ID="UserName" runat="server" CssClass="form-control"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName"
                                ErrorMessage="Username is required." ForeColor="Red" Display="Dynamic">
                            </asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div class="row form-group col-sm-12">
                        <label class="col-sm-4" for="Password">Password:</label>
                        <div class="col-sm-8">
                            <asp:TextBox ID="Password" runat="server" TextMode="Password" CssClass="form-control"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password"
                                ErrorMessage="Password is required." ForeColor="Red" Display="Dynamic">
                            </asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div class="row form-group col-sm-12">
                        <label class="col-sm-4" for="loggedUserType">User Type:</label>
                        <div class="col-sm-8">
                            <asp:DropDownList ID="loggedUserType" runat="server" CssClass="form-control">
                                <asp:ListItem Text="Customer" Value="Customer"></asp:ListItem>
                                <asp:ListItem Text="Admin" Value="Admin"></asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>
                    <div class="row form-group col-sm-12">
                        <div class="col-sm-offset-4 col-sm-8">
                            <asp:Button ID="LoginButton" runat="server" OnClick="LoginUser_Authenticate" Text="Log In" CssClass="btn btn-primary" />

                        </div>
                    </div>
                </LayoutTemplate>
            </asp:Login>
        </div>
    </main>
</asp:Content>
