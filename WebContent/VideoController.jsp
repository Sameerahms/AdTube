<%
	String video = request.getParameter("vid");
	if (video.equals("1")) {
		System.out.println("Video 1");
		response.sendRedirect("testPage1.jsp");
		return;
	}
	if (video.equals("2")) {
		System.out.println("Video 2");
		response.sendRedirect("Page2.jsp");
		return;
	}
	if (video.equals("3")) {
		System.out.println("Video 3");
		response.sendRedirect("Page3.jsp");
		return;
	}

	if (video.equals("4")) {
		System.out.println("Video 4");
		response.sendRedirect("Page4.jsp");
		return;
	}
	if (video.equals("5")) {
		System.out.println("Video 5");
		response.sendRedirect("Page5.jsp");
		return;
	} else {

		response.sendRedirect("Video1.jsp");
		return;
	}
%>