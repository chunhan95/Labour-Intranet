<%@ Page Language="C#" MasterPageFile="~/Master page/Director.Master" AutoEventWireup="true" CodeBehind="ImagePreview.aspx.cs" Inherits="PrisMegahHRSystem.ImagePreview" %>

<asp:Content ID="Content1" ContentPlaceHolderID="DirectoryPlaceHolder" runat="server">
    <asp:Label ID="Label8" runat="server" Text="Attachment Preview" Font-Bold="True" ForeColor="#CC3300"></asp:Label>
</asp:Content>

<asp:Content ID="myContent" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link rel="stylesheet" type="text/css" href="CSS class/Layout.css" />
    <div>
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <%--http://stackoverflow.com/questions/26494505/asp-net-c-sharp-get-retrieve-and-show-image-from-sql-server-database--%>


                <asp:Label ID="Label5" runat="server" Text="Passport No"></asp:Label>
                &nbsp;<asp:DropDownList ID="ddlPPNo" runat="server" DataSourceID="SqlDataSource1" DataTextField="passportNo_New" DataValueField="passportNo_New" ToolTip="Select a passport number to preview">
                </asp:DropDownList>
                &nbsp;<asp:ImageButton ID="ibtnSearchByPPNo" runat="server" Height="18px" ImageUrl="~/Images/search-button.png" Width="18px" OnClick="ibtnSearchByPPNo_Click" CssClass="grow" />
                <asp:Label ID="lblWorkerNo" runat="server" Visible="False"></asp:Label>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:PrisMegahConnString %>" SelectCommand="SELECT [passportNo_New] FROM [workerDetails]"></asp:SqlDataSource>
                <br />
                <br />
                <asp:Label ID="Label6" runat="server" Text="Photo" CssClass="titlePreview"></asp:Label>
                <br />
                <asp:Image ID="imgPersonalPhoto" runat="server" Height="250px" Width="200px" />
                <br />
                <br />
                <hr />
                <asp:Label ID="Label1" runat="server" Text="Passport Particular" CssClass="titlePreview"></asp:Label>
                &nbsp;<asp:Label ID="Label23" runat="server" Font-Bold="True" Font-Names="Bell MT" Text="Old"></asp:Label>
                <asp:GridView ID="gvPassportOld1" runat="server" AutoGenerateColumns="False" CellPadding="4" OnRowCommand="gvPassportOld1_RowCommand" ForeColor="#333333" GridLines="Vertical" Font-Names="Arial Narrow" Font-Bold="True">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:BoundField DataField="fileName1" HeaderText="File 1" />
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:LinkButton ID="lnkViewPassport1" runat="server" CommandArgument='<%# Eval("fileName1") + "," + Eval("filePath1") %>' CommandName="ViewPassport1" Text="View"></asp:LinkButton>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:LinkButton ID="lnkDownloadPassport1" runat="server" CommandArgument='<%# Eval("fileName1") + "," + Eval("filePath1") %>' CommandName="DownloadPassport1" Text="Download"></asp:LinkButton>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>
                        <asp:BoundField DataField="fileName2" HeaderText="File 2" />
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:LinkButton ID="lnkViewPassport2" runat="server" CommandArgument='<%# Eval("fileName2") + "," + Eval("filePath2") %>' CommandName="ViewPassport1" Text="View"></asp:LinkButton>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:LinkButton ID="lnkDownloadPassport2" runat="server" CommandArgument='<%# Eval("fileName2") + "," + Eval("filePath2") %>' CommandName="DownloadPassport1" Text="Download"></asp:LinkButton>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>
                        <asp:BoundField DataField="fileName3" HeaderText="File 3" />
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:LinkButton ID="lnkViewPassport3" runat="server" CommandArgument='<%# Eval("fileName3") + "," + Eval("filePath3") %>' CommandName="ViewPassport1" Text="View"></asp:LinkButton>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:LinkButton ID="lnkDownloadPassport3" runat="server" CommandArgument='<%# Eval("fileName3") + "," + Eval("filePath3") %>' CommandName="DownloadPassport1" Text="Download"></asp:LinkButton>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>
                        <asp:BoundField DataField="fileName4" HeaderText="File 4" />
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:LinkButton ID="lnkViewPassport4" runat="server" CommandArgument='<%# Eval("fileName4") + "," + Eval("filePath4") %>' CommandName="ViewPassport1" Text="View"></asp:LinkButton>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:LinkButton ID="lnkDownloadPassport4" runat="server" CommandArgument='<%# Eval("fileName4") + "," + Eval("filePath4") %>' CommandName="DownloadPassport1" Text="Download"></asp:LinkButton>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>
                    </Columns>
                    <EditRowStyle BackColor="#2461BF" />
                    <FooterStyle BackColor="#507CD1" ForeColor="White" Font-Bold="True" />
                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" HorizontalAlign="Left" />
                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#EFF3FB" />
                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#F5F7FB" />
                    <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                    <SortedDescendingCellStyle BackColor="#E9EBEF" />
                    <SortedDescendingHeaderStyle BackColor="#4870BE" />
                </asp:GridView>
                <br />
                <asp:GridView ID="gvPassportOld2" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:ImageField DataImageUrlField="filePath1" HeaderText="Picture 1" ControlStyle-Width="100" ControlStyle-Height="100">
                            <ControlStyle Height="100px" Width="100px"></ControlStyle>
                        </asp:ImageField>
                        <asp:ImageField DataImageUrlField="filePath2" HeaderText="Picture 2" ControlStyle-Width="100" ControlStyle-Height="100">
