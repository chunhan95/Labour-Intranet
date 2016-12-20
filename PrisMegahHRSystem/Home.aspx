<%@ Page Language="C#" MasterPageFile="~/Master page/Director.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="PrisMegahHRSystem.Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="DirectoryPlaceHolder" runat="server">
    <asp:Label ID="Label8" runat="server" Text="Home" Font-Bold="True" ForeColor="#CC3300"></asp:Label>
</asp:Content>

<asp:Content ID="myContent" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link rel="stylesheet" type="text/css" href="CSS class/Layout.css" />
    <link rel="stylesheet" href="ism/css/my-slider.css" />
    <script src="ism/js/ism-2.2.min.js"></script>
    <div class="title" style="font-family: 'Bookman Old Style'; background-color: burlywood">

        <asp:Label ID="Label1" runat="server" Text="The Company" Font-Bold="True" ForeColor="#669900" Font-Underline="True" Font-Size="Large"></asp:Label>
        <br />
        <br />
        <asp:Label ID="Label2" runat="server" Text="PRISMEGAH HOLDINGS SDN. BHD. (715361-M) A foreign worker Out-Sourcing agency was incorporated on 18th November 2005. As a manpower Out-Sourcing company, Prismegah Holdings provides numerous services to our customers and fellow clients. We do not restrict our services to any particular industry or job category but we extend our offer to various industries and all job categories including professional, skilled, semi-skilled and unskilled workers. We strive to match all candidate's attributes and personality criterion to the best possible occupation. The company also handles goverment application and documentation aporoval, industrial training and the welfare of the workers." Font-Bold="False" Font-Size="Small"></asp:Label>
        <br />
    </div>
    <br />
    <div class="ism-slider" data-play_type="loop" data-image_fx="zoompan" id="my-slider">
        <ol>
            <li>
                <img src="ism/image/slides/_u/1471284667637_435833.png">
                <div class="ism-caption ism-caption-0">Myanmar</div>
            </li>
            <li>
                <img src="ism/image/slides/_u/1471284669541_748886.png">
                <div class="ism-caption ism-caption-0">Sri Lanka</div>
            </li>
            <li>
                <img src="ism/image/slides/_u/1471284667368_985522.jpg">
                <div class="ism-caption ism-caption-0">Vietnam</div>
            </li>
            <li>
                <img src="ism/image/slides/_u/1471284666771_831963.jpg">
                <div class="ism-caption ism-caption-0">Nepal</div>
            </li>
            <li>
                <img src="ism/image/slides/_u/1471284667817_1143.jpg">
                <div class="ism-caption ism-caption-0">India</div>
            </li>
            <li>
                <img src="ism/image/slides/_u/1471284667079_878114.png">
                <div class="ism-caption ism-caption-0">Cambodia</div>
            </li>
            <li>
                <img src="ism/image/slides/_u/1471284666712_650397.jpg">
                <div class="ism-caption ism-caption-0">Bangladesh</div>
            </li>
        </ol>
    </div>
    <%--<p class="ism-badge" id="my-slider-ism-badge"><a class="ism-link" href="http://imageslidermaker.com" rel="nofollow">generated with ISM</a></p>--%>

</asp:Content>

<asp:Content ID="companyInfo" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">

    <div style="background-color: lightgray; font-family: 'Book Antiqua'">
        <table style="width: 100%">
            <tr>
                <td style="width: 50%">
                    <asp:Label ID="Label3" runat="server" Text="Company Address" Font-Bold="True"></asp:Label>
                    <br />
                    <asp:Label ID="Label4" runat="server" Text="28-2-2, Block A, Jalan 5/101C, Off Jalan Kaskas 1, Jalan Cheras," Font-Size="X-Small" Font-Bold="True"></asp:Label>
                    <br />
                    <asp:Label ID="Label5" runat="server" Text="56100, Wilayah Persekutuan, Kuala Lumpur, Malaysia" Font-Size="X-Small" Font-Bold="True"></asp:Label>
                </td>
                <td style="width: 50%">
                    <asp:Label ID="Label6" runat="server" Text="Phone No." Font-Bold="True"></asp:Label>
                    <br />
                    <asp:Label ID="Label7" runat="server" Font-Bold="True" Font-Size="Small" ForeColor="#0066FF" Text="+60 3-9131 3233"></asp:Label>
                </td>
        </table>
    </div>

</asp:Content>
