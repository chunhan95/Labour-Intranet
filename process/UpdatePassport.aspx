<%@ Page Language="C#" MasterPageFile="~/Master page/Director.Master" AutoEventWireup="true" CodeBehind="UpdatePassport.aspx.cs" Inherits="PrisMegahHRSystem.UpdatePassport" %>

<%--<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" type="text/css" href="../CSS class/Passport_Layout.css" />
    <style type="text/css">
        .auto-style1
        {
            width: 184px;
        }
    </style>
</head>
<body style="background-image:url('../Images/light-blue-background.jpg')">
    <form id="form1" runat="server">--%>
<asp:Content ID="Content1" ContentPlaceHolderID="DirectoryPlaceHolder" runat="server">
    <asp:Label ID="Label8" runat="server" Text="Passport Expiry" Font-Bold="True" ForeColor="#CC3300"></asp:Label>
</asp:Content>

<asp:Content ID="myContent" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link rel="stylesheet" type="text/css" href="CSS class/Passport_Layout.css" />
    <style type="text/css">
        .auto-style1
        {
            width: 200px;
        }

        .grow
        {
        }

        .auto-style2
        {
            width: 200px;
            height: 26px;
        }

        .auto-style3
        {
            height: 26px;
        }
    </style>
    <div class="center">
        <asp:Label ID="Label2" runat="server" Text="Worker Passport Details" CssClass="labelTitle"></asp:Label>
        <br />
        <br />
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <asp:Label ID="Label16" runat="server" Text="Passport No." Font-Bold="True"></asp:Label>
        &nbsp;<asp:DropDownList ID="ddlSearchPPNo" runat="server" Font-Names="Lucida Bright" BackColor="#F6F1DB" CssClass="ddl" ForeColor="#7D6754">
        </asp:DropDownList>
        &nbsp;<asp:ImageButton ID="ibtnSearchBy" runat="server" Height="18px" ImageUrl="~/Images/search-button.png" Width="18px" CssClass="grow" OnClick="ibtnSearchBy_Click" />

        <br />
        <br />
        <%--</ContentTemplate>
        </asp:UpdatePanel>--%>
        <asp:Panel ID="Panel1" runat="server" DefaultButton="btnUpdateDate">
            <table border="1" style="background-color: #C0C0C0; font-family: Century">
                <tr>
                    <td class="auto-style2" style="background-color: lightblue">
                        <asp:Label ID="Label1" runat="server" Text="Name" Font-Names="Comic Sans MS"></asp:Label>
                    </td>
                    <td class="auto-style3">
                        <asp:Label ID="lblName" runat="server" Font-Bold="True" ForeColor="Blue"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style1" style="background-color: lightblue">
                        <asp:Label ID="Label9" runat="server" Text="Gender" Font-Names="Comic Sans MS"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lblGender" runat="server" Font-Bold="True" ForeColor="Blue"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style1" style="background-color: lightblue">
                        <asp:Label ID="Label11" runat="server" Text="Nationality" Font-Names="Comic Sans MS"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lblNationality" runat="server" Font-Bold="True" ForeColor="Blue"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td style="background-color: lightblue" class="auto-style1">
                        <asp:Label ID="Label19" runat="server" Text="PLKS Company" Font-Names="Comic Sans MS"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lblPLKSCo" runat="server" Font-Bold="True" ForeColor="Blue"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td style="background-color: lightblue" class="auto-style1">
                        <asp:Label ID="Label21" runat="server" Text="PIC" Font-Names="Comic Sans MS"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lblEmpName" runat="server" Font-Bold="True" ForeColor="Blue"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td style="background-color: lightblue" class="auto-style1">
                        <asp:Label ID="Label23" runat="server" Text="Employer Company" Font-Names="Comic Sans MS"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lblEmpCo" runat="server" Font-Bold="True" ForeColor="Blue"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td style="background-color: lightblue" class="auto-style1">
                        <asp:Label ID="Label25" runat="server" Text="Employer Contact" Font-Names="Comic Sans MS"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lblEmpContact" runat="server" Font-Bold="True" ForeColor="Blue"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style1" style="background-color: lightblue">
                        <asp:Label ID="Label17" runat="server" Text="Sector" Font-Names="Comic Sans MS"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lblSector" runat="server" Font-Bold="True" ForeColor="Blue"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style1" style="background-color: lightblue">
                        <asp:Label ID="Label7" runat="server" Text="Agent" Font-Names="Comic Sans MS"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lblAgent" runat="server" Font-Bold="True" ForeColor="Blue"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style1" style="background-color: lightblue">
                        <asp:Label ID="Label13" runat="server" Text="Admin Incharge" Font-Names="Comic Sans MS"></asp:Label>
                    </td>
                    <td>
                        <asp:UpdatePanel ID="UpdatePanel4" runat="server">
                            <ContentTemplate>
                                <asp:Label ID="lblAdminIncharge" runat="server" Font-Bold="True" ForeColor="Blue"></asp:Label>
                                <asp:ImageButton ID="ibtnEditAdmin" runat="server" CssClass="grow" Height="18px" ImageUrl="~/Images/edit-icon.png" OnClick="ibtnEditAdmin_Click" ToolTip="Click to change admin incharge" Width="18px" />
                                <asp:DropDownList ID="ddlAdminIncharge" runat="server" DataSourceID="AdminDataSource" DataTextField="name" DataValueField="name" AutoPostBack="True" OnSelectedIndexChanged="ddlAdminIncharge_SelectedIndexChanged"></asp:DropDownList>
                                <asp:SqlDataSource ID="AdminDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:PrisMegahConnString %>" SelectCommand="SELECT name FROM userDetails WHERE (position = 'Administrator') AND (status = 'Available')"></asp:SqlDataSource>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style1" style="background-color: lightblue">
                        <asp:Label ID="Label6" runat="server" Text="Service Type/Phase" Font-Names="Comic Sans MS"></asp:Label>
                    </td>
                    <td>
                        <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                            <ContentTemplate>
                                <asp:Label ID="lblServiceType" runat="server" Font-Bold="True" ForeColor="Blue"></asp:Label>
                                <asp:TextBox ID="txtServicePhase" runat="server" ToolTip="Number of phase" Width="56px" OnTextChanged="txtServicePhase_TextChanged"></asp:TextBox>
                                <asp:ImageButton ID="ibtnEditService" runat="server" CssClass="grow" Height="18px" ImageUrl="~/Images/edit-icon.png" OnClick="ibtnEditService_Click" Width="18px" ToolTip="Click to change service type" />
                                <asp:DropDownList ID="ddlServiceType" runat="server" DataSourceID="ServiceDataSource" DataTextField="serviceType" DataValueField="serviceType" OnSelectedIndexChanged="ddlServiceType_SelectedIndexChanged" AutoPostBack="true">
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="ServiceDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:PrisMegahConnString %>" SelectCommand="SELECT [serviceType] FROM [serviceType_List]"></asp:SqlDataSource>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style1" style="background-color: lightblue">
                        <asp:Label ID="Label10" runat="server" Text="Submit By" Font-Names="Comic Sans MS"></asp:Label>
                    </td>
                    <td>
                        <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                            <ContentTemplate>
                                <asp:Label ID="lblSubmitBy" runat="server" Font-Bold="True" ForeColor="Blue"></asp:Label>
                                <asp:ImageButton ID="ibtnEditSB" runat="server" CssClass="grow" Height="18px" ImageUrl="~/Images/edit-icon.png" OnClick="ibtnEditSB_Click" ToolTip="Click to change submit by" Width="18px" />
                                <asp:DropDownList ID="ddlSubmitBy" runat="server" AutoPostBack="True" DataSourceID="SubmitByDataSource" DataTextField="name" DataValueField="name" OnSelectedIndexChanged="ddlSubmitBy_SelectedIndexChanged">
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="SubmitByDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:PrisMegahConnString %>" SelectCommand="SELECT name FROM userDetails WHERE ((position = 'Director') OR (position = 'Administrator')) AND (status='Available')"></asp:SqlDataSource>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style1" style="background-color: lightblue">
                        <asp:Label ID="Label12" runat="server" Text="Submit To" Font-Names="Comic Sans MS"></asp:Label>
                    </td>
                    <td>
                        <asp:UpdatePanel ID="UpdatePanel5" runat="server">
                            <ContentTemplate>
                                <asp:Label ID="lblSubmitTo" runat="server" Font-Bold="True" ForeColor="Blue"></asp:Label>
                                <asp:ImageButton ID="ibtnEditST" runat="server" CssClass="grow" Height="18px" ImageUrl="~/Images/edit-icon.png" OnClick="ibtnEditST_Click" ToolTip="Click to change submit to" Width="18px" />
                                <asp:DropDownList ID="ddlSubmitTo" runat="server" AutoPostBack="True" DataSourceID="SubmitToDataSource" DataTextField="coName" DataValueField="coName" OnSelectedIndexChanged="ddlSubmitTo_SelectedIndexChanged">
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="SubmitToDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:PrisMegahConnString %>" SelectCommand="SELECT [coName] FROM [submitTo]"></asp:SqlDataSource>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </td>
                </tr>
                <tr>
                    <td style="background-color: lightblue; vertical-align: top" class="auto-style1">
                        <asp:Label ID="Label15" runat="server" Text="Submit Date" Font-Names="Comic Sans MS"></asp:Label>
                    </td>
                    <td>
                        <asp:UpdatePanel ID="UpdatePanel7" runat="server">
                            <ContentTemplate>
                                <asp:Label ID="lblSubmit" runat="server" Font-Bold="True" Font-Names="Century" ForeColor="Red"></asp:Label>
                                <asp:Label ID="Label38" runat="server" Font-Bold="True" Font-Names="Century" ForeColor="Red"></asp:Label>
                                <asp:ImageButton ID="ibtnEditSubmit" runat="server" CssClass="grow" Height="18px" ImageUrl="~/Images/edit-icon.png" OnClick="ibtnEditSubmit_Click" Width="18px" ToolTip="Click to change submit date" />
                                <asp:Calendar ID="Calendar3" runat="server" BackColor="White" BorderColor="White" BorderWidth="1px" Font-Names="Verdana" Font-Size="9pt" ForeColor="Black" Height="120px" NextPrevFormat="FullMonth" OnSelectionChanged="Calendar3_SelectionChanged" Visible="False" Width="320px">
                                    <DayHeaderStyle Font-Bold="True" Font-Size="8pt" />
                                    <NextPrevStyle Font-Bold="True" Font-Size="8pt" ForeColor="#333333" VerticalAlign="Bottom" />
                                    <OtherMonthDayStyle ForeColor="#999999" />
                                    <SelectedDayStyle BackColor="#333399" ForeColor="White" />
                                    <TitleStyle BackColor="White" BorderColor="Black" BorderWidth="4px" Font-Bold="True" Font-Size="12pt" ForeColor="#333399" />
                                    <TodayDayStyle BackColor="#CCCCCC" />
                                </asp:Calendar>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style1" style="background-color: lightblue">
                        <asp:Label ID="Label4" runat="server" Text="Old Passport No." Font-Names="Comic Sans MS"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtOldPPNo" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style1" style="background-color: lightblue">
                        <asp:Label ID="Label5" runat="server" Text="New Passport No." Font-Names="Comic Sans MS"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtNewPPNo" runat="server" OnTextChanged="txtNewPPNo_TextChanged"></asp:TextBox>
                        <asp:Label ID="lblError" runat="server" Text=""></asp:Label>
                        <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtNewPPNo" ErrorMessage="* new passport number is required" ForeColor="Black"></asp:RequiredFieldValidator>--%>
                    </td>
                </tr>
                <tr>
                    <td style="vertical-align: top; background-color: lightblue" class="auto-style1">
                        <asp:Label ID="Label3" runat="server" Text="Passport Expired Date" Font-Names="Comic Sans MS"></asp:Label>
                    </td>
                    <td>
                        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                            <ContentTemplate>
                                <asp:Label ID="lblPPExpired" runat="server" Font-Bold="True" Font-Names="Century" ForeColor="Red"></asp:Label>
                                <asp:Label ID="Label26" runat="server" Font-Bold="True" Font-Names="Century" ForeColor="Red"></asp:Label>
                                <asp:ImageButton ID="ibtnEditPPExp" runat="server" CssClass="grow" Height="18px" ImageUrl="~/Images/edit-icon.png" OnClick="ibtnEditPPExp_Click" ToolTip="Click to change passport expired date" Width="18px" />
                                <asp:Calendar ID="Calendar1" runat="server" BackColor="White" BorderColor="White" BorderWidth="1px" Font-Names="Verdana" Font-Size="9pt" ForeColor="Black" Height="120px" NextPrevFormat="FullMonth" Width="320px" OnSelectionChanged="Calendar1_SelectionChanged" Visible="False">
                                    <DayHeaderStyle Font-Bold="True" Font-Size="8pt" />
                                    <NextPrevStyle Font-Bold="True" Font-Size="8pt" ForeColor="#333333" VerticalAlign="Bottom" />
                                    <OtherMonthDayStyle ForeColor="#999999" />
                                    <SelectedDayStyle BackColor="#333399" ForeColor="White" />
                                    <TitleStyle BackColor="White" BorderColor="Black" BorderWidth="4px" Font-Bold="True" Font-Size="12pt" ForeColor="#333399" />
                                    <TodayDayStyle BackColor="#CCCCCC" />
                                </asp:Calendar>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </td>
                </tr>
                <tr>
                    <td style="vertical-align: top; background-color: lightblue" class="auto-style1">
                        <asp:Label ID="Label14" runat="server" Text="PLKS Expired Date" Font-Names="Comic Sans MS"></asp:Label>
                    </td>
                    <td>
                        <asp:UpdatePanel ID="UpdatePanel6" runat="server">
                            <ContentTemplate>
                                <asp:Label ID="lblPLKSExpired" runat="server" Font-Bold="True" Font-Names="Century" ForeColor="Red"></asp:Label>
                                <asp:Label ID="Label27" runat="server" Font-Bold="True" Font-Names="Century" ForeColor="Red"></asp:Label>
                                <asp:ImageButton ID="ibtnEditPLKSExp" runat="server" CssClass="grow" Height="18px" ImageUrl="~/Images/edit-icon.png" OnClick="ibtnEditPLKSExp_Click" ToolTip="Click to change PLKS expired date" Width="18px" />
                                <asp:Calendar ID="Calendar2" runat="server" BackColor="White" BorderColor="White" BorderWidth="1px" Font-Names="Verdana" Font-Size="9pt" ForeColor="Black" Height="120px" NextPrevFormat="FullMonth" Width="320px" OnSelectionChanged="Calendar2_SelectionChanged" Visible="False">
                                    <DayHeaderStyle Font-Bold="True" Font-Size="8pt" />
                                    <NextPrevStyle Font-Bold="True" Font-Size="8pt" ForeColor="#333333" VerticalAlign="Bottom" />
                                    <OtherMonthDayStyle ForeColor="#999999" />
                                    <SelectedDayStyle BackColor="#333399" ForeColor="White" />
                                    <TitleStyle BackColor="White" BorderColor="Black" BorderWidth="4px" Font-Bold="True" Font-Size="12pt" ForeColor="#333399" />
                                    <TodayDayStyle BackColor="#CCCCCC" />
                                </asp:Calendar>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </td>
                </tr>
                <tr>
                    <td style="background-color: lightblue; vertical-align: top" class="auto-style1">
                        <asp:Label ID="Label20" runat="server" Text="Special Pass Expired Date" Font-Names="Comic Sans MS"></asp:Label>
                    </td>
                    <td>
                        <asp:UpdatePanel ID="UpdatePanel8" runat="server">
                            <ContentTemplate>
                                <asp:Label ID="lblSPExpired" runat="server" Font-Bold="True" Font-Names="Century" ForeColor="Red"></asp:Label>
                                <asp:Label ID="Label39" runat="server" Font-Bold="True" Font-Names="Century" ForeColor="Red"></asp:Label>
                                <asp:ImageButton ID="ibtnEditSPExpiry" runat="server" CssClass="grow" Height="18px" ImageUrl="~/Images/edit-icon.png" OnClick="ibtnEditSPExpiry_Click" Width="18px" ToolTip="Click to change special pass expired date" />
                                <asp:Calendar ID="Calendar4" runat="server" BackColor="White" BorderColor="White" BorderWidth="1px" Font-Names="Verdana" Font-Size="9pt" ForeColor="Black" Height="120px" NextPrevFormat="FullMonth" OnSelectionChanged="Calendar4_SelectionChanged" Visible="False" Width="320px">
                                    <DayHeaderStyle Font-Bold="True" Font-Size="8pt" />
                                    <NextPrevStyle Font-Bold="True" Font-Size="8pt" ForeColor="#333333" VerticalAlign="Bottom" />
                                    <OtherMonthDayStyle ForeColor="#999999" />
                                    <SelectedDayStyle BackColor="#333399" ForeColor="White" />
                                    <TitleStyle BackColor="White" BorderColor="Black" BorderWidth="4px" Font-Bold="True" Font-Size="12pt" ForeColor="#333399" />
                                    <TodayDayStyle BackColor="#CCCCCC" />
                                </asp:Calendar>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </td>
                </tr>
                <tr>
                    <td style="background-color: lightblue; vertical-align: top" class="auto-style1">
                        <asp:Label ID="Label24" runat="server" Text="Process Date" Font-Names="Comic Sans MS"></asp:Label>
                    </td>
                    <td>
                        <asp:UpdatePanel ID="UpdatePanel9" runat="server">
                            <ContentTemplate>
                                <asp:Label ID="lblProcess" runat="server" Font-Bold="True" Font-Names="Century" ForeColor="Red"></asp:Label>
                                <asp:Label ID="Label40" runat="server" Font-Bold="True" Font-Names="Century" ForeColor="Red"></asp:Label>
                                <asp:ImageButton ID="ibtnEditProcess" runat="server" CssClass="grow" Height="18px" ImageUrl="~/Images/edit-icon.png" OnClick="ibtnEditProcess_Click" Width="18px" ToolTip="Click to change process date" />
                                <asp:Calendar ID="Calendar5" runat="server" BackColor="White" BorderColor="White" BorderWidth="1px" Font-Names="Verdana" Font-Size="9pt" ForeColor="Black" Height="120px" NextPrevFormat="FullMonth" OnSelectionChanged="Calendar5_SelectionChanged" Visible="False" Width="320px">
                                    <DayHeaderStyle Font-Bold="True" Font-Size="8pt" />
                                    <NextPrevStyle Font-Bold="True" Font-Size="8pt" ForeColor="#333333" VerticalAlign="Bottom" />
                                    <OtherMonthDayStyle ForeColor="#999999" />
                                    <SelectedDayStyle BackColor="#333399" ForeColor="White" />
                                    <TitleStyle BackColor="White" BorderColor="Black" BorderWidth="4px" Font-Bold="True" Font-Size="12pt" ForeColor="#333399" />
                                    <TodayDayStyle BackColor="#CCCCCC" />
                                </asp:Calendar>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </td>
                </tr>
                <tr>
                    <td style="background-color: lightblue; vertical-align: top" class="auto-style1">
                        <asp:Label ID="Label29" runat="server" Text="Return Date" Font-Names="Comic Sans MS"></asp:Label>
                    </td>
                    <td>
                        <asp:UpdatePanel ID="UpdatePanel10" runat="server">
                            <ContentTemplate>
                                <asp:Label ID="lblReturn" runat="server" Font-Bold="True" Font-Names="Century" ForeColor="Red"></asp:Label>
                                <asp:Label ID="Label41" runat="server" Font-Bold="True" Font-Names="Century" ForeColor="Red"></asp:Label>
                                <asp:ImageButton ID="ibtnEditReturn" runat="server" CssClass="grow" Height="18px" ImageUrl="~/Images/edit-icon.png" OnClick="ibtnEditReturn_Click" Width="18px" ToolTip="Click to change return date" />
                                <asp:Calendar ID="Calendar6" runat="server" BackColor="White" BorderColor="White" BorderWidth="1px" Font-Names="Verdana" Font-Size="9pt" ForeColor="Black" Height="120px" NextPrevFormat="FullMonth" OnSelectionChanged="Calendar6_SelectionChanged" Visible="False" Width="320px">
                                    <DayHeaderStyle Font-Bold="True" Font-Size="8pt" />
                                    <NextPrevStyle Font-Bold="True" Font-Size="8pt" ForeColor="#333333" VerticalAlign="Bottom" />
                                    <OtherMonthDayStyle ForeColor="#999999" />
                                    <SelectedDayStyle BackColor="#333399" ForeColor="White" />
                                    <TitleStyle BackColor="White" BorderColor="Black" BorderWidth="4px" Font-Bold="True" Font-Size="12pt" ForeColor="#333399" />
                                    <TodayDayStyle BackColor="#CCCCCC" />
                                </asp:Calendar>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </td>
                </tr>
                <tr>
                    <td style="background-color: lightblue; vertical-align: top" class="auto-style1">
                        <asp:Label ID="Label31" runat="server" Text="Employer Delivered Date" Font-Names="Comic Sans MS"></asp:Label>
                    </td>
                    <td>
                        <asp:UpdatePanel ID="UpdatePanel11" runat="server">
                            <ContentTemplate>
                                <asp:Label ID="lblEmpDelivery" runat="server" Font-Bold="True" Font-Names="Century" ForeColor="Red"></asp:Label>
                                <asp:Label ID="Label42" runat="server" Font-Bold="True" Font-Names="Century" ForeColor="Red"></asp:Label>
                                <asp:ImageButton ID="ibtnEditEmpDelivery" runat="server" CssClass="grow" Height="18px" ImageUrl="~/Images/edit-icon.png" OnClick="ibtnEditEmpDelivery_Click" Width="18px" ToolTip="Click to change delivered date" />
                                <asp:Calendar ID="Calendar7" runat="server" BackColor="White" BorderColor="White" BorderWidth="1px" Font-Names="Verdana" Font-Size="9pt" ForeColor="Black" Height="120px" NextPrevFormat="FullMonth" OnSelectionChanged="Calendar7_SelectionChanged" Visible="False" Width="320px">
                                    <DayHeaderStyle Font-Bold="True" Font-Size="8pt" />
                                    <NextPrevStyle Font-Bold="True" Font-Size="8pt" ForeColor="#333333" VerticalAlign="Bottom" />
                                    <OtherMonthDayStyle ForeColor="#999999" />
                                    <SelectedDayStyle BackColor="#333399" ForeColor="White" />
                                    <TitleStyle BackColor="White" BorderColor="Black" BorderWidth="4px" Font-Bold="True" Font-Size="12pt" ForeColor="#333399" />
                                    <TodayDayStyle BackColor="#CCCCCC" />
                                </asp:Calendar>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </td>
                </tr>
                <tr>
                    <td style="background-color: lightblue; vertical-align: top" class="auto-style1">
                        <asp:Label ID="Label18" runat="server" Text="Remarks" Font-Names="Comic Sans MS"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtRemark" runat="server" TextMode="MultiLine" Width="320px" Height="46px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style1"></td>
                    <td style="text-align: right">
                        <asp:Button ID="btnUpdateDate" runat="server" Text="Update" BackColor="#CCFF99" CssClass="grow" Font-Bold="True" OnClick="btnUpdateDate_Click" />
                    </td>
                </tr>
            </table>
        </asp:Panel>
        <%--</ContentTemplate>
        </asp:UpdatePanel>--%>
    </div>
</asp:Content>
<%--</form>
</body>
</html>--%>
