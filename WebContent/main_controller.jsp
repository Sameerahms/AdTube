<%@page import="com.main.crtl.OTPsend"%>
<%@page import="com.main.db.MCQAnswer"%>
<%
	String phone = session.getAttribute("Phone_num").toString();
	String action = request.getParameter("action");
	MCQAnswer cont = new MCQAnswer();
	System.out.println("Main_controller" + phone);
	
		String point = request.getParameter("result");
		System.out.println("point:"+point);
		
		String dbpoints = cont.getPoints(phone);
		
		int all = Integer.valueOf(point) + Integer.valueOf(dbpoints);
		cont.updatePoints(String.valueOf(all), phone);
		return;
	

%>