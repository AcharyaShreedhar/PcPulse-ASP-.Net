<%@ Page Title="" Language="C#" MasterPageFile="~/PcPulse.Master" AutoEventWireup="true" CodeBehind="ProductsAdmin.aspx.cs" Inherits="PcPulse.ProductsAdmin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="server">
    <main>
        <div class="form-group">
            <div class="col-xs-12 col-sm-12 col-lg-12">
                <h2>List of Products:</h2>
            </div>


            <div class="col-xs-12 col-sm-12 col-lg-12">
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SoftByte_PcPulse_ConnectionString %>" DeleteCommand="DELETE FROM [Products] WHERE [ProductID] = @ProductID" InsertCommand="INSERT INTO [Products] ([Name], [ShortDescription], [LongDescription], [Price], [StockQuantity], [ProductImage], [CategoryID]) VALUES (@Name, @ShortDescription, @LongDescription, @Price, @StockQuantity, @ProductImage, @CategoryID)" SelectCommand="SELECT [ProductID], [Name], [ShortDescription], [LongDescription], [Price], [StockQuantity], [ProductImage], [CategoryID] FROM [Products] ORDER BY [Name]" UpdateCommand="UPDATE [Products] SET [Name] = @Name, [ShortDescription] = @ShortDescription, [LongDescription] = @LongDescription, [Price] = @Price, [StockQuantity] = @StockQuantity, [ProductImage] = @ProductImage, [CategoryID] = @CategoryID WHERE [ProductID] = @ProductID">
                    <DeleteParameters>
                        <asp:Parameter Name="ProductID" Type="Int32"></asp:Parameter>
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="Name" Type="String"></asp:Parameter>
                        <asp:Parameter Name="ShortDescription" Type="String"></asp:Parameter>
                        <asp:Parameter Name="LongDescription" Type="String"></asp:Parameter>
                        <asp:Parameter Name="Price" Type="Decimal"></asp:Parameter>
                        <asp:Parameter Name="StockQuantity" Type="Int32"></asp:Parameter>
                        <asp:Parameter Name="ProductImage" Type="String"></asp:Parameter>
                        <asp:Parameter Name="CategoryID" Type="Int32"></asp:Parameter>
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="Name" Type="String"></asp:Parameter>
                        <asp:Parameter Name="ShortDescription" Type="String"></asp:Parameter>
                        <asp:Parameter Name="LongDescription" Type="String"></asp:Parameter>
                        <asp:Parameter Name="Price" Type="Decimal"></asp:Parameter>
                        <asp:Parameter Name="StockQuantity" Type="Int32"></asp:Parameter>
                        <asp:Parameter Name="ProductImage" Type="String"></asp:Parameter>
                        <asp:Parameter Name="CategoryID" Type="Int32"></asp:Parameter>
                        <asp:Parameter Name="ProductID" Type="Int32"></asp:Parameter>
                    </UpdateParameters>
                </asp:SqlDataSource>
                <asp:GridView ID="GridView_Products" runat="server" OnPreRender="GridView_Products_PreRender" OnRowUpdated="GridView_Products_RowUpdated" OnRowDeleted="GridView_Products_RowDeleted"
                    CssClass="table table-bordered table-striped table-condensed table-responsive" AutoGenerateColumns="False" DataKeyNames="ProductID"
                    CellPadding="4" ForeColor="#333333" GridLines="None" DataSourceID="SqlDataSource1" AllowPaging="True" AllowSorting="True">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:BoundField DataField="ProductID" HeaderText="ID" ReadOnly="True" InsertVisible="False" SortExpression="ProductID">
                            <ItemStyle CssClass="col-xs-1" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name">
                            <ItemStyle CssClass="col-xs-2" />
                        </asp:BoundField>
                        <asp:BoundField DataField="ShortDescription" HeaderText="Short Description" SortExpression="ShortDescription">
                            <ItemStyle CssClass="col-xs-3" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price">
                            <ItemStyle CssClass="col-xs-1" />
                        </asp:BoundField>
                        <asp:BoundField DataField="StockQuantity" HeaderText="In Stock" SortExpression="StockQuantity">
                            <ItemStyle CssClass="col-xs-1" />
                        </asp:BoundField>
                        <asp:BoundField DataField="ProductImage" HeaderText="Image File" SortExpression="ProductImage">
                            <ItemStyle CssClass="col-xs-1" />
                        </asp:BoundField>
                        <asp:BoundField DataField="CategoryID" HeaderText="Category" SortExpression="CategoryID">
                            <ItemStyle CssClass="col-xs-1" />
                        </asp:BoundField>
                        <asp:CommandField ShowEditButton="True">
                            <ItemStyle CssClass="col-xs-1" />
                        </asp:CommandField>
                        <asp:CommandField ShowDeleteButton="True">
                            <ItemStyle CssClass="col-xs-1" />
                        </asp:CommandField>

                    </Columns>
                    <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                    <PagerSettings Mode="NextPrevious" NextPageText="Next" PreviousPageText="Previous....  " />
                    <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                    <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                    <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                    <SortedAscendingCellStyle BackColor="#FDF5AC" />
                    <SortedAscendingHeaderStyle BackColor="#4D0000" />
                    <SortedDescendingCellStyle BackColor="#FCF6C0" />
                    <SortedDescendingHeaderStyle BackColor="#820000" />
                </asp:GridView>
                <div class="col-xs-12">
                    <h2>Add New Product</h2>
                    <p>
                        <asp:Label ID="lblError" runat="server"
                            EnableViewState="false" CssClass="text-danger">
                        </asp:Label>
                    </p>
                    <asp:ValidationSummary ID="ValidationSummary1" runat="server"
                        HeaderText="Please correct the following errors:"
                        ValidationGroup="AddProduct" CssClass="text-danger" />

                    <asp:TextBox ID="txtName" runat="server" CssClass="form-control" placeholder="Product Name"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvName" runat="server" ControlToValidate="txtName"
                        ErrorMessage="Product Name is required." ValidationGroup="AddProduct" CssClass="text-danger"></asp:RequiredFieldValidator>

                    <asp:TextBox ID="txtShortDescription" runat="server" CssClass="form-control" placeholder="Short Description"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvShortDescription" runat="server" ControlToValidate="txtShortDescription"
                        ErrorMessage="Short Description is required." ValidationGroup="AddProduct" CssClass="text-danger"></asp:RequiredFieldValidator>

                    <asp:TextBox ID="txtLongDescription" runat="server" CssClass="form-control" placeholder="Long Description"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvLongDescription" runat="server" ControlToValidate="txtLongDescription"
                        ErrorMessage="Long Description is required." ValidationGroup="AddProduct" CssClass="text-danger"></asp:RequiredFieldValidator>

                    <asp:TextBox ID="txtPrice" runat="server" CssClass="form-control" placeholder="Price"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvPrice" runat="server" ControlToValidate="txtPrice"
                        ErrorMessage="Price is required." ValidationGroup="AddProduct" CssClass="text-danger"></asp:RequiredFieldValidator>

                    <asp:TextBox ID="txtStockQuantity" runat="server" CssClass="form-control" placeholder="Stock Quantity"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvStockQuantity" runat="server" ControlToValidate="txtStockQuantity"
                        ErrorMessage="Stock Quantity is required." ValidationGroup="AddProduct" CssClass="text-danger"></asp:RequiredFieldValidator>

                    <asp:TextBox ID="txtProductImage" runat="server" CssClass="form-control" placeholder="Product Image File"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvProductImage" runat="server" ControlToValidate="txtProductImage"
                        ErrorMessage="Product Image file is required." ValidationGroup="AddProduct" CssClass="text-danger"></asp:RequiredFieldValidator>

                    <asp:TextBox ID="txtCategoryID" runat="server" CssClass="form-control" placeholder="Category"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvCategoryID" runat="server" ControlToValidate="txtCategoryID"
                        ErrorMessage="Category  is required." ValidationGroup="AddProduct" CssClass="text-danger"></asp:RequiredFieldValidator>
                    <div class="col-xs-12 form-group">
                        <asp:Button ID="btnAddProduct" runat="server" Text="Add Product" CssClass="btn btn-primary"
                            ValidationGroup="AddProduct" OnClick="btnAddProduct_Click" />
                    </div>
                </div>
            </div>
        </div>
    </main>
</asp:Content>
