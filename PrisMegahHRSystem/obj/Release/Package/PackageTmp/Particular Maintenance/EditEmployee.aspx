<%@ Page Language="C#" MasterPageFile="~/Master page/Common.Master" AutoEventWireup="true" CodeBehind="EditEmployee.aspx.cs" Inherits="PrisMegahHRSystem.Particular_Maintenance.EditEmployee" %>

<asp:Content ID="myContent" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link rel="stylesheet" type="text/css" href="../CSS class/Layout.css" />
    <style type="text/css">
        .auto-style1
        {
            height: 22px;
        }
        .auto-style2
        {
            height: 28px;
        }
        .shrink
        {}
        .auto-style3
        {
            height: 50px;
        }
    </style>
    <div class="center">
    
        <asp:Label ID="Label1" runat="server" Text="Employees Particular" BackColor="#9378C9" Font-Bold="True" Font-Size="Medium" CssClass="labelTitle"></asp:Label>
        <br />
        <br />
        <table border="1" style="background-color: #C0C0C0">
            <tr>
                <td style="background-color:lightblue">
                    <asp:Label ID="Label9" runat="server" Text="Login ID"></asp:Label>
                </td>
                <td>
                    <asp:DropDownList ID="ddlIDSearch" runat="server" DataSourceID="SqlDataSource1" DataTextField="loginID" DataValueField="loginID">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:PrisMegahConnString %>" SelectCommand="SELECT loginID FROM userDetails WHERE (position &lt;&gt; 'System Admin')"></asp:SqlDataSource>
                    <asp:Label ID="lblStaffNo" runat="server" Visible="False"></asp:Label>
                    <asp:ImageButton ID="ibtnSearchByID" runat="server" CssClass="grow" Height="18px" ImageUrl="~/Images/search-button.png" Width="18px" OnClick="ibtnSearchByName_Click" />
                </td>
            </tr>
            <tr>
                <td style="background-color:lightblue"><asp:Label ID="Label2" runat="server" Text="Name"></asp:Label></td>
                <td><asp:TextBox ID="txtName" runat="server" Width="300px" OnTextChanged="txtName_TextChanged"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="background-color:lightblue"><asp:Label ID="Label3" runat="server" Text="Age"></asp:Label></td>
                <td><asp:TextBox ID="txtAge" runat="server" TextMode="Number" Width="38px"></asp:TextBox></td>
            </tr>
            <tr>
                <td style="background-color:lightblue" class="auto-style3"><asp:Label ID="Label4" runat="server" Text="Gender"></asp:Label>&nbsp;<asp:Image ID="Image1" runat="server" Height="16px" ImageUrl="~/Images/gender.png" Width="16px" />
                </td>
                <td class="auto-style3">
                    <asp:Label ID="lblGender" runat="server"></asp:Label>
