package com.main.db;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class ReplayDb {

	public void addReplay(String phone, String yid, int reCount) {
		System.out.println("*****start getReplay*****");
		
		java.sql.Connection conn = null;
		try {
			conn = (java.sql.Connection) DBR.getConnection();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		PreparedStatement statement = null;
		String query = "INSERT INTO replay(mobileNumber, adYoutubeId, replayCount) VALUES (?, ?, ?)";

		try {
			statement = (PreparedStatement) conn.prepareStatement(query);
			statement.setString(1, phone);
			statement.setString(2, yid);
			statement.setInt(3, reCount);
			
			statement.executeUpdate();
			System.out.println(query);						
			
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
	
	
	public void updateReCount(String phone, String yid, int reCount) {
		java.sql.Connection conn = null;
		
		try {
			conn = DBR.getConnection();	
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		

		PreparedStatement statementUpdate = null;
		String updateQuery = "UPDATE replay SET replayCount=? WHERE mobileNumber='" + phone + "' AND adYoutubeId='" + yid + "'";

		try {
			statementUpdate = (PreparedStatement) conn.prepareStatement(updateQuery);
			statementUpdate.setInt(1, reCount);
			
			statementUpdate.executeUpdate();
			System.out.println(updateQuery);
			
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

	
	public int getReCount(String phone, String yid) throws SQLException {
		System.out.println("*****start getReCount*****");

		java.sql.Connection conn = null;
		try {
			conn = DBR.getConnection();
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}

		ResultSet rs = null;
		int reCountKey=0;
		PreparedStatement statement = null;

		String query = "SELECT replayCount FROM replay WHERE mobileNumber='" + phone + "' AND adYoutubeId='" + yid + "'";
		System.out.println(query);

		try {
			statement = (PreparedStatement) ((java.sql.Connection) conn).prepareStatement(query);
			rs = statement.executeQuery(query);

			while (rs.next()) {

				reCountKey = rs.getInt("replayCount");
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

		return reCountKey;
	}
}
