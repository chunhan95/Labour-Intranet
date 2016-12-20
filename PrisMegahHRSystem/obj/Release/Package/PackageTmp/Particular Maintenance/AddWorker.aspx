<%@ Page Language="C#" MasterPageFile="~/Master page/Common.Master" AutoEventWireup="true" CodeBehind="AddWorker.aspx.cs" Inherits="PrisMegahHRSystem.Particular_Maintenance.AddWorker" %>

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

        </style>
    <div class="center2">

        <asp:Label ID="Label1" runat="server" Text="Foreign Workers Particular" BackColor="#9378C9" Font-Bold="True" Font-Size="Medium" CssClass="labelTitle2"></asp:Label>
        <br />
        <asp:Label ID="Label33" runat="server" BackColor="#00FFCC" Font-Bold="True" Text="Personal Details"></asp:Label>
        <br />
        <table border="1" style="background-color: #C0C0C0">
            <tr>
                <td style="background-color: lightblue">
                    <asp:Label ID="Label3" runat="server" Text="Calling VISA No"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtCallingVISANo" runat="server" Width="174px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="background-color: lightblue">
                    <asp:Label ID="Label20" runat="server" Text="Received Date"></asp:Label></td>
                <td class="auto-style1">
                    <asp:TextBox ID="txtReceivedDate" runat="server" TextMode="Date"></asp:TextBox>&nbsp;<asp:Label ID="Label30" runat="server" Text="(dd/mm/yy)"></asp:Label>
                    &nbsp;</td>
                <td style="background-color: lightblue">
                    <asp:Label ID="Label5" runat="server" Text="Nationality"></asp:Label>
                </td>
                <td>
                    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                            <asp:DropDownList ID="ddlNationality" runat="server" DataSourceID="NationsDataSource" DataTextField="nationality" DataValueField="nationality">
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="NationsDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:PrisMegahConnString %>" SelectCommand="SELECT [nationality] FROM [nationality]"></asp:SqlDataSource>
                            <asp:ImageButton ID="ibtnEditNationality" runat="server" Height="18px" ImageUrl="~/Images/edit-icon.png" OnClick="ibtnEditNationality_Click" Width="18px" CssClass="grow" />
                            <asp:ImageButton ID="ibtnAddNationality" runat="server" Height="18px" ImageUrl="~/Images/add-button.png" OnClick="ibtnAddNationality_Click" Visible="False" Width="18px" />
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
                    <asp:TextBox ID="txtName" runat="server" Width="290px" Height="16px" OnTextChanged="txtName_TextChanged"></asp:TextBox>
                    <br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtName" ValidationExpression="[a-zA-Z ]*$" ErrorMessage="*alphabets and space only" ForeColor="Red" />
                </td>
                <td style="background-color: lightblue">
                    <asp:Label ID="Label9" runat="server" Text="Date of Birth"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtDOB" runat="server" TextMode="Date"></asp:TextBox>
                    &nbsp;<asp:Label ID="Label10" runat="server" Text="(dd/mm/yy)"></asp:Label>
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
                    <asp:TextBox ID="txtPhoneNo1" runat="server" MaxLength="4" Width="32px"></asp:TextBox>
                    <asp:Label ID="Label15" runat="server" Text="-"></asp:Label>
                    <asp:TextBox ID="txtPhoneNo2" runat="server" TextMode="Phone" Width="110px"></asp:TextBox>
                </td>
                <td style="background-color: lightblue">
                    <asp:Label ID="Label47" runat="server" Text="Worker Status"></asp:Label>
                </td>
                <td>
                    <asp:RadioButtonList ID="rbtnWorkerStatus" runat="server" RepeatDirection="Horizontal">
                        <asp:ListItem Selected="True">Available</asp:ListItem>
                        <asp:ListItem>Not Available</asp:ListItem>
                    </asp:RadioButtonList>
                </td>
            </tr>
            <tr>
                <td style="background-color: lightblue">
                    <asp:Label ID="Label4" runat="server" Text="Gender"></asp:Label>&nbsp;<asp:Image ID="Image1" runat="server" Height="16px" ImageUrl="~/Images/gender.png" Width="16px" />
                </td>
                <td class="auto-style1">
                    <asp:RadioButtonList ID="rbtnGender" runat="server" RepeatDirection="Horizontal">
                        <asp:ListItem>Male</asp:ListItem>
                        <asp:ListItem>Female</asp:ListItem>
                    </asp:RadioButtonList></td>
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
                    <asp:Label ID="Label17" runat="server" Text="Passport No."></asp:Label>
                </td>
                <td>
                    <table border="1" style="background-color: #C0C0C0">
                        <tr>
                            <td>
                                <asp:TextBox ID="txtNewPassportNo" runat="server" Width="174px"></asp:TextBox>
                                &nbsp;<asp:Label ID="Label36" runat="server" Text="(NEW)"></asp:Label>
                                <br />
                            </td>
                            <td>&nbsp;<asp:TextBox ID="txtOldPassportNo" runat="server" Width="174px"></asp:TextBox>
                                &nbsp;<asp:Label ID="Label35" runat="server" Text="(OLD)"></asp:Label>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td style="background-color: lightblue">
                    <asp:Label ID="Label18" runat="server" Text="Passport Expired Date"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtPPExpiryDate" runat="server" TextMode="Date"></asp:TextBox>
                    &nbsp;<asp:Label ID="Label31" runat="server" Text="(dd/mm/yy)"></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="background-color: lightblue">
                    <asp:Label ID="Label19" runat="server" Text="PLKS Expired Date"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtPLKSExpiryDate" runat="server" TextMode="Date"></asp:TextBox>
                    &nbsp;<asp:Label ID="Label32" runat="server" Text="(dd/mm/yy)"></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="background-color: lightblue">
                    <asp:Label ID="Label11" runat="server" Text="PLKS Company Name"></asp:Label></td>
                <td>
                    <%--<asp:UpdatePanel ID="UpdatePanel2" runat="server">
                        <ContentTemplate>--%>
                            <asp:DropDownList ID="ddlPermitCompany" runat="server" DataSourceID="PermitCompDataSource" DataTextField="companyName" DataValueField="companyName" AutoPostBack="True" OnSelectedIndexChanged="ddlPermitCompany_SelectedIndexChanged">
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
                    <asp:TextBox ID="txtEmpCompanyName" runat="server" Width="294px" OnTextChanged="txtEmpCompanyName_TextChanged"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="background-color: lightblue">
                    <asp:Label ID="Label21" runat="server" Text="Employer Tel"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtEmpTel1" runat="server" Width="32px" TextMode="Phone"></asp:TextBox>
                    <asp:Label ID="Label46" runat="server" Text="-"></asp:Label>
                    <asp:TextBox ID="txtEmpTel2" runat="server" Width="110px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="background-color: lightblue">
                    <asp:Label ID="Label13" runat="server" Text="Sector"></asp:Label>
                </td>
                <td>
                    <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                        <ContentTemplate>
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
            <tr>
                <td style="background-color: lightblue">
                    <asp:Label ID="Label23" runat="server" Text="Admin Incharge"></asp:Label>
                </td>
                <td>
                    <asp:DropDownList ID="ddlAdminIncharge" runat="server" DataSourceID="AdminDataSource" DataTextField="name" DataValueField="name">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="AdminDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:PrisMegahConnString %>" SelectCommand="SELECT name FROM userDetails WHERE (position = 'Administrator') AND (status = 'Available')"></asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td style="background-color: lightblue">
                    <asp:Label ID="Label24" runat="server" Text="Service Type"></asp:Label>
                </td>
                <td>
                    <asp:UpdatePanel ID="UpdatePanel4" runat="server">
                        <ContentTemplate>
                            <asp:DropDownList ID="ddlServiceType" runat="server" DataSourceID="ServiceDataSource" DataTextField="serviceType" DataValueField="serviceType">
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="ServiceDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:PrisMegahConnString %>" SelectCommand="SELECT [serviceType] FROM [serviceType_List]"></asp:SqlDataSource>
                            <asp:ImageButton ID="ibtnEditService" runat="server" Height="18px" ImageUrl="~/Images/edit-icon.png" OnClick="ibtnEditService_Click" Width="18px" CssClass="grow" />
                            <asp:ImageButton ID="ibtnAddService" runat="server" CssClass="grow" Height="18px" ImageUrl="~/Images/add-button.png" Width="18px" OnClick="ibtnAddService_Click" Visible="False" />
                            <asp:TextBox ID="txtNewService" runat="server" BackColor="Yellow" ToolTip="Input to add or remove service type" OnTextChanged="txtNewService_TextChanged" Visible="False"></asp:TextBox>
                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="ddlServiceType" />
                        </Triggers>
                    </asp:UpdatePanel>
                </td>
            </tr>
            <tr>
                <td style="background-color: lightblue">
                    <asp:Label ID="Label26" runat="server" Text="Submit By"></asp:Label>
                </td>
                <td>
                    <asp:DropDownList ID="ddlSubmitBy" runat="server" DataSourceID="SubmitByDataSource" DataTextField="name" DataValueField="name"></asp:DropDownList>
                    <asp:SqlDataSource ID="SubmitByDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:PrisMegahConnString %>" SelectCommand="SELECT name FROM userDetails WHERE ((position = 'Director') OR (position = 'Administrator')) AND (status='Available')"></asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td style="background-color: lightblue">
                    <asp:Label ID="Label27" runat="server" Text="Submit To"></asp:Label>
                </td>
                <td>
                    <asp:UpdatePanel ID="UpdatePanel5" runat="server">
                        <ContentTemplate>
                            <asp:DropDownList ID="ddlSubmitTo" runat="server" DataSourceID="SubmitToDataSource" DataTextField="coName" DataValueField="coName"></asp:DropDownList>
                            <asp:SqlDataSource ID="SubmitToDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:PrisMegahConnString %>" SelectCommand="SELECT [coName] FROM [submitTo]"></asp:SqlDataSource>
                            <asp:ImageButton ID="ibtnEditSubmitTo" runat="server" Height="18px" ImageUrl="~/Images/edit-icon.png" OnClick="ibtnEditSubmitTo_Click" Width="18px" CssClass="grow" />
                            <asp:ImageButton ID="ibtnAddSubmitTo" runat="server" CssClass="grow" Height="18px" ImageUrl="~/Images/add-button.png" Width="18px" OnClick="ibtnAddSubmitTo_Click" Visible="False" />
                            <asp:TextBox ID="txtNewSubmitTo" runat="server" BackColor="Yellow" ToolTip="Input to add or remove submit to" OnTextChanged="txtNewSubmitTo_TextChanged" Visible="False"></asp:TextBox>
                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="ddlSubmitTo" />
                        </Triggers>
                    </asp:UpdatePanel>
                </td>
            </tr>
            <tr>
                <td style="background-color: lightblue">
                    <asp:Label ID="Label28" runat="server" Text="Submission Date"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtSubmitDate" runat="server" TextMode="Date"></asp:TextBox>
                    &nbsp;<asp:Label ID="Label37" runat="server" Text="(dd/mm/yy)"></asp:Label>
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
            <tr>
                <td style="background-color: lightblue">
                    <asp:Label ID="Label48" runat="server" Text="Remarks (if any)"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtRemarks" runat="server" TextMode="MultiLine" Width="408px"></asp:TextBox>
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
                    <br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtNextOfKin" ValidationExpression="[a-zA-Z ]*$" ErrorMessage="*alphabets and space only" ForeColor="Red" />
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
