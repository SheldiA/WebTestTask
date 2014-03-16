<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UsersEditor.aspx.cs" Inherits="WebsiteTestTask.UsersEditor" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="/Scripts/jquery-1.10.2.js" type="text/javascript"></script>
    <link type="text/css" href="/Scripts/validation_style.css" rel="stylesheet" />
    <script src="/Scripts/jquery.validate.min.js" type="text/javascript"></script>
    <script src="/Scripts/jquery_form_validation.js" type="text/javascript"></script>
</head>
<body>
    <form id="fm_usersEditor" runat="server">
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
        <asp:Label ID="lb_error" runat="server" ForeColor="Red"></asp:Label>
        <br />
        <br />
        <asp:DetailsView ID="dv_userssList" runat="server" AutoGenerateRows="False" DataKeyNames="user_id" DataSourceID="DVUsersListSqlDataSource" Height="50px" Width="104px" OnItemDeleted="dv_userssList_ItemDeleted" OnItemInserted="dv_userssList_ItemInserted" OnItemInserting="dv_userssList_ItemInserting" OnItemUpdated="dv_userssList_ItemUpdated" OnModeChanged="dv_userssList_ModeChanged" CellPadding="4" ForeColor="#333333" GridLines="None" OnItemUpdating="dv_userssList_ItemUpdating">
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
                <asp:TemplateField HeaderText="name" SortExpression="name">
                    <EditItemTemplate>
                        <asp:TextBox ID="tb_name" runat="server" Text='<%# Bind("name") %>' Height="19px" Width="102px"></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="tb_name" runat="server" Text='<%# Bind("name") %>' Height="18px" Width="102px"></asp:TextBox>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("name") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="password" SortExpression="password">
                    <EditItemTemplate>
                        <asp:TextBox ID="tb_password" runat="server" Height="19px" Text='<%# Bind("password") %>' Width="102px"></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="tb_password" runat="server" Text='<%# Bind("password") %>' Height="19px" Width="102px"></asp:TextBox>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("password") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="email" SortExpression="email">
                    <EditItemTemplate>
                        <asp:TextBox ID="tb_email" runat="server" Text='<%# Bind("email") %>' Height="19px" Width="102px"></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="tb_email" runat="server" Text='<%# Bind("email") %>' Height="19px" Width="102px"></asp:TextBox>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label5" runat="server" Text='<%# Bind("email") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
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
                <asp:TemplateField HeaderText="start_date" SortExpression="start_date">
                    <EditItemTemplate>
                        <asp:TextBox ID="tb_start_date" runat="server" Text='<%# Bind("start_date") %>' Height="19px" Width="102px"></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="tb_start_date" runat="server" Text='<%# Bind("start_date") %>' Height="19px" Width="102px"></asp:TextBox>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label6" runat="server" Text='<%# Bind("start_date") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField ShowHeader="False">
                    <EditItemTemplate>
                        <asp:LinkButton ID="LinkButton1" runat="server" CssClass="connect" CausesValidation="True" CommandName="Update" Text="Update"></asp:LinkButton>
                        &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel"></asp:LinkButton>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:LinkButton ID="LinkButton1" runat="server" CssClass="connect" CausesValidation="True" CommandName="Insert" Text="Insert"></asp:LinkButton>
                        &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel"></asp:LinkButton>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Edit" Text="Edit"></asp:LinkButton>
                        &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="New" Text="New"></asp:LinkButton>
                        &nbsp;<asp:LinkButton ID="LinkButton3" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete"></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
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
