package com.main.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class OtpDb {
	
 public static String phoneNum;

	public void updateOTP(String phone, String otp) {
		System.out.println("*****start updateOTP*****");
		
		java.sql.Connection conn = null;
		try {
			conn = (java.sql.Connection) DBR.getConnection();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		PreparedStatement statement = null;
		String query = "UPDATE otp SET otp_no=?, otp_sendDateTime=NOW() WHERE otp_mobile_no='" + phone + "'";

		try {
			statement = (PreparedStatement) conn.prepareStatement(query);
			statement.setString(1, otp);

			statement.executeUpdate();
			System.out.println("UPDATE OTP"+phone);			
			phoneNum = phone;			
			
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

	
	public void insertData(String phone, String otp) {		
		System.out.println("*****start insertData OtpDb*****");
		
			phoneNum=phone;
		
		java.sql.Connection conn = null;
		
		try {
			conn = DBR.getConnection();
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		PreparedStatement statement = null;

		String query = "INSERT INTO otp(otp_mobile_no, otp_no, otp_sendDateTime, otp_noOfAttempt) VALUES (?,?,NOW(),?)";

		try {
			statement = (PreparedStatement) conn.prepareStatement(query);
			statement.setString(1, phone);
			statement.setString(2, otp);
			statement.setString(3, "0");

			statement.executeUpdate();
			System.out.println("Registration start");
			

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		
		PreparedStatement  statusStatement = null;
		String statusQuery = "INSERT INTO videostatus(cu_mobileNo) VALUES (?)";
		
		try {
			statusStatement = (PreparedStatement) conn.prepareStatement(statusQuery);
			statusStatement.setString(1, phone);
			
			statusStatement .executeUpdate();
			System.out.println("video default status");
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		
		}
		
		ResultSet videoResultSet = null;
		String AuthKey = "";
		PreparedStatement videoStatement = null;
		String[] adsList = new String[5];
		
		String randQuery = "SELECT adYoutubeId FROM advertistment ORDER BY RAND() limit 5";
		System.out.println(randQuery);
		
		try {
			videoStatement = (PreparedStatement) ((java.sql.Connection) conn).prepareStatement(randQuery);
			videoResultSet = videoStatement.executeQuery(randQuery);
			int i=0;
			
			while (videoResultSet.next()) {
				AuthKey = videoResultSet.getString("adYoutubeId");
					adsList [i] =AuthKey;
					System.out.println(adsList[i]);
				i+=1;				
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();			
		}
		

		PreparedStatement  playlistStatement = null;
		String playlistQuery = "INSERT INTO playlist(mobile_number, video1, video2, video3, video4, video5) VALUES (?,?,?,?,?,?)";
		
		try {
			playlistStatement = (PreparedStatement) conn.prepareStatement(playlistQuery);
			playlistStatement.setString(1, phone);
			playlistStatement.setString(2, adsList[0]);
			playlistStatement.setString(3, adsList[1]);
			playlistStatement.setString(4, adsList[2]);
			playlistStatement.setString(5, adsList[3]);
			playlistStatement.setString(6, adsList[4]);
			
			playlistStatement .executeUpdate();
			System.out.println("playlist Updated firstTime");
			
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
	}

	
	public String getOtp(String phone) throws SQLException {
		System.out.println("*****start OTP getOtp*****");
		
		Connection conn = null;
		conn = DBR.getConnection();

		ResultSet rs = null;
		String AuthKey = "";
		PreparedStatement statement = null;
		String query = "SELECT otp_no FROM otp WHERE otp_mobile_no='" + phone + "'";

		System.out.println(query);

		try {
			statement = (PreparedStatement) ((java.sql.Connection) conn).prepareStatement(query);
			rs = statement.executeQuery(query);

			while (rs.next()) {

				AuthKey = rs.getString("otp_no");
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

	
	public String getPhone(String phone) throws SQLException {
		System.out.println("*****start OTP phone*****");
		
		Connection conn = null;
		conn = DBR.getConnection();

		ResultSet rs = null;
		String AuthKey = "";
		PreparedStatement statement = null;
		
		String query = "SELECT otp_mobile_no FROM otp WHERE otp_mobile_no='" + phone + "'";
        System.out.println(query);
        
		try {
			statement = (PreparedStatement) ((java.sql.Connection) conn).prepareStatement(query);
			rs = statement.executeQuery(query);

			while (rs.next()) {

				AuthKey = rs.getString("otp_mobile_no");
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
		
		return AuthKey;
	}
 
	
	public void updatAttemp(String phone, String otpatt) {
		System.out.println("*****start updateAttempOtpDb*****");
		
		java.sql.Connection conn = null;
		try {
			conn = (java.sql.Connection) DBR.getConnection();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	
		PreparedStatement statement = null;
		String query = "UPDATE otp SET otp_noOfAttempt=?, otp_sendDateTime=NOW() WHERE otp_mobile_no='" + phone + "'";

		try {
			statement = (PreparedStatement) conn.prepareStatement(query);
			statement.setString(1,otpatt);

			statement.executeUpdate();
			System.out.println("UPDATE OTP Attemp");
			
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

	
	public String getAttemp(String phone) throws SQLException {		
		System.out.println("*****start OTP getAttemp*****");
		
		Connection conn = null;
		conn = DBR.getConnection();

		ResultSet rs = null;
		String AuthKey = "";
		PreparedStatement statement = null;

		String query = "SELECT otp_noOfAttempt FROM otp WHERE otp_mobile_no='" + phone + "'";
		System.out.println(query);

		try {
			statement = (PreparedStatement) ((java.sql.Connection) conn).prepareStatement(query);
			rs = statement.executeQuery(query);

			while (rs.next()) {

				AuthKey = rs.getString("otp_noOfAttempt");
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

}
