<%@page import="com.main.db.VideoDB"%>
<%@page import="com.main.db.PlaylistDb"%>
<%@page import="java.util.UUID"%>
<%@page import="org.apache.commons.lang3.RandomStringUtils"%>
<%@page import="com.main.db.OtpDb"%>
<%@page import="com.main.crtl.NewConntroller"%>
<%@page import="com.main.crtl.OTPsend"%>
<%@page import="com.main.db.DbController"%>
<%
    String uuid=UUID.randomUUID().toString().replace("-","");

	String rephone = session.getAttribute("Phone_num").toString();
	String otp = request.getParameter("otpn");
	
	DbController controller = new DbController();
	OtpDb otpDb = new OtpDb();
	VideoDB videoDb = new VideoDB();

	String respo=request.getParameter("oti");
	String characters = "0123456789";
	String otpKey = RandomStringUtils.random(4, characters);	
	String statusKey=videoDb.ids();
	
	
	String attemp=otpDb.getAttemp(rephone);
	int at=Integer.parseInt(attemp)+1;
	
	if(respo.equals("1")){
	
		if(otp.equals("")){
			response.sendRedirect("hello.jsp?uuid="+uuid+"");
			session.setAttribute("empty_otp", "2");
			return;
		}
	
		if(otp.length()<4){
			response.sendRedirect("hello.jsp?uuid="+uuid+"");
			session.setAttribute("length_otp", "3");
			return;
		}
	
		//Ads play starting
		if (otpDb.getOtp(rephone).equals(otp)) {
			
			if(controller.getPhone(rephone).equals(rephone)){
				otpDb.updatAttemp(rephone,"0");
				response.sendRedirect("controller2.jsp?&i="+statusKey+"");
				return;
			}
			
			else{
				otpDb.updatAttemp(rephone,"0");
				response.sendRedirect("RegPage.jsp?uuid="+uuid+"");
				return;
			}
		
		
		} else {
			if(otpDb.getAttemp(rephone).equals("3")){
				session.setAttribute("blockno", "1");
				response.sendRedirect("index.jsp");
				return;
			}
		
		response.sendRedirect("hello.jsp?uuid="+uuid+"&attamp="+at+"");
		otpDb.updatAttemp(rephone, String.valueOf(at));		
		session.setAttribute("wrong_otp", "1");
		return;
		}
	}
	
	
	if(respo.equals("2")){
		otpDb.updateOTP(rephone,otpKey);
		//OTPsend.sendSMS(rephone,"otp:"+otpKey);
		response.sendRedirect("hello.jsp?uuid="+uuid+"");
		return;
		
		}
	
%>