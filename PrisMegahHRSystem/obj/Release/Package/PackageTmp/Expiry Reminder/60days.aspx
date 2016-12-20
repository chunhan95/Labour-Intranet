<%@ Page Language="C#" MasterPageFile="~/Master page/Common.Master" AutoEventWireup="true" CodeBehind="60days.aspx.cs" Inherits="PrisMegahHRSystem.Expiry_Reminder._60days" %>


<asp:Content ID="myContent" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Label ID="Label1" runat="server" Text="Filter By:"></asp:Label>
    <asp:DropDownList ID="ddlFilter" runat="server">
        <asp:ListItem>Passport Expired</asp:ListItem>
        <asp:ListItem>PLKS Expired</asp:ListItem>
    </asp:DropDownList>
    &nbsp;<asp:Button ID="btnFilter" runat="server" OnClick="btnFilter_Click" Text="Filter" CssClass="shrink" />
    &nbsp;
    <asp:Label ID="Label2" runat="server" Font-Bold="True" ForeColor="#CCCC00"></asp:Label>
&nbsp;<asp:Label ID="Label3" runat="server" Font-Bold="True" ForeColor="#CCCC00"></asp:Label>
    <br />
    <br />
    <asp:GridView ID="gvPassport" runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" OnRowCommand="gvPassport_RowCommand" Width="1310px">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:TemplateField HeaderText="New Passport No" SortExpression="New Passport No">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("[New Passport No]") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CommandName="view" CommandArgument='<%# Bind("[New Passport No]") %>'><asp:Label ID="Label1" runat="server" Text='<%# Bind("[New Passport No]") %>'></asp:Label></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
            <asp:BoundField DataField="Gender" HeaderText="Gender" SortExpression="Gender" />
            <asp:BoundField DataField="Nationality" HeaderText="Nationality" SortExpression="Nationality" />
            <asp:BoundField DataField="Contact No" HeaderText="Contact No" SortExpression="Contact No" />
            <asp:BoundField DataField="Passport Expiry" HeaderText="Passport Expiry" ReadOnly="True" SortExpression="Passport Expiry" />
            <asp:BoundField DataField="PLKS Company" HeaderText="PLKS Company" SortExpression="PLKS Company" />
            <asp:BoundField DataField="EmployerName" HeaderText="Employer Name" SortExpression="EmployerName" />
            <asp:BoundField DataField="Employer Company" HeaderText="Employer Company" SortExpression="Employer Company" />
            <asp:BoundField DataField="Sector" HeaderText="Sector" SortExpression="Sector" />
            <asp:BoundField DataField="Admin Incharge" HeaderText="Admin Incharge" SortExpression="Admin Incharge" />
        </Columns>
        <EditRowStyle BackColor="#999999" />
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#E9E7E2" />
        <SortedAscendingHeaderStyle BackColor="#506C8C" />
        <SortedDescendingCellStyle BackColor="#FFFDF8" />
        <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
    </asp:GridView>
    <asp:GridView ID="gvPLKS" runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource2" ForeColor="#333333" GridLines="None" OnRowCommand="gvPLKS_RowCommand" Width="1310px">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:TemplateField HeaderText="New Passport No" SortExpression="New Passport No">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("[New Passport No]") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton2" runat="server" CommandName="view" CommandArgument='<%# Bind("[New Passport No]") %>'><asp:Label ID="Label1" runat="server" Text='<%# Bind("[New Passport No]") %>'></asp:Label></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
            <asp:BoundField DataField="Gender" HeaderText="Gender" SortExpression="Gender" />
            <asp:BoundField DataField="Nationality" HeaderText="Nationality" SortExpression="Nationality" />
            <asp:BoundField DataField="Contact No" HeaderText="Contact No" SortExpression="Contact No" />
            <asp:BoundField DataField="PLKS Expiry" HeaderText="PLKS Expiry" ReadOnly="True" SortExpression="PLKS Expiry" />
            <asp:BoundField DataField="PLKS Company" HeaderText="PLKS Company" SortExpression="PLKS Company" />
            <asp:BoundField DataField="EmployerName" HeaderText="Employer Name" SortExpression="EmployerName" />
            <asp:BoundField DataField="Employer Company" HeaderText="Employer Company" SortExpression="Employer Company" />
            <asp:BoundField DataField="Sector" HeaderText="Sector" SortExpression="Sector" />
            <asp:BoundField DataField="Admin Incharge" HeaderText="Admin Incharge" SortExpression="Admin Incharge" />
        </Columns>
        <EditRowStyle BackColor="#999999" />
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#E9E7E2" />
        <SortedAscendingHeaderStyle BackColor="#506C8C" />
        <SortedDescendingCellStyle BackColor="#FFFDF8" />
        <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
    </asp:GridView>
    <asp:GridView ID="gvPassport2" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" OnRowCommand="gvPassport2_RowCommand" Width="1310px">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:TemplateField HeaderText="New Passport No" SortExpression="New Passport No">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("[New Passport No]") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton3" runat="server" CommandName="view" CommandArgument='<%# Bind("[New Passport No]") %>'><asp:Label ID="Label1" runat="server" Text='<%# Bind("[New Passport No]") %>'></asp:Label></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
            <asp:BoundField DataField="Gender" HeaderText="Gender" SortExpression="Gender" />
            <asp:BoundField DataField="Nationality" HeaderText="Nationality" SortExpression="Nationality" />
            <asp:BoundField DataField="Contact No" HeaderText="Contact No" SortExpression="Contact No" />
            <asp:BoundField DataField="Passport Expiry" HeaderText="Passport Expiry" SortExpression="Passport Expiry" ReadOnly="True" />
            <asp:BoundField DataField="PLKS Company" HeaderText="PLKS Company" SortExpression="PLKS Company" />
            <asp:BoundField DataField="EmployerName" HeaderText="Employer Name" SortExpression="EmployerName" />
            <asp:BoundField DataField="Employer Company" HeaderText="Employer Company" SortExpression="Employer Company" />
            <asp:BoundField DataField="Sector" HeaderText="Sector" SortExpression="Sector" />
            <asp:BoundField DataField="Admin Incharge" HeaderText="Admin Incharge" SortExpression="Admin Incharge" />
        </Columns>
        <EditRowStyle BackColor="#999999" />
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#E9E7E2" />
        <SortedAscendingHeaderStyle BackColor="#506C8C" />
        <SortedDescendingCellStyle BackColor="#FFFDF8" />
        <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
    </asp:GridView>
    <asp:GridView ID="gvPLKS2" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" OnRowCommand="gvPLKS2_RowCommand" Width="1310px">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:TemplateField HeaderText="New Passport No" SortExpression="New Passport No">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("[New Passport No]") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton4" runat="server" CommandName="view" CommandArgument='<%# Bind("[New Passport No]") %>'><asp:Label ID="Label1" runat="server" Text='<%# Bind("[New Passport No]") %>'></asp:Label></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
            <asp:BoundField DataField="Gender" HeaderText="Gender" SortExpression="Gender" />
            <asp:BoundField DataField="Nationality" HeaderText="Nationality" SortExpression="Nationality" />
            <asp:BoundField DataField="Contact No" HeaderText="Contact No" SortExpression="Contact No" />
            <asp:BoundField DataField="PLKS Expiry" HeaderText="PLKS Expiry" SortExpression="PLKS Expiry" ReadOnly="True" />
            <asp:BoundField DataField="PLKS Company" HeaderText="PLKS Company" SortExpression="PLKS Company" />
            <asp:BoundField DataField="EmployerName" HeaderText="Employer Name" SortExpression="EmployerName" />
            <asp:BoundField DataField="Employer Company" HeaderText="Employer Company" SortExpression="Employer Company" />
            <asp:BoundField DataField="Sector" HeaderText="Sector" SortExpression="Sector" />
            <asp:BoundField DataField="Admin Incharge" HeaderText="Admin Incharge" SortExpression="Admin Incharge" />
        </Columns>
        <EditRowStyle BackColor="#999999" />
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#E9E7E2" />
        <SortedAscendingHeaderStyle BackColor="#506C8C" />
        <SortedDescendingCellStyle BackColor="#FFFDF8" />
        <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:PrisMegahConnString %>" SelectCommand="SELECT  name AS [Name],gender AS [Gender],nationality AS [Nationality],contactNo AS [Contact No],passportNo_New AS [New Passport No],FORMAT(PLKSExp,'yyyy-MM-dd') AS [PLKS Expiry],PLKSCompany AS [PLKS Company],employerName As [EmployerName],employerCompany As [Employer Company],sector As [Sector],adminIncharge As [Admin Incharge]
