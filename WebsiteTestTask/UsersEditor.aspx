<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UsersEditor.aspx.cs" Inherits="WebsiteTestTask.UsersEditor" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:Button ID="bt_signOut" runat="server" OnClick="bt_signOut_Click" Text="SignOut" BackColor="#FFFF99" BorderColor="#990000" BorderStyle="Groove" Font-Bold="True" />
        <br />
        <br />
        <asp:GridView ID="gv_usersList" runat="server" AutoGenerateColumns="False" AutoGenerateSelectButton="True" DataKeyNames="user_id" DataSourceID="UsersSqlDataSource" CellPadding="4" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="user_id" HeaderText="user_id" ReadOnly="True" SortExpression="user_id" />
                <asp:BoundField DataField="name" HeaderText="name" SortExpression="name" />
            </Columns>
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
        <br />
        <br />
        <asp:DetailsView ID="dv_userssList" runat="server" AutoGenerateRows="False" DataKeyNames="user_id" DataSourceID="DVUsersListSqlDataSource" Height="50px" Width="125px" OnItemDeleted="dv_userssList_ItemDeleted" OnItemInserted="dv_userssList_ItemInserted" OnItemInserting="dv_userssList_ItemInserting" OnItemUpdated="dv_userssList_ItemUpdated" OnModeChanged="dv_userssList_ModeChanged" CellPadding="4" ForeColor="#333333" GridLines="None" OnItemUpdating="dv_userssList_ItemUpdating">
            <AlternatingRowStyle BackColor="White" />
            <CommandRowStyle BackColor="#FFFFC0" Font-Bold="True" />
            <FieldHeaderStyle BackColor="#FFFF99" Font-Bold="True" />
            <Fields>
                <asp:TemplateField HeaderText="user_id" SortExpression="user_id">
                    <EditItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("user_id") %>'></asp:Label>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" ReadOnly="True" Text='<%# Bind("user_id") %>'></asp:TextBox>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("user_id") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="name" HeaderText="name" SortExpression="name" />
                <asp:BoundField DataField="password" HeaderText="password" SortExpression="password" />
                <asp:BoundField DataField="email" HeaderText="email" SortExpression="email" />
                <asp:BoundField DataField="company" HeaderText="company" SortExpression="company" />
                <asp:TemplateField HeaderText="type" SortExpression="type">
                    <EditItemTemplate>
                        <asp:RadioButtonList ID="RadioButtonList1" runat="server" SelectedValue='<%# Bind("type") %>'>
                            <asp:ListItem>admin</asp:ListItem>
                            <asp:ListItem>user</asp:ListItem>
                        </asp:RadioButtonList>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:RadioButtonList ID="RadioButtonList2" runat="server" SelectedValue='<%# Bind("type") %>'>
                            <asp:ListItem>admin</asp:ListItem>
                            <asp:ListItem>user</asp:ListItem>
                        </asp:RadioButtonList>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("type") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="start_date" HeaderText="start_date" SortExpression="start_date" />
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowInsertButton="True" />
            </Fields>
            <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
            <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
        </asp:DetailsView>
        <asp:SqlDataSource ID="UsersSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:UsersDBConnectionString %>" ProviderName="<%$ ConnectionStrings:UsersDBConnectionString.ProviderName %>" SelectCommand="SELECT [user_id], [name] FROM [user] WHERE ([user_id] = ?)">
            <SelectParameters>
                <asp:SessionParameter Name="user_id2" SessionField="usersListDS" Type="Int64" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="DVUsersListSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:UsersDBConnectionString %>" DeleteCommand="DELETE FROM [user] WHERE [user_id] = ?" InsertCommand="INSERT INTO [user] ([user_id], [name], [password], [email], [company], [type], [start_date]) VALUES (?, ?, ?, ?, ?, ?, ?)" ProviderName="<%$ ConnectionStrings:UsersDBConnectionString.ProviderName %>" SelectCommand="SELECT * FROM [user] WHERE ([user_id] = ?)" UpdateCommand="UPDATE [user] SET [name] = ?, [password] = ?, [email] = ?, [company] = ?, [type] = ?, [start_date] = ? WHERE [user_id] = ?">
            <DeleteParameters>
                <asp:Parameter Name="user_id" Type="Int64" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="user_id" Type="Int64" />
                <asp:Parameter Name="name" Type="String" />
                <asp:Parameter Name="password" Type="String" />
                <asp:Parameter Name="email" Type="String" />
                <asp:Parameter Name="company" Type="String" />
                <asp:Parameter Name="type" Type="String" />
                <asp:Parameter Name="start_date" Type="String" />
            </InsertParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="gv_usersList" Name="user_id" PropertyName="SelectedValue" Type="Int64" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="name" Type="String" />
                <asp:Parameter Name="password" Type="String" />
                <asp:Parameter Name="email" Type="String" />
                <asp:Parameter Name="company" Type="String" />
                <asp:Parameter Name="type" Type="String" />
                <asp:Parameter Name="start_date" Type="String" />
                <asp:Parameter Name="user_id" Type="Int64" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:Button ID="bt_goToLogList" runat="server" OnClick="bt_goToLogList_Click" Text="Show logs" BackColor="#FFFF99" BorderColor="#990000" BorderStyle="Groove" Font-Bold="True" />
    </form>
</body>
</html>
