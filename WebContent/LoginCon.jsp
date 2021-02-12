<%@page import="java.util.UUID"%>
<%@page import="java.util.regex.Matcher"%>
<%@page import="java.util.regex.Pattern"%>
<%@page import="com.main.crtl.OTPsend"%>
<%@page import="com.main.db.OtpDb"%>
<%@page import="com.main.HttpHead"%>
<%@page import="org.apache.commons.lang3.RandomStringUtils"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.main.db.DbController"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%

	String action = request.getParameter("action");
	String un = request.getParameter("phone");
	OtpDb otpDb = new OtpDb();
	String phone=un;

	String attemp = otpDb.getAttemp(phone);
	String nic = request.getParameter("nic");
	session.setAttribute("Phone_num", phone);
	String uuid=UUID.randomUUID().toString().replace("-","");
	System.out.println("Entered number "+phone);
	String characters = "0123456789";
	
	String otp = RandomStringUtils.random(4, characters);
	OtpDb otpconn = new  OtpDb();
	DbController cony = new DbController();
	Pattern p=Pattern.compile("[0]{1}\\d{9}");
	Matcher matcher=p.matcher(phone);
	
	if(phone==""){
		session.setAttribute("wrong_uname", "1");
		response.sendRedirect("index.jsp");
		return;
	}
	if(matcher.matches()==false) {
		session.setAttribute("in_num", "1");
		response.sendRedirect("index.jsp");
		return;
	}
	
	
	if(attemp.equals("3")){
		session.setAttribute("blockno", "1");
		response.sendRedirect("index.jsp");
		return;
	}
	
	try {
		
		if(otpconn.getPhone(phone).equals(phone)){
			otpconn.updateOTP(phone, otp);
			//OTPsend.sendSMS(phone,"OTP:"+otp);
			response.sendRedirect("hello.jsp?uuid="+uuid+"");
			return;
			
		
		}else{
			otpconn.insertData(phone, otp);
			//OTPsend.sendSMS(phone,"OTP:"+otp);
			response.sendRedirect("hello.jsp?uuid="+uuid+"");
			return;
		}
			

	} catch (Exception e) {
		response.reset();
        e.printStackTrace();

	}
	
	
%>