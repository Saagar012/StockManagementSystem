<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="AddItems.aspx.cs" Inherits="MasterPageDemo.AddItems" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server" style="background-color: #bbb9b9">
   
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <br />
    <br />
    &nbsp; <h2 style="margin-top:-6% ; margin-bottom:-2%; margin-left:0%" > Add Items </h2>&nbsp;&nbsp;&nbsp;&nbsp;
 
   
    <div class="row" style="margin-bottom:1%">
        <div class="col-sm-4">
            Item Name :
    <asp:TextBox ID="itemName" Class="form-control" BorderColor="#CCCCCC" runat="server"></asp:TextBox>
     <asp:RequiredFieldValidator ID="RequiredFieldValidator1" style="margin-left:95%; font-size:35px; position:absolute; top:22% "  ControlToValidate="itemName"  runat="server" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>

        </div>
        <div class="col-sm-5">
            Category : 
            <asp:DropDownList ID="categoryDropDownList" CssClass="form-control" BorderColor="#CCCCCC" runat="server" DataSourceID="getCategorySqlDataSource" DataTextField="CategoryName" DataValueField="CategoryId">
            </asp:DropDownList>
        </div>
    </div>
    <div class="row mt-3 " style="margin-bottom:1%">
        <div class="col-sm-3">
             Added Date:
            <asp:TextBox ID="purchaseDateTextField" type="date" Class="form-control" BorderColor="#CCCCCC" runat="server"></asp:TextBox>
            &nbsp;&nbsp;<%--<asp:ImageButton ID="calendarImage1" runat="server" ImageUrl="~/imgs/calendar.png" ImageAlign="AbsBottom" OnClick="calendarImage1_Click" />--%>
              <asp:RequiredFieldValidator ID="RequiredFieldValidator2" style="margin-left:89%; font-size:35px; position:absolute; top:18% "  ControlToValidate="purchaseDateTextField"  runat="server" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>

            </div>

        <div class="col-sm-3">
            ManuFacturedDate:&nbsp;&nbsp;<asp:TextBox ID="mfdTextBox" type="date" BorderColor="#CCCCCC" Class="form-control" runat="server"></asp:TextBox>
            &nbsp;&nbsp;&nbsp;<%--<asp:ImageButton ID="calendarImage2" runat="server" ImageUrl="~/imgs/calendar.png" ImageAlign="AbsBottom" OnClick="calendarImage2_Click" />--%>
          <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator3" style="margin-left:88%; font-size:35px; position:absolute; top:20% "  ControlToValidate="mfdTextBox"  runat="server" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>--%>

        </div>
        <div class="col-sm-3">
            ExpiryDate:&nbsp;&nbsp;<asp:TextBox ID="expTextBox" type="date" BorderColor="#CCCCCC" Class="form-control" runat="server"></asp:TextBox>
            &nbsp;&nbsp;&nbsp;   
            <%--<asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/imgs/calendar.png" ImageAlign="AbsBottom" OnClick="expCalendarBtn_Click" />--%>
           
           <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator4" style="margin-left:88%; font-size:35px; position:absolute; top:20% "  ControlToValidate="expTextBox"  runat="server" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>--%>

        </div>
    </div>

   <%-- <asp:Calendar ID="purchaseCalendar" runat="server" CssClass="ml-3" BackColor="White" BorderColor="#3366CC" BorderWidth="1px" CellPadding="1" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="#003399" Height="198px" Style="margin-left: 0px;" Width="217px" OnSelectionChanged="purchaseCalendar_SelectionChanged" OnDayRender="purchaseCalendar_DayRender">
        <DayHeaderStyle BackColor="#99CCCC" ForeColor="#336666" Height="1px" />
        <NextPrevStyle Font-Size="8pt" ForeColor="#CCCCFF" />
        <OtherMonthDayStyle ForeColor="#999999" />
        <SelectedDayStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
        <SelectorStyle BackColor="#99CCCC" ForeColor="#336666" />
        <TitleStyle BackColor="#003399" BorderColor="#3366CC" BorderWidth="1px" Font-Bold="True" Font-Size="10pt" ForeColor="#CCCCFF" Height="25px" />
        <TodayDayStyle BackColor="#99CCCC" ForeColor="White" />
        <WeekendDayStyle BackColor="#CCCCFF" />

    </asp:Calendar>

    <asp:Calendar ID="mfdCalendar" runat="server" CssClass="ml-3" Width="223px" BackColor="#FFFFCC" BorderColor="#FFCC66" BorderWidth="1px" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="#663399" Height="214px" OnSelectionChanged="mfdCalendar_SelectionChanged" OnDayRender="mfdCalendar_DayRender" ShowGridLines="True">
        <DayHeaderStyle BackColor="#FFCC66" Font-Bold="True" Height="1px" />
        <NextPrevStyle Font-Size="9pt" ForeColor="#FFFFCC" />
        <OtherMonthDayStyle ForeColor="#CC9966" />
        <SelectedDayStyle BackColor="#CCCCFF" Font-Bold="True" />
        <SelectorStyle BackColor="#FFCC66" />
        <TitleStyle BackColor="#990000" Font-Bold="True" Font-Size="9pt" ForeColor="#FFFFCC" />
        <TodayDayStyle BackColor="#FFCC66" ForeColor="White" />
    </asp:Calendar>

    <asp:Calendar ID="expCalendar" runat="server"  CssClass="ml-3" BackColor="White" BorderColor="Black" BorderStyle="Solid" CellSpacing="1" Font-Names="Verdana" Font-Size="9pt" ForeColor="Black" Height="207px" NextPrevFormat="ShortMonth" Width="226px" OnSelectionChanged="expCalendar_SelectionChanged1">
        <DayHeaderStyle Font-Bold="True" Font-Size="8pt" ForeColor="#333333" Height="8pt" />
        <DayStyle BackColor="#CCCCCC" />
        <NextPrevStyle Font-Bold="True" Font-Size="8pt" ForeColor="White" />
        <OtherMonthDayStyle ForeColor="#999999" />
        <SelectedDayStyle BackColor="#333399" ForeColor="White" />
        <TitleStyle BackColor="#333399" BorderStyle="Solid" Font-Bold="True" Font-Size="12pt" ForeColor="White" Height="12pt" />
        <TodayDayStyle BackColor="#999999" ForeColor="White" />
    </asp:Calendar>--%>


    <div class="col-sm-0 mt-0 ml-0" >
        Description:
     <br />
        <asp:TextBox ID="descTextBox" CssClass="form-control" BorderColor="#CCCCCC" runat="server" Height="144px" TextMode="MultiLine" Width="500px"></asp:TextBox>
      <asp:RequiredFieldValidator ID="RequiredFieldValidator5" style="margin-left:33%; font-size:35px; position:absolute; top:46% "  ControlToValidate="descTextBox"  runat="server" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>

    </div>
    <br />
    <asp:Button ID="addItemBtn" style="margin-top:-1%" runat="server" Height="40px" class="btn btn-success ml-0" Text="Add Item" Width="157px" OnClick="addItemBtn_Click" />
    <br />
   
    <asp:GridView ID="GridView1" runat="server" CssClass="ml-0 mt-2" Width="80%" AllowSorting="True" BackColor="White" BorderColor="#CCCCCC" AutoGenerateColumns="False" DataKeyNames="ItemCode" DataSourceID="insertItemsSqlDataSource" BorderStyle="None" BorderWidth="1px" CellPadding="3">
        <Columns>
            <asp:BoundField DataField="ItemCode" HeaderText="ItemCode" InsertVisible="False" ReadOnly="True" SortExpression="ItemCode"  HeaderStyle-Width="80px" />
            <asp:BoundField DataField="ItemName" HeaderText="ItemName" SortExpression="ItemName"  HeaderStyle-Width="150px" />
            <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description"  HeaderStyle-Width="400px"/>
            <asp:BoundField DataField="CategoryId" HeaderText="CategoryId" SortExpression="CategoryId"  HeaderStyle-Width="100px" />
            <asp:BoundField DataField="AddedDate" HeaderText="AddedDate" SortExpression="AddedDate"  HeaderStyle-Width="120px" />
            <asp:BoundField DataField="MfDate" HeaderText="MfDate" SortExpression="MfDate"  HeaderStyle-Width="120px" />
            <asp:BoundField DataField="ExpDate" HeaderText="ExpDate" SortExpression="ExpDate"  HeaderStyle-Width="120px" />
        </Columns>
        <FooterStyle BackColor="White" ForeColor="#000066" />
        <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" Height="40px" />
        <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
        <RowStyle ForeColor="#000066" />
        <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F1F1F1" />
        <SortedAscendingHeaderStyle BackColor="#007DBB" />
        <SortedDescendingCellStyle BackColor="#CAC9C9" />
        <SortedDescendingHeaderStyle BackColor="#00547E" />
    </asp:GridView>
 
    <asp:SqlDataSource ID="getCategorySqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:StockManagementConnectionString %>" SelectCommand="SELECT * FROM [category]"></asp:SqlDataSource>
    <br />
    <asp:SqlDataSource ID="CheckItemSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:StockManagementConnectionString %>" SelectCommand="SELECT * FROM [items] WHERE ([ItemName] = @ItemName)">
        <SelectParameters>
            <asp:ControlParameter ControlID="itemName" Name="ItemName" PropertyName="Text" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
  
    <asp:SqlDataSource ID="insertItemsSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:StockManagementConnectionString %>" DeleteCommand="DELETE FROM [items] WHERE [ItemCode] = @ItemCode" InsertCommand="INSERT INTO [items] ([ItemName], [Description], [CategoryId], [AddedDate], [MfDate], [ExpDate]) VALUES (@ItemName, @Description, @CategoryId, @AddedDate, @MfDate, @ExpDate)" SelectCommand="SELECT * FROM [items]" UpdateCommand="UPDATE [items] SET [ItemName] = @ItemName, [Description] = @Description, [CategoryId] = @CategoryId, [AddedDate] = @AddedDate, [MfDate] = @MfDate, [ExpDate] = @ExpDate WHERE [ItemCode] = @ItemCode">
        <DeleteParameters>
            <asp:Parameter Name="ItemCode" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="ItemName" Type="String" />
            <asp:Parameter Name="Description" Type="String" />
            <asp:Parameter Name="CategoryId" Type="Int32" />
            <asp:Parameter DbType="Date" Name="AddedDate" />
            <asp:Parameter DbType="Date" Name="MfDate" />
            <asp:Parameter DbType="Date" Name="ExpDate" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="ItemName" Type="String" />
            <asp:Parameter Name="Description" Type="String" />
            <asp:Parameter Name="CategoryId" Type="Int32" />
            <asp:Parameter DbType="Date" Name="AddedDate" />
            <asp:Parameter DbType="Date" Name="MfDate" />
            <asp:Parameter DbType="Date" Name="ExpDate" />
            <asp:Parameter Name="ItemCode" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
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


