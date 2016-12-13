<%@ Page Language="C#" MasterPageFile="~/Master page/Common.Master" AutoEventWireup="true" CodeBehind="EditWorker.aspx.cs" Inherits="PrisMegahHRSystem.Particular_Maintenance.EditWorker" %>

<asp:Content ID="myContent" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link rel="stylesheet" type="text/css" href="../CSS class/Layout.css" />
    <link rel="stylesheet" href="http://localhost:9768/code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css" />
    <script src="//code.jquery.com/jquery-1.10.2.js"></script>
    <script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
    <link rel="stylesheet" href="/resources/demos/style.css" />
    <script>
        $(function () {
            //$("#txtReceivedDate").datepicker();
            //$("#txtPPExpiryDate").datepicker();
            //$("#txtPLKSExpiryDate").datepicker();
        });
    </script>
    <%--<script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>
    <script type="text/javascript">
        function PopupPicker(ctl) {
            var PopupWindow = null;
            PopupWindow = window.open('../Calendar.aspx?ctl=' + ctl, '', 'width=250,height=250');
            PopupWindow.focus();
        }

        function SetDate(dateValue, ctl) {
            thisForm = window.opener.document.forms[0].elements[ctl].value = dateValue;
            self.close();
        }
    </script>--%>

    <style type="text/css">
        .auto-style1
        {
            width: 334px;
        }
        .grow
        {}
    </style>
    <div class="center2">

        <asp:Label ID="Label1" runat="server" Text="Foreign Workers Particular" BackColor="#9378C9" Font-Bold="True" Font-Size="Medium" CssClass="labelTitle2"></asp:Label>
        <br />
        <asp:Label ID="Label48" runat="server" Font-Bold="True" Font-Names="Baskerville Old Face" Text="Passport No."></asp:Label>
        &nbsp;<asp:DropDownList ID="ddlPPNo" runat="server" DataSourceID="SqlDataSource1" DataTextField="passportNo_New" DataValueField="passportNo_New" BackColor="#F6F1DB" ForeColor="#7D6754" Font-Names="Lucida Bright">
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:PrisMegahConnString %>" SelectCommand="SELECT [passportNo_New] FROM [workerDetails]"></asp:SqlDataSource>
        <asp:ImageButton ID="ibtnSearchBy" runat="server" Height="18px" ImageUrl="~/Images/search-button.png" Width="18px" CssClass="grow" OnClick="ibtnSearchBy_Click" />

        <br />
        <br />
        <asp:Label ID="Label33" runat="server" BackColor="#00FFCC" Font-Bold="True" Text="Personal Details"></asp:Label>
        <br />
        <table border="1" style="background-color: #C0C0C0">
            <tr>
                <td style="background-color: lightblue">
                    <asp:Label ID="Label20" runat="server" Text="Received Date"></asp:Label></td>
                <td class="auto-style1">
                    <asp:TextBox ID="txtReceivedDate" runat="server"></asp:TextBox>&nbsp;<asp:Label ID="Label49" runat="server" Text="(yyyy-MM-dd)"></asp:Label>
                </td>
                <td style="background-color: lightblue">
                    <asp:Label ID="Label5" runat="server" Text="Nationality"></asp:Label>
                </td>
                <td>
                    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                            <asp:Label ID="lblNationality" runat="server" ForeColor="Blue"></asp:Label>
                            <asp:ImageButton ID="ibtnMoveNation" runat="server" CssClass="grow" Height="18px" ImageUrl="~/Images/move-action.png" OnClick="ibtnMoveNation_Click" Width="18px" />
                            <asp:DropDownList ID="ddlNationality" runat="server" DataSourceID="NationsDataSource" DataTextField="nationality" DataValueField="nationality">
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="NationsDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:PrisMegahConnString %>" SelectCommand="SELECT [nationality] FROM [nationality]"></asp:SqlDataSource>
                            <asp:ImageButton ID="ibtnEditNationality" runat="server" Height="18px" ImageUrl="~/Images/edit-icon.png" OnClick="ibtnEditNationality_Click" Width="18px" CssClass="grow" />
                            <asp:ImageButton ID="ibtnAddNationality" runat="server" Height="18px" ImageUrl="~/Images/add-button.png" OnClick="ibtnAddNationality_Click" Visible="False" Width="18px" CssClass="grow" />
                            <asp:TextBox ID="txtNewNationality" runat="server" BackColor="#FFFF66" ToolTip="Input to add or remove nationality" OnTextChanged="txtNewNationality_TextChanged" Visible="False"></asp:TextBox>
                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="ddlNationality" />
                        </Triggers>
                    </asp:UpdatePanel>
                </td>
            </tr>
            <tr>
                <td style="background-color: lightblue">
                    <asp:Label ID="Label2" runat="server" Text="Name"></asp:Label></td>
                <td class="auto-style1">
                    <asp:TextBox ID="txtName" runat="server" Width="290px" Height="16px" OnTextChanged="txtName_TextChanged"></asp:TextBox></td>
                <td style="background-color: lightblue">
                    <asp:Label ID="Label9" runat="server" Text="Date of Birth"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtDOB" runat="server"></asp:TextBox>
                &nbsp;<asp:Label ID="Label50" runat="server" Text="(yyyy-MM-dd)"></asp:Label>
                </td>
            </tr>
            <tr>
                <%--<td style="background-color: lightblue">
                    <asp:Label ID="Label3" runat="server" Text="Age"></asp:Label></td>
                <td class="auto-style1">
                    <asp:UpdatePanel ID="UpdatePanel5" runat="server">
                        <ContentTemplate>
                            <asp:TextBox ID="txtAge" runat="server" TextMode="Number" Width="38px"></asp:TextBox>
                            &nbsp;<asp:Button ID="btnGetAge" runat="server" CssClass="shrink" OnClick="btnGetAge_Click" Text="Generate Age from DOB" />
                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="txtAge" />
                        </Triggers>
                    </asp:UpdatePanel>
                </td>--%>
                <td style="background-color: lightblue">
                    <asp:Label ID="Label6" runat="server" Text="Contact No."></asp:Label><asp:Label ID="Label8" runat="server" Text="(H/P)"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtPhoneNo" runat="server" TextMode="Phone" Width="134px"></asp:TextBox>
                </td>
                <td style="background-color: lightblue">
                    <asp:Label ID="Label47" runat="server" Text="Worker Status"></asp:Label>
                </td>
                <td>
                    <asp:UpdatePanel ID="UpdatePanel4" runat="server">
                        <ContentTemplate>
                            <asp:Label ID="lblWorkerStatus" runat="server"></asp:Label>
                            <asp:ImageButton ID="ibtnEditWorkerStatus" runat="server" Height="18px" ImageUrl="~/Images/edit-icon.png" OnClick="ibtnEditWorkerStatus_Click" Width="18px" CssClass="grow" />
                            <asp:RadioButtonList ID="rbtnWorkerStatus" runat="server" RepeatDirection="Horizontal" Visible="False" OnSelectedIndexChanged="rbtnWorkerStatus_SelectedIndexChanged" AutoPostBack="True">
                                <asp:ListItem Selected="True">Available</asp:ListItem>
                                <asp:ListItem>Not Available</asp:ListItem>
                            </asp:RadioButtonList>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </td>
            </tr>
            <tr>
                <td style="background-color: lightblue">
                    <asp:Label ID="Label4" runat="server" Text="Gender"></asp:Label>&nbsp;<asp:Image ID="Image1" runat="server" Height="16px" ImageUrl="~/Images/gender.png" Width="16px" />
                </td>
                <td class="auto-style1">
                    <asp:UpdatePanel ID="UpdatePanel5" runat="server">
                        <ContentTemplate>
                            <asp:Label ID="lblGender" runat="server"></asp:Label>
                            <asp:ImageButton ID="ibtnEditGender" runat="server" Height="18px" ImageUrl="~/Images/edit-icon.png" OnClick="ibtnEditGender_Click" Width="18px" CssClass="grow" />
                            <asp:RadioButtonList ID="rbtnGender" runat="server" RepeatDirection="Horizontal" Visible="False" OnSelectedIndexChanged="rbtnGender_SelectedIndexChanged" AutoPostBack="True">
                                <asp:ListItem>Male</asp:ListItem>
                                <asp:ListItem>Female</asp:ListItem>
                            </asp:RadioButtonList>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </td>
                <td style="background-color: lightblue">
                    <asp:Label ID="Label7" runat="server" Text="Address"></asp:Label></td>
                <td>
                    <asp:TextBox ID="txtAddress" runat="server" TextMode="MultiLine" Width="398px" Height="42px"></asp:TextBox>
                </td>
            </tr>
        </table>
        <br />
        <asp:Label ID="Label34" runat="server" BackColor="#00FFCC" Font-Bold="True" Text="Passport Details"></asp:Label>
        <br />
        <table border="1" style="background-color: #C0C0C0">
            <tr>
                <td style="background-color: lightblue">
                    <asp:Label ID="Label11" runat="server" Text="PLKS Company Name"></asp:Label></td>
                <td>
                    <%--<asp:UpdatePanel ID="UpdatePanel2" runat="server">
                        <ContentTemplate>--%>
                            <asp:Label ID="lblPLKSCo" runat="server" ForeColor="Blue"></asp:Label>
                            <asp:ImageButton ID="ibtnMovePLKSCo" runat="server" CssClass="grow" Height="18px" ImageUrl="~/Images/move-action.png" OnClick="ibtnMovePLKSCo_Click" Width="18px" />
                            <asp:DropDownList ID="ddlPermitCompany" runat="server" DataSourceID="PermitCompDataSource" DataTextField="companyName" DataValueField="companyName">
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="PermitCompDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:PrisMegahConnString %>" SelectCommand="SELECT [companyName] FROM [permitCompany_List]"></asp:SqlDataSource>
                        <%--</ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="ddlPermitCompany" />
                        </Triggers>
                    </asp:UpdatePanel>--%>
                </td>
            </tr>
            <tr>
                <td style="background-color: lightblue">
                    <asp:Label ID="Label12" runat="server" Text="Employer Name (PIC)"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtEmpName" runat="server" Width="174px" OnTextChanged="txtEmpName_TextChanged"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="background-color: lightblue">
                    <asp:Label ID="Label25" runat="server" Text="Employer Company Name"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtEmpCompName" runat="server" Width="294px" OnTextChanged="txtEmpCompName_TextChanged"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="background-color: lightblue">
                    <asp:Label ID="Label21" runat="server" Text="Employer Tel"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtEmpTel" runat="server" Width="134px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="background-color: lightblue">
                    <asp:Label ID="Label13" runat="server" Text="Sector"></asp:Label>
                </td>
                <td>
                    <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                        <ContentTemplate>
                            <asp:Label ID="lblSector" runat="server" ForeColor="Blue"></asp:Label>
                            <asp:ImageButton ID="ibtnMoveSector" runat="server" CssClass="grow" Height="18px" ImageUrl="~/Images/move-action.png" OnClick="ibtnMoveSector_Click" Width="18px" />
                            <asp:DropDownList ID="ddlSector" runat="server" DataSourceID="SectorDataSource" DataTextField="sector" DataValueField="sector">
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="SectorDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:PrisMegahConnString %>" SelectCommand="SELECT [sector] FROM [sectorList]"></asp:SqlDataSource>
                            <asp:ImageButton ID="ibtnEditSector" runat="server" Height="18px" ImageUrl="~/Images/edit-icon.png" OnClick="ibtnEditSector_Click" Width="18px" CssClass="grow" />
                            <asp:ImageButton ID="ibtnAddSector" runat="server" CssClass="grow" Height="18px" ImageUrl="~/Images/add-button.png" Width="18px" OnClick="ibtnAddSector_Click" Visible="False" />
                            <asp:TextBox ID="txtNewSector" runat="server" BackColor="Yellow" ToolTip="Input to add or remove sector" OnTextChanged="txtNewSector_TextChanged" Visible="False"></asp:TextBox>
                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="ddlSector" />
                        </Triggers>
                    </asp:UpdatePanel>
                </td>
            </tr>
            <tr>
                <td style="background-color: lightblue">
                    <asp:Label ID="Label22" runat="server" Text="Agent"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtAgent" runat="server" Width="174px" OnTextChanged="txtAgent_TextChanged"></asp:TextBox>
                </td>
            </tr>
            <%--<tr>
                <td style="background-color: lightblue">
                    <asp:Label ID="Label29" runat="server" Text="Invoice Reference No."></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtInvoiceRef" runat="server" Width="174px" OnTextChanged="txtInvoiceRef_TextChanged"></asp:TextBox>
                </td>
            </tr>--%>
            <tr>
                <td style="background-color: lightblue">
                    <asp:Label ID="Label16" runat="server" Text="Policy IG"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtPolicyIG" runat="server" Width="174px"></asp:TextBox>
                </td>
            </tr>
        </table>
        <br />
        <asp:Label ID="Label38" runat="server" BackColor="#00FFCC" Font-Bold="True" Text="Insurans Details"></asp:Label>
        <br />
        <table border="1" style="background-color: #C0C0C0">
            <tr>
                <td style="background-color: lightblue">
                    <asp:Label ID="Label39" runat="server" Text="Next of Kin"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtNextOfKin" runat="server" Width="290px" OnTextChanged="txtNextOfKin_TextChanged"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="background-color: lightblue">
                    <asp:Label ID="Label40" runat="server" Text="Next of Kin Address"></asp:Label>
                </td>
                <td>

                    <asp:TextBox ID="txtNextOfKinAddr" runat="server" Height="30px" TextMode="MultiLine" Width="433px"></asp:TextBox>

                </td>
            </tr>
        </table>

        <div style="text-align: right">
            <asp:ImageButton ID="ibtnConfirm" CssClass="shrink" runat="server" ImageUrl="~/Images/confirm-buton.png" Height="27px" Width="74px" OnClick="ibtnConfirm_Click" />
            &nbsp;<asp:ImageButton ID="ibtnCancel" CssClass="shrink" runat="server" ImageUrl="~/Images/cancel-button.png" Height="27px" Width="74px" OnClick="ibtnCancel_Click" />
        </div>
    </div>
</asp:Content>
