<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="MasterPageDemo.Login.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"/>
    <link rel="stylesheet" href="/css/UserLogin.css"/>
    <script src="/jss/sweetalert.js"></script> 
</head>
<body>
     <div class="login-form">
        <h2> LOGIN</h2>
        <form method="post"  runat="server">
            <div class="input-field">
                <i class="fa fa-user"></i>
                <%--<input type="text" placeholder="UserName" name="adminName"/>--%>
                 <asp:TextBox ID="username" name="username" placeholder="UserName" Width="85%" CssClass="form-control" BorderColor="#CCCCCC" runat="server"></asp:TextBox>

            </div>
            <div class="input-field">
                <i class="fa fa-lock"></i>
                <%--<input type="password" placeholder="Password" name="adminPass"/>--%>
                <asp:TextBox ID="password" name="password" type="password" placeholder="Password" Width="85%"  CssClass="form-control" BorderColor="#CCCCCC" runat="server"></asp:TextBox>

            </div>
            <%--<button type="submit" name="login"> Log In</button>--%>
            <asp:Button ID="loginBtn" style="margin-left:18%;margin-top:-1%" name="login"  runat="server" Height="32px"  Text="Login" Width="250px" OnClick="loginBtn_Click" />

            <div class="extra">
                <a href="#"> Forgot Password ?</a>
                <!-- <a href="#">Create an Account</a> -->
            </div>
        </form>
    </div>
    

</body>
</html>
