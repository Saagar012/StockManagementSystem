<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="PurchaseInvoice.aspx.cs" Inherits="MasterPageDemo.User.PurchaseInvoice" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="main-panel" style="width: 100%; margin-top:-2%">
        <div class="content-wrapper"  style="background-color: #BCDCDB;">
            <center>
             <h3 style="margin-top: 4%">&nbsp; InVoice</h3>
            
                        <h3> Cave On Tech </h3>
                        Address: Silicon Valley, Wall Street , California<br />
                        Phone: 787037846
                  </center>

            <table class="table mt-1">

                <tr>
                    <td>Invoice No.: </td>
                    <td>
                        <asp:TextBox ID="invoiceTextBox" runat="server" BackColor="#BCDCDB" BorderStyle="None"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>Purchased Date: </td>
                    <td>
                        <asp:TextBox ID="billDateTextBox" runat="server"  BackColor="#BCDCDB" BorderStyle="None"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>Supplier Name: </td>
                    <td>
                        <asp:TextBox ID="supplierNameTextBox" runat="server"  BackColor="#BCDCDB" BorderStyle="None"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>Item Name: </td>
                    <td>
                        <asp:TextBox ID="itemNameTextBox" runat="server"  BackColor="#BCDCDB" BorderStyle="None"></asp:TextBox></td>
                </tr>


            </table>
            <table class="table">
                <tr>
                    <th>Item Name</th>
                    <th>Qty</th>
                    <th>Price</th>
                    <th>Amount</th>

                </tr>

                <tr>
                    <td>
                        <asp:TextBox ID="itemNameTextBox1" runat="server"  BackColor="#BCDCDB" BorderStyle="None"></asp:TextBox></td>
                    <td>
                        <asp:TextBox ID="quantityTextBox" runat="server"  BackColor="#BCDCDB" BorderStyle="None"></asp:TextBox></td>
                    <td>
                        <asp:TextBox ID="priceTextBox" runat="server" BackColor="#BCDCDB" BorderStyle="None"></asp:TextBox></td>
                    <td>
                        <asp:TextBox ID="totalAmountTextBox1" runat="server"  BackColor="#BCDCDB" BorderStyle="None"></asp:TextBox></td>
                </tr>

            </table>

            <h3>Total Amount:
                <asp:TextBox ID="totalAmountTextBox" runat="server" BackColor="#BCDCDB" BorderStyle="None"></asp:TextBox></h3>
            <br />
            <a href="PrintAll" target="_blank">
                 <asp:Button ID="generatePdfButton" runat="server"  class="btn btn-success" Text="Generate PDF" OnClick="generatePdfButton_Click" />
                </a>
            <a href="PurchaseItems.aspx">
                <input type="button" class="btn btn-primary" value="New Order"></a>

            <br />
            <br />
            <br />
           <br />
            <br />
           
            </div>
        </div>
</asp:Content>
