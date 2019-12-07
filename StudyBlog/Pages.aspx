<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Pages.aspx.cs" Inherits="StudyBlog.Pages" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="bloder-content">
        <asp:Repeater ID="repBlogPost" runat="server">
            <ItemTemplate>
                <div class="bloger-grid">						
					<div class="blog-img" style="text-align:center;">
						<img src='<%# Eval("Blog_Image") %>' title="img6" />
					</div>
					<div class="bloger-content">
						<h5><a href='<%# "Single.aspx?BlogId="+Eval("Blog_Id") %>'><asp:Label ID="lblTitle" runat="server" Text='<%# Eval("Blog_Title") %>'></asp:Label></a></h5>
                        <p><asp:Label ID="lblBlogContent" runat="server" Text='<%# Eval("Blog_Content") %>' style="text-transform:lowercase !important;font-size:15px;"></asp:Label></p>
						<ul>
							<li><a href="#"><asp:Label ID="lblUser" runat="server" Text='<%# Eval("UserName") %>'></asp:Label></a></li>
							<li><a href="#">: <asp:Label ID="lblDate" runat="server" Text='<%# Eval("Blog_Date") %>' style="text-transform:lowercase !important;font-size:15px;"></asp:Label></a></li>
							<li>
                                <span>
                                    <asp:LinkButton ID="lblReadMore" runat="server"><a href='<%# "Single.aspx?BlogId="+Eval("Blog_Id") %>'>ReadMore</a></asp:LinkButton>
                                </span>
							</li>
						</ul>
					</div>
					<div class="clear"> </div>
				</div>
            </ItemTemplate>
        </asp:Repeater>		
    </div>
    <div class="clear"> </div>
     <br />
    <br />
    <div class="wrap">
        <div style="overflow: hidden; margin-left:20px">
             <asp:Repeater ID="rptPaging" runat="server" OnItemCommand="rptPaging_ItemCommand">
                  <ItemTemplate>
                       <asp:LinkButton ID="btnPage"
                                Style="padding: 8px; margin: 2px; background: #007acc; color:#666; border: solid 1px blue; font: 8px;"
                                CommandName="Page" CommandArgument="<%# Container.DataItem %>"
                                runat="server" ForeColor="White" Font-Bold="True" CausesValidation="false"><%# Container.DataItem %>
                         </asp:LinkButton>
                     </ItemTemplate>
                </asp:Repeater>
           </div>
    </div>
    <div class="clear"> </div>
    <br />
    <br />    
</asp:Content>
