<%@ Page Language="C#" MasterPageFile="~/Master page/Common.Master" AutoEventWireup="true" CodeBehind="ViewDetails.aspx.cs" Inherits="PrisMegahHRSystem.ViewDetails" %>

<asp:Content ID="myContent" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="text-align:center">
        <br />
        <asp:DetailsView ID="DetailsView1" runat="server" CellPadding="4" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" Height="50px" Width="450px" AutoGenerateRows="False" HorizontalAlign="Center">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <CommandRowStyle BackColor="#E2DED6" Font-Bold="True" />
            <EditRowStyle BackColor="#999999" />
            <FieldHeaderStyle BackColor="#E9ECF1" Font-Bold="True" HorizontalAlign="Right" />
            <Fields>
                <asp:BoundField DataField="Date Received" HeaderText="Date Received" ReadOnly="True" SortExpression="Date Received" />
                <asp:BoundField DataField="name" HeaderText="Name" SortExpression="name" />
                <asp:BoundField DataField="gender" HeaderText="Gender" SortExpression="gender" />
                <asp:BoundField DataField="nationality" HeaderText="Nationality" SortExpression="nationality" />
                <asp:BoundField DataField="Date Of Birth" HeaderText="Date Of Birth" ReadOnly="True" SortExpression="Date Of Birth" />
                <asp:BoundField DataField="PLKSCompany" HeaderText="PLKS Company Name" SortExpression="PLKSCompany" />
                <asp:BoundField DataField="PLKS Expiry" HeaderText="PLKS Expiry" ReadOnly="True" SortExpression="PLKS Expiry" />
                <asp:BoundField DataField="Passport Expiry" HeaderText="Passport Expiry" ReadOnly="True" SortExpression="Passport Expiry" />
                <asp:BoundField DataField="passportNo_Old" HeaderText="Old Passport No" SortExpression="passportNo_Old" />
                <asp:BoundField DataField="passportNo_New" HeaderText="New Passport No" SortExpression="passportNo_New" />
                <asp:BoundField DataField="workerStatus" HeaderText="Worker Status" SortExpression="workerStatus" />
                <asp:BoundField DataField="address" HeaderText="Address" SortExpression="address" />
                <asp:BoundField DataField="contactNo" HeaderText="Contact No" SortExpression="contactNo" />
                <asp:BoundField DataField="employerName" HeaderText="Employer Name" SortExpression="employerName" />
                <asp:BoundField DataField="employerCompany" HeaderText="Employer Company" SortExpression="employerCompany" />
                <asp:BoundField DataField="employerContact_No" HeaderText="Employer Contact No" SortExpression="employerContact_No" />
                <asp:BoundField DataField="sector" HeaderText="Sector" SortExpression="sector" />
                <asp:BoundField DataField="agent" HeaderText="Agent" SortExpression="agent" />
                <asp:BoundField DataField="adminIncharge" HeaderText="Admin Incharge" SortExpression="adminIncharge" />
                <asp:BoundField DataField="serviceType" HeaderText="Service Type" SortExpression="serviceType" />
                <asp:BoundField DataField="servicePhase" HeaderText="Service Phase" SortExpression="servicePhase" />
                <asp:BoundField DataField="submitBy" HeaderText="Submit By" SortExpression="submitBy" />
                <asp:BoundField DataField="submitTo" HeaderText="Submit To" SortExpression="submitTo" />
                <asp:BoundField DataField="Submission Date" HeaderText="Submission Date" ReadOnly="True" SortExpression="Submission Date" />
                <asp:BoundField DataField="invoiceNo" HeaderText="Invoice No" SortExpression="invoiceNo" />
                <asp:BoundField DataField="policyIG" HeaderText="Policy IG" SortExpression="policyIG" />
                <asp:BoundField DataField="remark" HeaderText="Remark" SortExpression="remark" />
                <asp:BoundField DataField="paymentOutstanding" HeaderText="Payment Outstanding" SortExpression="paymentOutstanding" />
                <asp:BoundField DataField="paymentRemark" HeaderText="Payment Remark" SortExpression="paymentRemark" />
            </Fields>
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" Width="150px" />
            <InsertRowStyle HorizontalAlign="Left" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" HorizontalAlign="Left" />
        </asp:DetailsView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:PrisMegahConnString %>" SelectCommand="SELECT FORMAT(receivedDate,'yyyy-MM-dd') AS [Date Received], [name], [gender], [nationality], FORMAT(DOB,'yyyy-MM-dd') AS [Date Of Birth], [PLKSCompany], FORMAT(PLKSExp,'yyyy-MM-dd') AS [PLKS Expiry], FORMAT(passportExp,'yyyy-MM-dd') AS [Passport Expiry], [passportNo_Old], [passportNo_New], [workerStatus], [address], [contactNo], [employerName], [employerCompany], [employerContact_No], [sector], [agent], [adminIncharge], [serviceType], [servicePhase], [submitBy], [submitTo], FORMAT(submitDate,'yyyy-MM-dd') AS [Submission Date], [invoiceNo], [policyIG], [remark], [paymentOutstanding], [paymentRemark] FROM workerDetails wd
LEFT OUTER JOIN
(
SELECT  t.[workerNo]
              ,t.[paymentTotal]
              ,t.[paymentOutstanding]
              ,t.[paymentRemark]
              ,t.[paymentDate]
FROM payment t
INNER JOIN(
SELECT workerNo, max(paymentDate) as MaxDate
    FROM payment
    GROUP BY workerNo
) tm ON t.workerNo = tm.workerNo and t.paymentDate = tm.MaxDate
)p ON wd.workerNo=p.workerNo WHERE ([passportNo_New] = @passportNo_New)">
            <SelectParameters>
                <asp:QueryStringParameter Name="passportNo_New" QueryStringField="worker" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
</asp:Content>
