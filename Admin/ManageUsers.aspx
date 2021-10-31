<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="ManageUsers.aspx.cs" Inherits="MasterPageDemo.Admin.ManageUsers" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <h2 style="margin-top: 7%;  margin-left: 48%">Manage Users 
          <span style="font-size: 1em; ">
    <i class="fas fa-users"></i>
</span></h2>
    
     <asp:GridView ID="GridView1" style="margin-left:32% ; margin-top:2%" class="table table-striped" runat="server"  DataSourceID="insertUsersSqlDataSource"   Width="50%" AllowSorting="False" PageSize="5" BackColor="White" BorderColor="#999999" AutoGenerateColumns="False"  BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="None" Font-Bold="False" Font-Overline="False" Font-Strikeout="False" DataKeyNames="id">
         <AlternatingRowStyle BackColor="#CCCCCC" />
        <Columns>
            <asp:BoundField DataField="id" HeaderText="id" SortExpression="id" InsertVisible="False" ReadOnly="True" />
            <asp:BoundField DataField="UserName" HeaderText="UserName" SortExpression="UserName" />
              <asp:BoundField DataField="password" HeaderText="password" SortExpression="password" />
              <asp:CommandField ButtonType="Image" CancelImageUrl="~/imgs/cancel.png" DeleteImageUrl="~/imgs/delete.png" EditImageUrl="~/imgs/edit.png" ShowEditButton="True" UpdateImageUrl="~/imgs/save.png">
                <ControlStyle Height="25px" Width="25px" />
            </asp:CommandField>
            <asp:CommandField ButtonType="Image" CancelImageUrl="~/imgs/cancel.png" DeleteImageUrl="~/imgs/delete.png" EditImageUrl="~/imgs/cancel.png" ShowDeleteButton="True" UpdateImageUrl="~/imgs/save.png">
                <ControlStyle Height="25px" Width="25px" />
            </asp:CommandField>
        </Columns>
      
         <FooterStyle BackColor="#CCCCCC" />
         <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" Font-Size="19px" BorderStyle="Groove" />
         <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
         <RowStyle Font-Size="18px" BorderStyle="Inset" />
         <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
         <SortedAscendingCellStyle BackColor="#F1F1F1" />
         <SortedAscendingHeaderStyle BackColor="#808080" />
         <SortedDescendingCellStyle BackColor="#CAC9C9" />
         <SortedDescendingHeaderStyle BackColor="#383838" />
      
    </asp:GridView>


<asp:SqlDataSource ID="insertUsersSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:StockManagementConnectionString %>" SelectCommand="SELECT * FROM [Users]" DeleteCommand="DELETE FROM [Users] WHERE [id] = @id" InsertCommand="INSERT INTO [Users] ([UserName], [password]) VALUES (@UserName, @password)" UpdateCommand="UPDATE [Users] SET [UserName] = @UserName, [password] = @password WHERE [id] = @id">
    <DeleteParameters>
        <asp:Parameter Name="id" Type="Int32" />
    </DeleteParameters>
    <InsertParameters>
        <asp:Parameter Name="UserName" Type="String" />
        <asp:Parameter Name="password" Type="String" />
    </InsertParameters>
    <UpdateParameters>
        <asp:Parameter Name="UserName" Type="String" />
        <asp:Parameter Name="password" Type="String" />
        <asp:Parameter Name="id" Type="Int32" />
    </UpdateParameters>

    </asp:SqlDataSource>


</asp:Content>
