package com.main.db;

import java.sql.PreparedStatement;
import java.sql.SQLException;


public class LikeDb {
	
	public void updateLike(String videoId, String like) throws SQLException {
		System.out.println("*** Update Like ***");
		
		java.sql.Connection conn = null;
		
		try {
			conn = DBR.getConnection();
		}catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		PreparedStatement likeStatement = null;		
		String likeQuery ="UPDATE mcq SET adLike=? WHERE adYoutubeId='"+videoId+"'";
		System.out.println(likeQuery);
		
		try {
			likeStatement = (PreparedStatement) ((java.sql.Connection) conn).prepareStatement(likeQuery);
			likeStatement.setString(1, like);
			likeStatement.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	
	public void updateDisLike(String videoId,String disLike) throws SQLException {
		System.out.println("*** Update DisLike ***");
		
		java.sql.Connection conn = null;
		
		try {
			conn = DBR.getConnection();
		}catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		PreparedStatement likeStatement = null;
		
		String disQuery ="UPDATE mcq SET disLike=? WHERE adYoutubeId='"+videoId+"'";
		System.out.println(disQuery);
		
		try {
			likeStatement = (PreparedStatement) ((java.sql.Connection) conn).prepareStatement(disQuery);
			likeStatement.setString(1, disLike);
			likeStatement.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}