<ControlStyle Height="100px" Width="100px"></ControlStyle>
                        </asp:ImageField>
                        <asp:ImageField DataImageUrlField="filePath3" HeaderText="Picture 3" ControlStyle-Width="100" ControlStyle-Height="100">
<ControlStyle Height="100px" Width="100px"></ControlStyle>
                        </asp:ImageField>
                        <asp:ImageField DataImageUrlField="filePath4" HeaderText="Picture 4" ControlStyle-Width="100" ControlStyle-Height="100">
<ControlStyle Height="100px" Width="100px"></ControlStyle>
                        </asp:ImageField>
                    </Columns>
                    <EditRowStyle BackColor="#2461BF" />
                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" HorizontalAlign="Left" />
                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#EFF3FB" />
                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#F5F7FB" />
                    <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                    <SortedDescendingCellStyle BackColor="#E9EBEF" />
                    <SortedDescendingHeaderStyle BackColor="#4870BE" />
                </asp:GridView>
                <br />
                &nbsp;<asp:Label ID="Label10" runat="server" Font-Bold="True" Font-Names="Bell MT" Text="New"></asp:Label>
                <asp:GridView ID="gvPassportNew1" runat="server" AutoGenerateColumns="False" CellPadding="4" OnRowCommand="gvPassportNew1_RowCommand" ForeColor="#333333" GridLines="Vertical" Font-Names="Arial Narrow" Font-Bold="True">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:BoundField DataField="fileName1" HeaderText="File 1" />
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:LinkButton ID="lnkViewPassport1" runat="server" CommandArgument='<%# Eval("fileName1") + "," + Eval("filePath1") %>' CommandName="ViewPassport1" Text="View"></asp:LinkButton>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:LinkButton ID="lnkDownloadPassport1" runat="server" CommandArgument='<%# Eval("fileName1") + "," + Eval("filePath1") %>' CommandName="DownloadPassport1" Text="Download"></asp:LinkButton>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>
                        <asp:BoundField DataField="fileName2" HeaderText="File 2" />
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:LinkButton ID="lnkViewPassport2" runat="server" CommandArgument='<%# Eval("fileName2") + "," + Eval("filePath2") %>' CommandName="ViewPassport1" Text="View"></asp:LinkButton>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:LinkButton ID="lnkDownloadPassport2" runat="server" CommandArgument='<%# Eval("fileName2") + "," + Eval("filePath2") %>' CommandName="DownloadPassport1" Text="Download"></asp:LinkButton>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>
                        <asp:BoundField DataField="fileName3" HeaderText="File 3" />
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:LinkButton ID="lnkViewPassport3" runat="server" CommandArgument='<%# Eval("fileName3") + "," + Eval("filePath3") %>' CommandName="ViewPassport1" Text="View"></asp:LinkButton>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:LinkButton ID="lnkDownloadPassport3" runat="server" CommandArgument='<%# Eval("fileName3") + "," + Eval("filePath3") %>' CommandName="DownloadPassport1" Text="Download"></asp:LinkButton>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>
                        <asp:BoundField DataField="fileName4" HeaderText="File 4" />
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:LinkButton ID="lnkViewPassport4" runat="server" CommandArgument='<%# Eval("fileName4") + "," + Eval("filePath4") %>' CommandName="ViewPassport1" Text="View"></asp:LinkButton>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:LinkButton ID="lnkDownloadPassport4" runat="server" CommandArgument='<%# Eval("fileName4") + "," + Eval("filePath4") %>' CommandName="DownloadPassport1" Text="Download"></asp:LinkButton>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>
                    </Columns>
                    <EditRowStyle BackColor="#2461BF" />
                    <FooterStyle BackColor="#507CD1" ForeColor="White" Font-Bold="True" />
                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" HorizontalAlign="Left" />
                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#EFF3FB" />
                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#F5F7FB" />
                    <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                    <SortedDescendingCellStyle BackColor="#E9EBEF" />
                    <SortedDescendingHeaderStyle BackColor="#4870BE" />
                </asp:GridView>
                <br />
                <asp:GridView ID="gvPassportNew2" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:ImageField DataImageUrlField="filePath1" HeaderText="Picture 1" ControlStyle-Width="100" ControlStyle-Height="100">
                            <ControlStyle Height="100px" Width="100px"></ControlStyle>
                        </asp:ImageField>
                        <asp:ImageField DataImageUrlField="filePath2" HeaderText="Picture 2" ControlStyle-Width="100" ControlStyle-Height="100">
