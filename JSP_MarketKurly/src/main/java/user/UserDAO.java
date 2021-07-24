package user;

import java.sql.*;


public class UserDAO {
	private Connection conn;
	private PreparedStatement pstmt; 	
	private ResultSet rs;
	
	public UserDAO() {
		try {
			String dbURL = "jdbc:mysql://sql6.freemysqlhosting.net:3306/sql6427042";
			String dbID = "sql6427042";
			String dbPassword = "8he56Rfa7J";
			Class.forName("com.mysql.jdbc.Driver");
			conn=DriverManager.getConnection(dbURL, dbID, dbPassword);
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public int login(String userID, String userPassword) {
		String SQL = "SELECT userPassword FROM MARKET_User WHERE userID = ?";
		try {
			pstmt=conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				if(rs.getString(1).equals(userPassword)) {
					return 1;
				}
			}
			return -1;
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -2; // database error
	}
	
	public int join(User user) {
		String SQL = "INSERT INTO MARKET_User VALUES (?, ?, ?, ?, ?, ?, ?)";
			try {
				pstmt = conn.prepareStatement(SQL);
				pstmt.setString(1, user.getUserID());
				pstmt.setString(2, user.getUserPassword());
				pstmt.setString(3, user.getUserPassword1());
				pstmt.setString(4, user.getUserName());
				pstmt.setString(5, user.getUserEmail());
				pstmt.setString(6, user.getUserPhone());
				pstmt.setString(7, user.getUserGender());
				System.out.println("1. is "+user.getUserPassword());
				System.out.println("2. is "+user.getUserPassword1());

				
				return pstmt.executeUpdate();
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			return -1;	// db error
		}
	}
