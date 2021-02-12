package com.main.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DbController {
	
	public String insertData(String phone, String nic, String os) {
		System.out.println("*****start insertData*****");
		
		java.sql.Connection conn = null;
		try {
			conn = DBR.getConnection();
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		PreparedStatement customerStatement = null;
		String customerQuery = "INSERT INTO customer(cu_mobileNo, cus_nic, cus_lastViewed_dateTime, cus_totalPoint) VALUES (?,?,NOW(),?)";

		try {	
			customerStatement = (PreparedStatement) conn.prepareStatement(customerQuery);
			customerStatement.setString(1, phone);
			customerStatement.setString(2, nic);
			customerStatement.setString(3, "0");
			
			customerStatement.executeUpdate();
			System.out.println("Registration Done");
		
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
		
		return "";		
	}
		
	
	public String getPhone(String phone) throws SQLException {
		System.out.println("*****start getPhone  DbController*****");

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

		String query = "SELECT cu_mobileNo FROM customer WHERE cu_mobileNo='" + phone + "'";
		System.out.println(query);

		try {
			statement = (PreparedStatement) ((java.sql.Connection) conn).prepareStatement(query);
			rs = statement.executeQuery(query);

			while (rs.next()) {

				AuthKey = rs.getString("cu_mobileNo");
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

	
	public String getOtp(String phone) throws SQLException {
		System.out.println("*****start OTP DbController*****");
		
		Connection conn = null;
		conn = DBR.getConnection();

		ResultSet rs = null;
		String AuthKey = "";
		PreparedStatement statement = null;

		String query = "SELECT otp FROM login WHERE phone_number='" + phone + "'";
		System.out.println(query);

		try {
			statement = (PreparedStatement) ((java.sql.Connection) conn).prepareStatement(query);
			rs = statement.executeQuery(query);

			while (rs.next()) {

				AuthKey = rs.getString("otp");
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

	
	public void updateSq(String phone, String page) {
		java.sql.Connection conn = null;
		
		try {
			conn = DBR.getConnection();
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		

		PreparedStatement statement = null;
		String query = "UPDATE customer SET cus_lastViewed_dateTime=NOW() WHERE cu_mobileNo='" + phone + "'";

		try {
			statement = (PreparedStatement) conn.prepareStatement(query);
			statement.executeUpdate();
			System.out.println("***Upadate last view time***");

			
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



	public void updateName(String name, String phone) {
		System.out.println("*****start updateName*****");
		
		java.sql.Connection conn = null;
		try {
			conn = DBR.getConnection();
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		

		PreparedStatement statement = null;
		String query = "UPDATE customer SET cus_name=? WHERE cu_mobileNo='" + phone + "'";

		try {
			statement = (PreparedStatement) conn.prepareStatement(query);
			statement.setString(1, name);

			statement.executeUpdate();
			System.out.println("UPDATE NAME");
			
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

	
	public void updateGrand(String valP, String phone, String data) {
		System.out.println("*****start updateGrand*****");
		
		java.sql.Connection conn = null;
		try {
			conn = (java.sql.Connection) DBR.getConnection();
		} catch (SQLException e) {
			e.printStackTrace();
		}


		PreparedStatement statement = null;
		String query = "UPDATE customer SET cus_totalPoint=?,cus_Mdata=? WHERE cu_mobileNo='" + phone + "'";

		try {
			statement = (PreparedStatement) conn.prepareStatement(query);
			statement.setString(1, valP);
			statement.setString(2, data);

			statement.executeUpdate();
			System.out.println("***UPDATE Grand***");


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
		
		return AuthKey;
	}

	
	public String getDmb(String phoneNu) throws SQLException {
		System.out.println("*****start getDmb*****");

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
		String query = "SELECT cus_Mdata FROM customer WHERE cu_mobileNo='" + phoneNu + "'";
		System.out.println(query);

		try {
			statement = (PreparedStatement) ((java.sql.Connection) conn).prepareStatement(query);
			rs = statement.executeQuery(query);

			while (rs.next()) {

				AuthKey = rs.getString("cus_Mdata");
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
	
	
	public String getOTP(String phoneNu) throws SQLException {
		System.out.println("*****start getOTP*****");

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

		String query = "SELECT otp FROM login WHERE phone_number='" + phoneNu + "'";

		System.out.println(query);

		try {
			statement = (PreparedStatement) ((java.sql.Connection) conn).prepareStatement(query);
			rs = statement.executeQuery(query);

			while (rs.next()) {

				AuthKey = rs.getString("otp");
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

	
	public void updateOTP(String phone, String OTP) {
		System.out.println("*****start updateOTP*****");
		
		java.sql.Connection conn = null;
		try {
			conn = DBR.getConnection();
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		

		PreparedStatement statement = null;
		String query = "UPDATE customer SET cus_lastViewed_dateTime=NOW() WHERE cu_mobileNo='" + phone + "'";

		try {
			statement = (PreparedStatement) conn.prepareStatement(query);		

			statement.executeUpdate();
			System.out.println("Reg");

			
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
}
