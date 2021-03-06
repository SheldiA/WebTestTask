﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UsersActions.aspx.cs" Inherits="WebsiteTestTask.UsersActions" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="/Scripts/jquery-1.10.2.js" type="text/javascript"></script>
    <link type="text/css" href="/Scripts/jquery-ui-1.10.4.custom.css" rel="stylesheet" />
    <script src="/Scripts/jquery-ui-1.10.4.custom.js" type="text/javascript"></script>
    <script src="/Scripts/jquery-ui-1.10.4.custom.min.js" type="text/javascript"></script>
    <script src="/Scripts/jquery.validate.min.js" type="text/javascript"></script>
    <script src="/Scripts/script.js" type="text/javascript"></script>
    <script src="/Scripts/jquery_date_validation.js" type="text/javascript"></script>
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
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="lb_userNameFilter" runat="server" Text="user name:" Font-Bold="True" Font-Italic="False"></asp:Label>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="lb_actionFilter" runat="server" Text="action:" Font-Bold="True"></asp:Label>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="lb_fromDate" runat="server" Text="from date:" Font-Bold="True"></asp:Label>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="lb_toDate" runat="server" Text="to date:" Font-Bold="True"></asp:Label>
        <br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="tb_usernameFilter" runat="server" Width="79px"></asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="tb_actionFilter" runat="server" Width="80px"></asp:TextBox>
&nbsp;&nbsp;&nbsp;<asp:TextBox ID="tb_fromDate" runat="server" Width="77px"></asp:TextBox>
&nbsp;&nbsp;&nbsp;<asp:TextBox ID="tb_toDate" runat="server" Width="77px" Height="16px"></asp:TextBox>
        &nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="bt_filter" runat="server" OnClick="bt_filter_Click" Text="Filter" BackColor="#FFFF99" BorderColor="#990000" BorderStyle="Groove" Font-Bold="True" />
        <br />
    
        </div>
        <asp:GridView ID="gv_actionsList" runat="server" AllowSorting="True" OnSorting="gv_actionsList_Sorting" CellPadding="4" ForeColor="#333333" GridLines="None" Width="445px">
            <AlternatingRowStyle BackColor="White" />
            <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
            <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
            <SortedAscendingCellStyle BackColor="#FDF5AC" />
            <SortedAscendingHeaderStyle BackColor="#4D0000" />
            <SortedDescendingCellStyle BackColor="#FCF6C0" />
            <SortedDescendingHeaderStyle BackColor="#820000" />
        </asp:GridView>
    </form>
</body>
</html>