FROM workerDetails
WHERE (DATEDIFF(day, FORMAT(GETDATE(),'yyyy-MM-dd'), FORMAT(PLKSExp,'yyyy-MM-dd')) &lt;= 60 AND DATEDIFF(day, FORMAT(GETDATE(),'yyyy-MM-dd'), FORMAT(PLKSExp,'yyyy-MM-dd')) &gt; 30) AND workerStatus='Available'"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:PrisMegahConnString %>" SelectCommand="SELECT  name AS [Name],gender AS [Gender],nationality AS [Nationality],contactNo AS [Contact No],passportNo_New AS [New Passport No],FORMAT(passportExp,'yyyy-MM-dd') AS [Passport Expiry],PLKSCompany AS [PLKS Company],employerName As [EmployerName],employerCompany As [Employer Company],sector As [Sector],adminIncharge As [Admin Incharge]
FROM workerDetails
WHERE (DATEDIFF(day, FORMAT(GETDATE(),'yyyy-MM-dd'), FORMAT(passportExp,'yyyy-MM-dd')) &lt;= 60 AND DATEDIFF(day, FORMAT(GETDATE(),'yyyy-MM-dd'), FORMAT(passportExp,'yyyy-MM-dd')) &gt; 30) AND workerStatus='Available'
"></asp:SqlDataSource>
    <link rel="stylesheet" type="text/css" href="../CSS class/Layout.css" />

</asp:Content>
