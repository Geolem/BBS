<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Login</title>
</head>
<body>
    <form id="form1" runat="server">
    <div align="center">
    <asp:Login ID="Login1" runat="server" CreateUserText="注册" CreateUserUrl="~/Register.aspx" DestinationPageUrl="~/CategoryList.aspx" 
            PasswordRequiredErrorMessage="请填写“密码”。" UserNameRequiredErrorMessage="请填写“用户名”。" Height="200px" >
        </asp:Login>
    </div>
        
    </form>
</body>
</html>
