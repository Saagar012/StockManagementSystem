<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="dashboard.aspx.cs" Inherits="MasterPageDemo.User.dashboard" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   
   <h1 class="mt-2" > Date Wise Sales Report</h1>
    <hr />
    From Date : <asp:TextBox ID="txtFrom" type="date" CssClass="form-control" style="margin-bottom:2%" runat="server"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidatortxtFrom" style="margin-left:27%; font-size:35px; position:absolute; top:27% "  ControlToValidate="txtFrom"  runat="server" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>

    <br />
    To Date : <asp:TextBox ID="txtTo" type="date" CssClass="form-control" runat="server"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidatortxtTo" style="margin-left:27%; font-size:35px; position:absolute; top:40% " ControlToValidate="txtTo"  runat="server" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>

    <asp:Button ID="searchButton" runat="server" class="btn btn-dark ml-0 mt-2" Text="Search" OnClick="searchButton_Click" />
    <br />
    <asp:GridView ID="GridView1" runat="server" CellPadding="5"  class="mt-2" ForeColor="#333333" GridLines="None">
        <AlternatingRowStyle BackColor="White" />
        <EditRowStyle BackColor="#7C6F57" />
        <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" Height="35px" />
        <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#E3EAEB" Height="32px" />
        <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#F8FAFA" />
        <SortedAscendingHeaderStyle BackColor="#246B61" />
        <SortedDescendingCellStyle BackColor="#D4DFE1" />
        <SortedDescendingHeaderStyle BackColor="#15524A" />
    </asp:GridView>

</asp:Content>
