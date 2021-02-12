package com.main;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.RandomStringUtils;

public class RegControll extends HttpServlet  {
protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	System.out.println("########RegController#########");
		String un=request.getParameter("rephone");
		String characters = "0123456789";
		String otp = RandomStringUtils.random( 11, characters );		
			System.out.println(otp);
			System.out.println(un);
	
		response.sendRedirect("hello.jsp");
		}	
}
