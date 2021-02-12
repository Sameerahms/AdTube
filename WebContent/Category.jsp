<%@page import="com.main.db.PlaylistDb"%>
<%@page import="com.main.db.VideoDB"%>
<%@page import="com.main.db.CategoryDb" %>


<%
	String phone = session.getAttribute("Phone_num").toString();
	String category =request.getParameter("category");
	VideoDB videoDb = new VideoDB(); 
	String key = videoDb.ids();
	
// 	retun new categoy what user want

	CategoryDb categoryDb = new CategoryDb();
	categoryDb.categoryVideo(phone, category, key);	
	response.sendRedirect("controller2.jsp?i="+key);
	 return;
%>