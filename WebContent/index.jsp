<%@page import="java.util.UUID"%>
<%@page import="com.sun.net.httpserver.Filter.Chain"%>
<%@page import="com.main.crtl.NewConntroller"%>
<%@page import="com.main.HttpHead"%>
<%@page import="java.util.StringTokenizer"%>
<%@ page pageEncoding="utf-8"%>
<%
	NewConntroller v = new NewConntroller();
	String i = v.fOs(request, response);
	System.out.println(i);	
%>

<!DOCTYPE html>
<html lang="en">

<head>
<title>Login</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
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
<link rel="stylesheet" type="text/css" href="css/my.css">
<!--===============================================================================================-->
<script type="text/javascript">
	    	window.history.forward();
		function noBack() {
			window.history.forward();
		}	
	</script>

</head>
<body>

	<div class="container-contact100" style="background: #2986ff;">
		<div class="wrap-contact100 ">
			<form class="contact100-form validate-form" id="form1"
				action="LoginCon.jsp" method="post">
				<span class="contact100-form-title " style="font-weight: bolder;"> Login </span>

				<div class="wrap-input100 validate-input"
					data-validate="Name is required">
					<span class="label-input100">Phone Number</span> 
					<input class="input100" type="number" name="phone" placeholder="phone number: 07xxxxxxxx" id="ph" value=""> 
						<span class="focus-input100"></span>

				</div>
				<a id="vn"></a>
				<div class="container-contact100-form-btn">
					<div class="wrap-contact100-form-btn">
						<div class="contact100-form-bgbtn"></div>
						<button class="contact100-form-btn" value="Login" onclick="fu();">
							<span> Login <i class="fa fa-long-arrow-right m-l-7"
								aria-hidden="true"></i></span>
						</button>
					</div>
				</div>
				<br>

			</form>
		</div>
	</div>


	<div id="dropDownSelect1"></div>

	<script type="text/javascript">
		function fu() {
			var ph = document.getElementById("ph").value;
			var p = ph.length;

			}
		
	</script>
	<!--===============================================================================================-->
	<script src="vendor/jquery/jquery-3.2.1.min.js"></script>
	<!--===============================================================================================-->
	<script src="vendor/animsition/js/animsition.min.js"></script>
	<!--===============================================================================================-->
	<script src="vendor/bootstrap/js/popper.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
	<!--===============================================================================================-->
	<script src="vendor/select2/select2.min.js"></script>
	<script>
		$(".selection-2").select2({
			minimumResultsForSearch : 20,
			dropdownParent : $('#dropDownSelect1')
		});
	</script>
	<!--===============================================================================================-->
	<script src="vendor/daterangepicker/moment.min.js"></script>
	<script src="vendor/daterangepicker/daterangepicker.js"></script>
	<!--===============================================================================================-->
	<script src="vendor/countdowntime/countdowntime.js"></script>
	<!--===============================================================================================-->
	<script src="js/main.js"></script>

	<!-- Global site tag (gtag.js) - Google Analytics -->
	<script async
		src="https://www.googletagmanager.com/gtag/js?id=UA-23581568-13">
	</script>

	<script>
			window.dataLayer = window.dataLayer || [];
		function gtag() {
			dataLayer.push(arguments);
			}
		gtag('js', new Date());
		gtag('config', 'UA-23581568-13');
	</script>

	<%
				if(session.getAttribute("wrong_uname") != null){
	%>
	<script>			
			swal ( "Oops" ,  "Please enter your mobile number" ,  "error" );
	</script>

	<%
			 	session.removeAttribute("wrong_uname");
				}			
	%>


	<%
		if(session.getAttribute("in_num") != null){
	%>
	<script>			
				swal ( "Oops" ,"Invalid Mobile Number" ,  "error" );
	</script>

	<%
			 	session.removeAttribute("in_num");
				}			
	%>


	<%
				if(session.getAttribute("blockno") != null){
	%>
	<script>			
				swal ( "Oops" ,"Number Was Blocked" ,  "error" );
	</script>

	<%
			 	session.removeAttribute("blockno");
			}			
	%>


</body>
</html>
