<%@ Page Title="" Language="C#" MasterPageFile="~/PcPulse.Master" AutoEventWireup="true" CodeBehind="Products.aspx.cs" Inherits="PcPulse.Products" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="server">
    <main>
        <div class="form-group">
            <div class="col-xs-12 col-sm-12 col-lg-12">
                <div class="col-xs-4 col-sm-4 col-lg-4">
                    <asp:Label class="col-xs-12 col-sm-12 col-lg-12 form-group" runat="server" Text="Products List" Font-Bold="True"></asp:Label>
                </div>
                <div class="col-xs-8 col-sm-8 col-lg-8 form-group">
                    <asp:Label class="col-xs-4 col-sm-4 col-lg-4" runat="server" Text="Filter Products:"></asp:Label>
                    <div class="col-xs-8 col-sm-8 col-lg-8">
                        <asp:SqlDataSource ID="SqlDataSourceCategory" runat="server" ConnectionString="<%$ ConnectionStrings:SoftByte_PcPulse_ConnectionString %>" SelectCommand="SELECT [CategoryID], [LongName] FROM [Categories]"></asp:SqlDataSource>
                        <asp:DropDownList ID="DropDownListCategory" runat="server" DataTextField="LongName" DataValueField="CategoryID" DataSourceID="SqlDataSourceCategory" AutoPostBack="True"></asp:DropDownList>
                    </div>
                </div>
            </div>

            <div class="col-xs-12 col-sm-12 col-lg-12">
                <asp:SqlDataSource ID="SqlDataSourceProducts" runat="server" ConnectionString="<%$ ConnectionStrings:SoftByte_PcPulse_ConnectionString %>" SelectCommand="SELECT [ProductID], [Name], [ShortDescription], [Price], [ProductImage], [CategoryID] FROM [Products] WHERE ([CategoryID] = @CategoryID) ORDER BY [Name]">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownListCategory" PropertyName="SelectedValue" Name="CategoryID" Type="Int32"></asp:ControlParameter>
                    </SelectParameters>
                </asp:SqlDataSource>
                <div class="product-grid">
                    <asp:Repeater ID="RepeaterProducts" runat="server" DataSourceID="SqlDataSourceProducts">
                        <ItemTemplate>
                            <div class="panel panel-default">
                                <div class="panel-body">
                                    <a href='<%# "ProductDetail?ProductID=" + Eval("ProductID") %>'>
                                        <div class="row">
                                            <div class="col-sm-12">
                                                <img src='<%# "Images/" + Eval("ProductImage") %>' alt="Product Image" class="img-responsive product-image" />
                                            </div>
                                            <div class="col-sm-12">
                                                <h4><%# Eval("Name") %></h4>
                                                <p><%# Eval("ShortDescription") %></p>
                                                <p><strong>Price:$</strong> $<%# Eval("Price") %></p>
                                                <asp:Button ID="btnAddToCart" runat="server" Text="Add to Cart" CssClass="btn btn-primary" OnClick="btnAddToCart_Click" CommandArgument='<%# Eval("ProductID") %>' />
                                            </div>
                                        </div>
                                    </a>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>


                </div>
            </div>
        </div>
    </main>
</asp:Content>
