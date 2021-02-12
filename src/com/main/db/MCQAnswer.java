package com.main.db;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class MCQAnswer {
	
	public void updatePoints(String phoneNu, String Points) throws SQLException {
		System.out.println("*****Update Total Points*****");

		java.sql.Connection conn = null;
		try {
			conn = DBR.getConnection();
		} catch (SQLException e1) {
		 //TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		PreparedStatement statement = null;
		String pointQuery = "UPDATE customer SET cus_totalPoint =? WHERE cu_mobileNo='" + phoneNu + "'";

		System.out.println(pointQuery);

		try {
			statement = (PreparedStatement) ((java.sql.Connection) conn).prepareStatement(pointQuery);
			statement.setString(1, Points);
			statement.executeUpdate();			
						
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
	}
	
	
	public String getPoints(String phoneNu) throws SQLException {
		System.out.println("*****start getPoints*****");

		java.sql.Connection conn = null;
		try {
			conn = DBR.getConnection();
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		ResultSet rs = null;
		String AuthKey = "";
		PreparedStatement statement = null;

		String query = "SELECT cus_totalPoint FROM customer WHERE cu_mobileNo='" + phoneNu + "'";

		System.out.println(query);

		try {
			statement = (PreparedStatement) ((java.sql.Connection) conn).prepareStatement(query);
			rs = statement.executeQuery(query);

			while (rs.next()) {

				AuthKey = rs.getString("cus_totalPoint");
				System.out.println("*" + AuthKey);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		
		System.out.println("-*" + AuthKey);
		return AuthKey;
	}	


	public String getAnswer(String yid) throws SQLException {
		System.out.println("*****start getAnswer*****");
	
		java.sql.Connection conn = null;
		try {
			conn = DBR.getConnection();
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		ResultSet result = null;
		String Ans = "";
		PreparedStatement state = null;
	
		String query = "SELECT mcq_answer FROM mcq WHERE adYoutubeId='" +yid+ "'";
		System.out.println(query);
	
		try {
			state = (PreparedStatement) ((java.sql.Connection) conn).prepareStatement(query);
			result = state.executeQuery(query);
	
			while (result.next()) {
				Ans = result.getString("mcq_answer");			
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		
		return Ans;
		}	
	}