<ControlStyle Height="100px" Width="100px"></ControlStyle>
                        </asp:ImageField>
                        <asp:ImageField DataImageUrlField="filePath3" HeaderText="Picture 3" ControlStyle-Width="100" ControlStyle-Height="100">
<ControlStyle Height="100px" Width="100px"></ControlStyle>
                        </asp:ImageField>
                        <asp:ImageField DataImageUrlField="filePath4" HeaderText="Picture 4" ControlStyle-Width="100" ControlStyle-Height="100">
<ControlStyle Height="100px" Width="100px"></ControlStyle>
                        </asp:ImageField>
                    </Columns>
                    <EditRowStyle BackColor="#2461BF" />
                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" HorizontalAlign="Left" />
                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#EFF3FB" />
                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#F5F7FB" />
                    <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                    <SortedDescendingCellStyle BackColor="#E9EBEF" />
                    <SortedDescendingHeaderStyle BackColor="#4870BE" />
                </asp:GridView>
                <br />
                <div>
                    <asp:Label ID="Label7" runat="server" Text="If you are unable to view file, you can download through the link above or download "></asp:Label>
                    <a target="_blank" href="http://get.adobe.com/reader/">Adobe PDF Reader</a>
                    <asp:Label ID="Label9" runat="server" Text="to view the file."></asp:Label>
                </div>
                <br />
                <br />
                <hr />
                <asp:Label ID="Label2" runat="server" Text="Special Pass" CssClass="titlePreview"></asp:Label>
                &nbsp;<asp:Label ID="Label22" runat="server" Font-Bold="True" Font-Names="Bell MT" Text="Old"></asp:Label>
                <br />
                <asp:GridView ID="gvSpecialPassOld1" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" OnRowCommand="gvSpecialPassOld1_RowCommand" GridLines="Vertical" Font-Names="Arial Narrow" Font-Bold="True">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:BoundField DataField="fileName1" HeaderText="File 1" />
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:LinkButton ID="lnkViewSpecialPass1" runat="server" CommandArgument='<%# Eval("fileName1") + "," + Eval("filePath1") %>' CommandName="ViewSpecialPass1" Text="View"></asp:LinkButton>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center"></ItemStyle>
                        </asp:TemplateField>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:LinkButton ID="lnkDownloadSpecialPass1" runat="server" CommandArgument='<%# Eval("fileName1") + "," + Eval("filePath1") %>' CommandName="DownloadSpecialPass1" Text="Download"></asp:LinkButton>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center"></ItemStyle>
                        </asp:TemplateField>
                        <asp:BoundField DataField="fileName2" HeaderText="File 2" />
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:LinkButton ID="lnkViewSpecialPass2" runat="server" CommandArgument='<%# Eval("fileName2") + "," + Eval("filePath2") %>' CommandName="ViewSpecialPass1" Text="View"></asp:LinkButton>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center"></ItemStyle>
                        </asp:TemplateField>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:LinkButton ID="lnkDownloadSpecialPass2" runat="server" CommandArgument='<%# Eval("fileName2") + "," + Eval("filePath2") %>' CommandName="DownloadSpecialPass1" Text="Download"></asp:LinkButton>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center"></ItemStyle>
                        </asp:TemplateField>
                        <asp:BoundField DataField="fileName3" HeaderText="File 3" />
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:LinkButton ID="lnkViewSpecialPass3" runat="server" CommandArgument='<%# Eval("fileName3") + "," + Eval("filePath3") %>' CommandName="ViewSpecialPass1" Text="View"></asp:LinkButton>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center"></ItemStyle>
                        </asp:TemplateField>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:LinkButton ID="lnkDownloadSpecialPass3" runat="server" CommandArgument='<%# Eval("fileName3") + "," + Eval("filePath3") %>' CommandName="DownloadSpecialPass1" Text="Download"></asp:LinkButton>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center"></ItemStyle>
                        </asp:TemplateField>
                        <asp:BoundField DataField="fileName4" HeaderText="File 4" />
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:LinkButton ID="lnkViewSpecialPass4" runat="server" CommandArgument='<%# Eval("fileName4") + "," + Eval("filePath4") %>' CommandName="ViewSpecialPass1" Text="View"></asp:LinkButton>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center"></ItemStyle>
                        </asp:TemplateField>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:LinkButton ID="lnkDownloadSpecialPass4" runat="server" CommandArgument='<%# Eval("fileName4") + "," + Eval("filePath4") %>' CommandName="DownloadSpecialPass1" Text="Download"></asp:LinkButton>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center"></ItemStyle>
                        </asp:TemplateField>
                    </Columns>
                    <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" HorizontalAlign="Left" />
                    <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Right" />
                    <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                    <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                    <SortedAscendingCellStyle BackColor="#FDF5AC" />
                    <SortedAscendingHeaderStyle BackColor="#4D0000" />
                    <SortedDescendingCellStyle BackColor="#FCF6C0" />
                    <SortedDescendingHeaderStyle BackColor="#820000" />
                </asp:GridView>
                <br />
                <asp:GridView ID="gvSpecialPassOld2" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:ImageField DataImageUrlField="filePath1" HeaderText="Picture 1" ControlStyle-Width="100" ControlStyle-Height="100">
