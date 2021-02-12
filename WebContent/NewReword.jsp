<%@page import="com.main.crtl.OTPsend"%>
<%@page import="com.main.Mobi"%>
<%@page import="com.sun.xml.internal.txw2.Document"%>
<%@page import="com.main.db.DbController"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
<%
	DbController dbController =  new DbController();
	try {

		String uri = request.getRequestURI();
		String pageName = uri.substring(uri.lastIndexOf("/") + 1);
		String rephone = session.getAttribute("Phone_num").toString();
		
		if (rephone == "") {
			response.sendRedirect("index.jsp");
			return;
		}
		DbController controller = new DbController();

		controller.updateSq(rephone, pageName);

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

<link rel="stylesheet" href="newCss/framework7.ios.min.css">
<link rel="stylesheet" href="newCss/ionicons.css">
<link rel="stylesheet" href="newCss/style.css">

<link rel="stylesheet" href="css/core-style.css">
<link rel="stylesheet" href="newCss/rewordpage.css">
<link rel="stylesheet" href="css/hom.css">

<script type="text/javascript">
		window.history.forward();
		function noBack() {
		window.history.forward();
		 }
		
</script>

<title>Ad Tube Reword</title>
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
								<a class="dropdown-item link external" href="Back.jsp">Profile</a>
								<a class="dropdown-item link external" href="NewFile.html">About</a>
								<a class="dropdown-item link external" href="NewFile.html">How to</a> 
								<a class="dropdown-item link external" href="NewFile.html">Terms & Conditions</a> 
								<a class="dropdown-item link external" href="NewFile.html">Settings</a> 
								<a class="dropdown-item link external" href="index.jsp">Log Out</a>
							</div>
						</div>
					</nav>
				</div>

				<div data-name="categories" class="page no-navbar">
				
	<!-- 	 page content -->
					<div class="page-content">
						<br>

						<div class="container-fluid pagemarg" align="center">
							<div>
								<img alt="" src="images/reStar.png" class="img-fluid winphoto">

								<h1 class="text-center texttop"> Congratulation <b class="textstyle"></b>
								 <br>
								</h1>
							</div>

							<div>
								<a class="text-center textsize">You have collected <%= dbController.getPoints(session.getAttribute("Phone_num").toString())%>
									points
								</a>
							</div>
							<div>
								<a class="text-center textsize"> & Won 100Mb</a>
							</div>
							<br>
							<div>
								<button class="btn btn-outline-info btnwid"
									onclick="window.location = 'index.jsp'">Finish</button>
							</div>
						</div>
					</div>
				</div>

	<!-- end the page Content -->

	<!-- Tool bar -->
				<div class="toolbar tabbar tabbar-labels">
					<div class="toolbar-inner">
						<a href="#view-today" class="tab-link tab-link-active"> 
							<i class="icon ion-ios-today"></i> 
							<span class="tabbar-label">Today</span>
						</a> 
						<a href="#view-categories" class="tab-link"> 
							<i class="icon ion-ios-apps"></i> 
							<span class="tabbar-label">Categories</span>
						</a> 
						<a href="#view-discover" class="tab-link"> 
							<i class="icon ion-ios-star"></i> 
							<span class="tabbar-label">Discover</span>
						</a> 
						<a href="#view-search" class="tab-link"> 
							<i class="icon ion-ios-search"></i> 
							<span class="tabbar-label">Search</span>
						</a> 
						<a href="#view-pages" class="tab-link"> 
							<i class="icon ion-ios-albums"></i> 
							<span class="tabbar-label">Pages</span>
						</a>
					</div>
				</div>
	<!-- Tool bar End -->
	
			</div>
		</div>
	</div>
	<script src="newJs/framework7.min.js"></script>
	<script src="newJs/app.js"></script>
</body>
</html>
