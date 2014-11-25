<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ContentList.aspx.cs" Inherits="ContentList" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>ContentList</title>
    <link href="css/css.css" rel="stylesheet" type="text/css" />
</head>

<body>
    <div id="container"><!--页面层容器-->
        <div id="Header"><img src="image/top.jpg" alt="top" /><!--页面头部--> </div>
        <div id="PageBody"><!--页面主体-->
            <div id="Sidebar"><!--侧边栏--></div>
            <div id="MainBody"><!--主体内容-->
                <br />
                <asp:hyperlink runat="server" ID="hypeylink1">返回帖子列表</asp:hyperlink>
                <form id="form1" runat="server">
                    <asp:DataList ID="DataList1" runat="server" DataSourceID="XmlDataSource1" >
                        <HeaderTemplate ><br /><b>帖子详细内容</b><table >                                
                        </HeaderTemplate>
                        <ItemTemplate>
                            <hr />
                            <tr>
                                <td>主题：<b><%#XPath("title") %></b></td>
                                <td>发帖人：<%#XPath("postuser") %></td>
                                </tr>
                            <tr><td colspan="2">发帖时间：<%#XPath("posttime") %></td></tr>
                            <tr><td></td></tr>
                            <tr><td colspan ="2"><%#XPath("content") %></td></tr>
                            <br />
                        </ItemTemplate>
                        <FooterTemplate ></table></FooterTemplate>
                    </asp:DataList>
                    <asp:XmlDataSource ID="XmlDataSource1" runat="server"></asp:XmlDataSource>
                    <div><br />
                    <asp:Button ID="Button1" runat="server" PostBackUrl="~/BackMsg.aspx" Text="回复主题" />
                    </div>
               </form>
              </div>
        </div>
　　    <div id="Footer" style ="font :300; position: relative; margin-top: -80px;align-content:center; height: 80px; min-height: 100%; margin:6px auto ">Copyright © 2014 Geolem 版权所有 Mail: geolem@foxmail.com<!--页面底部--></div>
    </div>
</body>
</html>
