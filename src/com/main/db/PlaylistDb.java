package com.main.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class PlaylistDb {
	
	OtpDb otpDb = new OtpDb();
	
	public String getVideo1(String phone) throws SQLException {
		System.out.println("**getVideo1**");

		Connection conn = null;
		conn = DBR.getConnection(); 

		ResultSet rs = null;
		String AuthKey = "";
		PreparedStatement statement = null;
		
		String query = "SELECT video1 FROM playlist WHERE mobile_number='" +phone+ "'";		
		System.out.println(query);

		try {
			statement = (PreparedStatement) ((java.sql.Connection) conn).prepareStatement(query);
			rs = statement.executeQuery(query);

			while (rs.next()) {

				AuthKey = rs.getString("video1");
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

	public String getVideo2(String phone) throws SQLException {
		System.out.println("**getVideo2**");

		Connection conn = null;
		conn = DBR.getConnection();

		ResultSet rs = null;
		String AuthKey = "";
		PreparedStatement statement = null;

		String query = "SELECT video2 FROM playlist WHERE mobile_number='" + phone+ "'";

		System.out.println(query);

		try {
			statement = (PreparedStatement) ((java.sql.Connection) conn).prepareStatement(query);
			rs = statement.executeQuery(query);

			while (rs.next()) {

				AuthKey = rs.getString("video2");
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

	
	public String getVideo3(String phone) throws SQLException {
		System.out.println("**getVideo3**");

		Connection conn = null;
		conn = DBR.getConnection();
		

		ResultSet rs = null;
		String AuthKey = "";
		PreparedStatement statement = null;
		String query = "SELECT video3 FROM playlist WHERE mobile_number='" +phone + "'";

		System.out.println(query);

		try {
			statement = (PreparedStatement) ((java.sql.Connection) conn).prepareStatement(query);
			rs = statement.executeQuery(query);

			while (rs.next()) {

				AuthKey = rs.getString("video3");
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

	
	public String getVideo4(String phone) throws SQLException {
		System.out.println("**getVideo4**");

		Connection conn = null;
		conn = DBR.getConnection();

		ResultSet rs = null;
		String AuthKey = "";
		PreparedStatement statement = null;

		String query = "SELECT video4 FROM playlist WHERE mobile_number='" + phone + "'";
		System.out.println(query);

		try {
			statement = (PreparedStatement) ((java.sql.Connection) conn).prepareStatement(query);
			rs = statement.executeQuery(query);

			while (rs.next()) {

				AuthKey = rs.getString("video4");
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

	
	public String getVideo5(String phone) throws SQLException {
		System.out.println("**getVideo5**");

		Connection conn = null;
		conn = DBR.getConnection();

		ResultSet rs = null;
		String AuthKey = "";
		PreparedStatement statement = null;

		String query = "SELECT video5 FROM playlist WHERE mobile_number='" + phone + "'";
		System.out.println(query);

		try {
			statement = (PreparedStatement) ((java.sql.Connection) conn).prepareStatement(query);
			rs = statement.executeQuery(query);

			while (rs.next()) {

				AuthKey = rs.getString("video5");
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

	
	public void updatVideo1(String phone, String video) {
		
		java.sql.Connection conn = null;
		try {
			conn = (java.sql.Connection) DBR.getConnection();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		PreparedStatement statement = null;
		String query = "UPDATE playlist SET video1=? WHERE mobile_number='" + phone + "'";

		try {
			statement = (PreparedStatement) conn.prepareStatement(query);
			statement.setString(1, video);

			statement.executeUpdate();
			System.out.println("UPDATE Video");

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

	
	public void updatVideo2(String phone, String video) {
		
		java.sql.Connection conn = null;
		try {
			conn = (java.sql.Connection) DBR.getConnection();
		} catch (SQLException e) {
			e.printStackTrace();
		}


		PreparedStatement statement = null;
		String query = "UPDATE playlist SET video2=? WHERE mobile_number='" + phone + "'";

		try {
			statement = (PreparedStatement) conn.prepareStatement(query);
			statement.setString(1, video);

			statement.executeUpdate();
			System.out.println("UPDATE Video");
			
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

	
	public void updatVideo3(String phone, String video) {
		
		java.sql.Connection conn = null;
		try {
			conn = (java.sql.Connection) DBR.getConnection();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		PreparedStatement statement = null;
		String query = "UPDATE playlist SET video3=? WHERE mobile_number='" + phone + "'";

		try {
			statement = (PreparedStatement) conn.prepareStatement(query);
			statement.setString(1, video);

			statement.executeUpdate();
			System.out.println("UPDATE Video");

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

	
	public void updatVideo4(String phone, String video) {
		
		java.sql.Connection conn = null;
		try {
			conn = (java.sql.Connection) DBR.getConnection();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		PreparedStatement statement = null;

		String query = "UPDATE playlist SET video4=? WHERE mobile_number='" + phone + "'";

		try {
			statement = (PreparedStatement) conn.prepareStatement(query);
			statement.setString(1, video);

			statement.executeUpdate();
			System.out.println("UPDATE Video");

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

	
	public void updatVideo5(String phone, String video) {
		
		java.sql.Connection conn = null;
		try {
			conn = (java.sql.Connection) DBR.getConnection();
		} catch (SQLException e) {
			e.printStackTrace();
		}


		PreparedStatement statement = null;
		String query = "UPDATE playlist SET video5=? WHERE mobile_number='" + phone + "'";

		try {
			statement = (PreparedStatement) conn.prepareStatement(query);
			statement.setString(1, video);

			statement.executeUpdate();
			System.out.println("UPDATE Video");

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



