<%@page import="com.main.db.VideoDB"%>
<%@page import="com.main.db.OtpDb"%>
<%@page import="com.main.crtl.ValiNic"%>
<%@page import="com.main.crtl.OTPsend"%>
<%@page import="com.main.crtl.NewConntroller"%>
<%@page import="com.main.HttpHead"%>
<%@page import="org.apache.commons.lang3.RandomStringUtils"%>
<%@page import="com.main.db.DbController"%>
<%@page import="com.main.db.PlaylistDb"%>
<%
	String un = request.getParameter("rephone");
	String nic = request.getParameter("nic");
	String characters = "0123456789";
	String phone=session.getAttribute("Phone_num").toString();
	
	PlaylistDb playlistDb  = new PlaylistDb();
	OtpDb otpDb = new OtpDb();
	boolean nicV = ValiNic.validateNIC(nic);
	int length = nic.length();
	
	String otp = RandomStringUtils.random(4, characters);
	String attemp = otpDb.getAttemp(phone);
	
	session.setAttribute("nic_no", nic);
	DbController controller = new DbController();

	String uniqid = playlistDb.getVideo1(phone);
	
	NewConntroller v=new NewConntroller();
	
	String os=v.fOs(request, response);
	System.out.println("NIC:"+nicV);
	
	if(nic.equals("")&&phone.isEmpty()){
		session.setAttribute("emb", "1");
		response.sendRedirect("RegPage.jsp");
		return;	
	}
	if(nic.equals("")){
		session.setAttribute("emn", "1");
		response.sendRedirect("RegPage.jsp?nic="+nic+"&phone="+phone);
		return;
	}
	
	if(phone.length()<9){
		
		response.sendRedirect("RegPage.jsp?nic="+nic+"&phone="+phone);
		return;
	}
	
	if(nicV==false){
		session.setAttribute("wrong_nic", "1");
	
		response.sendRedirect("RegPage.jsp?nic="+nic+"&phone="+phone);
	 	return;
	}

	if (controller.getPhone(un).equals(phone)) {
		System.out.println("**Equal**");
		session.setAttribute("aph", "1");
		response.sendRedirect("RegPage.jsp?nic="+nic+"&phone="+phone);
		return;
	}
	
	else{
		// Connect to mysql and verify username password
		//first time start video playing
		System.out.println(otp);
		controller.insertData(phone,nic,os);
		response.sendRedirect("controller2.jsp?i=0"+"");
		return;
	}
%>