<ControlStyle Height="100px" Width="100px"></ControlStyle>
                        </asp:ImageField>
                        <asp:ImageField DataImageUrlField="filePath2" HeaderText="Picture 2" ControlStyle-Width="100" ControlStyle-Height="100">
<ControlStyle Height="100px" Width="100px"></ControlStyle>
                        </asp:ImageField>
                        <asp:ImageField DataImageUrlField="filePath3" HeaderText="Picture 3" ControlStyle-Width="100" ControlStyle-Height="100">
<ControlStyle Height="100px" Width="100px"></ControlStyle>
                        </asp:ImageField>
                        <asp:ImageField DataImageUrlField="filePath4" HeaderText="Picture 4" ControlStyle-Width="100" ControlStyle-Height="100">
<ControlStyle Height="100px" Width="100px"></ControlStyle>
                        </asp:ImageField>
                    </Columns>
                    <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" HorizontalAlign="Left" />
                    <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                    <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                    <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                    <SortedAscendingCellStyle BackColor="#FDF5AC" />
                    <SortedAscendingHeaderStyle BackColor="#4D0000" />
                    <SortedDescendingCellStyle BackColor="#FCF6C0" />
                    <SortedDescendingHeaderStyle BackColor="#820000" />
                </asp:GridView>
                <br />
                &nbsp;<asp:Label ID="Label11" runat="server" Font-Bold="True" Font-Names="Bell MT" Text="New"></asp:Label>
                <br />
                <asp:GridView ID="gvSpecialPassNew1" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" OnRowCommand="gvSpecialPassNew1_RowCommand" GridLines="Vertical" Font-Names="Arial Narrow" Font-Bold="True">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:BoundField DataField="fileName1" HeaderText="File 1" />
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:LinkButton ID="lnkViewSpecialPass1" runat="server" CommandArgument='<%# Eval("fileName1") + "," + Eval("filePath1") %>' CommandName="ViewSpecialPass1" Text="View"></asp:LinkButton>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center"></ItemStyle>
                        </asp:TemplateField>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:LinkButton ID="lnkDownloadSpecialPass1" runat="server" CommandArgument='<%# Eval("fileName1") + "," + Eval("filePath1") %>' CommandName="DownloadSpecialPass1" Text="Download"></asp:LinkButton>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center"></ItemStyle>
                        </asp:TemplateField>
                        <asp:BoundField DataField="fileName2" HeaderText="File 2" />
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:LinkButton ID="lnkViewSpecialPass2" runat="server" CommandArgument='<%# Eval("fileName2") + "," + Eval("filePath2") %>' CommandName="ViewSpecialPass1" Text="View"></asp:LinkButton>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center"></ItemStyle>
                        </asp:TemplateField>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:LinkButton ID="lnkDownloadSpecialPass2" runat="server" CommandArgument='<%# Eval("fileName2") + "," + Eval("filePath2") %>' CommandName="DownloadSpecialPass1" Text="Download"></asp:LinkButton>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center"></ItemStyle>
                        </asp:TemplateField>
                        <asp:BoundField DataField="fileName3" HeaderText="File 3" />
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:LinkButton ID="lnkViewSpecialPass3" runat="server" CommandArgument='<%# Eval("fileName3") + "," + Eval("filePath3") %>' CommandName="ViewSpecialPass1" Text="View"></asp:LinkButton>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center"></ItemStyle>
                        </asp:TemplateField>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:LinkButton ID="lnkDownloadSpecialPass3" runat="server" CommandArgument='<%# Eval("fileName3") + "," + Eval("filePath3") %>' CommandName="DownloadSpecialPass1" Text="Download"></asp:LinkButton>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center"></ItemStyle>
                        </asp:TemplateField>
                        <asp:BoundField DataField="fileName4" HeaderText="File 4" />
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:LinkButton ID="lnkViewSpecialPass4" runat="server" CommandArgument='<%# Eval("fileName4") + "," + Eval("filePath4") %>' CommandName="ViewSpecialPass1" Text="View"></asp:LinkButton>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center"></ItemStyle>
                        </asp:TemplateField>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:LinkButton ID="lnkDownloadSpecialPass4" runat="server" CommandArgument='<%# Eval("fileName4") + "," + Eval("filePath4") %>' CommandName="DownloadSpecialPass1" Text="Download"></asp:LinkButton>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center"></ItemStyle>
                        </asp:TemplateField>
                    </Columns>
                    <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" HorizontalAlign="Left" />
                    <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Right" />
                    <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                    <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                    <SortedAscendingCellStyle BackColor="#FDF5AC" />
                    <SortedAscendingHeaderStyle BackColor="#4D0000" />
                    <SortedDescendingCellStyle BackColor="#FCF6C0" />
                    <SortedDescendingHeaderStyle BackColor="#820000" />
                </asp:GridView>
                <br />
                <asp:GridView ID="gvSpecialPassNew2" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:ImageField DataImageUrlField="filePath1" HeaderText="Picture 1" ControlStyle-Width="100" ControlStyle-Height="100">
