<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="AddSupplier.aspx.cs" Inherits="MasterPageDemo.User.AddSupplier" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
      
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   <h2 style="margin-left:9%; margin-top:2%"> Suppliers Details</h2>
      <asp:GridView ID="SuppliersGridView" class="table table-striped table-bordered table-light" style="margin-top:3%;margin-left: 10%;" runat="server" DataSourceID="InsertSupplierSqlDataSource" HorizontalAlign="Justify" CellPadding="3" ForeColor="#333333" GridLines="None">
          <AlternatingRowStyle BackColor="White" />
          <EditRowStyle BackColor="#7C6F57" />
          <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White"  />
          <HeaderStyle BackColor="#34A2B2" Font-Bold="True" ForeColor="White" />
          <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
          <RowStyle BackColor="#E3EAEB" Font-Size="30px" />
          <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
          <SortedAscendingCellStyle BackColor="#F8FAFA" />
          <SortedAscendingHeaderStyle BackColor="#246B61" />
          <SortedDescendingCellStyle BackColor="#D4DFE1" />
          <SortedDescendingHeaderStyle BackColor="#15524A" />
          
       
        </asp:GridView> 
    <div>
    <button type="button" style="margin-left: 10%; margin-top: 2%; height:37px;width:152px"   class="btn btn-danger" data-toggle="modal" data-target="#myModal">Add Supplier</button>
        
    </div>

    <div class="modal fade" id="myModal" role="dialog">
        <div class="modal-dialog">

            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title" style="">Add Supplier</h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>

                </div>
                <div class="modal-body">
                    <form method="post" id="registration">
                        <table class="table">
                            <tr>
                                <td>Supplier Name</td>
                                <td>
                                     <asp:TextBox ID="sup_name" required="true" style="border-bottom: 2px solid #0094ff" CssClass="form-control" placeholder="Supplier Name"  runat="server"></asp:TextBox>
                                    </td>
                            </tr>
                            <tr>
                                <td>Supplier Contact No.</td>
                                <td>
                                <asp:TextBox ID="mobile"  type="number" required="true" style="border-bottom: 2px solid #0094ff" CssClass="form-control" placeholder="Supplier Phone"  runat="server"></asp:TextBox>

                                </td>
                            </tr>
                            <tr>
                                <td>Supplier's Email</td>
                                <td>
                                    <asp:TextBox ID="email" name="email" required="true"  type="text" style="border-bottom: 2px solid #0094ff" CssClass="form-control" placeholder="Supplier Email"  runat="server"></asp:TextBox>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" runat="server" ErrorMessage="Please Enter Correct Email." ControlToValidate="email"  ForeColor="Red" Font-Names="Arial Narrow"></asp:RegularExpressionValidator>
                                   </td>
                            </tr>
                            <tr>
                                <td>Supplier Address</td>
                                <td>
                                   <asp:TextBox ID="address" name="address"  required="true" type="text" style="border-bottom: 2px solid #0094ff" CssClass="form-control" placeholder="Supplier Address"  runat="server"></asp:TextBox>

                                    </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Button ID="addSupplierBtn" runat="server" Height="40px" class="btn btn-success ml-0" Text="Add Supplier" Width="157px" OnClick="addSupplierBtn_Click" />
                                 </td>

                            </tr>
                        </table>
                    </form>

                </div>

            </div>

        </div>

    </div>
    <p>
        &nbsp;
        <asp:SqlDataSource ID="CheckSupplierSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:StockManagementConnectionString %>" SelectCommand="SELECT * FROM [Supplier] WHERE ([supp_name] = @supp_name)">
            <SelectParameters>
                <asp:ControlParameter ControlID="sup_name" Name="supp_name" PropertyName="Text" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
    </p>
    <p>
        &nbsp;</p>
    <p>
        <asp:SqlDataSource ID="InsertSupplierSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:StockManagementConnectionString %>" DeleteCommand="DELETE FROM [Supplier] WHERE [supp_id] = @supp_id" InsertCommand="INSERT INTO [Supplier] ([supp_name], [mobile], [email], [address]) VALUES (@supp_name, @mobile, @email, @address)" SelectCommand="SELECT * FROM [Supplier]" UpdateCommand="UPDATE [Supplier] SET [supp_name] = @supp_name, [mobile] = @mobile, [email] = @email, [address] = @address WHERE [supp_id] = @supp_id">
            <DeleteParameters>
                <asp:Parameter Name="supp_id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="supp_name" Type="String" />
                <asp:Parameter Name="mobile" Type="String" />
                <asp:Parameter Name="email" Type="String" />
                <asp:Parameter Name="address" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="supp_name" Type="String" />
                <asp:Parameter Name="mobile" Type="String" />
                <asp:Parameter Name="email" Type="String" />
                <asp:Parameter Name="address" Type="String" />
                <asp:Parameter Name="supp_id" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </p>
    <p>
       
    </p>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;
    </p>
    <p>
        &nbsp;
    </p>
   <div>
         
        
         <p> &nbsp;</p>
         <p> &nbsp;</p>
         <p> &nbsp;</p>
         <p> &nbsp;</p>
         <p> &nbsp;</p>
         
         <p> &nbsp;</p>
         <p> &nbsp;</p>
         <p> &nbsp;</p>
         <p> &nbsp;</p>
       
      
   </div>
  
   

</asp:Content>
