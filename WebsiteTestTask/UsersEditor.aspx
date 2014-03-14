<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UsersEditor.aspx.cs" Inherits="WebsiteTestTask.UsersEditor" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        UsersEditor</div>
        <asp:Button ID="bt_signOut" runat="server" OnClick="bt_signOut_Click" Text="SignOut" />
        <asp:GridView ID="gv_usersList" runat="server">
        </asp:GridView>
    </form>
</body>
</html>
