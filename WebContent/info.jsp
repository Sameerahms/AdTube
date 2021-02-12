<%@page import="com.main.HttpHead"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body style="background: gray;">
	<%
		System.out.println("***********************************");
		HttpHead headers = new HttpHead();
		String agent = headers.fOs(request, response);
		String ip = headers.ips(request, response);
		String browser = headers.brow(request, response);

		String type = request.getHeader("user-agent");
		System.out.println("OS:" + agent);
		System.out.println("Browser: " + browser);
		System.out.println("ip: " + ip);
	%>
	<div align="center" style="font-size: 50px; font-family:monospace;">
	
	<label>OS:<%=agent %> </label>
	<br>
	<label>Browser:<%=browser %> </label>
	</div>
	
	<%
out.print( request.getRemoteAddr() );
out.print( request.getRemoteHost() );
%>
</body>
</html>