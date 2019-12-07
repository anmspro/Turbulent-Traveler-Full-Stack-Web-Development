<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="StudyBlog.AdminArea.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login</title>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="keywords" content="Shoppy Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
    Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
    <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <link href="AdminArea/css/bootstrap.css" rel="stylesheet" type="text/css" media="all"/>
    <!-- Custom Theme files -->
    <link href="AdminArea/css/style.css" rel="stylesheet" type="text/css" media="all"/>
    <!--js-->
    <script src="AdminArea/js/jquery-2.1.1.min.js"></script> 
    <!--icons-css-->
    <link href="AdminArea/css/font-awesome.css" rel="stylesheet"/> 
    <!--Google Fonts-->
    <link href='//fonts.googleapis.com/css?family=Carrois+Gothic' rel='stylesheet' type='text/css'/>
    <link href='//fonts.googleapis.com/css?family=Work+Sans:400,500,600' rel='stylesheet' type='text/css'/>
    <!--static chart-->
</head>
<body>
    <form id="form1" runat="server">
        <div class="login-page">
            <div class="login-main">  	
    	         <div class="login-head">
				        <h1>Login</h1>
			        </div>
			        <div class="login-block">
				        <div>
                            <asp:TextBox ID="txtEmail" runat="server" Placeholder="E-mail" required=""></asp:TextBox>
                            <asp:TextBox ID="txtPassword" runat="server" Placeholder="Password" required="" TextMode="Password"></asp:TextBox>
					        <div class="forgot-top-grids">
						        <div class="forgot-grid">
							        <ul>
								        <li>
                                            <asp:CheckBox ID="Check1" runat="server" />
									        <label for="brand1">Remember me</label> 
								        </li>
							        </ul>
						        </div>
						        <div class="clearfix"> </div>
					        </div>
                            <asp:Button ID="btnSubmit" runat="server" Text="Login" OnClick="btnSubmit_Click" />	
				        </div>
				        <h5><a href="Default.aspx">Go Back to Home</a></h5>
			        </div>
              </div>
        </div>
        <!--inner block end here-->
        <!--copy rights start here-->
        <div class="copyrights">
	         <p class="link"><span>All rights Reserved by ©<b>Abu Noman Md. Sakib</b>	</span></p>
        </div>	
        <!--COPY rights end here-->

       
    </form>
     <!--scrolling js-->
		        <script src="AdminArea/js/jquery.nicescroll.js"></script>
		        <script src="AdminArea/js/scripts.js"></script>
		        <!--//scrolling js-->
        <script src="AdminArea/js/bootstrap.js"> </script>
        <!-- mother grid end here-->
</body>
</html>