<ControlStyle Height="100px" Width="100px"></ControlStyle>
                        </asp:ImageField>
                        <asp:ImageField DataImageUrlField="filePath2" HeaderText="Picture 2" ControlStyle-Width="100" ControlStyle-Height="100">
<ControlStyle Height="100px" Width="100px"></ControlStyle>
                        </asp:ImageField>
                        <asp:ImageField DataImageUrlField="filePath3" HeaderText="Picture 3" ControlStyle-Width="100" ControlStyle-Height="100">
<ControlStyle Height="100px" Width="100px"></ControlStyle>
                        </asp:ImageField>
                        <asp:ImageField DataImageUrlField="filePath4" HeaderText="Picture 4" ControlStyle-Width="100" ControlStyle-Height="100">
<ControlStyle Height="100px" Width="100px"></ControlStyle>
                        </asp:ImageField>
                    </Columns>
                    <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" HorizontalAlign="Left" />
                    <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                    <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                    <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                    <SortedAscendingCellStyle BackColor="#FDF5AC" />
                    <SortedAscendingHeaderStyle BackColor="#4D0000" />
                    <SortedDescendingCellStyle BackColor="#FCF6C0" />
                    <SortedDescendingHeaderStyle BackColor="#820000" />
                </asp:GridView>
                <br />
                <div>
                    <asp:Label ID="Label12" runat="server" Text="If you are unable to view file, you can download through the link above or download "></asp:Label>
                    <a target="_blank" href="http://get.adobe.com/reader/">Adobe PDF Reader</a>
                    <asp:Label ID="Label13" runat="server" Text="to view the file."></asp:Label>
                </div>
                <br />
                <br />
                <hr />
                <asp:Label ID="Label3" runat="server" Text="PLKS" CssClass="titlePreview"></asp:Label>
                &nbsp;<asp:Label ID="Label17" runat="server" Font-Bold="True" Font-Names="Bell MT" Text="Old"></asp:Label>
                <br />
                <asp:GridView ID="gvPLKSOld1" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="Vertical" Font-Names="Arial Narrow" OnRowCommand="gvPLKSOld1_RowCommand" Font-Bold="True">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:BoundField DataField="fileName" HeaderText="File Name" />
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:LinkButton ID="lnkViewPLKS" runat="server" CommandArgument='<%# Eval("fileName") + "," + Eval("filePath") %>' CommandName="ViewPLKS" Text="View"></asp:LinkButton>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center"></ItemStyle>
                        </asp:TemplateField>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:LinkButton ID="lnkDownloadPLKS" runat="server" CommandArgument='<%# Eval("fileName") + "," + Eval("filePath") %>' CommandName="DownloadPLKS" Text="Download"></asp:LinkButton>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center"></ItemStyle>
                        </asp:TemplateField>
                    </Columns>
                    <EditRowStyle BackColor="#7C6F57" />
                    <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" HorizontalAlign="Left" />
                    <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#E3EAEB" />
                    <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#F8FAFA" />
                    <SortedAscendingHeaderStyle BackColor="#246B61" />
                    <SortedDescendingCellStyle BackColor="#D4DFE1" />
                    <SortedDescendingHeaderStyle BackColor="#15524A" />
                </asp:GridView>
                <br />
                <asp:GridView ID="gvPLKSOld2" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:ImageField DataImageUrlField="filePath" HeaderText="Picture" ControlStyle-Width="100" ControlStyle-Height="100">
