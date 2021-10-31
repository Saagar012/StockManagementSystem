<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="StockDetails.aspx.cs" Inherits="MasterPageDemo.User.StockDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <p>
        <h2 class="ml-0"> Sort The Items Which Are Currently Out Of Stock</h2>
        <asp:DropDownList BorderColor="#CCCCCC" Class="form-control ml-0" ID="DropDownList1" runat="server" Height="35px" Width="250px" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
            <asp:ListItem Value="1">Item Name in Ascending Order</asp:ListItem>
            <asp:ListItem Value="2">Item Stock Quantity From High To Low</asp:ListItem>
            <asp:ListItem Value="3">Item Stocked Date in Descending Order</asp:ListItem>
        </asp:DropDownList>
    <p>
        &nbsp;</p>
    <p>
        <asp:GridView ID="GridView1" class="table table-striped table-bordered table-light mt-2 ml-0 " Width="60%" runat="server" AllowSorting="False" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
        </asp:GridView>
    </p>
   
     <h3 class="ml-0"> List of items in the stock where no item has been sold in the last 31 days. </h3>
    <p class="ml-5"> 
        <asp:SqlDataSource ID="getItemsSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:StockManagementConnectionString %>" SelectCommand="SELECT SellItems.ItemCode, Items.ItemName,SellItems.BillDate,Items.MfDate,Items.ExpDate, Items.Description FROM SellItems INNER JOIN Items ON SellItems.ItemCode=Items.ItemCode WHERE NOT BillDate &gt;= DATEADD(day,-31,GETDATE()) AND BillDate &lt;= getdate()"></asp:SqlDataSource>
    </p>
    
        <asp:GridView ID="GridView2" class="table table-striped table-bordered table-light mt-2 mr-5" runat="server" AutoGenerateColumns="False" CellPadding="2" DataSourceID="getItemsSqlDataSource" ForeColor="#333333" GridLines="None" PageSize="1">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:BoundField DataField="ItemCode" HeaderText="ItemCode" SortExpression="ItemCode"  />
                <asp:BoundField DataField="ItemName" HeaderText="ItemName" SortExpression="ItemName"  />
                <asp:BoundField DataField="BillDate" HeaderText="BillDate" SortExpression="BillDate"   />
                <asp:BoundField DataField="MfDate" HeaderText="MfDate" SortExpression="MfDate"  />
                <asp:BoundField DataField="ExpDate" HeaderText="ExpDate" SortExpression="ExpDate"  />
                <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
            </Columns>
            <EditRowStyle BackColor="#999999" />
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#E9E7E2" />
            <SortedAscendingHeaderStyle BackColor="#506C8C" />
            <SortedDescendingCellStyle BackColor="#FFFDF8" />
            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
        </asp:GridView>
   
    <p class="ml-5"> &nbsp;</p>
    <p class="ml-5"> &nbsp;</p>
    <p class="ml-5"> &nbsp;</p>
    <p class="ml-5"> &nbsp;</p>
    <p class="ml-5"> &nbsp;</p>
    <p class="ml-5"> &nbsp;</p>
    <p class="ml-5"> &nbsp;</p>
    <p class="ml-5"> &nbsp;</p>
    <p class="ml-5"> &nbsp;</p>
    <p class="ml-5"> &nbsp;</p>
    <p class="ml-5"> &nbsp;</p>
    <p class="ml-5"> &nbsp;</p>
    <p class="ml-5"> &nbsp;</p>




</asp:Content>
