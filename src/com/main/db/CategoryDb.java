package com.main.db;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class CategoryDb {

	public String categoryVideo(String phone, String category, String key) throws SQLException { 
		
		String statusKey = key;
		java.sql.Connection conn = null;
		
		try {
			conn = DBR.getConnection();
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		ResultSet videoResultSet = null;
		String AuthKey = "";
		PreparedStatement statement = null;
		String[] adsList = new String[5];
		
		String videoQuery = "SELECT adYoutubeId FROM advertistment WHERE adCategory='" + category + "' ORDER BY RAND() LIMIT 5";
		System.out.println(videoQuery);
		
		try {
			statement = (PreparedStatement) ((java.sql.Connection) conn).prepareStatement(videoQuery);
			videoResultSet = statement.executeQuery(videoQuery);
			
			int i=0;
			
			while (videoResultSet.next()) {
				AuthKey = videoResultSet.getString("adYoutubeId");
				
					adsList [i] =AuthKey;
					i+=1;				
			}		
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();			
		}

		PreparedStatement playlistStatement = null;
		String playlistQuery = "UPDATE playlist SET mobile_number =?, video1 =?, video2 =?, video3 =?, video4 =?, video5 =? WHERE mobile_number ='"+OtpDb.phoneNum+"'";
		
		try {
			playlistStatement = (PreparedStatement) conn.prepareStatement(playlistQuery);
			playlistStatement.setString(1, phone);
			playlistStatement.setString(2, adsList[0]);
			playlistStatement.setString(3, adsList[1]);
			playlistStatement.setString(4, adsList[2]);
			playlistStatement.setString(5, adsList[3]);
			playlistStatement.setString(6, adsList[4]);
			
			playlistStatement.executeUpdate();
			System.out.println("Playlist Category videos Updated");
				
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
		
		return statusKey;	
	}
}
