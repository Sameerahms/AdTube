<%@page import="com.main.crtl.OTPsend"%>
<%@page import="com.main.db.VideoStatus"%>
<%@page import="com.main.db.MCQAnswer"%>

<%
	String phone = session.getAttribute("Phone_num").toString();

	VideoStatus videoStatus = new VideoStatus();
	
	String videoId = request.getParameter("i");	
	System.out.println("Status " + phone);

	if(videoId.equals("0")){
		videoStatus.updatVideo1(phone);
		return;
	}
	
	if(videoId.equals("1")){
		videoStatus.updatVideo2(phone);
		return;
	}
	
	if(videoId.equals("2")){
		videoStatus.updatVideo3(phone);
		return;
	}
	
	if(videoId.equals("3")){
		videoStatus.updatVideo4(phone);
		return;
	}
	
	if(videoId.equals("4")){
		videoStatus.updatVideo5(phone);
		return;
	}
	
%>
