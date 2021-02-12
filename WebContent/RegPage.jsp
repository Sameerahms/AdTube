<%@page import="com.sun.org.apache.xalan.internal.xsltc.compiler.sym"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript">
    		window.history.forward();
    	function noBack() {
    		window.history.forward();
    	}
</script>

<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">
<meta name="viewport" content="width=device-width, initial-scale=1" />
<meta charset ="UTF-8">
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
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<title>Register</title>

</head>
<body onload="myFunction()">
	<%
		String nic = request.getParameter("nic");
			if(nic==null){
				nic="";
			}
		System.out.println("NIC:" + nic);
	%>
	
	<%
		String phone = request.getParameter("phone");
		if(phone==null){
			phone="";
		}		
	%>
	
	<form action="RegController.jsp" method="post">
		<div class="container-contact100">
			<div class="wrap-contact100">
				<form class="contact100-form validate-form">
					<span class="contact100-form-title"> Register </span>

					<div class="wrap-input100 validate-input" data-validate="Name is required">
						<span class="label-input100">NIC</span>
						<input class="input100" id="rnic" type="text" name="nic" placeholder="NIC" value="<%=nic%>">
						<span class="focus-input100"></span>
					</div>
					
					<div class="container-contact100-form-btn">
						<div class="wrap-contact100-form-btn">
							<div class="contact100-form-bgbtn"></div>
								<button class="contact100-form-btn" value='submit request' onclick="fu()">
								<span> Register <i class="fa fa-long-arrow-right m-l-7" aria-hidden="true"></i></span>
								</button>
						</div>
					</div>
					
					<br> 
					<a href="index.jsp" style="color: red;">Back to Login</a>
					
				</form>
			</div>
		</div>

	</form>
	<script type="text/javascript">
		function fu() {
			var ph = document.getElementById("pj").value;
			var ni = document.getElementById("rnic").value;
			var p = ph.length;
			var n = ni.length;

		}
	</script>
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

	<script>
		window.dataLayer = window.dataLayer || [];
		function gtag() {
			dataLayer.push(arguments);
		}
		gtag('js', new Date());
		gtag('config', 'UA-23581568-13');
	</script>

	<%
		if (session.getAttribute("wrong_nic") != null) {
	%>
	<script>
	
		swal("Oops", "Invalid NIC", "error");
		
	</script>

	<%
		session.removeAttribute("wrong_nic");
		}
	%>


	<%
		if (session.getAttribute("aph") != null) {
	%>
	<script>
		swal("Oops", "Number already Exit ", "error")
	</script>

	<%
		session.removeAttribute("aph");
		}
	%>


	<%
		if (session.getAttribute("emp") != null) {
	%>
	<script>
		swal("Oops", "Please enter your mobile number", "error")
	</script>

	<%
		session.removeAttribute("emp");
		}
	%>

	<%
		if (session.getAttribute("emn") != null) {
	%>
	<script>
		swal("Oops", "Please enter your NIC", "error")
	</script>

	<%
		session.removeAttribute("emn");
		}
	%>


	<%
		if (session.getAttribute("emb") != null) {
	%>
	<script>
		swal("Oops", "Please enter NIC and Phone number", "error")
	</script>

	<%
		session.removeAttribute("emb");
		}
	%>


</body>
</html>