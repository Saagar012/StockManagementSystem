<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="PurchaseItems.aspx.cs" Inherits="MasterPageDemo.User.PurchaseItems" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <h2 style="margin-left: 0%; margin-bottom: -2%">Purchase Items </h2>
    &nbsp;&nbsp;&nbsp;&nbsp;
    
    <div class="row">
        <div class="col-sm-5">
            Invoice No :
                <asp:TextBox ID="invoiceNo" type="Number" ReadOnly="true"  BorderColor="#CCCCCC" BackColor="White" Class="form-control" runat="server"></asp:TextBox>
        </div>
        <div class="col-sm-5">
            Purchased Date :
            <asp:TextBox ID="billDate" type="date" Class="form-control"  BorderColor="#CCCCCC" runat="server"></asp:TextBox>
            <%--&nbsp;&nbsp;<asp:ImageButton ID="billDateCalendar" runat="server" ImageUrl="~/imgs/calendar.png" ImageAlign="AbsBottom" OnClick="billDateCalendar_Click" />--%>
        </div>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1"  Style="margin-left: 37%; font-size: 35px; position: absolute; top: 17%" ControlToValidate="billDate" runat="server" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>

        <div class="col-sm-10">
            Supplier Name :
            <asp:DropDownList ID="supplierDropDownList" BorderColor="#CCCCCC"  CssClass="form-control" runat="server" DataSourceID="getSupplierSqlDataSource" DataTextField="Supp_name" DataValueField="Supp_id" AutoPostBack="True">
            </asp:DropDownList>
        </div>
    </div>


    <div class="row">
        <div class="col-sm-10 mt-1" style="margin-bottom: -2%">
            Item Name : 
             <asp:DropDownList ID="ItemDropDownList" AutoPostBack="true"  CssClass="form-control" BorderColor="#CCCCCC" runat="server" DataSourceID="getItemsSqlDataSource" DataTextField="ItemName" DataValueField="ItemCode">
             </asp:DropDownList>
            &nbsp;&nbsp;
        </div>

        <div class="col-sm-5 mb-5">
            Quantity:&nbsp;&nbsp;<asp:TextBox type="number"  BorderColor="#CCCCCC" ID="quantity" Class="form-control" runat="server"></asp:TextBox>
            &nbsp;&nbsp;&nbsp;
        </div>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2"  Style="margin-left: 18%; font-size: 35px; position: absolute; top: 46%" ControlToValidate="quantity" runat="server" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>

        <div class="col-sm-5">
            Amount:&nbsp;&nbsp;<asp:TextBox ID="amount"  Class="form-control" BorderColor="#CCCCCC" runat="server"></asp:TextBox>
            &nbsp;&nbsp;&nbsp;   
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        </div>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator3"  Style="margin-left: 37%; font-size: 35px; position: absolute; top: 46%" ControlToValidate="amount" runat="server" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>

    </div>
    <div style="margin-left: 0%; margin-top: -10%">
        Total Amount:
     <br />
        <asp:TextBox ID="totalAmount" Width="83%"  CssClass="form-control" BorderColor="#CCCCCC" runat="server"></asp:TextBox>
    </div>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator4"  Style="margin-left: 36.2%; font-size: 35px; position: absolute; top: 54%" ControlToValidate="totalAmount" runat="server" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>

    <br />
    <asp:Button ID="purchaseItemBtn" runat="server" Height="40px" class="btn btn-success ml-0" Text="Purchase Item" Width="157px" OnClick="purchaseItemBtn_Click" />
    <br />
    <div class="col-sm-0">
        <asp:GridView ID="GridView1" Style="margin-top: 1%; margin-left: 0%" runat="server" AutoGenerateColumns="False" GridLines="None" DataKeyNames="InvoiceNo" DataSourceID="purchaseItemsSqlDataSource" CellPadding="4" ForeColor="#333333">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="InvoiceNo" HeaderText="InvoiceNo" ReadOnly="True" SortExpression="InvoiceNo" />
                <asp:BoundField DataField="PurchasedDate" HeaderText="PurchasedDate" SortExpression="PurchasedDate" />
                <asp:BoundField DataField="Supp_Name" HeaderText="Supp_Name" SortExpression="Supp_Name" />
                <asp:BoundField DataField="ItemName" HeaderText="ItemName" SortExpression="ItemName" />
                <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" />
                <asp:BoundField DataField="TotalAmount" HeaderText="TotalAmount" SortExpression="TotalAmount" />
            </Columns>
            <EditRowStyle BackColor="#7C6F57" />
            <FooterStyle BackColor="#1C5E55" ForeColor="White" Font-Bold="True" />
            <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" Height="40px" />
            <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle Height="50px" BackColor="#E3EAEB" />
            <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F8FAFA" />
            <SortedAscendingHeaderStyle BackColor="#246B61" />
            <SortedDescendingCellStyle BackColor="#D4DFE1" />
            <SortedDescendingHeaderStyle BackColor="#15524A" />
        </asp:GridView>


    </div>



    <asp:Button Style="margin-bottom: 2% ; margin-top:2%" ID="saveItemsButton" ValidationGroup="save" runat="server" Height="40px" class="btn btn-danger ml-0" Text="Save Items" Width="157px" OnClick="saveItemsButton_Click" />


    <br />

    <asp:SqlDataSource ID="getItemsSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:StockManagementConnectionString %>" SelectCommand="SELECT * FROM [items]"></asp:SqlDataSource>

    <asp:SqlDataSource ID="getSupplierSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:StockManagementConnectionString %>" SelectCommand="SELECT * FROM [Supplier]"></asp:SqlDataSource>
    
    <asp:SqlDataSource ID="purchaseItemsSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:StockManagementConnectionString %>" DeleteCommand="DELETE FROM [PurchasedItems] WHERE [InvoiceNo] = @InvoiceNo" InsertCommand="INSERT INTO [PurchasedItems] ([InvoiceNo], [PurchasedDate], [Supp_id], [ItemCode], [Quantity], [Amount], [TotalAmount]) VALUES (@InvoiceNo, @PurchasedDate, @Supp_id, @ItemCode, @Quantity, @Amount, @TotalAmount)" SelectCommand="SELECT PurchasedItems.InvoiceNo, PurchasedItems.PurchasedDate,Supplier.Supp_Name, items.ItemName, PurchasedItems.Quantity, PurchasedItems.TotalAmount FROM ((PurchasedItems INNER JOIN Supplier ON PurchasedItems.Supp_id=Supplier.Supp_id) INNER JOIN items ON PurchasedItems.ItemCode=items.ItemCode)" UpdateCommand="UPDATE [PurchasedItems] SET [PurchasedDate] = @PurchasedDate, [Supp_id] = @Supp_id, [ItemCode] = @ItemCode, [Quantity] = @Quantity, [Amount] = @Amount, [TotalAmount] = @TotalAmount WHERE [InvoiceNo] = @InvoiceNo">
        <DeleteParameters>
            <asp:Parameter Name="InvoiceNo" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="InvoiceNo" Type="Int32" />
            <asp:Parameter DbType="Date" Name="PurchasedDate" />
            <asp:Parameter Name="Supp_id" Type="Int32" />
            <asp:Parameter Name="ItemCode" Type="Int32" />
            <asp:Parameter Name="Quantity" Type="Int32" />
            <asp:Parameter Name="Amount" Type="Int32" />
            <asp:Parameter Name="TotalAmount" Type="Int32" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter DbType="Date" Name="PurchasedDate" />
            <asp:Parameter Name="Supp_id" Type="Int32" />
            <asp:Parameter Name="ItemCode" Type="Int32" />
            <asp:Parameter Name="Quantity" Type="Int32" />
            <asp:Parameter Name="Amount" Type="Int32" />
            <asp:Parameter Name="TotalAmount" Type="Int32" />
            <asp:Parameter Name="InvoiceNo" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    
    <asp:SqlDataSource ID="CheckItemsSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:StockManagementConnectionString %>" SelectCommand="SELECT * FROM [PurchasedItems] WHERE ([ItemCode] = @ItemCode)" DeleteCommand="DELETE FROM [PurchasedItems] WHERE [InvoiceNo] = @InvoiceNo" InsertCommand="INSERT INTO [PurchasedItems] ([InvoiceNo], [PurchasedDate], [Supp_id], [ItemCode], [Quantity], [Amount], [TotalAmount]) VALUES (@InvoiceNo, @PurchasedDate, @Supp_id, @ItemCode, @Quantity, @Amount, @TotalAmount)" UpdateCommand="UPDATE [PurchasedItems] SET [PurchasedDate] = @PurchasedDate, [Supp_id] = @Supp_id, [ItemCode] = @ItemCode, [Quantity] = @Quantity, [Amount] = @Amount, [TotalAmount] = @TotalAmount WHERE [InvoiceNo] = @InvoiceNo">
        <DeleteParameters>
            <asp:Parameter Name="InvoiceNo" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="InvoiceNo" Type="Int32" />
            <asp:Parameter DbType="Date" Name="PurchasedDate" />
            <asp:Parameter Name="Supp_id" Type="Int32" />
            <asp:Parameter Name="ItemCode" Type="Int32" />
            <asp:Parameter Name="Quantity" Type="Int32" />
            <asp:Parameter Name="Amount" Type="Int32" />
            <asp:Parameter Name="TotalAmount" Type="Int32" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="ItemDropDownList" Name="ItemCode" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter DbType="Date" Name="PurchasedDate" />
            <asp:Parameter Name="Supp_id" Type="Int32" />
            <asp:Parameter Name="ItemCode" Type="Int32" />
            <asp:Parameter Name="Quantity" Type="Int32" />
            <asp:Parameter Name="Amount" Type="Int32" />
            <asp:Parameter Name="TotalAmount" Type="Int32" />
            <asp:Parameter Name="InvoiceNo" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="CheckSuppliersSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:StockManagementConnectionString %>" SelectCommand="SELECT * FROM [Supplier] WHERE ([Supp_id] = @Supp_id)">
        <SelectParameters>
            <asp:ControlParameter ControlID="supplierDropDownList" Name="Supp_id" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    
    <footer class="footer mb-0">
        <div class="container-fluid clearfix mb-0">
            <span class="text-muted d-block text-center text-sm-left d-sm-inline-block mb-0">Copyright © 2021
                            <a href="#" target="_blank">StockManagementSystem</a>. All rights reserved.
            </span>
            <span class="float-none float-sm-right d-block mt-1 mt-sm-0 text-center">Made with
                            <i class="mdi mdi-heart text-danger"></i>
            </span>
        </div>
    </footer>



</asp:Content>
