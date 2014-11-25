<%@ Page Language="C#" AutoEventWireup="true" CodeFile="MsgList.aspx.cs" Inherits="MsgList" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>MsgList</title>
    <link href="css/css.css" rel="stylesheet" type="text/css" />
</head>
<body>
   <div id="container"><!--页面层容器-->
        <div id="Header"><img src="image/top.jpg" alt="top" /><!--页面头部--></div>
        <div id="PageBody"><!--页面主体-->
            <div id="Sidebar"><!--侧边栏--></div>
            <div id="MainBody" style ="margin-left:2%; margin-right:2%"><!--主体内容--> 
            <br />
            <form id="form1" runat="server">
            <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click" PostBackUrl="~/CategoryList.aspx">返回首页</asp:LinkButton><br /><br />
            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="InfoID" DataSourceID="SqlDataSource1" Width="100%" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                <Columns>
                    <asp:CommandField ShowSelectButton="True" />
                    <asp:BoundField DataField="InfoID" HeaderText="InfoID" InsertVisible="False" ReadOnly="True" SortExpression="InfoID" Visible="False" />
                    <asp:BoundField DataField="Title" HeaderText="帖子主题" SortExpression="Title" />
                    <asp:BoundField DataField="PostUser" HeaderText="发帖人" SortExpression="PostUser" />
                    <asp:BoundField DataField="PostTime" HeaderText="发帖时间" SortExpression="PostTime" />
                    <asp:BoundField DataField="ReplyCount" HeaderText="回复数" SortExpression="ReplyCount" />
                    <asp:BoundField DataField="LastReplyTime" HeaderText="最后回复时间" SortExpression="LastReplyTime" />
                    <asp:BoundField DataField="FileName" HeaderText="文件名" SortExpression="FileName" />
                    <asp:BoundField DataField="CategoryID" HeaderText="CategoryID" ShowHeader="False" SortExpression="CategoryID" Visible="False" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BBSConnectionString %>" SelectCommand="SELECT * FROM [BBSInfo] WHERE ([CategoryID] = @CategoryID)">
                <SelectParameters>
                    <asp:QueryStringParameter Name="CategoryID" QueryStringField="categoryid" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
            <br />
            <br />
            <asp:Button ID="Button1" runat="server" PostBackUrl="~/SendMsg.aspx" Text="我要发帖" />        
             </form>
            </div>
        </div>
　　    <div id="Footer" style ="font :300; position: relative; margin-top: -80px;align-content:center; height: 80px; min-height: 100%; margin:6px auto ">Copyright © 2014 Geolem 版权所有 Mail: geolem@foxmail.com<!--页面底部--></div>
    </div>
</body>
</html>
