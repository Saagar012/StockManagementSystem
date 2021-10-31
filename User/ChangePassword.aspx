<%@ Page Title="" Language="C#" MasterPageFile="~/Site4.Master" AutoEventWireup="true" CodeBehind="ChangePassword.aspx.cs" Inherits="MasterPageDemo.User.ChangePassword" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="container">
        <div class="row">
            <div class="col-md-4 offset-md-5 form" style="height:320px">
                
                    <h2 class="text-center" style="margin-top:-2%">New Password</h2>
                           <div class="form-group">
                            <asp:TextBox ID="username" required="true" name="username" placeholder="User Name" ReadOnly="true" CssClass="form-control" runat="server" BorderColor="#CCCCCC" BackColor="White"></asp:TextBox>
                        </div>

                       <div class="form-group">
                            <asp:TextBox ID="oldpassword" required="true" name="op" placeholder="Old Password" CssClass="form-control" runat="server" BorderColor="#CCCCCC"></asp:TextBox>
</div>
                    <div class="form-group">
                          <asp:TextBox ID="newpassword" required="true" type="password" name="np" placeholder="Create New Password" CssClass="form-control" BorderColor="#CCCCCC" runat="server" CausesValidation="True"></asp:TextBox>

                        <%--<input class="form-control" type="password" name="password" placeholder="Create new password" required>--%>
                    </div>
                    <div class="form-group">

                     <asp:TextBox ID="confirmpassword" required="true" type="password" name="c_np" placeholder="Confirm New Password" CssClass="form-control" BorderColor="#CCCCCC" runat="server"></asp:TextBox>

                    </div>
                    <div class="form-group">
             <asp:Button ID="changePasswordBtn" CssClass="btn btn-success ml-1" Width="100%" name="changePassword"  runat="server" Text="Update Password" OnClick="changePasswordBtn_Click"   />
                    </div>
               
            </div>
        </div>
    </div>
</asp:Content>