&nbsp;<asp:ImageButton ID="ibtnEditGender" runat="server" OnClick="ibtnEditGender_Click" CssClass="grow" Height="18px" ImageUrl="~/Images/edit-icon.png" Width="18px" />
                    <asp:RadioButtonList ID="rbtnGender" runat="server" RepeatDirection="Horizontal" OnSelectedIndexChanged="rbtnGender_SelectedIndexChanged" AutoPostBack="True">
                    <asp:ListItem>Male</asp:ListItem>
                    <asp:ListItem>Female</asp:ListItem>
                    </asp:RadioButtonList></td>
            </tr>
            <tr>
                <td style="background-color:lightblue" class="auto-style2"><asp:Label ID="Label5" runat="server" Text="Position"></asp:Label></td>
                <td class="auto-style2">
                    <asp:Label ID="lblPosition" runat="server"></asp:Label>
                    <asp:ImageButton ID="ibtnEditPosition" runat="server" OnClick="ibtnEditPosition_Click" CssClass="grow" Height="18px" ImageUrl="~/Images/edit-icon.png" Width="18px" />
                    <asp:DropDownList ID="ddlPosition" runat="server" OnSelectedIndexChanged="ddlPosition_SelectedIndexChanged" AutoPostBack="True">
                    <asp:ListItem>Director</asp:ListItem>
                    <asp:ListItem>Administrator</asp:ListItem>
                    <asp:ListItem>Accountant</asp:ListItem>
                    </asp:DropDownList>&nbsp;
                    <asp:Label ID="Label13" runat="server" Text="(Edit Payment:" Visible="False"></asp:Label>
                    <asp:Label ID="lblPaymentState" runat="server"></asp:Label>
                    <asp:ImageButton ID="ibtnEditPaymentState" runat="server" OnClick="ibtnEditPaymentState_Click" CssClass="grow" Height="18px" ImageUrl="~/Images/edit-icon.png" Width="18px" />
                    <asp:DropDownList ID="ddlEditPaymentRight" runat="server" Visible="False" AutoPostBack="True" OnSelectedIndexChanged="ddlEditPaymentRight_SelectedIndexChanged">
                        <asp:ListItem>Yes</asp:ListItem>
                        <asp:ListItem>No</asp:ListItem>
                    </asp:DropDownList>
                    <asp:Label ID="Label14" runat="server" Text=")" Visible="False"></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="background-color:lightblue" class="auto-style1">
                    <asp:Label ID="Label10" runat="server" Text="Status"></asp:Label>
                </td>
                <td class="auto-style1">
                    <asp:Label ID="lblStatus" runat="server"></asp:Label>
&nbsp;<asp:ImageButton ID="ibtnEditStatus" runat="server" OnClick="ibtnEditStatus_Click" style="height: 16px" CssClass="grow" Height="18px" ImageUrl="~/Images/edit-icon.png" Width="18px" />
&nbsp;<asp:DropDownList ID="ddlStatus" runat="server" OnSelectedIndexChanged="ddlStatus_SelectedIndexChanged" AutoPostBack="True">
                        <asp:ListItem>Available</asp:ListItem>
                        <asp:ListItem>Resign</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td style="background-color:lightblue"><asp:Label ID="Label6" runat="server" Text="Contact No."></asp:Label><asp:Label ID="Label8" runat="server" Text="(H/P)"></asp:Label>
                    </td>
                <td>
                    <asp:TextBox ID="txtPhoneNo" runat="server" Width="180px"></asp:TextBox>
                    </td>
            </tr>
            <tr>
                <td style="background-color:lightblue"><asp:Label ID="Label7" runat="server" Text="Address"></asp:Label></td>
                <td><asp:TextBox ID="txtAddress" runat="server" TextMode="MultiLine" Width="500px" Height="38px"></asp:TextBox></td>
            </tr>
            <tr>
                <td style="background-color:lightblue">
                    <asp:Label ID="Label11" runat="server" Text="Login ID"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtLoginID" runat="server"></asp:TextBox>
                    <asp:ImageButton ID="ibtnEditID" runat="server" CssClass="grow" Height="18px" ImageUrl="~/Images/key-button.png" OnClick="ibtnEditID_Click" Width="18px" />
                </td>
            </tr>
            <tr>
                <td style="background-color:lightblue">
                    <asp:Label ID="Label12" runat="server" Text="Password"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtPassword" runat="server"></asp:TextBox>
                    <asp:ImageButton ID="ibtnEditPw" runat="server" CssClass="grow" Height="18px" ImageUrl="~/Images/key-button.png" OnClick="ibtnEditPw_Click" Width="18px" />
                </td>
            </tr>
            <tr>
                <td></td>
                <td style="text-align:right">
                    <asp:ImageButton ID="ibtnConfirm" CssClass="shrink" runat="server" ImageUrl="~/Images/confirm-buton.png" Height="27px" Width="74px" OnClick="ibtnConfirm_Click" />
                    &nbsp;<asp:ImageButton ID="ibtnCancel" CssClass="shrink" runat="server" ImageUrl="~/Images/cancel-button.png" Height="27px" Width="74px" OnClick="ibtnCancel_Click" />
                </td>
            </tr>
        </table>
        
    
    </div>
</asp:Content>
