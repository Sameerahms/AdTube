<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.main.db.VideoDB"%>

<%
	try {
		String uri = request.getRequestURI();
		String pageName = uri.substring(uri.lastIndexOf("/") + 1);
		String rephone = session.getAttribute("Phone_num").toString();
			
		if (rephone.equals("") | rephone.equals("null")) {
			response.sendRedirect("index.jsp");
		}

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
<link rel="stylesheet" href="newCss/videopage.css">
<link rel="stylesheet" href="css/hom.css">

<script type="text/javascript">
 	    	window.history.forward();
 		function noBack() {
 			window.history.forward();
 		}	
	</script>

<title>Ad Tube</title>
</head>

<body class="color-theme-pink">

	<!-- App root element -->
	<div id="app">
		<div class="views">

			<!-- Categories View -->
			<div id="view-categories" class="view tab">

				<div>
					<nav class="navbar videonav">

						<div class="logo-image">
							<img src="images/bg-img/logo_small.png" class="img-fluid">
						</div>

						<div class="navbar-toggler" data-toggle="collapse"
							data-target="#navbarToggleExternalContent"
							aria-controls="navbarToggleExternalContent" aria-expanded="false"
							aria-label="Toggle navigation">
							<span class="videophone"><%=session.getAttribute("Phone_num")%></span>
						</div>

						<div class="dropdown show">
							<button type="button"
								class="navbar-toggler navbar-light bg-light"
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

						<div class="cards">
							<div class="numcard">

								<div class="row justify-content-center numrow">
									<div id="n1" class="numberCircle numbermargin">1</div>
									<div id="n2" class="numberCircle numbermargin">2</div>
									<div id="n3" class="numberCircle numbermargin">3</div>
									<div id="n4" class="numberCircle numbermargin">4</div>
									<div id="n5" class="numberCircle">5</div>
								</div>
							</div>

<script>
	    if(<%= Integer.parseInt(request.getParameter("i"))%>==0){
	      document.getElementById("n1").style.color = "#00cc00";
	      document.getElementById("n1").style.border= "2px solid #00cc00";
	    }
	    if(<%= Integer.parseInt(request.getParameter("i"))%>==1){
	      document.getElementById("n2").style.color = "#00cc00";
	      document.getElementById("n2").style.border= "2px solid #00cc00";
	    }
	    if(<%= Integer.parseInt(request.getParameter("i"))%>==2){
	      document.getElementById("n3").style.color = "#00cc00";
	      document.getElementById("n3").style.border= "2px solid #00cc00";
	    }
	    if(<%= Integer.parseInt(request.getParameter("i"))%>==3){
	      document.getElementById("n4").style.color = "#00cc00";
	      document.getElementById("n4").style.border= "2px solid #00cc00";
	    }
	    if(<%= Integer.parseInt(request.getParameter("i"))%>==4){
	      document.getElementById("n5").style.color = "#00cc00";
	      document.getElementById("n5").style.border= "2px solid #00cc00";
	    }
</script>

<script>
	    if(<%= Integer.parseInt(request.getParameter("i"))%>>0){
	      document.getElementById("n1").style.color = "#F52F14";
	      document.getElementById("n1").style.border= "2px solid #F52F14";
	    }
	    if(<%= Integer.parseInt(request.getParameter("i"))%>>1){
	        document.getElementById("n2").style.color = "#F52F14";
	        document.getElementById("n2").style.border= "2px solid #F52F14";
	      }
	    if(<%= Integer.parseInt(request.getParameter("i"))%>>2){
	        document.getElementById("n3").style.color = "#F52F14";
	        document.getElementById("n3").style.border= "2px solid #F52F14";
	      }
	    if(<%= Integer.parseInt(request.getParameter("i"))%>>3){
	        document.getElementById("n4").style.color = "#F52F14";
	        document.getElementById("n4").style.border= "2px solid #F52F14";
	      }
	    if(<%= Integer.parseInt(request.getParameter("i"))%>>4){
	        document.getElementById("n5").style.color = "#F52F14F";
	        document.getElementById("n5").style.border= "2px solid #F52F14";	      
	    }
</script>

							<!-- ***  Video Frame *** -->
							<div>
								<form method="post">
									<div align="center" class="videoDiv">
										<h1 id="do" class="videoDiv1"></h1>
										<div id="player" class="container-fluid"></div>
									</div>
								</form>
							</div>


<script type="text/javascript">
  var url_s=(window.location.href);
  var url=new URL(url_s);
  var uni=url.searchParams.get("uni").split("?uni=");
  var i=url.searchParams.get("i").split("&i=");
  var tag = document.createElement('script');

    tag.src = "http://www.youtube.com/iframe_api";
    var firstScriptTag = document.getElementsByTagName('script')[0];
    firstScriptTag.parentNode.insertBefore(tag, firstScriptTag);

    // create youtube player
    var player;
    	function onYouTubePlayerAPIReady() {
		      player = new YT.Player('player', {
		        height : '300',
		        width : '300',
		        videoId : uni,
		        playerVars : {
		          'autoplay' : 1, 
		          'controls' : 0,
		          'rel' : 0,
		          'wmode': 'opaque',
		          'showinfo' :0,
		          'iv_load_policy':0,
		          'modestbranding':1,
		          'fullscreen' : 0,
		          'related': 0,
		          'allowfullscreen':0,
		
		        },
		        events : {
		          'onStateChange' : onPlayerStateChange
		        }
		      });
		    }

		    // when video ends  
		    function onPlayerStateChange(event) {		    	
		      if (event.data == 0)
		        GoHome();
			}
		    
		    function GoHome() {
		      document.getElementById('do').value = "done";
		      window.location = 'TemMCQ.jsp?uni='+uni+'&i='+i+'';
		    }
</script>
							<!-- ***  Video Frame End *** -->
			<!-- new part end -->

							<div class="title-container block">
								<br>
							</div>

							<div class="categories-container block">
								<a href="Category.jsp?category=Food" class="link external">
									<div class="category card"
										style="background-image: url('img/categories/food1.jpg'); box-shadow: 0px 15px 20px -10px rgba(252, 186, 47, 0.5);">
										<h2>Food</h2>
									</div>
								</a> 
								<a href="Category.jsp?category=Sanitary" class="link external">
									<div class="category card"
										style="background-image: url('img/categories/travel1.jpg'); box-shadow: 0px 15px 20px -10px rgba(128, 213, 250, 0.5);">
										<h2>Travel</h2>
									</div>
								</a>
								<a href="Category.jsp?category=Category 3"
									class="link external">
									<div class="category card"
										style="background-image: url('img/categories/music1.jpg'); box-shadow: 0px 15px 20px -10px rgba(231, 0, 70, 0.5);">
										<h2>Music</h2>
									</div>
								</a> 
								<a href="Category.jsp?category=Food" class="link external">
									<div class="category card"
										style="background-image: url('img/categories/game1.jpg'); box-shadow: 0px 15px 20px -10px rgba(37, 57, 155, 0.5);">
										<h2>Gaming</h2>
									</div>
								</a> 
								<a href="Category.jsp?category=Sanitary" class="link external">
									<div class="category card"
										style="background-image: url('img/categories/photo1.jpg'); box-shadow: 0px 15px 20px -10px rgba(37, 227, 154, 0.5);">
										<h2>Photo</h2>
									</div>
								</a> 
								<a href="Category.jsp?category=Category 3"
									class="link external">
									<div class="category card"
										style="background-image: url('img/categories/sport.jpg'); box-shadow: 0px 15px 20px -10px rgba(255, 128, 169, 0.5);">
										<h2>Sports</h2>
									</div>
								</a>
							</div>
						</div>
					</div>
				</div>
			</div>

			<!-- end the page -->

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

		</div>
	</div>
	<script src="newJs/framework7.min.js"></script>
	<script src="newJs/app.js"></script>
</body>
</html>
