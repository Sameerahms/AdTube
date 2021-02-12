package com.main.db;

import java.sql.PreparedStatement;
import java.sql.SQLException;

public class VideoStatus {
	
	public void updatVideo1(String phone) {
		
		java.sql.Connection conn = null;
		try {
			conn = (java.sql.Connection) DBR.getConnection();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		PreparedStatement statement = null;
		String query = "UPDATE videostatus SET video1=? WHERE cu_mobileNo='" + phone + "'";

		try {
			statement = (PreparedStatement) conn.prepareStatement(query);
			statement.setString(1, "YES");

			statement.executeUpdate();
			System.out.println("UPDATE Video1 status");

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

	
	public void updatVideo2(String phone) {
		
		java.sql.Connection conn = null;
		try {
			conn = (java.sql.Connection) DBR.getConnection();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		PreparedStatement statement = null;

		String query = "UPDATE videostatus SET video2=? WHERE cu_mobileNo='" + phone + "'";

		try {
			statement = (PreparedStatement) conn.prepareStatement(query);
			statement.setString(1, "YES");
			
            statement.executeUpdate();           
			System.out.println("UPDATE Video2 status");

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

	
	public void updatVideo3(String phone) {
		
		java.sql.Connection conn = null;
		try {
			conn = (java.sql.Connection) DBR.getConnection();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		PreparedStatement statement = null;

		String query = "UPDATE videostatus SET video3=? WHERE cu_mobileNo='" + phone + "'";

		try {
			statement = (PreparedStatement) conn.prepareStatement(query);
			statement.setString(1, "YES");
			
			statement.executeUpdate();
			System.out.println("UPDATE Video3 status");
	
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
	
	
	public void updatVideo4(String phone) {
		
		java.sql.Connection conn = null;
		try {
			conn = (java.sql.Connection) DBR.getConnection();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		PreparedStatement statement = null;
		String query = "UPDATE videostatus SET video4=? WHERE cu_mobileNo='" + phone + "'";

		try {
			statement = (PreparedStatement) conn.prepareStatement(query);
			statement.setString(1, "YES");

			statement.executeUpdate();
			System.out.println("UPDATE Video4 status");

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

	
	public void updatVideo5(String phone) {
		
		java.sql.Connection conn = null;
		try {
			conn = (java.sql.Connection) DBR.getConnection();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		PreparedStatement statement = null;
		String query = "UPDATE videostatus SET video5=? WHERE cu_mobileNo='" + phone + "'";

		try {
			statement = (PreparedStatement) conn.prepareStatement(query);
			statement.setString(1, "YES");

			statement.executeUpdate();
			System.out.println("UPDATE Video5 status");


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
