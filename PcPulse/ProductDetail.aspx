<%@ Page Title="" Language="C#" MasterPageFile="~/PcPulse.Master" AutoEventWireup="true" CodeBehind="ProductDetail.aspx.cs" Inherits="PcPulse.ProductDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="server">
    <main class="form-horizontal">
        <div class="form-group">
            <asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>
            <div class="col-xs-12 col-sm-12 col-lg-12">
                <div class="col-xs-6 col-sm-6 col-lg-6">
                    <asp:Image ID="Image1" runat="server" class="img-responsive product-image"/>
                </div>
                <div class="col-xs-6 col-sm-6 col-lg-6">
                    <h2>
                        <asp:Label ID="lblProductName" runat="server"></asp:Label></h2>
                    <hr />
                    <p><strong>Price:</strong> $<asp:Label ID="lblPrice" runat="server"></asp:Label></p>
                    <p>
                        <asp:Label ID="lblShortDescription" runat="server"></asp:Label>
                    </p>
                    <hr />
                    <p>
                        <asp:Label ID="lblStock" runat="server"></asp:Label>
                    </p>
                    <div class="quantity-container">
                        <asp:Button ID="btnDecrement" runat="server" Text="-" CssClass="quantity-button" OnClick="btnDecrement_Click" />
                        <asp:TextBox ID="txtQuantity" runat="server" CssClass="quantity-input" Text="1" ReadOnly="true"></asp:TextBox>
                        <asp:Button ID="btnIncrement" runat="server" Text="+" CssClass="quantity-button" OnClick="btnIncrement_Click" />
                        <asp:Button ID="btnAddToCart" runat="server" Text="Add to Cart" CssClass="btn btn-primary" OnClick="btnAddToCart_Click" />
                        <asp:Button ID="ButtonViewCart" runat="server" Text="View Cart" CssClass="btn btn-info" PostBackUrl="~/Cart" />
                    </div>
                </div>
            </div>
            <hr />
            <div class="col-xs-12 col-sm-12 col-lg-12">
                <p>
                    <asp:Label ID="lblLongDescription" runat="server"></asp:Label>
                </p>
            </div>
        </div>
    </main>
</asp:Content>
