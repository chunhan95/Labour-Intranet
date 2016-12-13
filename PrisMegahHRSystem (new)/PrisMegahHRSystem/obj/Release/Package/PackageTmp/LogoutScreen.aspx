<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LogoutScreen.aspx.cs" Inherits="PrisMegahHRSystem.LogoutScreen" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" type="text/css" href="CSS class/Login_Layout.css" />
    <link id="Link1" runat="server" rel="shortcut icon" href="~/Images/prismegah_icon.ico" type="image/x-icon"/>
    <link id="Link2" runat="server" rel="icon" href="~/Images/prismegah_icon.ico" type="image/ico"/>
    <script>
        function startTimer(duration, display) {
            var timer = duration, minutes, seconds;
            var end = setInterval(function () {
                minutes = parseInt(timer / 60, 10)
                seconds = parseInt(timer % 60, 10);

                minutes = minutes < 10 ? "0" + minutes : minutes;
                seconds = seconds < 10 ? "0" + seconds : seconds;

                display.textContent = minutes + ":" + seconds;

                if (--timer < 0) {
                    window.location = "Login.aspx";
                    clearInterval(end);
                }
            }, 1000);
        }

        window.onload = function () {
            var fiveMinutes = 0,
                display = document.querySelector('#lblCount');
            startTimer(fiveMinutes, display);
        };
    </script>
</head>
<body style="background-image: url('Images/loginBackground.png'); background-repeat: no-repeat; background-size: cover;">
    <form id="form1" runat="server">
        <div style="text-align: center">

            <asp:Image ID="Image1" runat="server" ImageUrl="Images/PrisMegah_Logo.JPG" />

        </div>
        <table class="center">
            <tr>
                <td class="auto-style3">
                    <div id="dvCountDown">
                        <asp:Label ID="Label1" runat="server" Text="Your session has expired, you will be redirect to login page in " Font-Bold="True" Font-Size="Large" ForeColor="#FF9933"></asp:Label>
                        <span id="lblCount" style="color:red">00:01</span>
                        <asp:Label ID="Label2" runat="server" Text="seconds" Font-Bold="True" Font-Size="Large" ForeColor="#FF9933"></asp:Label>
                    </div>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>

<%--http://stackoverflow.com/questions/31775113/create-a-countdown-timer-and-redirect-to-another-page-after-countdown-comes-to-z--%>
