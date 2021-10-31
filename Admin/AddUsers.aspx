<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="AddUsers.aspx.cs" Inherits="MasterPageDemo.Admin.AddUsers" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2 style="margin-top: 7%; margin-left: 48%">Add New Users</h2>

    <div class="container">
    <div class="form-group form">

        <img src="/images/icon.png" style="height: 100px; width: 100px; margin-left: 52%" class="rounded-circle" alt="" />

        <div class="col-sm-10">
            <h4 style="margin-top: 2%; margin-left: 48%">User Name : </h4>
            <asp:TextBox ID="username" required="true" Style="margin-left: 48%"  Width="40%" BorderColor="#CCCCCC" BackColor="White" Class="form-control " runat="server"></asp:TextBox>
        </div>
        <div class="col-sm-10">
            <h4 style="margin-top: 2%; margin-left: 48%">Password : </h4>
            <asp:TextBox ID="password" required="true" Style="margin-left: 48%"  type="password"  Width="40%" BorderColor="#CCCCCC" BackColor="White" Class="form-control " runat="server"></asp:TextBox>
        </div>
        <asp:Button ID="addUserBtn" Style="margin-left: 40%" runat="server" Height="40px" class="btn btn-danger mt-4" Text="Add New User" Width="157px" OnClick="addUserBtn_Click" />
</div>
        <br />
        <br />
        <asp:SqlDataSource ID="CheckUsersSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:StockManagementConnectionString %>" SelectCommand="SELECT * FROM [Users] WHERE ([UserName] = @UserName)">
            <SelectParameters>
                <asp:ControlParameter ControlID="username" Name="UserName" PropertyName="Text" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="InsertUsersSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:StockManagementConnectionString %>" DeleteCommand="DELETE FROM [Users] WHERE [id] = @id" InsertCommand="INSERT INTO [Users] ([UserName], [password]) VALUES (@UserName, @password)" SelectCommand="SELECT * FROM [Users]" UpdateCommand="UPDATE [Users] SET [UserName] = @UserName, [password] = @password WHERE [id] = @id">
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
        <br />

    </div>
</asp:Content>
