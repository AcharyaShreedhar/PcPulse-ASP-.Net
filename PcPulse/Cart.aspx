<%@ Page Title="" Language="C#" MasterPageFile="~/PcPulse.Master" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="PcPulse.Cart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="server">
    <main>
        <hr />
        <div class="col-xs-12 col-sm-12 col-lg-12 form-group">
            <div class="form-group">
                <asp:Label ID="lblMessage" runat="server"
                    EnableViewState="False"
                    CssClass="text-danger col-sm-12">
                </asp:Label>
            </div>

            <div class="col-sm-8">
                <asp:Label runat="server" Text="My Cart List" Font-Bold="True"></asp:Label>
            </div>
            <div class="col-sm-4 text-right">
                <asp:Button ID="btnEmptyCart" runat="server" Text="Empty Cart" CssClass="btn btn-danger" OnClick="btnEmpty_Click" />
            </div>
            <hr />
        </div>

        <div class="col-xs-12 col-sm-12 col-lg-12 form-group">
            <div class="col-md-6">
                <div class="row">
                    <div class="col-sm-8">
                        <asp:Label runat="server" Text="Product" Font-Bold="True"></asp:Label>
                    </div>
                    <div class="col-sm-4 text-right">
                        <asp:Label runat="server" Text="Total" Font-Bold="True"></asp:Label>
                    </div>
                </div>
                <hr />
                <asp:Repeater ID="rptCartItems" runat="server">
                    <ItemTemplate>
                        <div class="row cart-item">
                            <div class="col-sm-3">
                                <img src='<%# ((PcPulse.Model.CartItem)Container.DataItem).Product.ProductImage %>' alt="Product Image" class="cart-image" />
                            </div>
                            <div class="col-sm-5">
                                <h4><%# ((PcPulse.Model.CartItem)Container.DataItem).Product.Name %></h4>
                                <p>Price: $<%# ((PcPulse.Model.CartItem)Container.DataItem).Product.Price.ToString("0.00") %></p>
                                <p>Quantity: <%# ((PcPulse.Model.CartItem)Container.DataItem).Quantity %></p>
                            </div>
                            <div class="col-sm-4 text-right">
                                <h4>$<%# CalculateTotalPrice(((PcPulse.Model.CartItem)Container.DataItem)) %></h4>
                                <asp:Button ID="btnRemoveItem" runat="server" Text="Remove" CssClass="btn btn-danger btn-sm" CommandArgument='<%# Eval("Product.ProductID") %>' OnClick="RemoveCartItem" />
                            </div>
                        </div>
                        <hr />
                    </ItemTemplate>
                </asp:Repeater>
            </div>
            <div class="col-md-6  text-right">
                <div class="cart-totals">
                    <asp:Label runat="server" Text="Cart Totals" Font-Bold="True" CssClass="text-right"></asp:Label>
                    <hr />
                    <div class="row">
                        <div class="col-sm-6">
                            <asp:Label ID="Label1" runat="server" CssClass="font-weight-bold"> SubTotal:</asp:Label>
                        </div>
                        <div class="col-sm-6">
                            <asp:Label ID="lblSubtotal" runat="server" CssClass="font-weight-bold"></asp:Label>
                        </div>

                    </div>
                    <hr />
                    <div class="row">
                        <div class="col-sm-6">
                            <asp:Label ID="Label2" runat="server" CssClass="font-weight-bold"> Tax (13%):</asp:Label>
                        </div>
                        <div class="col-sm-6">
                            <asp:Label ID="lblTax" runat="server" CssClass="font-weight-bold"></asp:Label>
                        </div>

                    </div>
                    <hr />
                    <div class="row">
                        <div class="col-sm-6">
                            <asp:Label ID="Label3" runat="server" CssClass="font-weight-bold"> Total:</asp:Label>
                        </div>
                        <div class="col-sm-6">
                            <asp:Label ID="lblTotal" runat="server" CssClass="font-weight-bold"></asp:Label>
                        </div>

                    </div>
                    <hr />
                    <div class="row">
                        <div class="col-sm-4"></div>
                        <div class="col-sm-4">
                            <asp:Button ID="btnContinueShopping" runat="server" Text="Continue Shopping" CssClass="btn btn-info" PostBackUrl="~/Products" />

                        </div>
                        <div class="col-sm-4">
                            <asp:Button ID="btnCheckout" runat="server" Text="Proceed To Checkout" CssClass="btn btn-primary" PostBackUrl="~/Checkout" />

                        </div>

                    </div>
                </div>
            </div>
        </div>

    </main>
</asp:Content>

