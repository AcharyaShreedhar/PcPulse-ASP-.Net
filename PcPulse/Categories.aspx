<%@ Page Title="" Language="C#" MasterPageFile="~/PcPulse.Master" AutoEventWireup="true" CodeBehind="Categories.aspx.cs" Inherits="PcPulse.Categories" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="server">
    <main>
        <div class="form-group">
            <div class="col-xs-12 col-sm-12 col-lg-12">
                <h2>List of Categories:</h2>
            </div>
            <div class="col-xs-12 col-sm-12 col-lg-12">
                <asp:SqlDataSource ID="SqlDataSourceCategories" runat="server" ConnectionString="<%$ ConnectionStrings:SoftByte_PcPulse_ConnectionString %>" DeleteCommand="DELETE FROM [Categories] WHERE [CategoryID] = @CategoryID" InsertCommand="INSERT INTO [Categories] ([ShortName], [LongName]) VALUES (@ShortName, @LongName)" SelectCommand="SELECT [CategoryID], [ShortName], [LongName] FROM [Categories] ORDER BY [LongName]" UpdateCommand="UPDATE [Categories] SET [ShortName] = @ShortName, [LongName] = @LongName WHERE [CategoryID] = @CategoryID">
                    <DeleteParameters>
                        <asp:Parameter Name="CategoryID" Type="Int32"></asp:Parameter>
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="ShortName" Type="String"></asp:Parameter>
                        <asp:Parameter Name="LongName" Type="String"></asp:Parameter>
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="ShortName" Type="String"></asp:Parameter>
                        <asp:Parameter Name="LongName" Type="String"></asp:Parameter>
                        <asp:Parameter Name="CategoryID" Type="Int32"></asp:Parameter>
                    </UpdateParameters>
                </asp:SqlDataSource>
                <asp:GridView ID="GridViewCategories" runat="server" CssClass="table table-bordered table-striped table-condensed table-responsive"
                    CellPadding="4" ForeColor="#333333" GridLines="None" DataSourceID="SqlDataSourceCategories" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="CategoryID" OnPreRender="GridViewCategories_PreRender" OnRowUpdated="GridViewCategories_RowUpdated" OnRowDeleted="GridViewCategories_RowDeleted">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>

                        <asp:BoundField DataField="CategoryID" HeaderText="Category ID" ReadOnly="True" InsertVisible="False" SortExpression="CategoryID">
                            <ItemStyle CssClass="col-xs-3" />
                        </asp:BoundField>
                        <asp:BoundField DataField="ShortName" HeaderText="Short Name" SortExpression="ShortName">
                            <ItemStyle CssClass="col-xs-3" />
                        </asp:BoundField>
                        <asp:BoundField DataField="LongName" HeaderText="Long Name" SortExpression="LongName">
                            <ItemStyle CssClass="col-xs-3" />
                        </asp:BoundField>
                        <asp:CommandField ShowEditButton="True" CausesValidation="false">
                            <ItemStyle CssClass="col-xs-3" />
                        </asp:CommandField>
                        <asp:CommandField ShowDeleteButton="True" CausesValidation="false">
                            <ItemStyle CssClass="col-xs-3" />
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
                    <h2>Create a new category</h2>
                    <p>
                        <asp:Label ID="lblError" runat="server" EnableViewState="false" CssClass="text-danger"></asp:Label>
                    </p>
                    <asp:ValidationSummary ID="ValidationSummary1" runat="server"
                        HeaderText="Please correct the following errors:"
                        ValidationGroup="AddProduct" CssClass="text-danger" />
                    <div class="form-group">
                        <label for="txtShortName" class="col-sm-2">C. S Name:</label>
                        <div class="col-sm-4">
                            <asp:TextBox ID="txtShortName" runat="server" MaxLength="15" CssClass="form-control"></asp:TextBox>
                        </div>
                        <div class="col-sm-offset-2 col-sm-4">
                            <asp:RequiredFieldValidator ID="rfvShortName" runat="server" CssClass="text-danger" ControlToValidate="txtShortName" ErrorMessage="Short Name is a required field"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="txtLongName" class="col-sm-2">C. L Name:</label>
                        <div class="col-sm-6">
                            <asp:TextBox ID="txtLongName" runat="server" MaxLength="50" CssClass="form-control"></asp:TextBox>
                        </div>
                        <div class="col-sm-4">
                            <asp:RequiredFieldValidator ID="rfvLongName" runat="server" CssClass="text-danger" ControlToValidate="txtLongName" ErrorMessage="Long Name is a required field"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div class="form-group">
                        <asp:Button ID="btnAddCategory" runat="server" Text="Add New Category" CssClass="btn btn-primary" OnClick="btnAddCategory_Click" />
                    </div>
                </div>
            </div>
        </div>
    </main>
</asp:Content>
