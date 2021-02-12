package com.main.db;

import java.sql.DriverManager;
import java.sql.SQLException;
public class DBR {
	public static java.sql.Connection getConnection() throws SQLException {
		java.sql.Connection con = null;

		String dbUrl = "jdbc:mysql://localhost:3306/ad_markerting";
		String dbUser = "root";
		String dbPass = "";
//Nx2mD5RD2waHg8V Linux 	
//root_password windows 
		try {
			Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
			return  (java.sql.Connection) DriverManager.getConnection(dbUrl, dbUser, dbPass);
		} catch (Exception e) {
			 System.out.println("Error in DatabaseConnection.getConnection : "+e.toString());
		}
		System.out.println("*** CONNECTION ****" + con);
		return (java.sql.Connection) con;
	}
}	