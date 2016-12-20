<%@ Page Language="C#" MasterPageFile="~/Master page/Account.Master" AutoEventWireup="true" CodeBehind="Payment.aspx.cs" Inherits="PrisMegahHRSystem.Payment" %>

<asp:Content ID="Content1" ContentPlaceHolderID="DirectoryPlaceHolder" runat="server">
    <asp:Label ID="Label1" runat="server" Text="Payment Particular" Font-Bold="True" ForeColor="#CC3300"></asp:Label>
</asp:Content>

<asp:Content ID="myContent" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link rel="stylesheet" type="text/css" href="CSS class/Layout.css" />
    <div>
        <asp:Label ID="Label11" runat="server" CssClass="labelTitle" Text="Payment Details"></asp:Label>
        <br />
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel2" runat="server">
            <ContentTemplate>
                <table>
                    <tr>
                        <td>
                            <asp:Label ID="Label12" runat="server" Text="Passport No." Font-Bold="True" Font-Names="Book Antiqua"></asp:Label></td>
                        <td>
                            <asp:DropDownList ID="ddlPPNo" runat="server" DataSourceID="SqlDataSource2" DataTextField="passportNo_New" DataValueField="passportNo_New" Font-Names="Lucida Bright" BackColor="#F6F1DB" ForeColor="#7D6754">
                            </asp:DropDownList>
                            &nbsp;<asp:ImageButton ID="ibtnSearchByPPNo" runat="server" Height="18px" ImageUrl="~/Images/search-button.png" Width="18px" OnClick="ibtnSearchByPPNo_Click" CssClass="grow" />
                            <asp:Label ID="lblWorkerNo" runat="server" Visible="False"></asp:Label>
                            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:PrisMegahConnString %>" SelectCommand="SELECT [passportNo_New] FROM [workerDetails]"></asp:SqlDataSource>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label2" runat="server" Text="Invoice No" Font-Bold="True" Font-Names="Book Antiqua"></asp:Label></td>
                        <td>
                            <asp:TextBox ID="txtInvoiceNo" runat="server" Width="174px" Enabled="False"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label13" runat="server" Font-Bold="True" Font-Names="Book Antiqua" Text="Passport Expiry"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lblPPExpiry" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label14" runat="server" Font-Bold="True" Font-Names="Book Antiqua" Text="Payment Total"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtPaymentTotal" runat="server" Enabled="False"></asp:TextBox>
                            <asp:RegularExpressionValidator ID="revTotal" runat="server" ControlToValidate="txtPaymentTotal" ErrorMessage="*Please enter only numbers like 100 or 100.00" ValidationExpression="^-?\d+\.?\d{0,2}$" ForeColor="Red"></asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label15" runat="server" Font-Bold="True" Font-Names="Book Antiqua" Text="Payment Paid"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtCurrentPayment" runat="server" Enabled="False"></asp:TextBox>
                            <asp:RegularExpressionValidator ID="revPay" runat="server" ControlToValidate="txtCurrentPayment" ErrorMessage="*Please enter only numbers like 100 or 100.00" ValidationExpression="^\d+(\.\d\d)?$" ForeColor="Red"></asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label16" runat="server" Font-Bold="True" Font-Names="Book Antiqua" Text="Outstanding"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lblOutstanding" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td style="vertical-align: top">
                            <asp:Label ID="Label18" runat="server" Font-Bold="True" Font-Names="Book Antiqua" Text="Payment Date"></asp:Label>
                        </td>
                        <td>
                            <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                                <ContentTemplate>
                                    <asp:Label ID="lblPaymentDate" runat="server" Text=""></asp:Label>
                                    <asp:Calendar ID="Calendar1" runat="server" BackColor="White" BorderColor="#3366CC" BorderWidth="1px" CellPadding="1" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="#003399" Height="180px" OnSelectionChanged="Calendar1_SelectionChanged" Width="200px">
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
                        <td style="vertical-align: top">
                            <asp:Label ID="Label17" runat="server" Font-Bold="True" Font-Names="Book Antiqua" Text="Payment Remark (if any)"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtPaymentRemark" runat="server" TextMode="MultiLine" Width="264px" Enabled="False"></asp:TextBox></td>
                    </tr>
                </table>
            </ContentTemplate>
        </asp:UpdatePanel>
        <asp:Button ID="btnCalculateOutstanding" runat="server" Text="Calculate Outstanding" OnClick="btnCalculateOutstanding_Click" Width="142px" />
        &nbsp;<asp:Button ID="btnSubmitPay" runat="server" Text="Submit Payment Detail" Enabled="False" OnClick="btnSubmitPay_Click" Width="152px" />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:Button ID="btnEditPayment" runat="server" OnClick="btnEditPayment_Click" Text="Edit Payment" />
        <br />
        <br />
        <asp:Label ID="Label10" runat="server" CssClass="labelTitle" Text="Payment Records"></asp:Label>
        <br />
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <div style="overflow-x: auto; width: 100%">
                    <asp:GridView ID="gvPaymentDetails" runat="server" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" Font-Names="Calisto MT" AutoGenerateColumns="False" AllowPaging="True" PageSize="15" DataSourceID="SqlDataSource1" AllowSorting="True">
                        <Columns>
                            <asp:BoundField DataField="Passport No" HeaderText="Passport No" SortExpression="Passport No" />
                            <asp:BoundField DataField="Worker Name" HeaderText="Worker Name" SortExpression="Worker Name" />
                            <asp:BoundField DataField="Invoice No" HeaderText="Invoice No" SortExpression="Invoice No" />
                            <asp:BoundField DataField="Passport Expiry" HeaderText="Passport Expiry" ReadOnly="True" SortExpression="Passport Expiry" />
                            <asp:BoundField DataField="PLKS Company" HeaderText="PLKS Company" ReadOnly="True" SortExpression="PLKS Company" />
                            <asp:BoundField DataField="Worker Remark" HeaderText="Worker Remark" SortExpression="Worker Remark" />
                            <asp:BoundField DataField="Payment Total" HeaderText="Payment Total" SortExpression="Payment Total" />
                            <asp:BoundField DataField="Payment Outstanding" HeaderText="Payment Outstanding" SortExpression="Payment Outstanding" />
                            <asp:BoundField DataField="Payment Remark" HeaderText="Payment Remark" SortExpression="Payment Remark" />
                            <asp:BoundField DataField="Payment Date" HeaderText="Payment Date" SortExpression="Payment Date" />
                        </Columns>
                        <FooterStyle BackColor="White" ForeColor="#000066" />
                        <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                        <RowStyle ForeColor="#000066" HorizontalAlign="Center" />
                        <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                        <SortedAscendingCellStyle BackColor="#F1F1F1" />
                        <SortedAscendingHeaderStyle BackColor="#007DBB" />
                        <SortedDescendingCellStyle BackColor="#CAC9C9" />
                        <SortedDescendingHeaderStyle BackColor="#00547E" />
                    </asp:GridView>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:PrisMegahConnString %>" SelectCommand="SELECT workerDetails.passportNo_New AS [Passport No], workerDetails.name AS [Worker Name], FORMAT(workerDetails.passportExp, 'dd/MM/yyyy') AS [Passport Expiry], workerDetails.PLKSCompany AS [PLKS Company], workerDetails.remark AS [Worker Remark], payment.paymentNo AS [Invoice No], payment.paymentTotal AS [Payment Total], payment.paymentOutstanding AS [Payment Outstanding], payment.paymentRemark AS [Payment Remark], FORMAT(payment.paymentDate, 'dd/MM/yyyy') AS [Payment Date] FROM workerDetails LEFT OUTER JOIN payment ON workerDetails.workerNo = payment.workerNo"></asp:SqlDataSource>
    </div>

</asp:Content>
