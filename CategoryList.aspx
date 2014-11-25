<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CategoryList.aspx.cs" Inherits="CategoryList" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>CategoryList</title>
    <link href="css/css.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <div id="container"><!--页面层容器-->
        <div id="Header"><img src="image/top.jpg" alt="top" /><!--页面头部--></div>
        <div id="PageBody"><!--页面主体-->
            <div id="Sidebar"><!--侧边栏-->
            </div>
            <div id="MainBody"><!--主体内容-->
                <form id="form1" runat="server">
    <div style="text-align:left; margin-left:35px">
        <br />
        <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
            <HeaderTemplate>
                <table border="0" cellpadding="3" cellspacing="0" width="100%">
            </HeaderTemplate>
            <ItemTemplate>
                <tr><td><a href="MsgList.aspx?categoryid=<%# Eval("categoryid") %>"><%#Eval("categoryname") %></a></td></tr>
                <tr><td><%#Eval("categorydes") %></td></tr>
                <td><tr></tr></td>  
                </separatortemplate>
            </ItemTemplate>
            <FooterTemplate>
                </table>
            </FooterTemplate>
        </asp:Repeater>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Data Source=GEOLEMPC\GEOLEM;Initial Catalog=BBS;Persist Security Info=True;User ID=BBSadmin;Password=BBSadmin" ProviderName="System.Data.SqlClient" SelectCommand="SELECT * FROM [BBSCategory]"></asp:SqlDataSource>
    
    </div>
    </form>
            </div>
        </div>
　　    <div id="Footer" style ="font :300; position: relative; margin-top: -80px;align-content:center; height: 80px; min-height: 100%; margin:6px auto ">Copyright © 2014 Geolem 版权所有 Mail: geolem@foxmail.com<!--页面底部--></div>
    </div>
</body>
</html>
