<%@ Page Language="C#" AutoEventWireup="true" CodeFile="EditCategory.aspx.cs" Inherits="Manager_EditCategory" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        #form1 {
            height: 312px;
            text-align: center;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
    </div>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="CategoryID" DataSourceID="SqlDataSource1" Height="63px" style="text-align: left" Width="873px">
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                <asp:BoundField DataField="CategoryID" HeaderText="CategoryID" InsertVisible="False" ReadOnly="True" ShowHeader="False" SortExpression="CategoryID" Visible="False" />
                <asp:BoundField DataField="CategoryName" HeaderText="论坛类别名称" SortExpression="CategoryName" />
                <asp:BoundField DataField="CategoryDes" HeaderText="类别描述" SortExpression="CategoryDes" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Data Source=GEOLEMPC\GEOLEM;Initial Catalog=BBS;Persist Security Info=True;User ID=BBSadmin;Password=BBSadmin" DeleteCommand="DELETE FROM [BBSCategory] WHERE [CategoryID] = @CategoryID" InsertCommand="INSERT INTO [BBSCategory] ([CategoryName], [CategoryDes]) VALUES (@CategoryName, @CategoryDes)" ProviderName="System.Data.SqlClient" SelectCommand="SELECT * FROM [BBSCategory]" UpdateCommand="UPDATE [BBSCategory] SET [CategoryName] = @CategoryName, [CategoryDes] = @CategoryDes WHERE [CategoryID] = @CategoryID">
            <DeleteParameters>
                <asp:Parameter Name="CategoryID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="CategoryName" Type="String" />
                <asp:Parameter Name="CategoryDes" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="CategoryName" Type="String" />
                <asp:Parameter Name="CategoryDes" Type="String" />
                <asp:Parameter Name="CategoryID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </form>
</body>
</html>
