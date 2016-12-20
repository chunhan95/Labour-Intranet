<%@ Page Language="C#" MasterPageFile="~/Master page/Director.Master" AutoEventWireup="true" CodeBehind="Attach.aspx.cs" Inherits="PrisMegahHRSystem.Particular_Maintenance.Attach" %>

<asp:Content ID="Content1" ContentPlaceHolderID="DirectoryPlaceHolder" runat="server">
    <asp:Label ID="Label8" runat="server" Text="Attachment Upload" Font-Bold="True" ForeColor="#CC3300"></asp:Label>
</asp:Content>

<asp:Content ID="myContent" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link rel="stylesheet" type="text/css" href="CSS class/Layout.css" />
    <div>
        <br />
        <asp:Label ID="Label1" runat="server" BackColor="#00FFCC" Font-Bold="True" Text="Attachment Details"></asp:Label>
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <br />
        <table border="1" style="background-color: #C0C0C0">
            <tr>
                <td style="background-color: lightblue" class="auto-style2">
                    <asp:Label ID="Label7" runat="server" Text="Passport No"></asp:Label>
                </td>
                <td class="auto-style1">
                    <asp:DropDownList ID="ddlPassportNo" runat="server" DataSourceID="PassportNoDataSource" DataTextField="passportNo_New" DataValueField="passportNo_New">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="PassportNoDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:PrisMegahConnString %>" SelectCommand="SELECT [passportNo_New] FROM [workerDetails]"></asp:SqlDataSource>
                    <asp:ImageButton ID="ibtnSearchByPPNo" runat="server" Height="18px" ImageUrl="~/Images/search-button.png" Width="18px" OnClick="ibtnSearchByPPNo_Click" CssClass="grow" />
                    <asp:Label ID="lblWorkerNo" runat="server" Visible="False"></asp:Label>
                </td>
            </tr>
        </table>
        <asp:Panel ID="Panel1" runat="server">
            <table border="1" style="background-color: #C0C0C0">
                <tr>
                    <%--<asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>--%>
                            <td style="background-color: lightblue" class="auto-style2">
                                <asp:Label ID="Label2" runat="server" Text="Photo Upload"></asp:Label>
                            </td>
                            <td>
                                <asp:FileUpload ID="attPhoto" runat="server" />
                                <br />
                                <asp:Label ID="lblPhotoErrorMsg" runat="server"></asp:Label>
                            </td>
                            <td>
                                <asp:Button ID="btnSavePhoto" runat="server" Text="Saved" OnClick="btnSavePhoto_Click" />
                            </td>
                        <%--</ContentTemplate>
                    </asp:UpdatePanel>--%>
                </tr>
                <tr>
                    <td style="background-color: lightblue" class="auto-style2">
                        <asp:Label ID="Label3" runat="server" Text="Passport Particular"></asp:Label>
                    </td>
                    <td>
                        <table border="1" style="background-color: white">
                            <tr>
                                <td>
                                    <asp:FileUpload ID="attPassport1" runat="server" />
                                    <asp:Label ID="Label10" runat="server" Text="(attachment 1)"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:FileUpload ID="attPassport2" runat="server" />
                                    <asp:Label ID="Label11" runat="server" Text="(attachment 2)"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:FileUpload ID="attPassport3" runat="server" />
                                    <asp:Label ID="Label12" runat="server" Text="(attachment 3)"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:FileUpload ID="attPassport4" runat="server" />
                                    <asp:Label ID="Label13" runat="server" Text="(attachment 4)"></asp:Label>
                                </td>
                            </tr>
                        </table>
                        <asp:Label ID="lblPassportErrorMsg" runat="server"></asp:Label>
                    </td>
                    <td>
                        <asp:Button ID="btnSavePassport" runat="server" Text="Saved" OnClick="btnSavePassport_Click" />
                    </td>
                </tr>
                <tr>
                    <td style="background-color: lightblue" class="auto-style2">
                        <asp:Label ID="Label4" runat="server" Text="Special Pass"></asp:Label>
                    </td>
                    <td>
                        <table border="1" style="background-color: white">
                            <tr>
                                <td>
                                    <asp:FileUpload ID="attSpecialPass1" runat="server" />
                                    <asp:Label ID="Label14" runat="server" Text="(attachment 1)"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:FileUpload ID="attSpecialPass2" runat="server" />
                                    <asp:Label ID="Label15" runat="server" Text="(attachment 2)"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:FileUpload ID="attSpecialPass3" runat="server" />
                                    <asp:Label ID="Label16" runat="server" Text="(attachment 3)"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:FileUpload ID="attSpecialPass4" runat="server" />
                                    <asp:Label ID="Label17" runat="server" Text="(attachment 4)"></asp:Label>
                                </td>
                            </tr>
                        </table>
                        <asp:Label ID="lblPassErrorMsg" runat="server"></asp:Label>
                    </td>
                    <td>
                        <asp:Button ID="btnSaveSpecialPass" runat="server" Text="Saved" OnClick="btnSaveSpecialPass_Click" />
                    </td>
                </tr>
                <tr>
                    <td style="background-color: lightblue" class="auto-style2">
                        <asp:Label ID="Label5" runat="server" Text="PLKS"></asp:Label>
                    </td>
                    <td>
                        <asp:FileUpload ID="attPermit" runat="server" />
                        <br />
                        <asp:Label ID="lblPLKSErrorMsg" runat="server"></asp:Label>
                    </td>
                    <td>
                        <asp:Button ID="btnSavePLKS" runat="server" Text="Saved" OnClick="btnSavePLKS_Click" />
                    </td>
                </tr>
                <tr>
                    <td style="background-color: lightblue" class="auto-style2">
                        <asp:Label ID="Label6" runat="server" Text="Insurans Policy"></asp:Label>
                    </td>
                    <td>
                        <asp:FileUpload ID="attInsurans" runat="server" />
                        <br />
                        <asp:Label ID="lblInsuransErrorMsg" runat="server"></asp:Label>
                    </td>
                    <td>
                        <asp:Button ID="btnSaveInsPolicy" runat="server" Text="Saved" OnClick="btnSaveInsPolicy_Click" />
                    </td>
                </tr>
            </table>
        </asp:Panel>
    </div>

</asp:Content>
<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="head">
    <style type="text/css">
        .auto-style1
        {
            height: 61px;
            width: 400px;
        }

        .auto-style2
        {
            width: 152px;
        }
    </style>
</asp:Content>

