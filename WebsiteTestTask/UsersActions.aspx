<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UsersActions.aspx.cs" Inherits="WebsiteTestTask.UsersActions" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="/Scripts/jquery-1.10.2.js" type="text/javascript"></script>
    <link type="text/css" href="/Scripts/jquery-ui-1.10.4.custom.css" rel="stylesheet" />
    <script src="/Scripts/jquery-ui-1.10.4.custom.js" type="text/javascript"></script>
    <script src="/Scripts/jquery-ui-1.10.4.custom.min.js" type="text/javascript"></script>
    <script src="/Scripts/script.js" type="text/javascript"></script>
    <style type="text/css">
        #FromPicker {
            width: 87px;
        }
        #ToPicker {
            width: 88px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <br />
        <br />
        <asp:Label ID="lb_userNameFilter" runat="server" Text="user name:"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="lb_actionFilter" runat="server" Text="action:"></asp:Label>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="lb_fromDate" runat="server" Text="from date:"></asp:Label>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="lb_toDate" runat="server" Text="to date:"></asp:Label>
        <br />
        <asp:TextBox ID="tb_usernameFilter" runat="server" Width="79px"></asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="tb_actionFilter" runat="server" Width="80px"></asp:TextBox>
&nbsp;&nbsp;&nbsp;<asp:TextBox ID="tb_fromDate" runat="server" Width="99px"></asp:TextBox>
&nbsp;&nbsp;&nbsp;<asp:TextBox ID="tb_toDate" runat="server" Width="95px"></asp:TextBox>
        &nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="bt_filter" runat="server" OnClick="bt_filter_Click" Text="Filter" />
        <br />
    
        </div>
        <asp:GridView ID="gv_actionsList" runat="server" AllowSorting="True" OnSorting="gv_actionsList_Sorting">
        </asp:GridView>
    </form>
</body>
</html>
