<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ContactUs.aspx.cs" Inherits="StudyBlog.ContactUs" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <style>
        div.social_links img{
				height: 25px;
				width: 25px;
		}
    </style>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<link href="css/style.css" rel="stylesheet" type="text/css"  media="all" />
		<title>Contact Me</title>
		<meta name="viewport" content="width=device-width,initial-scale=1"/>
		<link href='http://localhost:3754/fonts.googleapis.com/css?family=Carrois+Gothic+SC' rel='stylesheet' type='text/css'/>
</head>
<body>
    <form id="form1" runat="server">
    	<!-- Start-wrap -->
		
			<!-- Start-Header-->			
			<div class="header">
				<div class="wrap">
				<!-- Start-logo-->
				    <div class="logo">
					    <h1 style="color:#fff;text-align:center;font-size:50px;text-transform:capitalize;"><a href="Default.aspx" style="color:#9ae1d7;margin-left:580px">Turbulent Traveller</a></h1>
				    </div>		
                    		
				<!-- End-Logo-->
				<!-- Start-Header-nav-->
                    				
				    <div class="clear"> </div>	
                    			
				<!-- End-Header-nav-->
			    </div>
			</div>
			    <div class="header-nav1">
				    <div class="wrap">
					    <ul>
						    <li><a href="Default.aspx">Home</a></li>
						    <li><a href="ContactUs.aspx">Contact</a></li>
                            <li><a href="Login.aspx">Login</a></li>
					    </ul>
                    
                        <div style="float:right;margin-right:30px">
                            <div class="social_links">
               <ul>
            <li><a href="https://github.com/anmspro" target="_blank"><img src="images/githublogo.png"></a></li>
			<li><a href="https://www.youtube.com/channel/UC2LCPWy90IWCY8QYCTklT5Q?sub_confirmation=1" target="_blank"><img src="images/youtubelogo1.png"></a></li>
			<li><a href="https://twitter.com/anms_pro" target="_blank"><img src="images/twitterlogo.png"></a></li>
			<li><a href="https://www.linkedin.com/in/anmspro" target="_blank"><img src="images/linkedinlogo.png"></a></li>
			<li><a href="https://www.instagram.com/sakib_anms" target="_blank"><img src="images/instagramlogo.png"></a></li>
            <li><a href="https://www.facebook.com/abunomanmd.sakib" target="_blank"><img src="images/fblogo.png"></a></li>
		    </ul></div>   
                        </div>
				
				       <!-- <div class="search-bar">
					        <ul>
						        <li><input type="text"/></li>
						        <li><div class="form"><input type="submit" value="" /></div></li>
					        </ul>
				        </div> -->
				    </div>				
			    <!-- End-Header-->
			    <div class="clear"> </div>
			    <!-- content-gallery-->
			    </div>
			    <div class="wrap">
				    <div style="border:none;" class="about">
					
				        <div class="contact-form">
					        
				            <div class="form">
			                    <div>
			                        <span><label>Name :</label></span> <span>
                                    <br />
                                    <asp:TextBox ID="txtName" runat="server" placeholder="Your Name" required=""  Width="465px" Height="30px" CssClass="dc_paginationA03" OnTextChanged="txtName_TextChanged"></asp:TextBox>
                                    <br />
                                    <br />
                                    </span>
			                    </div>
			                    <div>
			                        <span><label>Email :</label></span> <span>
                                    <br />
                                    <asp:TextBox ID="txtEmail" runat="server" Placeholder="Your Email Address" required="" Width="465px" Height="30px"></asp:TextBox>
                                    <br />
                                    <br />
                                    </span>
				                </div>
				                <div>
				                    <span><label>Message :</label></span> <span>
                                    <br />
                                    <asp:TextBox ID="txtMessage" runat="server" TextMode="MultiLine" Placeholder="Start Typing..." required="" Width="465px" Height="65px"></asp:TextBox>
                                    <br />
                                    <br />
                                    </span>
			                    </div>
			                    <div>
			                        <span><asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" /></span>
			                    </div>
                            </div>
				
			            </div>
			            
<!-- DC Pagination:C9 End -->
				</div>
			</div>			
<div class="clear"> </div>
			<!-- End-content-gallery-->
			<!-- DC Pagination:C9 Start -->
			<div class="wrap">	
		</div><br/><br/>
	<div class="clear"> </div>
		<div class="footer">
				<div class="wrap">
				<h3>HELLO! This is Sakib</h3>
				<p>Welcome to my personal traveling blog. You can find informations about all the traveling I have done. </p>			
			
			</div>
			</div>
			<div class="footer1">
	<p class="link"><span>All rights Reserved by ©<b>Abu Noman Md. Sakib</b>	</span></p>
</div>
		<!-- End-wrap -->		
    </form>
</body>
</html>
