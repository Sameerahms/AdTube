package com.main.db;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class VideoDB {

	public String ids() throws SQLException {
		System.out.println("**Random Five Videos**");

		String statusKey = "";
		java.sql.Connection conn = null;

		try {
			conn = DBR.getConnection();
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}

		ResultSet statusResultSet = null;
		PreparedStatement satusstatement = null;
		String[] statusList = new String[5];

		String statusQuery = "SELECT video1, video2, video3, video4, video5 FROM videostatus WHERE cu_mobileNo='" + OtpDb.phoneNum + "'";
		System.out.println(statusQuery);

		try {
			satusstatement = (PreparedStatement) ((java.sql.Connection) conn).prepareStatement(statusQuery);
			statusResultSet = satusstatement.executeQuery(statusQuery);

			while (statusResultSet.next()) {
				statusList[0] = statusResultSet.getString("video1");
				statusList[1] = statusResultSet.getString("video2");
				statusList[2] = statusResultSet.getString("video3");
				statusList[3] = statusResultSet.getString("video4");
				statusList[4] = statusResultSet.getString("video5");
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();

		}

		if (statusList[4].equals("YES")) {

			ResultSet videoResultSet = null;
			String AuthKey = "";
			PreparedStatement statement = null;
			String[] adsList = new String[5];

			String videoQuery = "SELECT adYoutubeId FROM advertistment ORDER BY RAND() LIMIT 5";
			System.out.println(videoQuery);

			try {
				statement = (PreparedStatement) ((java.sql.Connection) conn).prepareStatement(videoQuery);
				videoResultSet = statement.executeQuery(videoQuery);

				int i = 0;
				while (videoResultSet.next()) {
					AuthKey = videoResultSet.getString("adYoutubeId");

					adsList[i] = AuthKey;
					i += 1;
				}

			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			PreparedStatement playlistStatement = null;
			String playlistQuery = "UPDATE playlist SET mobile_number =?, video1 =?, video2 =?, video3 =?, video4 =?, video5 =? WHERE mobile_number ='" + OtpDb.phoneNum + "'";

			try {
				playlistStatement = (PreparedStatement) conn.prepareStatement(playlistQuery);
				playlistStatement.setString(1, OtpDb.phoneNum);
				playlistStatement.setString(2, adsList[0]);
				playlistStatement.setString(3, adsList[1]);
				playlistStatement.setString(4, adsList[2]);
				playlistStatement.setString(5, adsList[3]);
				playlistStatement.setString(6, adsList[4]);

				playlistStatement.executeUpdate();
				System.out.println("playlist Updated after first time");

			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			PreparedStatement defaultStatement = null;
			String defaultQuery = "UPDATE videostatus SET cu_mobileNo =?, video1 =?, video2 =?, video3 =?, video4 =?, video5 =? WHERE cu_mobileNo ='" + OtpDb.phoneNum + "'";

			try {
				defaultStatement = (PreparedStatement) conn.prepareStatement(defaultQuery);
				defaultStatement.setString(1, OtpDb.phoneNum);
				defaultStatement.setString(2, "NO");
				defaultStatement.setString(3, "NO");
				defaultStatement.setString(4, "NO");
				defaultStatement.setString(5, "NO");
				defaultStatement.setString(6, "NO");

				defaultStatement.executeUpdate();
				System.out.println("videoStatus table refresh");

			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			statusKey = "0";

		} else {
			if (statusList[0].equals("NO")) {
				statusKey = "0";
				return statusKey;
			}
			if (statusList[1].equals("NO")) {
				statusKey = "1";
				return statusKey;

			}
			if (statusList[2].equals("NO")) {
				statusKey = "2";
				return statusKey;
			}
			if (statusList[3].equals("NO")) {
				statusKey = "3";
				return statusKey;
			}
			if (statusList[4].equals("NO")) {
				statusKey = "4";
				return statusKey;
			}

		}

		return statusKey;
	}

}
