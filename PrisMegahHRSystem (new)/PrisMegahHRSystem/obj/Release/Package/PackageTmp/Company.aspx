<%@ Page Language="C#" MasterPageFile="~/Master page/Director.Master" AutoEventWireup="true" CodeBehind="Company.aspx.cs" Inherits="PrisMegahHRSystem.Particular_Maintenance.Company" %>

<asp:Content ID="Content1" ContentPlaceHolderID="DirectoryPlaceHolder" runat="server">
    <asp:Label ID="Label8" runat="server" Text="Company Maintenance" Font-Bold="True" ForeColor="#CC3300"></asp:Label>
</asp:Content>

<asp:Content ID="myContent" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style type="text/css">
        .labelTitle
        {
            display: block;
            -webkit-box-sizing: content-box;
            -moz-box-sizing: content-box;
            box-sizing: content-box;
            float: none;
            z-index: auto;
            width: 200px;
            height: auto;
            position: static;
            cursor: default;
            opacity: 1;
            margin: 0;
            padding: 14px 12px;
            overflow: hidden;
            border: none;
            -webkit-border-radius: 13px;
            border-radius: 13px;
            font: normal 16px/1 "Comic Sans MS", cursive, sans-serif;
            color: rgba(119,71,71,1);
            text-align: center;
            -o-text-overflow: ellipsis;
            text-overflow: ellipsis;
            background: -webkit-linear-gradient(45deg, rgba(63,198,171,1) 0, rgba(63,198,171,1) 1%, rgba(21,206,239,1) 100%);
            background: -moz-linear-gradient(45deg, rgba(63,198,171,1) 0, rgba(63,198,171,1) 1%, rgba(21,206,239,1) 100%);
            background: linear-gradient(45deg, rgba(63,198,171,1) 0, rgba(63,198,171,1) 1%, rgba(21,206,239,1) 100%);
            background-position: 50% 50%;
            -webkit-background-origin: padding-box;
            background-origin: padding-box;
            -webkit-background-clip: border-box;
            background-clip: border-box;
            -webkit-background-size: auto auto;
            background-size: auto auto;
            -webkit-box-shadow: 1px 1px 1px 0 rgba(0,0,0,0.3);
            box-shadow: 1px 1px 1px 0 rgba(0,0,0,0.3);
            text-shadow: 1px 1px 1px rgba(0,0,0,0.2);
            -webkit-transition: none;
            -moz-transition: none;
            -o-transition: none;
            transition: none;
            -webkit-transform: none;
            transform: none;
            -webkit-transform-origin: 50% 50% 0;
            transform-origin: 50% 50% 0;
        }

        .FixedHeader
        {
            position: absolute;
            font-weight: bold;
        }
    </style>
    <asp:Label ID="Label2" runat="server" Text="Company Details" CssClass="labelTitle"></asp:Label>
    <br />
    <div style="width: 100%; height: 150px; overflow: auto">
        <asp:GridView ID="gvPLKSCo" runat="server" AutoGenerateColumns="False" BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" CellPadding="2" ForeColor="Black" GridLines="None">
            <Columns>
                <asp:TemplateField HeaderText="PLKS Company" HeaderStyle-Width="500px" ItemStyle-Width="500px">
                    <ItemTemplate>
                        <asp:Label ID="lblCoName" runat="server" Text='<%#Eval("companyName")%>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <AlternatingRowStyle BackColor="PaleGoldenrod" />
            <FooterStyle BackColor="Tan" />
            <HeaderStyle BackColor="#99ff66" Font-Bold="True" />
            <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" HorizontalAlign="Center" />
            <RowStyle HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
            <SortedAscendingCellStyle BackColor="#FAFAE7" />
            <SortedAscendingHeaderStyle BackColor="#DAC09E" />
            <SortedDescendingCellStyle BackColor="#E1DB9C" />
            <SortedDescendingHeaderStyle BackColor="#C2A47B" />
        </asp:GridView>
    </div>
    <br />
    <div>
        <table>
            <tr>
                <td>
                    <asp:Label ID="Label1" runat="server" Text="New PLKS Company Name" Font-Names="Comic Sans MS"></asp:Label></td>
                <td>
                    <asp:TextBox ID="txtPLKSCoName" runat="server" OnTextChanged="txtPLKSCoName_TextChanged" Width="318px"></asp:TextBox>
                    <asp:Label ID="Label14" runat="server" ForeColor="#FF3300" Text="*"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label10" runat="server" Text="Employer Name" Font-Names="Comic Sans MS"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtEmpName" runat="server" OnTextChanged="txtEmpName_TextChanged" Width="234px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label11" runat="server" Text="Employer Contact No." Font-Names="Comic Sans MS"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtEmpTel1" runat="server" Width="32px" MaxLength="4"></asp:TextBox>
                    <asp:Label ID="Label13" runat="server" Text="-"></asp:Label>
                    <asp:TextBox ID="txtEmpTel2" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label12" runat="server" Text="Sector" Font-Names="Comic Sans MS"></asp:Label>
                </td>
                <td>
                    <asp:DropDownList ID="ddlSector" runat="server" DataSourceID="SqlDataSource2" DataTextField="sector" DataValueField="sector">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:PrisMegahConnString %>" SelectCommand="SELECT [sector] FROM [sectorList]"></asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td></td>
                <td style="text-align:right">
                    <asp:Button ID="btnSubmit" runat="server" Text="Submit" BackColor="#99CCFF" Font-Names="Arial Rounded MT Bold" ForeColor="#6666FF" OnClick="btnSubmit_Click" />
                </td>
            </tr>
        </table>

    </div>
</asp:Content>
