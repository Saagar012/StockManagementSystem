<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="CustomerDetails.aspx.cs" Inherits="MasterPageDemo.User.CustomerDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <p>
        <br />
    </p>

    <h3 style="margin-left: 6.5%; margin-top: 2%">Purchase Details of Customer From Last 31 Days.</h3>
    <div class="row" style="margin-left: 6.5%">
        <p>
            <asp:DropDownList ID="customerDropDownList" runat="server" CssClass="form-control" BorderColor="#CCCCCC" AutoPostBack="True" DataSourceID="getCustomerSqlDataSource" DataTextField="CustomerName" DataValueField="CustomerName" Height="35px" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" Width="300px">
            </asp:DropDownList>
            <%--<asp:TextBox ID="customerTextBox" BackColor="White" CssClass="form-control mt-2" BorderColor="#CCCCCC" runat="server" Style="width: 300px" ReadOnly="true"></asp:TextBox>--%>
        </p>
    </div>

    <div class="container" style="margin-left: 5.5%; margin-top: -3%">

            <asp:GridView ID="GridView2" class="table table-striped table-bordered mt-4" runat="server"   CellPadding="4" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" DataKeyNames="InvoiceNo">
                <Columns>
                    <asp:BoundField DataField="InvoiceNo" HeaderText="InvoiceNo" ReadOnly="True" SortExpression="InvoiceNo" />
                    <asp:BoundField DataField="CustomerId" HeaderText="CustomerId" SortExpression="CustomerId" />
                    <asp:BoundField DataField="CustomerName" HeaderText="CustomerName" SortExpression="CustomerName" />
                    <asp:BoundField DataField="BillDate" HeaderText="BillDate" SortExpression="BillDate" />
                    <asp:BoundField DataField="ItemCode" HeaderText="ItemCode" SortExpression="ItemCode" />
                    <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" />
                    <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" />
                    <asp:BoundField DataField="TotalAmount" HeaderText="TotalAmount" SortExpression="TotalAmount" />
                </Columns>
                <FooterStyle BackColor="White" ForeColor="#000066" />
                <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                <RowStyle ForeColor="#000066" />
                <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                <SortedAscendingHeaderStyle BackColor="#007DBB" />
                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                <SortedDescendingHeaderStyle BackColor="#00547E" />
            </asp:GridView>
    </div>
        <h3 style="margin-left: 7%; margin-top: 5%">Purchase Details of Customer Who Have Not Bought From Last 31 Days.</h3>

     <div class="row" style="margin-left: 7%">
        <p>
            <asp:GridView ID="GridView1" runat="server" class="table table-striped table-bordered mt-0" AutoGenerateColumns="False" DataSourceID="CustomerSqlDataSource1" CellPadding="4" ForeColor="#333333" GridLines="None">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="CustomerId" HeaderText="CustomerId" SortExpression="CustomerId" />
                    <asp:BoundField DataField="CustomerName" HeaderText="CustomerName" SortExpression="CustomerName" />
                    <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address" />
                    <asp:BoundField DataField="ContactNo" HeaderText="ContactNo" SortExpression="ContactNo" />
                    <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                    <asp:BoundField DataField="BillDate" HeaderText="BillDate" SortExpression="BillDate" />
                </Columns>
                <EditRowStyle BackColor="#2461BF" />
                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#EFF3FB" />
                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#F5F7FB" />
                <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                <SortedDescendingCellStyle BackColor="#E9EBEF" />
                <SortedDescendingHeaderStyle BackColor="#4870BE" />
            </asp:GridView>
        </p>
         <p>
             &nbsp;</p>
    </div>


    <p>
        &nbsp;
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:StockManagementConnectionString %>" DeleteCommand="DELETE FROM [Customer] WHERE [CustomerId] = @CustomerId" InsertCommand="INSERT INTO [Customer] ([CustomerId], [CustomerName], [Address], [ContactNo], [Email], [CustomerType]) VALUES (@CustomerId, @CustomerName, @Address, @ContactNo, @Email, @CustomerType)" SelectCommand="SELECT SellItems.InvoiceNo,SellItems.CustomerId, Customer.CustomerName, SellItems.BillDate,SellItems.ItemCode,SellItems.Quantity,SellItems.Price,SellItems.TotalAmount FROM [Customer] INNER JOIN SellItems ON Customer.CustomerId=SellItems.CustomerId WHERE ([CustomerName] = @CustomerName) AND BillDate &gt;= DATEADD(day,-31,GETDATE()) AND BillDate &lt;= getdate()" UpdateCommand="UPDATE [Customer] SET [CustomerName] = @CustomerName, [Address] = @Address, [ContactNo] = @ContactNo, [Email] = @Email, [CustomerType] = @CustomerType WHERE [CustomerId] = @CustomerId">
            <DeleteParameters>
                <asp:Parameter Name="CustomerId" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="CustomerId" Type="Int32" />
                <asp:Parameter Name="CustomerName" Type="String" />
                <asp:Parameter Name="Address" Type="String" />
                <asp:Parameter Name="ContactNo" Type="String" />
                <asp:Parameter Name="Email" Type="String" />
                <asp:Parameter Name="CustomerType" Type="String" />
            </InsertParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="customerDropDownList" Name="CustomerName" PropertyName="SelectedValue" Type="String" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="CustomerName" Type="String" />
                <asp:Parameter Name="Address" Type="String" />
                <asp:Parameter Name="ContactNo" Type="String" />
                <asp:Parameter Name="Email" Type="String" />
                <asp:Parameter Name="CustomerType" Type="String" />
                <asp:Parameter Name="CustomerId" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </p>
    <p>
        <asp:SqlDataSource ID="CustomerSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:StockManagementConnectionString %>" SelectCommand="SELECT * FROM [SellItems] WHERE ([CustomerId] = @CustomerId) AND BillDate >= DATEADD(day,-31,GETDATE()) AND BillDate <= getdate()" DeleteCommand="DELETE FROM [SellItems] WHERE [InvoiceNo] = @InvoiceNo" InsertCommand="INSERT INTO [SellItems] ([InvoiceNo], [BillDate], [ItemCode], [CategoryId], [CustomerId], [Quantity], [Price], [TotalAmount]) VALUES (@InvoiceNo, @BillDate, @ItemCode, @CategoryId, @CustomerId, @Quantity, @Price, @TotalAmount)" UpdateCommand="UPDATE [SellItems] SET [BillDate] = @BillDate, [ItemCode] = @ItemCode, [CategoryId] = @CategoryId, [CustomerId] = @CustomerId, [Quantity] = @Quantity, [Price] = @Price, [TotalAmount] = @TotalAmount WHERE [InvoiceNo] = @InvoiceNo">
            <DeleteParameters>
                <asp:Parameter Name="InvoiceNo" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="InvoiceNo" Type="Int32" />
                <asp:Parameter DbType="Date" Name="BillDate" />
                <asp:Parameter Name="ItemCode" Type="Int32" />
                <asp:Parameter Name="CategoryId" Type="Int32" />
                <asp:Parameter Name="CustomerId" Type="Int32" />
                <asp:Parameter Name="Quantity" Type="Int32" />
                <asp:Parameter Name="Price" Type="Int32" />
                <asp:Parameter Name="TotalAmount" Type="Int32" />
            </InsertParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="customerDropDownList" Name="CustomerId" PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter DbType="Date" Name="BillDate" />
                <asp:Parameter Name="ItemCode" Type="Int32" />
                <asp:Parameter Name="CategoryId" Type="Int32" />
                <asp:Parameter Name="CustomerId" Type="Int32" />
                <asp:Parameter Name="Quantity" Type="Int32" />
                <asp:Parameter Name="Price" Type="Int32" />
                <asp:Parameter Name="TotalAmount" Type="Int32" />
                <asp:Parameter Name="InvoiceNo" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </p>
    <p>
        <asp:SqlDataSource ID="getCustomerSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:StockManagementConnectionString %>" SelectCommand="SELECT * FROM [Customer]"></asp:SqlDataSource>
    </p>
    <p>
        <asp:SqlDataSource ID="CustomerSqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:StockManagementConnectionString %>" SelectCommand="SELECT SellItems.CustomerId, Customer.CustomerName,Customer.Address, Customer.ContactNo,Customer.Email,SellItems.BillDate FROM SellItems INNER JOIN Customer ON SellItems.CustomerId=Customer.CustomerId WHERE NOT BillDate &gt;= DATEADD(day,-31,GETDATE()) AND BillDate &lt;= getdate()"></asp:SqlDataSource>
    </p>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>

</asp:Content>
