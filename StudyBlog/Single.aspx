<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Single.aspx.cs" Inherits="StudyBlog.Single" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 30%;
            float:right;
            
        }

        .auto-style2 {
            width: 60%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    	<div class="bloder-content">
			<asp:Repeater ID="repBlogPost" runat="server">
                <ItemTemplate>
                    <div class="blog-box1">
					    <div class="blog-box-image" style="text-align:center;">
						    <img src='<%# Eval("Blog_Image") %>' title="priview" />
					    </div>
					        <div class="blog-box-content">
							    <h5><a href="#"><asp:Label ID="lblTitle" runat="server" Text='<%# Eval("Blog_Title") %>'></asp:Label></a></h5>
							    <p><asp:Label ID="lblBlogContent" runat="server" Text='<%# Eval("Blog_Content") %>' style="text-transform:lowercase !important;font-size:15px;"></asp:Label></p>
                                <br />
                                <br />
                                <asp:Label ID="lblUser" runat="server" Text='<%# Eval("UserName") %>'></asp:Label>: <asp:Label ID="lblDate" runat="server" Text='<%# Eval("Blog_Date") %>' style="text-transform:lowercase !important;font-size:15px;"></asp:Label>
						
					        </div>
				       </div>					
			        <div class="clear"> </div>
                </ItemTemplate>
			</asp:Repeater>
				
		</div>	
			
        <div class="clear"> </div>
         <div>
                <div class="formDesign">
                    <table style="width: 100%;">
                        <tr>
                            <td class="auto-style1">Email :</td>
                            <td class="auto-style2">
                                <asp:TextBox ID="txtEmail" runat="server" Width="100%" Height="25px"></asp:TextBox>
                                <asp:RegularExpressionValidator ID="regexEmailValid" runat="server" ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="txtEmail" ErrorMessage="Invalid Email Format"></asp:RegularExpressionValidator>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Enter E-mail" ControlToValidate="txtEmail" Display="Dynamic"></asp:RequiredFieldValidator>
                            </td>
                            <td style="width:10%">
                            </td>
                        </tr>
                        <tr>
                            <td><br /></td>
                            <td><br /></td>
                            <td><br /></td>
                        </tr>
                        <tr>
                            <td class="auto-style1">Comment :</td>
                            <td class="auto-style2">
                                <asp:TextBox ID="txtComment" runat="server" Height="44px" TextMode="MultiLine" Width="100%"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"  ControlToValidate="txtComment" ErrorMessage="Enter Comment" Display="Dynamic" ></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Enter only alphabet,numeric and special character" ControlToValidate="txtComment" ValidationExpression="^(.|\n){1,500}$" ></asp:RegularExpressionValidator>
                            </td>
                            <td style="width:10%">
                            </td>
                        </tr>
                        <tr>
                            <td><br /></td>
                            <td><br /></td>
                            <td><br /></td>
                        </tr>
                        <tr>
                            <td class="auto-style1">&nbsp;</td>
                            <td class="auto-style2">
                                <asp:Button ID="btn_Submit" runat="server" Text="Post Comment" OnClick="btn_Submit_Click" CssClass="buttonSubmit" />
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                    </table>
                </div>
                <div class="clear"> </div>
                <br />
                <br />
                <br />
             <div style="margin-left:20px">
                <h2 style="text-decoration:underline;">Comments:</h2>
                <br />
                <br />
                <asp:Repeater ID="repComment" runat="server">
                    <ItemTemplate>
                        <div class="commentbox">
                            <b>
                                <asp:Label ID="Label1" runat="server" Text='<%#Eval("Email") %>'></asp:Label></b>&nbsp;<b>Date : </b>(<asp:Label ID="Label2" runat="server" Text='<%#Eval("Comment_Date") %>'></asp:Label>):<br /><br />
                                <pre style="width:800px;white-space:pre-wrap;"><asp:Label ID="Label3" runat="server" Text='<%#Eval("Comment_Content") %>'></asp:Label></pre><br /><br /><br />
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
                <div class="clear"> </div>
                <br />
                <br />
                <div style="overflow: hidden;">
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
            </div>
</asp:Content>
