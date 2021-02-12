<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.sun.xml.internal.txw2.Document"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.main.db.DBR"%>
<%@page import="com.main.db.DbController"%>
<%@page import="com.main.db.OtpDb"%>

<%

	try {
		String uri = request.getRequestURI();
		String pageName = uri.substring(uri.lastIndexOf("/") + 1);
		String rephone = session.getAttribute("Phone_num").toString();
		
		
		if (rephone.equals("") | rephone.equals("null")) {
			response.sendRedirect("index.jsp");
		}

		System.out.println(rephone);
		DbController controller = new DbController();
		controller.updateSq(rephone, pageName);

	} catch (Exception e) {
		response.sendRedirect("index.jsp");
	}
%>

<%
	try{ 
		Connection connection = DBR.getConnection();
		Statement statement = null;
		ResultSet resultSet = null;
		statement=connection.createStatement();
		String query ="SELECT * FROM mcq WHERE adYoutubeId= '"+ request.getParameter("uni") +"'";

		resultSet = statement.executeQuery(query);
		while(resultSet.next()){	
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
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"crossorigin="anonymous">	
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
	integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
	crossorigin="anonymous">
</script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
	integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
	crossorigin="anonymous">
</script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
	integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
	crossorigin="anonymous">
</script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="Js/jquery-3.4.1.min.js"></script>
<link rel="stylesheet" href="newCss/framework7.ios.min.css">
<link rel="stylesheet" href="newCss/ionicons.css">
<link rel="stylesheet" href="newCss/style.css">

<link rel="stylesheet" href="css/core-style.css">
<link rel="stylesheet" href="newCss/mcqpage.css">
<link rel="stylesheet" href="css/hom.css">

<script type="text/javascript">
  		     	window.history.forward();
  			function noBack() {
  				window.history.forward(); 
  				} 	
</script>

<title>Ad Tube MCQ</title>
</head>

<body class="color-theme-pink">
	<!-- Application root element -->

	<div id="app">
		<div class="views">

	<!-- Categories View -->
			<div id="view-categories" class="view tab">

		<!-- 	Start NAV bar -->
				<div>
					<nav class="navbar navmcq">

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
								<a class="dropdown-item link external" href="Profile.jsp">Profile</a>
								<a class="dropdown-item link external" href="Setting.jsp">About</a>
								<a class="dropdown-item link external" href="Setting.jsp">How to</a> 
								<a class="dropdown-item link external" href="Terms.jsp">Terms & Conditions</a> 
								<a class="dropdown-item link external" href="Setting.jsp">Settings</a> 
								<a class="dropdown-item link external" href="index.jsp">Log Out</a>
							</div>
						</div>
					</nav>
				</div>
		<!-- 	End NAV Bar -->

		<!-- 	 page content -->
				<div id="id00" data-name="categories" class="page no-navbar">
					<div class="page-content">

					 	<form id="mcqForm" method="POST">
							<div class="container-fluid conmar">
								<div id="1st">
									<div class="row">
										<div class="col">
											<h2 class="text-center h2size">
												You Have Watched<br> <%= resultSet.getString("mcqName") %> Advertisement
											</h2>
										</div>
									</div>

									<div class="row">
										<div class="col" align="center">
											<img alt=""
												src="Num/<%= Integer.parseInt(request.getParameter("i")) +1 %>.png"
												class="img-fluid imgnum">
										</div>
									</div>
									<br>
									<div class="row">
										<div class="col" align="center">
											<img alt=""
												src="images/Ads-img/<%=request.getParameter("uni") %>.PNG"
												class="img-fluid imgad">
										</div>
									</div>

			<!-- Like Button BEGIN -->
									<div align="center" class="paddmcq">
										<div class="row mcqwidth">

											<div class="col paddmcq2">
												<img src="images/icons/like.png" class="imglike" onClick="onClick()">
											</div>
											<div class="col paddmcq2 marleft">
												<a id="clicks"><%=resultSet.getString("adLike") %></a>
											</div>

											<div class="col paddmcq2 marright">
												<a id="disclicks"><%=resultSet.getString("disLike") %></a>
											</div>

											<div class="col paddmcq2">
												<img src="images/icons/dislike.png" class="imgdislike" onClick="onDisClick()">
											</div>

										</div>
									</div>
		  <!-- Like Button  END -->

								</div>

				<script type="text/javascript">
   			 		var c = <%=resultSet.getString("adLike") %>;
   			 		var d = <%=resultSet.getString("disLike") %>;
   			 		var likeCou=0;
   			 		var disCou=0;
   			 		
  					function onClick() {
  						likeCou++;
    						
    					if ((likeCou)%2 == 1) {
    					   c = c+1;
  					      if(<%=resultSet.getString("disLike") %> <d){
  					    	d = d-1;
  					    	disCou =0;
  					    	document.getElementById("disclicks").innerHTML = d;
  					      }

    					} else {	
    					      c = c-1;
    					    }
    					    
                           document.getElementById("clicks").innerHTML = c;
    					}
  					
   			 			
    			  function onDisClick() {
    						disCou++;
    						
    						if ((disCou)%2 == 1) {
									   d = d+1;
									   c=<%=resultSet.getString("adLike") %>;
											likeCou = 0;
											document.getElementById("clicks").innerHTML = c;
										} else {
											d = d - 1;
										}
										    document.getElementById("disclicks").innerHTML = d;
									}
			</script>
			
		<!-- LikeBtn END -->

								<br>

		<!-- Replay button start -->
								<div>
									<div class="row" align="center">
										<div class="col">
											<button id="re" type="submit" onclick="replay();"
												style="width: 120px;" class="yesbtn">
												<i class="fa fa-play-circle"></i> Replay
											</button>
										</div>
									</div>
								</div>
								<script type="text/javascript">
									var m =<%=request.getParameter("i")%>;

									function replay() {
										var reCount = 0;
										    reCount = +1;

										$.ajax({
											url : 'ReplayController.jsp?m='+ m + '&reCount='+ reCount,
											contentType : 'text/plain',
											context : document.body
										}).done(function(response) {

										});

										document.getElementById("pass").removeAttribute("required");
										document.getElementById("mcqForm").action = 'controller2.jsp?i='+ m;
									}
								</script>
		<!-- Replay button end -->

		<!-- Activation button start -->
								<div>
									<div class="row" align="center">
										<div class="col">
											<button id="id03" onclick="subscribe();" class="yesbtn">Activate</button>
										</div>
									</div>

									<div id="id01" class="modal" style="background-color: #f1f1f1">

										<div class="imgcontainer">
											<div id="id04" class="col" align="center">
												<img alt=""
													src="images/Ads-img/<%=request.getParameter("uni")%>.PNG"
													class="img-fluid imgad">
											</div>
											<br> <span
												onclick="document.getElementById('id01').style.display='none'; document.getElementById('1st').style.opacity=1; document.getElementById('3rd').style.opacity=1; document.getElementById('id03').style.display='block';"
												class="close" title="Close Modal">&times;</span>
											<p id="topic">Do you want to subscribe this service?</p>
										</div>

										<div class="container">
											<div id="id02" style="display: none;" align="center">
												<input type="number" id="pass" name="otpn" placeholder="4 digit code" required> 
												<span class="focus-input100"></span>
											</div>
											<div align="center">
												<button id="yes" onclick="show();" type="submit" class="yesbtn">Yes</button>
												<button type="button" id="sub"  onclick="active();" style="display: none" class="yesbtn">Submit</button>
												<button type="button" onclick="cancel();" class="cancelbtn">Cancel</button>
											</div>
										</div>
									</div>
								</div>

								<script type="text/javascript">
									$("#pass").on("keypress", function(evt) {
														var keycode = evt.charCode || evt.keyCode;

														if (keycode == 46 || this.value.length == 4) {
															return false;
														}
													});
								</script>

								<script type="text/javascript">
									function subscribe() {
										document.getElementById('id03').style.display = 'none';
										document.getElementById('id01').style.display = 'block';
										document.getElementById('1st').style.opacity = 0.2;
										document.getElementById('3rd').style.opacity = 0.2;
									}
								</script>

								<script type="text/javascript">
									function cancel() {
										document.getElementById('id03').style.display = 'block';
										document.getElementById('id01').style.display = 'none';
										document.getElementById('1st').style.opacity = 1;
										document.getElementById('3rd').style.opacity = 1;
									}
								</script>

								<script type="text/javascript">
									if (<%=resultSet.getString("isSubcribe")%> == 1) {
										document.getElementById('id03').style.display = 'block';
									} else {
										document.getElementById('id03').style.display = 'none';
									}
								</script>

								<script type="text/javascript">
									function show() {
										$.ajax({
											url : 'ActivationOTP.jsp?oti=1',
											contentType : 'text/plain',
											context : document.body
										}).done(function(response) {

										});

										document.getElementById('id02').style.display = 'block';
										document.getElementById('topic').style.display = 'none';
										document.getElementById('sub').style.display = 'block';
										document.getElementById('yes').style.display = 'none';
										document.getElementById('id04').style.display = 'none';

									}
								</script>


								<script type="text/javascript">
									function active() {

										var otpVal = document.getElementById("pass").value;

										$.ajax({
											url : 'ActivationController.jsp?otpVal='+ otpVal + "",
											contentType : 'text/plain',
											context : document.body
										}).done(function(response) {

										});
									}
								</script>

								<%
									if (session.getAttribute("correct_otp") != null) {
								%>

								<script type="text/javascript">
									swal({
										title : "Good job!",
										text : "You Subscribed the Service!",
										icon : "success",
										button : "OK",
									});
									
									document.getElementById('1st').style.opacity = 1;
									document.getElementById('3rd').style.opacity = 1;
								</script>

								<%
									session.removeAttribute("correct_otp");
											}
								%>


								<%
									if (session.getAttribute("wrong") != null) {
								%>

								<script>
									swal("Oops", "Invalid OTP", "error");
								</script>


								<%
									session.removeAttribute("wrong");
											}
								%>


						<!-- Activation button end -->

						<!-- 	Start MCQ answers -->
								
								<div id="3rd">
									<div class="row">
										<div class="col">
											<b class="fontans">
												<div class="question text-center"><%=resultSet.getString("mcq_question")%></div>
											</b>
										</div>
									</div>

									<div class="row">
										<div class="col-6">
											<div class="floatright">
												<button id="btn1"
													value="<%=resultSet.getString("answer1")%>" class="bt"><%=resultSet.getString("answer1")%></button>
											</div>
										</div>

										<div class="col-6">
											<div class="paddans">
												<button id="btn2"
													value="<%=resultSet.getString("answer2")%>" class="bt"><%=resultSet.getString("answer2")%></button>
											</div>
										</div>
									</div>
									<br>
									<div class="row">

										<div class="col-6">
											<div class="floatright">
												<button id="btn3"
													value="<%=resultSet.getString("answer3")%>" class="bt"><%=resultSet.getString("answer3")%></button>
											</div>
										</div>

										<div class="col-6">
											<div class="paddans">
												<button id="btn4"
													value="<%=resultSet.getString("answer2")%>" class="bt"><%=resultSet.getString("answer2")%></button>
											</div>
										</div>
									</div>

						<!-- 	End MCQ answers -->

									<br>

						<!-- 	Start Next button -->
									<div class="row" align="center">
										<div class="col btnpadd">
											<button class="btn btn-outline-info" onclick="showTotalvalue();" id="nextButton"name="nextButton">Next</button>
										</div>
									</div>
						<!-- 	End Next button -->

								</div>
							</div>
						</form>
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
	</div>
	<%
		}
		}

		catch (Exception e) {
			System.out.println(e.getMessage());
		}
	%>

	<script type="text/javascript">
		var i =<%=request.getParameter("i")%>;
		var n = i + 1;
		var mcqAns;

		$('#btn1').click(function() {
			mcqAns = $('#btn1').val();
			$('#btn1').addClass('clicked');
			$('#btn2').removeClass('clicked');
			$('#btn3').removeClass('clicked');
			$('#btn4').removeClass('clicked');
		})

		$('#btn2').click(function() {

			mcqAns = $('#btn2').val();
			$('#btn2').addClass('clicked');
			$('#btn3').removeClass('clicked');
			$('#btn4').removeClass('clicked');
			$('#btn1').removeClass('clicked');
		})

		$('#btn3').click(function() {

			mcqAns = $('#btn3').val();
			$('#btn3').addClass('clicked');
			$('#btn4').removeClass('clicked');
			$('#btn1').removeClass('clicked');
			$('#btn2').removeClass('clicked');
		})

		$('#btn4').click(function() {

			mcqAns = $('#btn4').val();
			$('#btn4').addClass('clicked');
			$('#btn1').removeClass('clicked');
			$('#btn2').removeClass('clicked');
			$('#btn3').removeClass('clicked');
		})

		function showTotalvalue() {
			document.getElementById("pass").removeAttribute("required");

			if (mcqAns != null) {

				$.ajax({
					url : 'PointController.jsp?mcqAns=' + mcqAns + '&i=' + i,
					contentType : 'text/plain',
					context : document.body
				}).done(function(response) {

				});

				$.ajax({
					url : 'Status.jsp?i=' + i + '',
					contentType : 'text/plain',
					context : document.body
				}).done(function(response) {

				});

				$.ajax({
					url : 'TemLike.jsp?c=' + c + '&d=' + d,
					contentType : 'text/plain',
					context : document.body
				}).done(function(response) {

				});

				document.getElementById("mcqForm").action = 'controller2.jsp?i='+ n;

			} else {

				$.ajax({
					url : 'MCQAnswer.jsp?ans=WANS' + "",
					contentType : 'text/plain',
					context : document.body
				}).done(function(response) {

				});
			}
		}
	</script>
	<%
		if (session.getAttribute("wrong_ans") != null) {
	%>

	<script>
		swal("Oops", "Please Select Answer!", "error");
	</script>

	<%
		session.removeAttribute("wrong_ans");
		}
	%>

	<script src="newJs/framework7.min.js"></script>
	<script src="newJs/app.js"></script>
</body>
</html>
