<%@page import="com.main.db.OtpDb"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.UUID"%>

<% 
 	String uuid=UUID.randomUUID().toString().replace("-","");
	String rephone = session.getAttribute("Phone_num").toString();
	String otp = request.getParameter("otpVal");
	OtpDb otpDb = new OtpDb();


	if (otpDb.getOtp(rephone).equals(otp)) {
 		response.sendRedirect("TemMCQ.jsp?uuid="+uuid+"");
		session.setAttribute("correct_otp", "1");
		return;

		 	}else{
		 		response.sendRedirect("TemMCQ.jsp?uuid="+uuid+"");
				session.setAttribute("wrong", "2");
		 		
		 	}
	
%>
	
	   