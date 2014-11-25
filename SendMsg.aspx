<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SendMsg.aspx.cs" Inherits="SendMsg" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>SendMsg</title>
    <link href="css/css.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <div id="container"><!--页面层容器-->
        <div id="Header"><img src="image/top.jpg" alt="top" /><!--页面头部--></div>
        <div id="PageBody"><!--页面主体-->
            <div id="Sidebar"><!--侧边栏--></div>
            <div id="MainBody"><!--主体内容-->
                <form id="form1" runat="server">
            <br />
            <asp:HyperLink ID="HyperLink1" runat="server" OnClick="LinkButton1_Click">返回帖子列表</asp:HyperLink>
            <br /><br /><br />
            帖子主题
            <br /><br />
            <asp:TextBox ID="TextBox1" runat="server" style="height :25px" Width="90%"></asp:TextBox>
             <br />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="帖子主题必须填写" ForeColor="Red"></asp:RequiredFieldValidator>
            <br /><br />
           帖子内容<br /><br />
            <asp:TextBox ID="TextBox2" runat="server" Height="345px" style="text-align: left; " TextMode="MultiLine" Width="90%"></asp:TextBox>
            <br />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox2" ErrorMessage="帖子内容必须填写" ForeColor="Red"></asp:RequiredFieldValidator>
            <br />
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="发帖" Width="103px" />
            <br />
            <asp:Literal ID="Literal1" runat="server"></asp:Literal>
            <br />
    </form>
            </div>
        </div>
　　    <div id="Footer" style ="font :300; position: relative; margin-top: -80px;align-content:center; height: 80px; min-height: 100%; margin:6px auto ">Copyright © 2014 Geolem 版权所有 Mail: geolem@foxmail.com<!--页面底部--></div>
    </div>
</body>
</html>
