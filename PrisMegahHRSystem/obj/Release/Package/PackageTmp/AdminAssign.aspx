<%@ Page Language="C#" MasterPageFile="~/Master page/Director.Master" AutoEventWireup="true" CodeBehind="AdminAssign.aspx.cs" Inherits="PrisMegahHRSystem.AdminAssign" %>

<asp:Content ID="Content1" ContentPlaceHolderID="DirectoryPlaceHolder" runat="server">
    <asp:Label ID="Label8" runat="server" Text="Assign Module" Font-Bold="True" ForeColor="#CC3300"></asp:Label>
</asp:Content>

<asp:Content ID="myContent" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link rel="stylesheet" type="text/css" href="CSS class/Layout.css" />
    <asp:Label ID="Label1" runat="server" Text="Admin Reservation" CssClass="labelTitle"></asp:Label>
    <br />
    <br />
    <asp:Label ID="Label10" runat="server" Text="Permit Company Name" Font-Bold="True" Font-Names="Book Antiqua"></asp:Label>
    <asp:DropDownList ID="ddlPermitCo" runat="server" DataSourceID="PermitCoDataSource" DataTextField="companyName" DataValueField="companyName">
    </asp:DropDownList>
    <asp:ImageButton ID="ibtnSearchByCo" runat="server" Height="18px" ImageUrl="~/Images/search-button.png" Width="18px" CssClass="grow" OnClick="ibtnSearchByCo_Click" />
    <asp:SqlDataSource ID="PermitCoDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:PrisMegahConnString %>" SelectCommand="SELECT [companyName] FROM [permitCompany_List]"></asp:SqlDataSource>
    <br />
    <br />
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <table>
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="Label11" runat="server" Text="Person Incharge 1" Font-Bold="True" Font-Names="Bookman Old Style"></asp:Label>&nbsp;
                    </td>
                    <td class="auto-style1">
                        <asp:Label ID="lblPIC1" runat="server" BackColor="#CCCCCC" Font-Names="Baskerville Old Face" ForeColor="Blue"></asp:Label>
                        <asp:ImageButton ID="ibtnClearPIC1" runat="server" Height="18px" ImageUrl="~/Images/clear-action.png" Width="18px" CssClass="grow" OnClick="ibtnClearPIC1_Click" />
                    </td>
                    <td class="auto-style3">
                        <asp:ImageButton ID="ibtnAddPIC1" runat="server" Height="18px" ImageUrl="~/Images/move-action.png" Width="18px" CssClass="grow" OnClick="ibtnAddPIC1_Click" />
                        <asp:DropDownList ID="ddlPICList1" runat="server" DataSourceID="PICDataSource" DataTextField="name" DataValueField="name">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="PICDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:PrisMegahConnString %>" SelectCommand="SELECT name FROM userDetails WHERE (position = 'Administrator') AND (status = 'Available')"></asp:SqlDataSource>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="Label2" runat="server" Text="Person Incharge 2" Font-Bold="True" Font-Names="Bookman Old Style"></asp:Label>&nbsp;
                    </td>
                    <td class="auto-style1">
                        <asp:Label ID="lblPIC2" runat="server" BackColor="#CCCCCC" Font-Names="Baskerville Old Face" ForeColor="Blue"></asp:Label>
                        <asp:ImageButton ID="ibtnClearPIC2" runat="server" Height="18px" ImageUrl="~/Images/clear-action.png" Width="18px" CssClass="grow" OnClick="ibtnClearPIC2_Click" />
                    </td>
                    <td class="auto-style3">
                        <asp:ImageButton ID="ibtnAddPIC2" runat="server" Height="18px" ImageUrl="~/Images/move-action.png" Width="18px" CssClass="grow" OnClick="ibtnAddPIC2_Click" />
                        <asp:DropDownList ID="ddlPICList2" runat="server" DataSourceID="PICDataSource" DataTextField="name" DataValueField="name">
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="Label4" runat="server" Text="Person Incharge 3" Font-Bold="True" Font-Names="Bookman Old Style"></asp:Label>&nbsp;
                    </td>
                    <td class="auto-style1">
                        <asp:Label ID="lblPIC3" runat="server" BackColor="#CCCCCC" Font-Names="Baskerville Old Face" ForeColor="Blue"></asp:Label>
                        <asp:ImageButton ID="ibtnClearPIC3" runat="server" Height="18px" ImageUrl="~/Images/clear-action.png" Width="18px" CssClass="grow" OnClick="ibtnClearPIC3_Click" />
                    </td>
                    <td class="auto-style3">
                        <asp:ImageButton ID="ibtnAddPIC3" runat="server" Height="18px" ImageUrl="~/Images/move-action.png" Width="18px" CssClass="grow" OnClick="ibtnAddPIC3_Click" />
                        <asp:DropDownList ID="ddlPICList3" runat="server" DataSourceID="PICDataSource" DataTextField="name" DataValueField="name">
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="Label6" runat="server" Text="Person Incharge 4" Font-Bold="True" Font-Names="Bookman Old Style"></asp:Label>&nbsp;
                    </td>
                    <td class="auto-style1">
                        <asp:Label ID="lblPIC4" runat="server" BackColor="#CCCCCC" Font-Names="Baskerville Old Face" ForeColor="Blue"></asp:Label>
                        <asp:ImageButton ID="ibtnClearPIC4" runat="server" Height="18px" ImageUrl="~/Images/clear-action.png" Width="18px" CssClass="grow" OnClick="ibtnClearPIC4_Click" />
                    </td>
                    <td class="auto-style3">
                        <asp:ImageButton ID="ibtnAddPIC4" runat="server" Height="18px" ImageUrl="~/Images/move-action.png" Width="18px" CssClass="grow" OnClick="ibtnAddPIC4_Click" />
                        <asp:DropDownList ID="ddlPICList4" runat="server" DataSourceID="PICDataSource" DataTextField="name" DataValueField="name">
                        </asp:DropDownList>
                    </td>
                </tr>
            </table>
        </ContentTemplate>
    </asp:UpdatePanel>
    <table>
        <tr>
            <td class="auto-style2"></td>
            <td class="auto-style1"></td>
            <td class="auto-style3" style="text-align: right">
                <asp:ImageButton ID="ibtnSubmit" runat="server" ImageUrl="~/Images/confirm-buton.png" Height="22px" CssClass="shrink" OnClick="ibtnSubmit_Click" />
                <asp:ImageButton ID="ibtnCancel" runat="server" ImageUrl="~/Images/cancel-button.png" Height="22px" CssClass="shrink" OnClick="ibtnCancel_Click" />
            </td>
        </tr>
    </table>

</asp:Content>
<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="head">
    <style type="text/css">
        .auto-style1
        {
            width: 213px;
        }

        .grow
        {
        }
        .auto-style2
        {
            width: 165px;
        }
        .auto-style3
        {
            width: 181px;
        }
    </style>
</asp:Content>

