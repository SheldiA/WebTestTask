<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UsersActions.aspx.cs" Inherits="WebsiteTestTask.UsersActions" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        UsersActions</div>
        <asp:GridView ID="gv_actionsList" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="log_id" DataSourceID="LogDBSqlDataSource">
            <Columns>
                <asp:BoundField DataField="log_id" HeaderText="log_id" ReadOnly="True" SortExpression="log_id" />
                <asp:BoundField DataField="user_name" HeaderText="user_name" SortExpression="user_name" />
                <asp:BoundField DataField="action" HeaderText="action" SortExpression="action" />
                <asp:BoundField DataField="action_date" HeaderText="action_date" SortExpression="action_date" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="LogDBSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:LogDBConnectionString %>" ProviderName="<%$ ConnectionStrings:LogDBConnectionString.ProviderName %>" SelectCommand="SELECT * FROM [log]"></asp:SqlDataSource>
    </form>
</body>
</html>
