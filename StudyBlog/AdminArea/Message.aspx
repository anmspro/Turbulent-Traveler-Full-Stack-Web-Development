<%@ Page Title="" Language="C#" MasterPageFile="~/AdminArea/MasterPage.Master" AutoEventWireup="true" CodeBehind="Message.aspx.cs" Inherits="StudyBlog.AdminArea.Message" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMain" runat="server">
    <div class="inner-block">
        <div style="overflow:hidden">
            <h2 style="margin:5px">All Messages</h2>
            <asp:GridView ID="GridView1" runat="server" ShowHeaderWhenEmpty="True" DataKeyNames="Message_Id" AllowPaging="true"
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
                             <asp:Label ID ="lblMId" runat="server" Text='<%#Bind("Message_Id")%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
 
                    <asp:TemplateField>
                        <HeaderTemplate>Name</HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID ="lblMname" runat="server" Text='<%#Bind("Name") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField>
                        <HeaderTemplate>E-mail</HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID ="lblMemail" runat="server" Text='<%#Bind("Email") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField>
                        <HeaderTemplate>Date</HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID = "lblMDate" runat="server" Text='<%#Bind("Message_Date") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField>
                        <HeaderTemplate>Operation</HeaderTemplate>
                        <ItemTemplate>
                            <asp:Button ID="btnEdit" runat="server" PostBackUrl='<%# "~/AdminArea/MessageDetails.aspx?MessageId="+Eval("Message_Id") %>' Text="Details" />
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
