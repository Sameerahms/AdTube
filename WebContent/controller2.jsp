<%@page import="com.main.db.PlaylistDb"%>
<%@page import="com.main.db.VideoDB"%>


<%
	String phone = session.getAttribute("Phone_num").toString();
	String ir = request.getParameter("i");

	PlaylistDb playlistDb = new PlaylistDb();

	//selecting video play controll 
	if (ir.equals("0")) {
		System.out.println("Video1");
		String uniqid = playlistDb.getVideo1(phone);
		response.sendRedirect("TemVideoPlayer.jsp?uni=" + uniqid + "&i=" + ir + "");
		return;
	}

	if (ir.equals("1")) {
		System.out.println("Video2");
		String uniqid = playlistDb.getVideo2(phone);
		response.sendRedirect("TemVideoPlayer.jsp?uni=" + uniqid + "&i=" + ir + "");
		return;
	}

	if (ir.equals("2")) {
		System.out.println("Video3");
		String uniqid = playlistDb.getVideo3(phone);
		response.sendRedirect("TemVideoPlayer.jsp?uni=" + uniqid + "&i=" + ir + "");
		return;
	}

	if (ir.equals("3")) {
		System.out.println("Video4");
		String uniqid = playlistDb.getVideo4(phone);
		response.sendRedirect("TemVideoPlayer.jsp?uni=" + uniqid + "&i=" + ir + "");
		return;
	}

	if (ir.equals("4")) {
		System.out.println("Video5");
		String uniqid = playlistDb.getVideo5(phone);
		response.sendRedirect("TemVideoPlayer.jsp?uni=" + uniqid + "&i=" + ir + "");
		return;
	}

	if (ir.equals("5")) {
		System.out.println("Reword page");
		response.sendRedirect("NewReword.jsp");
		return;
	}
%>