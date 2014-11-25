<%@ Page Language="C#" AutoEventWireup="true" CodeFile="BackMsg.aspx.cs" Inherits="BackMsg" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>BackMsg</title>
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
                     回复主题&nbsp;&nbsp;&nbsp;&nbsp;<br /><br />
                     <asp:TextBox ID="TextBox1" runat="server" style="text-align: left; width: 86%; height :27px" ></asp:TextBox>
                     <br />
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox1" ErrorMessage="回复主题必须填写" ForeColor="Red"></asp:RequiredFieldValidator>
                     <br /><br />
                     回复内容&nbsp;&nbsp;&nbsp;&nbsp;<br /><br />
                     <asp:TextBox ID="TextBox2" runat="server" Height="345px" style="text-align: left; width: 86%;" TextMode="MultiLine" ></asp:TextBox>
                     <br /><br /><br />
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox2" ErrorMessage="内容必须填写" ForeColor="Red"></asp:RequiredFieldValidator>
                     <br />
                     <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="回复" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                     <asp:Literal ID="Literal1" runat="server"></asp:Literal>
                     <asp:HyperLink ID="HyperLink1" runat="server">返回</asp:HyperLink>
                </form>
             </div>
        </div>
　　   <div id="Footer" style ="font :300; position: relative; margin-top: -80px;align-content:center; height: 80px; min-height: 100%; margin:6px auto ">Copyright © 2014 Geolem 版权所有 Mail: geolem@foxmail.com<!--页面底部--></div>
    </div>
</body>
</html>
