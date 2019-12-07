<%@ Page Title="" Language="C#" MasterPageFile="~/AdminArea/MasterPage.Master" AutoEventWireup="true" CodeBehind="Comments.aspx.cs" Inherits="StudyBlog.AdminArea.Comments" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMain" runat="server">
    <div class="inner-block">
        <div style="overflow:hidden">
            <h2 style="margin:5px">All Comments</h2>
            <asp:GridView ID="GridView1" runat="server" ShowHeaderWhenEmpty="True" DataKeyNames="Comment_Id" AllowPaging="true"
                AutoGenerateColumns="False" onrowdeleting="GridView1_RowDeleting" OnPageIndexChanging="GridView1_PageIndexChanging"
                CellPadding="4" PageSize="6" GridLines="None" Width="100%" Height="500px"
                ForeColor="#333333" >
                <RowStyle HorizontalAlign="Center" />
                <AlternatingRowStyle BackColor="White" />
                <EditRowStyle BackColor="#F3B749" Width="100%" />
                <FooterStyle BackColor="#1C5E55" ForeColor="White" Font-Bold="True" />
                <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#E3EAEB" />
                <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
 
                <Columns>
 
                    <asp:TemplateField>
                        <HeaderTemplate>No.</HeaderTemplate>
                        <ItemTemplate>
                             <asp:Label ID ="lblCId" runat="server" Text='<%#Bind("Comment_Id")%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
 
                    <asp:TemplateField>
                        <HeaderTemplate>E-mail</HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID ="lblCEmail" runat="server" Text='<%#Bind("Email") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField>
                        <HeaderTemplate>Comment</HeaderTemplate>
                        <ItemTemplate>
                            <asp:TextBox ID ="lblCcontent"  Width="400px" Height="200px" TextMode="MultiLine" ReadOnly="true" runat="server" Text='<%#Bind("Comment_Content") %>'></asp:TextBox>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField>
                        <HeaderTemplate>E-mail</HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID ="lblCbolgname" runat="server" Text='<%#Bind("Blog_Title") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField>
                        <HeaderTemplate>Date</HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID = "lblCDate" runat="server" Text='<%#Bind("Comment_Date") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField>
                        <HeaderTemplate>Operation</HeaderTemplate>
                        <ItemTemplate>
                            <asp:Button ID="btnDelete" runat="server" CommandName="Delete" Text="Delete" CausesValidation="true" OnClientClick="return confirm('Are you sure?')" />
                        </ItemTemplate>      
                    </asp:TemplateField>           
                </Columns>
                <EmptyDataTemplate>
                          No record available                    
                </EmptyDataTemplate>       
            </asp:GridView>
            <br />
        </div>
    </div>
</asp:Content>
