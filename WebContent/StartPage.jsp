 <%@page import="com.main.HttpHead"%>
<%@page import="com.main.Mobi"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%
	System.out.println("***********************************");
	System.out.println("IOP:"+ request.getHeader("VIA"));        
	System.out.println("iop2:"+	request.getHeader("X-FORWARDED-FOR"));
	HttpHead headers=new HttpHead();
	String agent = headers.fOs(request, response);
	
	String ip = headers.ips(request, response);
	String browser=headers.brow(request, response);
	String v=request.getHeader("rlnclientipaddr");
	String type=request.getHeader ("user-agent");
	System.out.println("OS:"+agent);
	System.out.println("Browser: "+browser);
	System.out.println("ip: "+ip);

%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">
		<!--===============================================================================================-->
		<link rel="icon" type="image/png" href="images/icons/favicon.ico" />
		<!--===============================================================================================-->
		<link rel="stylesheet" type="text/css"
			href="vendor/bootstrap/css/bootstrap.min.css">
		<!--===============================================================================================-->
		<link rel="stylesheet" type="text/css"
			href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
		<!--===============================================================================================-->
		<link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">
		<!--===============================================================================================-->
		<link rel="stylesheet" type="text/css"
			href="vendor/css-hamburgers/hamburgers.min.css">
		<!--===============================================================================================-->
		<link rel="stylesheet" type="text/css"
			href="vendor/animsition/css/animsition.min.css">
		<!--===============================================================================================-->
		<link rel="stylesheet" type="text/css"
			href="vendor/select2/select2.min.css">
		<!--===============================================================================================-->
		<link rel="stylesheet" type="text/css"
			href="vendor/daterangepicker/daterangepicker.css">
		<!--===============================================================================================-->
		<link rel="stylesheet" type="text/css" href="css/util.css">
		<link rel="stylesheet" type="text/css" href="css/main.css">
		<!--===============================================================================================-->
		<link rel="stylesheet" href="newCss/start.css">

	<script type="text/javascript">
	    	window.history.forward();
		function noBack() {
			window.history.forward();
		}	
	</script>
	
<title>Start</title>
</head>
<body style="background: navy;">

	<div align="center" class="container-fluid startop" >
		<img alt="" class="img-responsive media-object startbtn" src="images/giftic.png"> <br>
		<br>
		<hr>
		<div class="container-contact100-form-btn startbt" >
			<div class="wrap-contact100-form-btn">
				<div class="contact100-form-bgbtn"></div>
				<button class="contact100-form-btn" value="Login" onclick="location.href = 'index.jsp';">
					<span> Start </span>
				</button>
			</div>

		</div>
	</div>

</body>
</html>