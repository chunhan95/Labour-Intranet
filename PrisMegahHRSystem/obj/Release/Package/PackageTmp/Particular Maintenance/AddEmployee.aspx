<%@ Page Language="C#" MasterPageFile="~/Master page/Common.Master" AutoEventWireup="true" CodeBehind="AddEmployee.aspx.cs" Inherits="PrisMegahHRSystem.Employee.AddEmployee" %>

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
    </style>
    <div class="center">
    
        <asp:Label ID="Label1" runat="server" Text="Employees Particular" BackColor="#9378C9" Font-Bold="True" Font-Size="Medium" CssClass="labelTitle"></asp:Label>
        <br />
        <br />
        <table border="1" style="background-color: #C0C0C0">
            <tr>
                <td style="background-color:lightblue"><asp:Label ID="Label2" runat="server" Text="Name"></asp:Label></td>
                <td><asp:TextBox ID="txtName" runat="server" Width="300px" CssClass="upper-case" OnTextChanged="txtName_TextChanged"></asp:TextBox>
                    <asp:Label ID="Label15" runat="server" ForeColor="Red" Text="*"></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="background-color:lightblue"><asp:Label ID="Label3" runat="server" Text="Age"></asp:Label></td>
                <td><asp:TextBox ID="txtAge" runat="server" TextMode="Number" Width="38px"></asp:TextBox></td>
            </tr>
            <tr>
                <td style="background-color:lightblue"><asp:Label ID="Label4" runat="server" Text="Gender"></asp:Label>&nbsp;<asp:Image ID="Image1" runat="server" Height="16px" ImageUrl="~/Images/gender.png" Width="16px" />
                </td>
                <td><asp:RadioButtonList ID="rbtnGender" runat="server" RepeatDirection="Horizontal">
                    <asp:ListItem>Male</asp:ListItem>
                    <asp:ListItem>Female</asp:ListItem>
                    </asp:RadioButtonList></td>
            </tr>
            <tr>
                <td style="background-color:lightblue" class="auto-style2"><asp:Label ID="Label5" runat="server" Text="Position"></asp:Label></td>
                <td class="auto-style2"><asp:DropDownList ID="ddlPosition" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlPosition_SelectedIndexChanged">
                    <asp:ListItem>Director</asp:ListItem>
                    <asp:ListItem>Administrator</asp:ListItem>
                    <asp:ListItem>Accountant</asp:ListItem>
                    </asp:DropDownList>&nbsp;
                    <asp:Label ID="Label13" runat="server" Text="(Edit Payment:" Visible="False"></asp:Label>
                    <asp:DropDownList ID="ddlEditPaymentRight" runat="server" Visible="False">
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
                    <asp:DropDownList ID="ddlStatus" runat="server">
                        <asp:ListItem>Available</asp:ListItem>
                        <asp:ListItem>Resign</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td style="background-color:lightblue"><asp:Label ID="Label6" runat="server" Text="Contact No."></asp:Label><asp:Label ID="Label8" runat="server" Text="(H/P)"></asp:Label>
                    </td>
                <td>
                    <asp:TextBox ID="txtPhoneNo1" runat="server" MaxLength="4" Width="32px"></asp:TextBox>
                    <asp:Label ID="Label9" runat="server" Text="-"></asp:Label>
                    <asp:TextBox ID="txtPhoneNo2" runat="server" TextMode="Phone" Width="110px"></asp:TextBox>
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
                    <asp:Label ID="Label16" runat="server" ForeColor="Red" Text="*"></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="background-color:lightblue">
                    <asp:Label ID="Label12" runat="server" Text="Password"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox>
                    <asp:Label ID="Label17" runat="server" ForeColor="Red" Text="*"></asp:Label>
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