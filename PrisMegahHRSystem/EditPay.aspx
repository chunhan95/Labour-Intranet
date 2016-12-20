<%@ Page Language="C#" MasterPageFile="~/Master page/Account.Master" AutoEventWireup="true" CodeBehind="EditPay.aspx.cs" Inherits="PrisMegahHRSystem.EditPay" %>

<asp:Content ID="Content1" ContentPlaceHolderID="DirectoryPlaceHolder" runat="server">
    <asp:Label ID="Label1" runat="server" Text="Payment Particular" Font-Bold="True" ForeColor="#CC3300"></asp:Label>
</asp:Content>

<asp:Content ID="myContent" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link rel="stylesheet" type="text/css" href="../CSS class/Layout.css" />
    <br />
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <table border="1">
        <tr>
            <td class="auto-style1">
                <asp:Label ID="Label10" runat="server" Text="1)Passport No."></asp:Label>
                <asp:DropDownList ID="ddlPPNo" runat="server" DataSourceID="SqlDataSource1" DataTextField="passportNo_New" DataValueField="passportNo_New" Font-Names="Lucida Bright" BackColor="#F6F1DB" ForeColor="#7D6754">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:PrisMegahConnString %>" SelectCommand="SELECT DISTINCT workerDetails.passportNo_New FROM workerDetails INNER JOIN payment ON workerDetails.workerNo = payment.workerNo"></asp:SqlDataSource>
                <asp:ImageButton ID="ibtnSearchByPPNo" runat="server" Height="18px" ImageUrl="~/Images/search-button.png" Width="18px" OnClick="ibtnSearchByPPNo_Click" CssClass="grow" />
            </td>
            <td>
                <asp:Label ID="Label11" runat="server" Text="2)Invoice No."></asp:Label>
                <asp:DropDownList ID="ddlPaymentNo" runat="server" Font-Names="Lucida Bright" BackColor="#F6F1DB" ForeColor="#7D6754"></asp:DropDownList>
                <asp:ImageButton ID="ibtnSearchByInvNo" runat="server" Height="18px" ImageUrl="~/Images/search-button.png" Width="18px" OnClick="ibtnSearchByInvNo_Click" CssClass="grow" />
            </td>
            <td>
                <asp:Label ID="Label2" runat="server" Text="3)Invoice Date"></asp:Label>
                <asp:DropDownList ID="ddlPayDate" runat="server" Font-Names="Lucida Bright" BackColor="#F6F1DB" ForeColor="#7D6754"></asp:DropDownList>
                <asp:ImageButton ID="ibtnSearchByDate" runat="server" Height="18px" ImageUrl="~/Images/search-button.png" Width="18px" OnClick="ibtnSearchByDate_Click" CssClass="grow" />
                <asp:Label ID="lblPayID" runat="server"></asp:Label>
            </td>
        </tr>
    </table>
    <br />
    <table>
        <%--<tr>
            <td>
                <asp:Label ID="Label3" runat="server" Text="Invoice No." Font-Bold="True" Font-Names="Book Antiqua"></asp:Label>
            </td>
            <td>
                <asp:Label ID="lblInvoiceNo" runat="server"></asp:Label>
            </td>
        </tr>--%>
        <tr>
            <td>
                <asp:Label ID="Label12" runat="server" Text="Payment Total" Font-Bold="True" Font-Names="Book Antiqua"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtPaymentTotal" runat="server" Enabled="False"></asp:TextBox>
                <asp:RegularExpressionValidator ID="revTotal" runat="server" ControlToValidate="txtPaymentTotal" ErrorMessage="*Please enter only numbers like 100 or 100.00" ValidationExpression="^-?\d+\.?\d{0,2}$" ForeColor="Red"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label13" runat="server" Text="Payment Paid" Font-Bold="True" Font-Names="Book Antiqua"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtCurrentPayment" runat="server" Enabled="False"></asp:TextBox>
                <asp:RegularExpressionValidator ID="revPay" runat="server" ControlToValidate="txtCurrentPayment" ErrorMessage="*Please enter only numbers like 100 or 100.00" ValidationExpression="^\d+(\.\d\d)?$" ForeColor="Red"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label14" runat="server" Text="Payment Outstanding" Font-Bold="True" Font-Names="Book Antiqua"></asp:Label>
            </td>
            <td>
                <asp:Label ID="lblOutstanding" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label15" runat="server" Text="Payment Remark (if any)" Font-Bold="True" Font-Names="Book Antiqua"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtPaymentRemark" runat="server" TextMode="MultiLine" Width="264px" Enabled="False"></asp:TextBox></td>
        </tr>
        <tr>
            <td style="vertical-align: top">
                <asp:Label ID="Label17" runat="server" Font-Bold="True" Font-Names="Book Antiqua" Text="Payment Date"></asp:Label>
            </td>
            <td>
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <asp:Label ID="lblPayDay" runat="server"></asp:Label>
                        <asp:ImageButton ID="ibtnEditDate" runat="server" Height="18px" ImageUrl="~/Images/edit-icon.png" OnClick="ibtnEditDate_Click" Width="18px" CssClass="grow" />
                        <asp:Calendar ID="Calendar1" runat="server" BackColor="White" BorderColor="#3366CC" BorderWidth="1px" CellPadding="1" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="#003399" Height="180px" Width="200px" OnSelectionChanged="Calendar1_SelectionChanged" Visible="False">
                            <DayHeaderStyle BackColor="#99CCCC" ForeColor="#336666" Height="1px" />
                            <NextPrevStyle Font-Size="8pt" ForeColor="#CCCCFF" />
                            <OtherMonthDayStyle ForeColor="#999999" />
                            <SelectedDayStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                            <SelectorStyle BackColor="#99CCCC" ForeColor="#336666" />
                            <TitleStyle BackColor="#003399" BorderColor="#3366CC" BorderWidth="1px" Font-Bold="True" Font-Size="10pt" ForeColor="#CCCCFF" Height="25px" />
                            <TodayDayStyle BackColor="#99CCCC" ForeColor="White" />
                            <WeekendDayStyle BackColor="#CCCCFF" />
                        </asp:Calendar>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </td>
        </tr>
        <tr>
            <td></td>
            <td style="text-align: right">
                <asp:Button ID="btnCalculateOutstanding" runat="server" Text="Re-Calculate Outstanding" OnClick="btnCalculateOutstanding_Click" Width="174px" />
                &nbsp;<asp:Button ID="btnSubmit" runat="server" Enabled="False" OnClick="btnSubmit_Click" Text="Submit" />
                &nbsp;<asp:Button ID="btnCancel" runat="server" Text="Cancel" OnClick="btnCancel_Click" />
            </td>
        </tr>
    </table>

</asp:Content>
<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="head">
    <style type="text/css">
        .auto-style1
        {
            width: 228px;
        }
    </style>
</asp:Content>

