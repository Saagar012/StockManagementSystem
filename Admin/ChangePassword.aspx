<%@ Page Title="" Language="C#" MasterPageFile="~/Site3.Master" AutoEventWireup="true" CodeBehind="ChangePassword.aspx.cs" Inherits="MasterPageDemo.Admin.ChangePassword" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      
    <form action="#" >
     
     	<h2>Change Password    <span style="font-size: 1em; ">
    <i class="fas fa-lock"></i>
</span></h2>
     	
        <label style="margin-bottom:-2%" >Admin Name</label>
        <asp:TextBox ID="adminname" required="true" name="adminname" placeholder="Admin Name" ReadOnly="true" BackColor="White" ForeColor="Black" CssClass="form-control" runat="server"></asp:TextBox>

     	<label style="margin-bottom:-2%" >Old Password</label>
        <asp:TextBox ID="oldpassword" required="true" name="op"  CssClass="form-control" ForeColor="Black" runat="server"></asp:TextBox>


     	<label style="margin-bottom:-2%">New Password</label>
        <asp:TextBox ID="newpassword" required="true" type="password" name="np"  CssClass="form-control" ForeColor="Black" runat="server"></asp:TextBox>

     	<label  style="margin-bottom:-2%">Confirm New Password</label>
        <asp:TextBox ID="confirmpassword" required="true" type="password" name="c_np" CssClass="form-control" ForeColor="Black" runat="server"></asp:TextBox>

     	 <br />
             <asp:Button ID="changePasswordBtn" required="true" Width="100%" CssClass="btn btn-danger ml-0" name="changePassword"  runat="server" Text="Update Password" OnClick="changePasswordBtn_Click"  />

      
     </form>
         

</asp:Content>
