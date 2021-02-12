<%@page import="com.main.db.OtpDb"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.UUID"%>

<% 
	String uuid=UUID.randomUUID().toString().replace("-","");
	String ans = request.getParameter("ans");


	if (ans.equals("WANS")) {
 		response.sendRedirect("TemMCQ.jsp?uuid="+uuid+"");
		session.setAttribute("wrong_ans", "3");
		return;
	}
	
	%>
	