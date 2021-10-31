<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="SellItem.aspx.cs" Inherits="MasterPageDemo.User.SellItem" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

     <h2 style="margin-top:1%; margin-left:2.5%"> Sell Items 
         </h2>
     
         <asp:SqlDataSource ID="getItemsSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:StockManagementConnectionString %>" SelectCommand="SELECT * FROM Items INNER JOIN PurchasedItems ON Items.ItemCode=PurchasedItems.ItemCode" OnSelecting="getItemsSqlDataSource_Selecting"></asp:SqlDataSource>
  
     <p > 
         <asp:SqlDataSource ID="SellSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:StockManagementConnectionString %>" DeleteCommand="DELETE FROM [SellItems] WHERE [InvoiceNo] = @InvoiceNo" InsertCommand="INSERT INTO [SellItems] ([InvoiceNo], [BillDate], [ItemCode], [CategoryId], [CustomerId], [Quantity], [Price], [TotalAmount]) VALUES (@InvoiceNo, @BillDate, @ItemCode, @CategoryId, @CustomerId, @Quantity, @Price, @TotalAmount)" SelectCommand="SELECT * FROM [SellItems]" UpdateCommand="UPDATE [SellItems] SET [BillDate] = @BillDate, [ItemCode] = @ItemCode, [CategoryId] = @CategoryId, [CustomerId] = @CustomerId, [Quantity] = @Quantity, [Price] = @Price, [TotalAmount] = @TotalAmount WHERE [InvoiceNo] = @InvoiceNo">
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
     <p > 
         <asp:SqlDataSource ID="categorySqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:StockManagementConnectionString %>" SelectCommand="SELECT * FROM [category]"></asp:SqlDataSource>
     </p>
     <p > 
         <asp:SqlDataSource ID="stockSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:StockManagementConnectionString %>" SelectCommand="SELECT * FROM Items INNER JOIN PurchasedItems ON Items.ItemCode=PurchasedItems.ItemCode"></asp:SqlDataSource>
     </p>
     <p > 
         <asp:SqlDataSource ID="CheckItemsSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:StockManagementConnectionString %>" SelectCommand="SELECT * FROM [PurchasedItems] WHERE ([ItemCode] = @ItemCode)">
             <SelectParameters>
                 <asp:ControlParameter ControlID="itemCode" Name="ItemCode" PropertyName="Text" Type="Int32" />
             </SelectParameters>
         </asp:SqlDataSource>
         <asp:SqlDataSource ID="InsertCustomerSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:StockManagementConnectionString %>" DeleteCommand="DELETE FROM [Customer] WHERE [CustomerId] = @CustomerId" InsertCommand="INSERT INTO [Customer] ([CustomerId], [CustomerName], [Address], [ContactNo], [Email], [CustomerType]) VALUES (@CustomerId, @CustomerName, @Address, @ContactNo, @Email, @CustomerType)" SelectCommand="SELECT * FROM [Customer]" UpdateCommand="UPDATE [Customer] SET [CustomerName] = @CustomerName, [Address] = @Address, [ContactNo] = @ContactNo, [Email] = @Email, [CustomerType] = @CustomerType WHERE [CustomerId] = @CustomerId">
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
    
     <div class="row ml-4" style="margin-bottom:0%">
        <div class="col-sm-5">
            Invoice No :
                <asp:TextBox ID="invoiceNo" required="true" type="Number" BorderColor="#CCCCCC" Class="form-control" runat="server" BackColor="White" OnTextChanged="invoiceNo_TextChanged" ReadOnly="True"></asp:TextBox>
        </div>
        <div class="col-sm-5">
            Bill Date :
            <asp:TextBox ID="billDate" type="date" Class="form-control" required="true" BorderColor="#CCCCCC" runat="server"></asp:TextBox>
            <%--&nbsp;&nbsp;<asp:ImageButton ID="billDateCalendar" runat="server" ImageUrl="~/imgs/calendar.png" ImageAlign="AbsBottom" OnClick="billDateCalendar_Click" />--%>

        </div>
        <div class="col-sm-5">
           Item Name :
            <asp:DropDownList ID="itemDropDownList" BorderColor="#CCCCCC" required="true" CssClass="form-control" runat="server" DataSourceID="getItemsSqlDataSource" DataTextField="ItemName" DataValueField="ItemCode" OnSelectedIndexChanged="itemDropDownList_SelectedIndexChanged" AutoPostBack="True">
            </asp:DropDownList>
        </div>

         <div class="col-sm-5">
          Item Code :
           <asp:TextBox ID="itemCode" ReadOnly="true" required="true" BorderColor="#CCCCCC" Class="form-control" runat="server" ForeColor="Black" BackColor="White"></asp:TextBox>
        </div>

         <div class="col-sm-5">
           Select Category :
            <asp:DropDownList ID="categoryDropDownList" BorderColor="#CCCCCC" required="true" CssClass="form-control" runat="server" AutoPostBack="True" DataSourceID="categorySqlDataSource" DataTextField="CategoryName" DataValueField="CategoryId" OnSelectedIndexChanged="categoryDropDownList_SelectedIndexChanged">
            </asp:DropDownList>
        </div>

          <div class="col-sm-5">
           Category Id :
           <asp:TextBox ID="category" ReadOnly="true" required="true" BackColor="White" CssClass="form-control" BorderColor="#CCCCCC" runat="server"></asp:TextBox>
        </div>
          <div class="col-sm-5">
           Select Item For Stock :
            <asp:DropDownList ID="stockDropDownList" required="true" BorderColor="#CCCCCC" CssClass="form-control" runat="server" AutoPostBack="True" DataSourceID="stockSqlDataSource" DataTextField="ItemName" DataValueField="Quantity" OnSelectedIndexChanged="stockDropDownList_SelectedIndexChanged">
            </asp:DropDownList>
        </div>
        <div class="col-sm-5">
          Total Stock :
           <asp:TextBox ID="totalStock" ReadOnly="true" required="true" BorderColor="#CCCCCC" Class="form-control" runat="server" ForeColor="Black" BackColor="White" OnTextChanged="totalStock_TextChanged"></asp:TextBox>
        </div>
      <div class="col-sm-3">
          Quantity :
           <asp:TextBox ID="quantity" type="number" required="true" BorderColor="#CCCCCC" Class="form-control" runat="server" BackColor="White"></asp:TextBox>
        </div>

        <div class="col-sm-3">
          Price :
           <asp:TextBox ID="price" type="number" required="true" BorderColor="#CCCCCC" Class="form-control" runat="server" BackColor="White"></asp:TextBox>
        </div>
      <div class="col-sm-4">
          Total Amount :
           <asp:TextBox ID="amount" type="number" required="true" BorderColor="#CCCCCC" Class="form-control" runat="server" BackColor="White"></asp:TextBox>
        </div>
     
         <div class="col-sm-10">
           CustomerId :
           <asp:TextBox ID="customerId" BorderColor="#CCCCCC" required="true" Class="form-control" runat="server" BackColor="White" ReadOnly="True"></asp:TextBox>
        </div>

         <div class="col-sm-5">
           Customer Name :
           <asp:TextBox ID="customerName" required="true" BorderColor="#CCCCCC" Class="form-control" runat="server"></asp:TextBox>
        </div>
         <div class="col-sm-5">
              Contact No :

           <asp:TextBox ID="phone" type="number" required="true" BorderColor="#CCCCCC" Class="form-control" runat="server"></asp:TextBox>
        </div>
         <div class="col-sm-10">
            Customer Address:
           <asp:TextBox ID="customerAddress" required="true" BorderColor="#CCCCCC" Class="form-control" runat="server"></asp:TextBox>
        </div>
         <div class="col-sm-5">
           Email :
           <asp:TextBox ID="email" BorderColor="#CCCCCC" required="true" Class="form-control" runat="server"></asp:TextBox>
             <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" runat="server" ControlToValidate="email"  ErrorMessage="Please enter correct email." Font-Names="Arial Narrow" ForeColor="Red"></asp:RegularExpressionValidator>
        </div>
         <div class="col-sm-5">
           Customer Type :
              <asp:DropDownList ID="customerTypeDropDownList" required="true" BorderColor="#CCCCCC" CssClass="form-control" runat="server">
                  <asp:ListItem>New</asp:ListItem>
                  <asp:ListItem>Regular</asp:ListItem>
            </asp:DropDownList>
           </div>
    </div>

  
  <asp:Button ID="sellItemBtn"  runat="server" Height="40px" style="margin-left:3%" class="btn btn-success mb-4" Text="Sell Item" Width="157px" OnClick="sellItemBtn_Click" />
    <br />
    <footer class="footer">
        <div class="container-fluid clearfix">
            <span class="text-muted d-block text-center text-sm-left d-sm-inline-block">Copyright © 2021
                            <a href="#" target="_blank">StockManagementSystem</a>. All rights reserved.
            </span>
            <span class="float-none float-sm-right d-block mt-1 mt-sm-0 text-center">Made with
                            <i class="mdi mdi-heart text-danger"></i>
            </span>
        </div>
    </footer>

</asp:Content>
