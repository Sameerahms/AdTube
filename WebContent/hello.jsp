<%@page import="com.main.crtl.NewConntroller"%>
<%@page import="com.main.crtl.OTPsend"%>
<%@page import="com.main.db.DbController"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%
	try {
		String uri = request.getRequestURI();
		String pageName = uri.substring(uri.lastIndexOf("/") + 1);
		String idu = request.getParameter("uuid");
		if (idu.equals("")) {
			request.getSession().invalidate();
			response.sendRedirect("index.jsp");
			return;
		}
		String rephone = session.getAttribute("Phone_num").toString();
		if (rephone.equals("") | rephone.equals("null")) {

			response.sendRedirect("index.jsp");
		}
		DbController controller = new DbController();

	} catch (Exception e) {

		response.sendRedirect("index.jsp");
	}
%>
<!DOCTYPE html>
<html>
<head>

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1, minimum-scale=1, user-scalable=no, minimal-ui, viewport-fit=cover">
<meta name="apple-mobile-web-app-capable" content="yes">

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
	integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
	integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
	crossorigin="anonymous"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
	integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
	crossorigin="anonymous"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="Js/jquery-3.4.1.min.js"></script>
<link rel="stylesheet" href="newCss/framework7.ios.min.css">
<link rel="stylesheet" href="newCss/ionicons.css">
<link rel="stylesheet" href="newCss/style.css">

<link rel="stylesheet" href="css/core-style.css">
<link rel="stylesheet" href="newCss/otppage.css">
<link rel="stylesheet" href="css/hom.css">


<script type="text/javascript">
		window.history.forward();
		function noBack() {
		window.history.forward();
		}
</script>


<title>OTP</title>

</head>
<body class="color-theme-pink">

<!-- Application root element -->
	<div id="app">
		<div class="views">

			<!-- Categories View -->
			<div id="view-categories" class="view tab">

				<div>
					<nav class="navbar navmarg">
						<div class="logo-image">
							<img src="images/bg-img/logo_small.png" class="img-fluid">
						</div>


						<div class="navbar-toggler" data-toggle="collapse"
							data-target="#navbarToggleExternalContent"
							aria-controls="navbarToggleExternalContent" aria-expanded="false"
							aria-label="Toggle navigation">
							<span class="phonenum"><%=session.getAttribute("Phone_num")%></span>
						</div>

						<div class="dropdown show">
							<button type="button"
								class="navbar-toggler navbar-light bg-light" href="#"
								data-target="dropdown-menu" data-toggle="dropdown"
								aria-haspopup="true" aria-expanded="false">
								<span class="navbar-toggler-icon my-toggler"></span>
							</button>

							<div class="dropdown-menu">
								<a class="dropdown-item link external" href="Setting.jsp">Profile</a>
								<a class="dropdown-item link external" href="Setting.jsp">About</a>
								<a class="dropdown-item link external" href="Setting.jsp">How to</a> 
								<a class="dropdown-item link external" href="Setting.jsp">Terms & Conditions</a> 
								<a class="dropdown-item link external" href="Setting.jsp">Settings</a> 
								<a class="dropdown-item link external" href="index.jsp">Log Out</a>
							</div>
						</div>
					</nav>
				</div>

				<div data-name="categories" class="page no-navbar">

	<!-- Scroll page content -->

					<div class="page-content">
						<!-- new part add -->

						<form action="OTPcontroller.jsp?oti=1" method="post">

							<div align="center" class="margtop">
								<img alt="" src="images/otpim.gif" class="imgsize">
								 <br>
								<a><%="Phone Number: " + session.getAttribute("Phone_num").toString()%></a>
								<div class="wrap-input100 validate-input"
									data-validate="Name is required" align="center">

									<input type="number" id="otpr" name="otpn"
										placeholder="4 digit code " align="middle"> 
										<span class="focus-input100"></span>

								</div>
								<br>
								<button class="btn btn-outline-info btnwi" onclick="go()">Submit</button>
								<br> <br>

							</div>

						</form>
						
		<script type="text/javascript">	
		
			$("#otpr").on("keypress", function(evt) {
				var keycode = evt.charCode || evt.keyCode;
								  
				if (keycode == 46 || this.value.length==4) {
					return false;
					}
				});
		</script>

						<div align="center">
							<button class="rebtn" onclick="re()">Resend OTP</button>
						</div>

	<script type="text/javascript">
	function go() {
		var ph = document.getElementById("otpr").value;
		if (ph == "") {
			swal ( "Oops" ,  "Invalid OTP" ,  "error" );
		}}
	
	</script>

						<%
							if (session.getAttribute("empty_otp") != null) {
						%>
							
			<script>
				swal ( "Oops" ,  "Please Enter OTP" ,  "error" );
			</script>

						<%
							session.removeAttribute("empty_otp");
							}
						%>


						<%
							if (session.getAttribute("length_otp") != null) {
						%>
			<script>
				swal ( "Oops" ,  "Invalid OTP" ,  "error" );
			</script>

						<%
							session.removeAttribute("length_otp");
							}
						%>



						<%
							if (session.getAttribute("wrong_otp") != null) {
						%>
			<script>
				swal ( "Oops" ,  "Invalid OTP" ,  "error" );
			</script>

						<%
							session.removeAttribute("wrong_otp");
							}
						%>

	<script type="text/javascript">
		function re() {
			window.location = 'OTPcontroller.jsp?oti=2';
			}
	</script>

					</div>
				</div>
			</div>
		</div>
	</div>
	<script src="newJs/framework7.min.js"></script>
	<script src="newJs/app.js"></script>
</body>
</html>