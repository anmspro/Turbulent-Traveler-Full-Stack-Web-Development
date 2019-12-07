<%@ Page Title="" Language="C#" MasterPageFile="~/AdminArea/MasterPage.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="StudyBlog.AdminArea.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        function GetConfirmation() {
            var reply = confirm("Ary you sure you want to delete this?");
            if (reply) {
                return true;
            }
            else {
                return false;
            }
        }
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMain" runat="server">
    <div class="inner-block">
    <!--market updates updates-->
	    <div class="market-updates">
			<div class="col-md-4 market-update-gd">
				<div class="market-update-block clr-block-1">
					<div class="col-md-8 market-update-left">
						<h3><asp:Label ID="lblblog" runat="server" Text="Label"></asp:Label></h3>
						<h4>Number of Blog</h4>
					</div>
					<div class="col-md-4 market-update-right">
						<i class="fa fa-file-text-o"> </i>
					</div>
				  <div class="clearfix"> </div>
				</div>
			</div>
			<div class="col-md-4 market-update-gd">
				<div class="market-update-block clr-block-2">
				 <div class="col-md-8 market-update-left">
					<h3><asp:Label ID="lblcmt" runat="server" Text="Label"></asp:Label></h3>
					<h4>Comments</h4>
				  </div>
					<div class="col-md-4 market-update-right">
						<i class="fa fa-comments"> </i>
					</div>
				  <div class="clearfix"> </div>
				</div>
			</div>
			<div class="col-md-4 market-update-gd">
				<div class="market-update-block clr-block-3">
					<div class="col-md-8 market-update-left">
						<h3><asp:Label ID="lblmsg" runat="server" Text="Label"></asp:Label></h3>
						<h4>New Messages</h4>
					</div>
					<div class="col-md-4 market-update-right">
						<i class="fa fa-envelope-o"> </i>
					</div>
				  <div class="clearfix"> </div>
				</div>
			</div>
		   <div class="clearfix"> </div>
		</div>
         <div class="clearfix"> </div>
        <br />
    <!--market updates end here-->
    <!--main page chart start here-->
        <div class="main-page-charts">
           <div class="main-page-chart-layer1">
		        <div > 
			        <div class="user-marorm">
			        <div class="malorum-top">				
			        </div>
			        <div class="malorm-bottom">
                        <asp:Repeater ID="repUserInfo" runat="server">
                            <ItemTemplate>
			                     <h4>Profile :</h4>
                                <br />
                                <p><asp:Image ID="Image1" runat="server" src='<%# Eval("ProfilePic")%>' style="width:100px;height:100px;border-radius:100px;"/></p>
				                 <h2><asp:Label ID="lbluser" runat="server" Text='<%# Eval("UserName") %>'></asp:Label></h2>
				                 <p> <asp:Label ID="Label1" runat="server" Text='<%# Eval("User_Type") %>'></asp:Label></p>
                                <table style="width: 100%;">
                                    <tr>
                                        <td style="width:20%;padding:5px;"><asp:Label ID="Label2" runat="server" Text="Email : "></asp:Label></td>
                                        <td style="width:70%;padding:5px;"><asp:Label ID="lblEmail" runat="server" Text='<%# Eval("Email") %>'></asp:Label></td>
                                        <td>&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td>&nbsp;</td>
                                        <td>&nbsp;</td>
                                        <td>&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td style="width:20%;padding:5px;"><asp:Label ID="Label3" runat="server" Text="Password : "></asp:Label></td>
                                        <td style="width:70%;padding:5px;"><asp:Label ID="Label4" runat="server" Text='<%# Eval("Password") %>'></asp:Label></td>
                                        <td>&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td>&nbsp;</td>
                                        <td>&nbsp;</td>
                                        <td>&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td style="width:20%;padding:5px;"><asp:Label ID="Label5" runat="server" Text="Mobile Number : "></asp:Label></td>
                                        <td style="width:70%;padding:5px;"><asp:Label ID="Label6" runat="server" Text='<%# Eval("MobileNo") %>'></asp:Label></td>
                                        <td>&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td>&nbsp;</td>
                                        <td>&nbsp;</td>
                                        <td>&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td>&nbsp;</td>
                                        <td>
                                            <asp:Button ID="btnEdit" runat="server" Text="Edit" OnClick="btnEdit_Click" />
                                            <asp:Button ID="btnAdd" runat="server" Text="Add New" OnClick="btnAdd_Click" />
                                        </td>
                                        <td>&nbsp;</td>
                                    </tr>
                                </table>
                                </ItemTemplate>
                        </asp:Repeater>
                        
                        <br />
				        <div>
                            <p>Want to Delete This Account ?? </p>
                            <p><asp:Button ID="btnDelete" runat="server" Text="Delete" OnClick="btnDelete_Click" OnClientClick="return GetConfirmation();" /></p>
				        </div>
                        <div class="clearfix"> </div>
			        </div>
                        <div class="clearfix"> </div>
		           </div>
                    <div class="clearfix"> </div>
		        </div>
	         <div class="clearfix"> </div>
          </div>
         </div>
        <!--main page chart layer2-->
    </div>
</asp:Content>
