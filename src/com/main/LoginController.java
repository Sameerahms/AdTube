package com.main;

import java.io.IOException;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LoginController extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {	
		String un=request.getParameter("phone");
		// Connect to my sql and verify user name password
				
			try {
				Class.forName("com.mysql.jdbc.Driver");
			 // loads driver
				java.sql.Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/ads", "Z4)^b95N8K", "Z4)^b95N8K"); // gets a new connection
		 
				PreparedStatement ps = c.prepareStatement("select phone_number from login where phone_number=?");
				ps.setString(1, un);
			
			ResultSet rs = ps.executeQuery();
			
			while (rs.next()) {
				System.out.println("OK");
				response.sendRedirect("hello.jsp");
				return;
			}
			
				System.out.println("Not Registerd");
				response.sendRedirect("RegPage.jsp");
				return;
			
			} catch (ClassNotFoundException | SQLException e) {
				response.reset();
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

}
