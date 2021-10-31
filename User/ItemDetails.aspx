<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="ItemDetails.aspx.cs" Inherits="MasterPageDemo.User.MyStock" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <asp:SqlDataSource ID="getItemsListSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:StockManagementConnectionString %>" SelectCommand="SELECT * FROM [PurchasedItems] WHERE ([ItemCode] = @ItemCode)">
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList2" Name="ItemCode" PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
    </asp:SqlDataSource>
      
    <h2 style="margin-left:5%; margin-top:5%"> Select Item to View Details  </h2>
    
    
        <asp:DropDownList ID="DropDownList2" runat="server" style="margin-left:5%" CssClass="form-control" BorderColor="#CCCCCC" DataSourceID="SqlDataSource1" DataTextField="ItemName" DataValueField="ItemCode" Height="35px" Width="300px" AutoPostBack="True">
    </asp:DropDownList>
   
        <br />
       
        <asp:GridView ID="GridView1" runat="server" style="margin-left:5%"  class="table table-striped table-bordered mt-2" AutoGenerateColumns="False" DataKeyNames="InvoiceNo" DataSourceID="getItemsListSqlDataSource">
            <Columns>
                <asp:BoundField DataField="InvoiceNo" HeaderText="InvoiceNo" ReadOnly="True" SortExpression="InvoiceNo" />
                <asp:BoundField DataField="PurchasedDate" HeaderText="PurchasedDate" SortExpression="PurchasedDate" />
                <asp:BoundField DataField="Supp_id" HeaderText="Supp_id" SortExpression="Supp_id" />
                <asp:BoundField DataField="ItemCode" HeaderText="ItemCode" SortExpression="ItemCode" />
                <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" />
                <asp:BoundField DataField="Amount" HeaderText="Amount" SortExpression="Amount" />
                <asp:BoundField DataField="TotalAmount" HeaderText="TotalAmount" SortExpression="TotalAmount" />
            </Columns>
         
        </asp:GridView>
    <p>
        &nbsp;</p>
    <p>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:StockManagementConnectionString %>" SelectCommand="SELECT * FROM [items]"></asp:SqlDataSource>
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
