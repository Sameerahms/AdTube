<%@page import="java.util.UUID"%>
<%@page import="org.apache.commons.lang3.RandomStringUtils"%>
<%@page import="com.main.db.OtpDb"%>
<%@page import="com.main.crtl.OTPsend"%>
<%@page import="java.sql.Connection"%>

<%

	String uuid=UUID.randomUUID().toString().replace("-","");
	String rephone = session.getAttribute("Phone_num").toString();
	OtpDb otpDb=new OtpDb();
	
	String respo=request.getParameter("oti");
	String characters = "0123456789";
	String otpKey = RandomStringUtils.random(4, characters);
	
	
	if(respo.equals("1")){
		otpDb.updateOTP(rephone,otpKey);
		//OTPsend.sendSMS(rephone,"otp:"+otpKey);		
		return;		
		}
	
%>
