<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Category.aspx.cs" Inherits="MasterPageDemo.Category" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        &nbsp; <h2 style="margin-top:-3% ; margin-bottom:-3%; margin-left:0%" > Add Categories </h2>&nbsp;&nbsp;&nbsp;&nbsp;

    <div class="row">
 
        <div class="col-sm-5 ml-0 mt-0  p-3">
            Category Name:
            &nbsp;<asp:TextBox ID="txtCategory"   runat="server" style="margin-bottom:-2% ; margin-top:1%" class="form-control" BorderColor="#CCCCCC"></asp:TextBox>
        </div>
          <asp:RequiredFieldValidator ID="RequiredFieldValidator1"  ValidationGroup="add" style="margin-left:31%; font-size:35px; position:absolute; top:15% "  ControlToValidate="txtCategory"  runat="server" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>

        <div class="col-sm-8 ml-0 p-3">
            Category Description:
            &nbsp;<asp:TextBox ID="textDesc"  runat="server"  style="margin-bottom:2% ; margin-top:1%" Height="164px" TextMode="MultiLine"  Class="form-control" BorderColor="#CCCCCC"></asp:TextBox>
        </div>
          <asp:RequiredFieldValidator ID="RequiredFieldValidator2"  ValidationGroup="add" style="margin-left:11.5%; font-size:35px; position:absolute; top:24% "  ControlToValidate="textDesc"  runat="server" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>

    </div>
           <asp:Button ID="addCategoryButton" runat="server"  ValidationGroup="add" class="btn btn-success ml-2 mt-0" Height="40px" OnClick="addCategoryButton_Click" Text="Add Category" Width="149px" />

        <br />

        <br />
        <asp:GridView ID="GridView1" class="table table-striped table-bordered table-light ml-2" runat="server" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataSourceID="SqlDataSourceCategory" AutoGenerateColumns="False" DataKeyNames="CategoryId">
            <Columns>
                <asp:BoundField DataField="CategoryId" HeaderText="CategoryId" InsertVisible="False" ReadOnly="True" SortExpression="CategoryId"  />
                <asp:BoundField DataField="CategoryName" HeaderText="CategoryName" SortExpression="CategoryName"  />
                <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description"  />
             <asp:CommandField ButtonType="Image" CancelImageUrl="~/imgs/cancel.png" DeleteImageUrl="~/imgs/delete.png" EditImageUrl="~/imgs/edit.png" ShowEditButton="True" UpdateImageUrl="~/imgs/save.png">
                                <ControlStyle Height="25px" Width="25px" />
                            </asp:CommandField>
                            <asp:CommandField ButtonType="Image" CancelImageUrl="~/imgs/cancel.png" DeleteImageUrl="~/imgs/delete.png" EditImageUrl="~/imgs/cancel.png" ShowDeleteButton="True" UpdateImageUrl="~/imgs/save.png">
                                <ControlStyle Height="25px" Width="25px" />
                            </asp:CommandField>
                </Columns>
            <FooterStyle BackColor="White" ForeColor="#000066" />
            <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" Height="30px" />
            <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
            <RowStyle ForeColor="#000066" />
            <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#007DBB" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#00547E" />

        </asp:GridView>


        <br />
      

    <p>
        &nbsp;</p>
    <p>
        <asp:SqlDataSource ID="SqlDataSourceCategory" runat="server" ConnectionString="<%$ ConnectionStrings:StockManagementConnectionString %>" SelectCommand="SELECT * FROM [category]" DeleteCommand="DELETE FROM [category] WHERE [CategoryId] = @CategoryId" InsertCommand="INSERT INTO [category] ([CategoryName], [Description]) VALUES (@CategoryName, @Description)" UpdateCommand="UPDATE [category] SET [CategoryName] = @CategoryName, [Description] = @Description WHERE [CategoryId] = @CategoryId">
            <DeleteParameters>
                <asp:Parameter Name="CategoryId" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="CategoryName" Type="String" />
                <asp:Parameter Name="Description" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="CategoryName" Type="String" />
                <asp:Parameter Name="Description" Type="String" />
                <asp:Parameter Name="CategoryId" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </p>
    <p>
        &nbsp;
    </p>
    <p>
        <asp:SqlDataSource ID="SqlDataSourceGetCategory" runat="server" ConnectionString="<%$ ConnectionStrings:StockManagementConnectionString %>" DeleteCommand="DELETE FROM [category] WHERE [categoryId] = @categoryId" InsertCommand="INSERT INTO [category] ([categoryName], [Description]) VALUES (@categoryName, @Description)" SelectCommand="SELECT * FROM [category] WHERE ([categoryName] = @categoryName)" UpdateCommand="UPDATE [category] SET [categoryName] = @categoryName, [Description] = @Description WHERE [categoryId] = @categoryId">
            <DeleteParameters>
                <asp:Parameter Name="categoryId" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="categoryName" Type="String" />
                <asp:Parameter Name="Description" Type="String" />
            </InsertParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="txtCategory" Name="categoryName" PropertyName="Text" Type="String" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="categoryName" Type="String" />
                <asp:Parameter Name="Description" Type="String" />
                <asp:Parameter Name="categoryId" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </p>
    <p>
        &nbsp;
    </p>
    <p>
        &nbsp;
    </p>
      
</asp:Content>