<ControlStyle Height="100px" Width="100px"></ControlStyle>
                        </asp:ImageField>
                    </Columns>
                    <EditRowStyle BackColor="#7C6F57" />
                    <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" HorizontalAlign="Left" />
                    <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#E3EAEB" />
                    <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#F8FAFA" />
                    <SortedAscendingHeaderStyle BackColor="#246B61" />
                    <SortedDescendingCellStyle BackColor="#D4DFE1" />
                    <SortedDescendingHeaderStyle BackColor="#15524A" />
                </asp:GridView>
                <br />
                &nbsp;<asp:Label ID="Label16" runat="server" Font-Bold="True" Font-Names="Bell MT" Text="New"></asp:Label>
                <br />
                <asp:GridView ID="gvPLKSNew1" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="Vertical" Font-Names="Arial Narrow" OnRowCommand="gvPLKSNew1_RowCommand" Font-Bold="True">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:BoundField DataField="fileName" HeaderText="File Name" />
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:LinkButton ID="lnkViewPLKS" runat="server" CommandArgument='<%# Eval("fileName") + "," + Eval("filePath") %>' CommandName="ViewPLKS" Text="View"></asp:LinkButton>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center"></ItemStyle>
                        </asp:TemplateField>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:LinkButton ID="lnkDownloadPLKS" runat="server" CommandArgument='<%# Eval("fileName") + "," + Eval("filePath") %>' CommandName="DownloadPLKS" Text="Download"></asp:LinkButton>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center"></ItemStyle>
                        </asp:TemplateField>
                    </Columns>
                    <EditRowStyle BackColor="#7C6F57" />
                    <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" HorizontalAlign="Left" />
                    <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#E3EAEB" />
                    <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#F8FAFA" />
                    <SortedAscendingHeaderStyle BackColor="#246B61" />
                    <SortedDescendingCellStyle BackColor="#D4DFE1" />
                    <SortedDescendingHeaderStyle BackColor="#15524A" />
                </asp:GridView>
                <br />
                <asp:GridView ID="gvPLKSNew2" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:ImageField DataImageUrlField="filePath" HeaderText="Picture" ControlStyle-Width="100" ControlStyle-Height="100">
