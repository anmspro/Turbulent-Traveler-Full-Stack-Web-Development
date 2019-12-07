<%@ Page Title="" Language="C#" MasterPageFile="~/AdminArea/MasterPage.Master" AutoEventWireup="true" CodeBehind="BlogView.aspx.cs" Inherits="StudyBlog.AdminArea.BlogView" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMain" runat="server">
    <div class="inner-block">
        <div style="overflow:hidden">
            <h2 style="margin:5px">All Blogs</h2>
            <asp:GridView ID="GridView1" runat="server" ShowHeaderWhenEmpty="True" DataKeyNames="Blog_Id" AllowPaging="true"
                AutoGenerateColumns="False" onrowdeleting="GridView1_RowDeleting" OnPageIndexChanging="GridView1_PageIndexChanging"
                OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowEditing="GridView1_RowEditing" OnRowDataBound="GridView1_RowDataBound"
                OnRowUpdating="GridView1_RowUpdating" CellPadding="4" PageSize="4" 
                EnableModelValidation="True" GridLines="None" Width="100%"
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
                        <HeaderTemplate>Blog Id</HeaderTemplate>
                        <ItemTemplate>
                             <asp:Label ID ="lblId" runat="server" Text='<%#Bind("Blog_Id")%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
 
                    <asp:TemplateField>
                        <HeaderTemplate>Title</HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID ="lblTitle" runat="server" Text='<%#Bind("Blog_Title") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtTitle" runat="server" Text='<%#Bind("Blog_Title") %>' MaxLength="50"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvtxtTitle" runat="server" Text="*" ToolTip="Enter Blog Title" ControlToValidate="txtTitle"></asp:RequiredFieldValidator>
                            
                        </EditItemTemplate>
                    </asp:TemplateField>
           
                    <asp:TemplateField>
                        <HeaderTemplate>Content</HeaderTemplate>
                        <ItemTemplate>
                            <asp:TextBox ID="lblContent" Width="400px" Height="200px" TextMode="MultiLine" ReadOnly="true" runat ="server" Text='<%#Bind("Blog_Content") %>'></asp:TextBox>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID ="txtContent" TextMode="MultiLine" Width="400px" Height="200px" runat="server" Text='<%#Bind("Blog_Content") %>' MaxLength="500"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvtxtContent" runat="server" Text="*" ToolTip="Enter Content" ControlToValidate="txtContent"></asp:RequiredFieldValidator>
                           
                        </EditItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField>
                        <HeaderTemplate>Categories</HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblCategories" runat ="server" Text='<%#Bind("Categorie_Name") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:DropDownList ID="DropDownCategories" runat="server" AppendDataBoundItems="true" AutoPostBack="true" OnSelectedIndexChanged="DropDownCategories_SelectedIndexChanged" DataTextField="Categorie_Name" DataValueField="Categorie_Id">
                                <asp:ListItem Value="0">Categories</asp:ListItem>
                            </asp:DropDownList>
                        </EditItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField>
                        <HeaderTemplate>Date</HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID = "lblDate" runat="server" Text='<%#Bind("Blog_Date") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField>
                        <HeaderTemplate>Images</HeaderTemplate>
                        <ItemTemplate>
                            <asp:Image ID="imgPhoto" Width="100px" Height="100px" runat="server" ImageUrl='<%#Bind("Blog_Image") %>' />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:FileUpload ID="fuPhoto" Width="100px" runat="server" ToolTip="select Blog Photo"/>
                            <asp:RequiredFieldValidator ID="rfvfuPhoto" runat="server" Text="*" ToolTip="Enter Content" ControlToValidate="fuPhoto"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="revfuPhoto" runat="server" Text="*" ToolTip="Image formate only" ControlToValidate="fuPhoto" ValidationExpression="[a-zA-Z0-9].*\b(.jpeg|.JPEG|.jpg|.JPG|.jpe|.JPE|.png|.PNG|.mpp|.MPP|.gif|.GIF)\b"></asp:RegularExpressionValidator>
                        </EditItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField>
                        <HeaderTemplate>Operation</HeaderTemplate>
                        <ItemTemplate>
                            <asp:Button ID="btnEdit" runat="server" CommandName="Edit" Text="Edit" />
                            <asp:Button ID="btnDelete" runat="server" CommandName="Delete" Text="Delete" CausesValidation="true" OnClientClick="return confirm('Are you sure?')" />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:Button ID="btnUpdate" runat="server" CommandName="Update" Text="Update" />
                            <asp:Button ID="btnCancel" runat="server" CommandName="Cancel" Text="Cancel" CausesValidation="false" />
                        </EditItemTemplate>       
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
