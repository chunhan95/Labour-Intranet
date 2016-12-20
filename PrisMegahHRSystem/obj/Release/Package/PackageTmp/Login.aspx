<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="PrisMegahHRSystem.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" type="text/css" href="CSS class/Login_Layout.css" />
    <link id="Link1" runat="server" rel="shortcut icon" href="~/Images/prismegah_icon.ico" type="image/x-icon"/>
    <link id="Link2" runat="server" rel="icon" href="~/Images/prismegah_icon.ico" type="image/ico"/>
    <style type="text/css">
        .auto-style3
        {
            width: 111px;
        }
        .auto-style4
        {
            width: 167px;
        }
        .grow
        {}
        .auto-style5
        {
            width: 111px;
            height: 40px;
        }
        .auto-style6
        {
            height: 40px;
        }
    </style>
</head>
<body style="background-image: url('Images/loginBackground.png'); background-repeat: no-repeat; background-size: 100%;">
    <form id="form1" runat="server">
        <div style="text-align: center">

            <asp:Image ID="Image1" runat="server" ImageUrl="Images/PrisMegah_Logo.JPG" />

            <br />
        </div>
        <table class="center">
            <tr>
                <td class="auto-style3">
                    <asp:Image ID="Image2" runat="server" Height="28px" ImageUrl="Images/login_icon.png" Width="44px" />
                </td>
                <td class="auto-style4">
                    <marquee id="mq" direction="left" loop="true" scrollamount="4"><asp:Label ID="Label4" runat="server" Font-Bold="True" Font-Size="Small" ForeColor="#FF3300" Text="Welcome, please sign in to enjoy the full features of this page !!" BackColor="White"></asp:Label></marquee>
                </td>
            </tr>
            <tr>
                <td style="background-color: lightblue" class="auto-style3">
                    <asp:Label ID="Label1" runat="server" Font-Bold="True" Text="User ID"></asp:Label></td>
                <td class="auto-style4">
                    <asp:TextBox ID="txtLoginID" CssClass="inputBox" runat="server" Width="130px"></asp:TextBox></td>
            </tr>
            <tr>
                <td style="background-color: lightblue" class="auto-style3">
                    <asp:Label ID="Label2" runat="server" Font-Bold="True" Text="Password"></asp:Label></td>
                <td class="auto-style4">
                    <asp:TextBox ID="txtLoginPw" CssClass="inputBox" runat="server" Width="130px" TextMode="Password"></asp:TextBox></td>
            </tr>
            <tr>
                <td class="auto-style5">
                    <asp:Label ID="Label3" runat="server" ForeColor="#FF9933"></asp:Label>
                </td>
                <td style="text-align:right" class="auto-style6">
                    <asp:ImageButton ID="ibtnLogin" CssClass="grow" runat="server" ImageUrl="~/Images/login-button.png" Height="36px" Width="84px" OnClick="ibtnLogin_Click" />
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
