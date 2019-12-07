<%@ Page Title="" Language="C#" MasterPageFile="~/AdminArea/MasterPage.Master" AutoEventWireup="true" CodeBehind="CategorieView.aspx.cs" Inherits="StudyBlog.CategorieView" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMain" runat="server">
    <div class="inner-block" >  
            <div style="margin:10px;padding:10px;height:400px">
                <h2 style="margin:5px">ALL Categories</h2>  
                <asp:GridView ID="GridView1" runat="server" DataKeyNames="Categorie_Id" PageSize="4" AutoGenerateColumns="false" AllowPaging="true" Width="800px" Height="300px" BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating" OnPageIndexChanging="GridView1_PageIndexChanging" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowDeleting="GridView1_RowDeleting" EmptyDataText="No records has been added." >  
                    <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />  
                    <RowStyle BackColor="White" ForeColor="#330099" HorizontalAlign="Center" /> 
                    <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />  
                    <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" HorizontalAlign="Center" />  
                    <Columns>  
                        <asp:TemplateField HeaderText="Categorie Id">  
                            <ItemTemplate>  
                                <asp:Label ID="lblCategorieId" runat="server" Text='<%#Eval ("Categorie_Id")%>'></asp:Label>  
                            </ItemTemplate>  
                        </asp:TemplateField>  
                        <asp:TemplateField HeaderText="Name">  
                            <ItemTemplate>  
                                <asp:Label ID="lblName" runat="server" Text='<%#Eval("Categorie_Name")%>'> </asp:Label>  
                            </ItemTemplate> 
                            <EditItemTemplate>
                                <asp:TextBox ID="txtName" runat="server" Text='<%#Eval("Categorie_Name") %>' MaxLength="50"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvtxtName" runat="server" Text="*" ToolTip="Enter Categorie Name" ControlToValidate="txtName"></asp:RequiredFieldValidator>
                            </EditItemTemplate> 
                        </asp:TemplateField>  
                        
                        <asp:TemplateField HeaderText="Edit" ShowHeader="false">  
                            <EditItemTemplate>  
                                <asp:LinkButton ID="lnkbtnUpdate" runat="server" CausesValidation="true" Text="Update" CommandName="Update"></asp:LinkButton>  
                                <asp:LinkButton ID="lnkbtnCancel" runat="server" CausesValidation="false" Text="Cancel" CommandName="Cancel"></asp:LinkButton>  
                            </EditItemTemplate> 
                            <ItemTemplate>  
                            <asp:LinkButton ID="btnEdit" runat="server" CausesValidation="false" CommandName="Edit" Text="Edit"></asp:LinkButton>  
                            </ItemTemplate>  
                        </asp:TemplateField>  
                        <asp:CommandField HeaderText="Delete" ShowDeleteButton="true" ShowHeader="true" />
                    </Columns>  
                </asp:GridView> 
             
            </div>  
        </div>  
</asp:Content>
