<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RecordPreview.aspx.cs" Inherits="PrisMegahHRSystem.RecordPreview" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <meta http-equiv="Refresh" content="900;url=LogoutScreen.aspx" />
    <link id="Link1" runat="server" rel="shortcut icon" href="~/Images/prismegah_icon.ico" type="image/x-icon" />
    <link id="Link2" runat="server" rel="icon" href="~/Images/prismegah_icon.ico" type="image/ico" />
    <link rel="stylesheet" type="text/css" href="../CSS class/Layout.css" />
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <script src="ASPSnippets_Pager.min.js" type="text/javascript"></script>
    <%--<script type="text/javascript">
        $(function () {
            GetWorkers(1);
        });
        $("[id*=txtSearch]").live("keyup", function () {
            GetWorkers(parseInt(1));
        });
        $(".Pager .page").live("click", function () {
            GetWorkers(parseInt($(this).attr('page')));
        });
        function SearchTerm() {
            return jQuery.trim($("[id*=txtSearch]").val());
        };
        function GetWorkers(pageIndex) {
            $.ajax({
                type: "POST",
                url: "RecordPreview.aspx/GetWorkers",
                data: '{searchTerm: "' + SearchTerm() + '", pageIndex: ' + pageIndex + '}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: OnSuccess,
                failure: function (response) {
                    alert(response.d);
                },
                error: function (response) {
                    alert(response.d);
                }
            });
        }
        var row;
        function OnSuccess(response) {
            var xmlDoc = $.parseXML(response.d);
            var xml = $(xmlDoc);
            var workers = xml.find("workerDetails");
            if (row == null) {
                row = $("[id*=gvWorkers] tr:last-child").clone(true);
            }
            $("[id*=gvWorkers] tr").not($("[id*=gvWorkers] tr:first-child")).remove();
            if (workers.length > 0) {
                $.each(workers, function () {
                    var worker = $(this);
                    var receiveDay = new Date($(this).find("receivedDate").text());
                    var ppExp = new Date($(this).find("passportExp").text());
                    var plksExp = new Date($(this).find("PLKSExp").text());
                    var submitDay = new Date($(this).find("submitDate").text());

                    $("td", row).eq(0).html(receiveDay.getDate() + "/" + (receiveDay.getMonth() + 1) + "/" + receiveDay.getFullYear());
                    $("td", row).eq(1).html($(this).find("name").text());
                    $("td", row).eq(2).html($(this).find("passportNo_New").text());
                    $("td", row).eq(3).html($(this).find("nationality").text());
                    $("td", row).eq(4).html(ppExp.getDate() + "/" + (ppExp.getMonth()+1) + "/" + ppExp.getFullYear());
                    $("td", row).eq(5).html(plksExp.getDate() + "/" + (plksExp.getMonth()+1) + "/" + plksExp.getFullYear());
                    $("td", row).eq(6).html($(this).find("PLKSCompany").text());
                    $("td", row).eq(7).html($(this).find("sector").text());
                    $("td", row).eq(8).html($(this).find("employerName").text());
                    $("td", row).eq(9).html($(this).find("employerCompany").text());
                    $("td", row).eq(10).html($(this).find("employerContact_No").text());
                    $("td", row).eq(11).html($(this).find("agent").text());
                    $("td", row).eq(12).html($(this).find("adminIncharge").text());
                    $("td", row).eq(13).html($(this).find("serviceType").text());
                    $("td", row).eq(14).html($(this).find("servicePhase").text());
                    $("td", row).eq(15).html($(this).find("submitBy").text());
                    $("td", row).eq(16).html($(this).find("submitTo").text());
                    $("td", row).eq(17).html(submitDay.getDate() + "/" + (submitDay.getMonth() + 1) + "/" + submitDay.getFullYear());
                    $("td", row).eq(18).html($(this).find("policyIG").text());
                    $("td", row).eq(19).html($(this).find("remark").text());
                    $("td", row).eq(20).html($(this).find("invoiceNo").text());
                    $("[id*=gvWorkers]").append(row);
                    row = $("[id*=gvWorkers] tr:last-child").clone(true);
                });
                var pager = xml.find("Pager");
                $(".Pager").ASPSnippets_Pager({
                    ActiveCssClass: "current",
                    PagerCssClass: "pager",
                    PageIndex: parseInt(pager.find("PageIndex").text()),
                    PageSize: parseInt(pager.find("PageSize").text()),
                    RecordCount: parseInt(pager.find("RecordCount").text())
                });

                $(".name").each(function () {
                    var searchPattern = new RegExp('(' + SearchTerm() + ')', 'ig');
                    $(this).html($(this).text().replace(searchPattern, "<span class = 'highlight'>" + SearchTerm() + "</span>"));
                });
            } else {
                var empty_row = row.clone(true);
                $("td:first-child", empty_row).attr("colspan", $("td", row).length);
                $("td:first-child", empty_row).attr("align", "center");
                $("td:first-child", empty_row).html("No records found for the search criteria.");
                $("td", empty_row).not($("td:first-child", empty_row)).remove();
                $("[id*=gvWorkers]").append(empty_row);
            }
        };
    </script>--%>
    <style type="text/css">
        body
        {
            font-family: Arial;
            font-size: 10pt;
        }

        table
        {
            border: 1px solid #ccc;
        }

            table th
            {
                background-color: #F7F7F7;
                color: #333;
                font-weight: bold;
            }

            table th, table td
            {
                padding: 5px;
                border-color: #ccc;
            }

        .Pager span
        {
            color: #333;
            background-color: #F7F7F7;
            font-weight: bold;
            text-align: center;
            display: inline-block;
            width: 20px;
            margin-right: 3px;
            line-height: 150%;
            border: 1px solid #ccc;
        }

        .Pager a
        {
            text-align: center;
            display: inline-block;
            width: 20px;
            border: 1px solid #ccc;
            color: #fff;
            color: #333;
            margin-right: 3px;
            line-height: 150%;
            text-decoration: none;
        }

        .highlight
        {
            background-color: #FFFFAF;
        }
    </style>