<ControlStyle Height="100px" Width="100px"></ControlStyle>
                        </asp:ImageField>
                    </Columns>
                    <EditRowStyle BackColor="#7C6F57" />
                    <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" HorizontalAlign="Left" />
                    <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#E3EAEB" />
                    <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#F8FAFA" />
                    <SortedAscendingHeaderStyle BackColor="#246B61" />
                    <SortedDescendingCellStyle BackColor="#D4DFE1" />
                    <SortedDescendingHeaderStyle BackColor="#15524A" />
                </asp:GridView>
                <br />
                <div>
                    <asp:Label ID="Label14" runat="server" Text="If you are unable to view file, you can download through the link above or download "></asp:Label>
                    <a target="_blank" href="http://get.adobe.com/reader/">Adobe PDF Reader</a>
                    <asp:Label ID="Label15" runat="server" Text="to view the file."></asp:Label>
                </div>
                <br />
                <br />
                <hr />
                <asp:Label ID="Label4" runat="server" Text="Insurans" CssClass="titlePreview"></asp:Label>
                &nbsp;<asp:Label ID="Label21" runat="server" Text="Old" Font-Bold="True" Font-Names="Bell MT"></asp:Label>
                <asp:GridView ID="gvInsuransOld1" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="Vertical" Font-Bold="True" Font-Names="Arial Narrow" OnRowCommand="gvInsuransOld1_RowCommand">
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <Columns>
                        <asp:BoundField DataField="fileName" HeaderText="File Name" />
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:LinkButton ID="lnkViewInsurans" runat="server" CommandArgument='<%# Eval("fileName") + "," + Eval("filePath") %>' CommandName="ViewInsurans" Text="View"></asp:LinkButton>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center"></ItemStyle>
                        </asp:TemplateField>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:LinkButton ID="lnkDownloadInsurans" runat="server" CommandArgument='<%# Eval("fileName") + "," + Eval("filePath") %>' CommandName="DownloadInsurans" Text="Download"></asp:LinkButton>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center"></ItemStyle>
                        </asp:TemplateField>
                    </Columns>
                    <EditRowStyle BackColor="#999999" />
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" HorizontalAlign="Left" />
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#E9E7E2" />
                    <SortedAscendingHeaderStyle BackColor="#506C8C" />
                    <SortedDescendingCellStyle BackColor="#FFFDF8" />
                    <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                </asp:GridView>
                <br />
                &nbsp;<asp:Label ID="Label20" runat="server" Font-Bold="True" Font-Names="Bell MT" Text="New"></asp:Label>
                <br />
                <asp:GridView ID="gvInsuransNew1" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="Vertical" Font-Bold="True" Font-Names="Arial Narrow" OnRowCommand="gvInsuransNew1_RowCommand">
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <Columns>
                        <asp:BoundField DataField="fileName" HeaderText="File Name" />
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:LinkButton ID="lnkViewInsurans" runat="server" CommandArgument='<%# Eval("fileName") + "," + Eval("filePath") %>' CommandName="ViewInsurans" Text="View"></asp:LinkButton>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center"></ItemStyle>
                        </asp:TemplateField>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:LinkButton ID="lnkDownloadInsurans" runat="server" CommandArgument='<%# Eval("fileName") + "," + Eval("filePath") %>' CommandName="DownloadInsurans" Text="Download"></asp:LinkButton>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center"></ItemStyle>
                        </asp:TemplateField>
                    </Columns>
                    <EditRowStyle BackColor="#999999" />
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" HorizontalAlign="Left" />
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#E9E7E2" />
                    <SortedAscendingHeaderStyle BackColor="#506C8C" />
                    <SortedDescendingCellStyle BackColor="#FFFDF8" />
                    <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                </asp:GridView>
                <br />
                <div>
                    <%--<asp:Literal ID="ltEmbedInsurans" runat="server" />--%>
                    <asp:Label ID="Label18" runat="server" Text="If you are unable to view file, you can download through the link above or download "></asp:Label>
                    <a target="_blank" href="http://get.adobe.com/reader/">Adobe PDF Reader</a>
                    <asp:Label ID="Label19" runat="server" Text="to view the file."></asp:Label>
                </div>
                <br />
                <br />
            <%--</ContentTemplate>
        </asp:UpdatePanel>--%>
    </div>
</asp:Content>

<%--http://stackoverflow.com/questions/26494505/asp-net-c-sharp-get-retrieve-and-show-image-from-sql-server-database--%>
<asp:Content ID="Content2" runat="server" contentplaceholderid="head">
    <style type="text/css">
        .grow
        {}
    </style>
</asp:Content>

