<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="RemoveItems.aspx.cs" Inherits="MasterPageDemo.User.RemoveItems" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <h2 class="ml-3">Items on Stock For more than 1 year</h2>
    <p>
        <asp:GridView ID="GridView1" class="table table-striped table-bordered table-light mt-2 ml-3 " runat="server" AutoGenerateColumns="False" DataKeyNames="InvoiceNo" DataSourceID="SqlDataSource1">
            <Columns>
                <asp:BoundField DataField="InvoiceNo" HeaderText="InvoiceNo" ReadOnly="True" SortExpression="InvoiceNo" />
                <asp:BoundField DataField="PurchasedDate" HeaderText="PurchasedDate" SortExpression="PurchasedDate" />
                <asp:BoundField DataField="Supp_id" HeaderText="Supp_id" SortExpression="Supp_id" />
                <asp:BoundField DataField="ItemCode" HeaderText="ItemCode" SortExpression="ItemCode" />
                <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" />
                <asp:BoundField DataField="Amount" HeaderText="Amount" SortExpression="Amount" />
                <asp:BoundField DataField="TotalAmount" HeaderText="TotalAmount" SortExpression="TotalAmount" />
                 <asp:CommandField ButtonType="Image" CancelImageUrl="~/imgs/cancel.png" DeleteImageUrl="~/imgs/delete.png" EditImageUrl="~/imgs/cancel.png" ShowDeleteButton="True" UpdateImageUrl="~/imgs/save.png">
                <ControlStyle Height="25px" Width="25px" />
            </asp:CommandField>
            </Columns>
            
        </asp:GridView>
        
                <asp:Button ID="removeButton" class="btn btn-danger mt-3" style="margin-left:85%" runat="server" Text="Remove All Items" Width="172px" Height="40px" OnClick="removeButton_Click" />

    </p>
    <p>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:StockManagementConnectionString %>" DeleteCommand="DELETE FROM [PurchasedItems] WHERE [InvoiceNo] = @InvoiceNo" InsertCommand="INSERT INTO [PurchasedItems] ([InvoiceNo], [PurchasedDate], [Supp_id], [ItemCode], [Quantity], [Amount], [TotalAmount]) VALUES (@InvoiceNo, @PurchasedDate, @Supp_id, @ItemCode, @Quantity, @Amount, @TotalAmount)" SelectCommand="SELECT * FROM [PurchasedItems] WHERE PurchasedDate < GETDATE() - 365;" UpdateCommand="UPDATE [PurchasedItems] SET [PurchasedDate] = @PurchasedDate, [Supp_id] = @Supp_id, [ItemCode] = @ItemCode, [Quantity] = @Quantity, [Amount] = @Amount, [TotalAmount] = @TotalAmount WHERE [InvoiceNo] = @InvoiceNo">
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
    </p>
    <p>
    </p>
    <p>
    </p>
    <p>
    </p>
    <p>
    </p>
    <p>
    </p>
    <p>
    </p>


</asp:Content>