</head>
<body style="background-color: lightblue">
    <form id="form1" runat="server">
        <div style="text-align: center">
            <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/PrisMegah_Logo.JPG" />
            <br />
            <br />
        </div>
        <div>
            <table border="1" style="background-color: #C0C0C0">
                <tr>
                    <td style="background-color: lightgreen">
                        <asp:Label ID="Label5" runat="server" Text="Search By:" Font-Bold="True" Font-Names="Bookman Old Style"></asp:Label>
                    </td>
                    <td>
                        <table>
                            <tr>
                                <td>
                                    <asp:Label ID="Label1" runat="server" Font-Bold="True" Text="Name" Font-Names="Bookman Old Style"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtSearchByName" runat="server" OnTextChanged="txtSearchByName_TextChanged" />
                                    <asp:ImageButton ID="ibtnByName" runat="server" Height="18px" Width="18px" CssClass="grow" ImageUrl="~/Images/filter-button.png" OnClick="ibtnByName_Click" ToolTip="Filter by worker name" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="Label2" runat="server" Font-Bold="True" Text="PLKS Company" Font-Names="Bookman Old Style"></asp:Label>
                                </td>
                                <td>
                                    <asp:DropDownList ID="ddlSearchByCo" runat="server">
                                    </asp:DropDownList>
                                    <asp:ImageButton ID="ibtnByPLKSCo" runat="server" Height="18px" Width="18px" CssClass="grow" ImageUrl="~/Images/filter-button.png" OnClick="ibtnByPLKSCo_Click" ToolTip="Filter by permit (PLKS) company name" />
                                </td>
                            </tr>
                            <tr>
                                <td style="vertical-align: top">
                                    <asp:Label ID="Label3" runat="server" Font-Bold="True" Text="PLKS Expired" Font-Names="Bookman Old Style"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtSearchExpStart" runat="server" TextMode="Date" ToolTip="Start date"></asp:TextBox>
                                    <asp:Label ID="Label4" runat="server" Text="to" Font-Bold="True"></asp:Label>
                                    <asp:TextBox ID="txtSearchExpEnd" runat="server" TextMode="Date" ToolTip="End date"></asp:TextBox>
                                    <asp:ImageButton ID="ibtnByExpDate" runat="server" Height="18px" Width="18px" CssClass="grow" ImageUrl="~/Images/filter-button.png" OnClick="ibtnByExpDate_Click" ToolTip="Filter by PLKS expiry" />
                                    <br />
                                    <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtSearchExpStart" ControlToValidate="txtSearchExpEnd" ErrorMessage="*start date should be earlier than end date !!" Font-Bold="True" ForeColor="#CC3300" Operator="GreaterThanEqual"></asp:CompareValidator>
                                </td>
                            </tr>
                            <tr>
                                <td></td>
                                <td style="text-align: right">
                                    <asp:Button ID="btnCoAndExp" runat="server" Text="PLKS Company &amp; Expired" Width="178px" BackColor="#CCFF33" OnClick="btnCoAndExp_Click" />
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
            <hr />
            <div style="overflow-x: auto; width: 100%">
                <asp:GridView ID="gvWorkers" runat="server" AutoGenerateColumns="False" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" Font-Names="Baskerville Old Face">
                    <Columns>
                        <asp:BoundField DataField="Received Date" HeaderText="Received Date" SortExpression="Received Date" ReadOnly="True" />
                        <asp:BoundField DataField="Worker Name" HeaderText="Worker Name" SortExpression="Worker Name" />
                        <asp:BoundField DataField="New Passport No" HeaderText="New Passport No" SortExpression="New Passport No" />
                        <asp:BoundField DataField="Old Passport No" HeaderText="Old Passport No" SortExpression="Old Passport No" />
                        <asp:BoundField DataField="Nationality" HeaderText="Nationality" SortExpression="Nationality" />
                        <asp:BoundField DataField="Passport Expiry" HeaderText="Passport Expiry" SortExpression="Passport Expiry" ReadOnly="True" />
                        <asp:BoundField DataField="PLKS Expiry" HeaderText="PLKS Expiry" SortExpression="PLKS Expiry" ReadOnly="True" />
                        <asp:BoundField DataField="Permit Company Name" HeaderText="Permit Company Name" SortExpression="Permit Company Name" />
                        <asp:BoundField DataField="Sector" HeaderText="Sector" SortExpression="Sector" />
                        <asp:BoundField DataField="Client" HeaderText="Client (PIC)" SortExpression="Client" />
                        <asp:BoundField DataField="Client Company" HeaderText="Client Company" SortExpression="Client Company" />
                        <asp:BoundField DataField="Client Tel" HeaderText="Client Tel" SortExpression="Client Tel" />
                        <asp:BoundField DataField="Marketing" HeaderText="Marketing" SortExpression="Marketing" />
                        <asp:BoundField DataField="Admin" HeaderText="Admin" SortExpression="Admin" />
                        <asp:BoundField DataField="Service Type" HeaderText="Service Type" SortExpression="Service Type" />
                        <asp:BoundField DataField="Service Phase" HeaderText="Service Phase" SortExpression="Service Phase" />
                        <asp:BoundField DataField="Submit By" HeaderText="Submit By" SortExpression="Submit By" />
                        <asp:BoundField DataField="Submit To" HeaderText="Submit To" SortExpression="Submit To" />
                        <asp:BoundField DataField="Submit Date" HeaderText="Submit Date" SortExpression="Submit Date" ReadOnly="True" />
                        <asp:BoundField DataField="Policy IG" HeaderText="Policy IG" SortExpression="Policy IG" />
                        <asp:BoundField DataField="Remarks" HeaderText="Remarks" SortExpression="Remarks" />
                        <asp:BoundField DataField="Invoice" HeaderText="Invoice" SortExpression="Invoice" />
                    </Columns>
                    <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
                    <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
                    <PagerStyle ForeColor="#8C4510" HorizontalAlign="Left" />
                    <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#FFF1D4" />
                    <SortedAscendingHeaderStyle BackColor="#B95C30" />
                    <SortedDescendingCellStyle BackColor="#F1E5CE" />
                    <SortedDescendingHeaderStyle BackColor="#93451F" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:PrisMegahConnString %>" SelectCommand="SELECT FORMAT([receivedDate],'dd/MM/yyyy') AS [Received Date], [name] AS [Worker Name], [passportNo_New] AS [New Passport No], [nationality] AS [Nationality], FORMAT([passportExp],'dd/MM/yyyy') AS [Passport Expiry], FORMAT([PLKSExp],'dd/MM/yyyy') AS [PLKS Expiry], [PLKSCompany] AS [Permit Company Name], [sector] AS [Sector], [employerName] AS [Client], [employerCompany] AS [Client Company], [employerContact_No] AS [Client Tel], [agent] AS [Marketing], [adminIncharge] AS [Admin], [serviceType] AS [Service Type], [servicePhase] AS [Service Phase], [submitBy] As [Submit By], [submitTo] AS [Submit To], [invoiceNo] AS [Invoice], FORMAT([submitDate],'dd/MM/yyyy') AS [Submit Date], [workerDetails].[policyIG] AS [Policy IG], [nextOfKin] AS [Next Of Kin], [nextOfKinAddress] AS [Next Of Kin Address],  [remark] AS [Remarks] FROM [workerDetails] LEFT JOIN [workerInsurans] ON workerDetails.policyIG=workerInsurans.policyIG"></asp:SqlDataSource>
            </div>
            <asp:Button ID="btnTop" runat="server" OnClick="btnTop_Click" Text="Back To Top" Width="93px" />
            <br />
            <div class="Pager">
            </div>
            <div style="text-align: center">
                <asp:Button ID="btnGetBeforeRenew" runat="server" Text="Get Before Renew Excel" OnClick="btnGetBeforeRenew_Click" BackColor="#99CCFF" />
                &nbsp;<asp:Button ID="btnGetAfterRenew" runat="server" Text="Get After Renew Excel" OnClick="btnGetAfterRenew_Click" BackColor="#99CCFF" />
            </div>
        </div>
    </form>
</body>
</html>
