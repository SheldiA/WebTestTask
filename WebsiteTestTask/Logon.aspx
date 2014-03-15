<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Logon.aspx.cs" Inherits="WebsiteTestTask.Logon" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 187px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
    </div>
        <asp:Login ID="lg_loginData" runat="server" BackColor="#FFFBD6" BorderColor="#990000" BorderPadding="4" BorderStyle="Groove" BorderWidth="2px" Font-Names="Verdana" Font-Size="0.8em" ForeColor="#333333" OnAuthenticate="lg_loginData_Authenticate" TextLayout="TextOnTop">
            <InstructionTextStyle Font-Italic="True" ForeColor="Black" />
            <LayoutTemplate>
                <table cellpadding="4" cellspacing="0" style="border-collapse:collapse; height: 199px; width: 256px; font-size: medium; position: fixed; top: 35px; left: 11px;">
                    <tr>
                        <td>
                            <table cellpadding="0">
                                <tr>
                                    <td align="center" style="color:White;background-color:#990000;font-size:0.9em;font-weight:bold;" class="auto-style1">Log In</td>
                                </tr>
                                <tr>
                                    <td class="auto-style1">
                                        <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName">User Name:</asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style1">
                                        <asp:TextBox ID="UserName" runat="server" Font-Size="0.8em" Width="124px"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName" ErrorMessage="User Name is required." ToolTip="User Name is required." ValidationGroup="lg_loginData">*</asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style1">
                                        <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password">Password:</asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style1">
                                        <asp:TextBox ID="Password" runat="server" Font-Size="0.8em" TextMode="Password" Width="123px"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password" ErrorMessage="Password is required." ToolTip="Password is required." ValidationGroup="lg_loginData">*</asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style1">
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td align="center" style="color:Red;" class="auto-style1">
                                        <asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" class="auto-style1">
                                        <asp:Button ID="LoginButton" runat="server" BackColor="White" BorderColor="#CC9966" BorderStyle="Solid" BorderWidth="1px" CommandName="Login" Font-Names="Verdana" Font-Size="0.8em" ForeColor="#990000" OnClick="LoginButton_Click" Text="Log In" ValidationGroup="lg_loginData" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </LayoutTemplate>
            <LoginButtonStyle BackColor="White" BorderColor="#CC9966" BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" Font-Size="0.8em" ForeColor="#990000" />
            <TextBoxStyle Font-Size="0.8em" />
            <TitleTextStyle BackColor="#990000" Font-Bold="True" Font-Size="0.9em" ForeColor="White" />
        </asp:Login>
    </form>
</body>
</html>
