<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.main.db.DBR" %>
	
<%
	try{ 
		String rephone = session.getAttribute("Phone_num").toString();

		Connection connection = DBR.getConnection();
		Statement statement = null;
		ResultSet resultSet = null;
		
		statement=connection.createStatement();
		String query ="SELECT * FROM customer WHERE cu_mobileNo = '"+ rephone +"'";

		resultSet = statement.executeQuery(query);
		while(resultSet.next()){
			
%>


<!DOCTYPE html>
<html>
<head>
<title>User Profile</title>
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

<link rel="stylesheet" href="newCss/profile.css">
</head>
<body style="padding: 20px;">
	<div class="container emp-profile">
		<form method="post">
			<div class="row">
				<div class="col-md-4">
					<div class="profile-img">
						<img
							src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS52y5aInsxSm31CvHOFHWujqUx_wWTS9iM6s7BAm21oEN_RiGoog"
							alt="" />
						<div class="file btn btn-lg btn-primary">
							Change Photo <input type="file" name="file" />
						</div>
					</div>
				</div>
				<div class="col-md-6">
					<div class="profile-head">
						<h5>User Name</h5>
<!-- 						<h6>Web Developer and Designer</h6> -->
<!-- 						<p class="proile-rating"> -->
<!-- 							RANKINGS : <span>8/10</span> -->
<!-- 						</p> -->
						<ul class="nav nav-tabs" id="myTab" role="tablist">
							<li class="nav-item"><a class="nav-link active"
								id="home-tab" data-toggle="tab" href="#home" role="tab"
								aria-controls="home" aria-selected="true">About</a>
							</li>
						</ul>
					</div>
				</div>
				<div class="col-md-2">
					<input type="submit" class="profile-edit-btn" name="btnAddMore"
						value="Edit Profile" />
				</div>
			</div>
			<div class="row">
				<div class="col-md-4">
<!-- 					<div class="profile-work"> -->
<!-- 						<p>WORK LINK</p> -->
<!-- 						<a href="">Website Link</a><br /> <a href="">Bootsnipp Profile</a><br /> -->
<!-- 						<a href="">Bootply Profile</a> -->
<!-- 						<p>SKILLS</p> -->
<!-- 						<a href="">Web Designer</a><br /> <a href="">Web Developer</a><br /> -->
<!-- 						<a href="">WordPress</a><br /> <a href="">WooCommerce</a><br /> <a -->
<!-- 							href="">PHP, .Net</a><br /> -->
<!-- 					</div> -->
				</div>
				<div class="col-md-8">
					<div class="tab-content profile-tab" id="myTabContent">
						<div class="tab-pane fade show active" id="home" role="tabpanel"
							aria-labelledby="home-tab">
							<div class="row">
								<div class="col-md-6">
									<label>User Id</label>
								</div>
								<div class="col-md-6">
									<p><%= resultSet.getString("cus_id") %></p>
								</div>
							</div>
							<div class="row">
								<div class="col-md-6">
									<label>Name</label>
								</div>
								<div class="col-md-6">
									<p><%= resultSet.getString("cus_name") %></p>
								</div>
							</div>
							<div class="row">
								<div class="col-md-6">
									<label>NIC Number</label>
								</div>
								<div class="col-md-6">
									<p><%= resultSet.getString("cus_nic") %></p>
								</div>
							</div>
							<div class="row">
								<div class="col-md-6">
									<label>Phone Number</label>
								</div>
								<div class="col-md-6">
									<p><%= resultSet.getString("cu_mobileNo") %></p>
								</div>
							</div>
							<div class="row">
								<div class="col-md-6">
									<label>Your Points</label>
								</div>
								<div class="col-md-6">
									<p><%= resultSet.getString("cus_totalPoint") %></p>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</form>
	</div>
	
	<%
		}
		}
		catch (Exception e) {
			System.out.println(e.getMessage());
		}
	%>
</body>
</html>