package bbs;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class BbsDAO { 

	private Connection conn; 
	private ResultSet rs; 

	public BbsDAO() { 
		try {
			String dbURL = "jdbc:mysql://sql6.freemysqlhosting.net:3306/sql6427042";
			String dbID = "sql6427042";
			String dbPassword = "8he56Rfa7J";
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword); 
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public String getDate() { 
		String SQL = "SELECT NOW()";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL); 
			rs = pstmt.executeQuery(); 
			if (rs.next()) { 
				return rs.getString(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "";// 데이터베이스 오류
	}

	public int getNext() {
		String SQL = "SELECT bbsID FROM MARKET_Bbs ORDER BY bbsID DESC";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery(); 
			if (rs.next()) { 
				return rs.getInt(1) + 1;
			}
			return 1; 
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}

	public int write(String bbsTitle, String userID, String bbsContent) { 
		String SQL = "INSERT INTO MARKET_Bbs VALUES (?,?,?,?,?,?)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL); 
			pstmt.setInt(1, getNext());
			pstmt.setString(2, bbsTitle);
			pstmt.setString(3, userID);
			pstmt.setString(4, getDate());
			pstmt.setString(5, bbsContent);
			pstmt.setInt(6, 1);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;// 데이터베이스 오류
	}
	
	public ArrayList<Bbs> getList(int pageNumber) {
		String SQL = "SELECT * FROM MARKET_Bbs WHERE bbsID < ? AND bbsAvailable = 1 ORDER BY bbsID DESC LIMIT 10";
		ArrayList<Bbs> list = new ArrayList<Bbs>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext() - (pageNumber - 1) * 10);
			rs = pstmt.executeQuery(); 
			while (rs.next()) {
				Bbs bbs = new Bbs();
				bbs.setBbsID(rs.getInt(1));
				bbs.setBbsTitle(rs.getString(2));
				bbs.setUserID(rs.getString(3));
				bbs.setBbsDate(rs.getString(4));
				bbs.setBbsContent(rs.getString(5));
				bbs.setBbsAvailable(rs.getInt(1));
				list.add(bbs);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public boolean nextPage(int pageNumber) {
		String SQL = "SELECT * FROM MARKET_Bbs WHERE bbsID < ? AND bbsAvailable = 1";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL); 
			pstmt.setInt(1, getNext() - (pageNumber - 1) * 10);
			rs = pstmt.executeQuery(); 
			if (rs.next()) {
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	public Bbs getBbs(int bbsID) { // 글을 불러오는 함수
		String SQL = "SELECT * FROM MARKET_Bbs WHERE bbsID = ? ";
		// 특정 숫자보다 작을 때 삭제가 되지않은 게시글 10개만 가져온다. try {
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL); // SQL문장으로 실행
			pstmt.setInt(1, bbsID);
			rs = pstmt.executeQuery(); // 실행결과를 가져옴.
			if (rs.next()) {
				Bbs bbs = new Bbs();
				bbs.setBbsID(rs.getInt(1));
				bbs.setBbsTitle(rs.getString(2));
				bbs.setUserID(rs.getString(3));
				bbs.setBbsDate(rs.getString(4));
				bbs.setBbsContent(rs.getString(5));
				bbs.setBbsAvailable(rs.getInt(6));
				return bbs;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	public int update(int bbsID, String bbsTitle, String bbsContent) { // 특정 bbsID의 타이틀과 내용을 수정하는 함수
		String SQL = "UPDATE MARKET_Bbs SET bbsTitle = ? ,bbsContent = ? WHERE bbsID = ?";
		// INSERT는 성공한 경우의 0이상의 결과를 반환하고 실패한 경우 -1을 반환한다.
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL); // SQL문장으로 실행
			pstmt.setString(1, bbsTitle);
			pstmt.setString(2, bbsContent);
			pstmt.setInt(3, bbsID);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;// 데이터베이스 오류
	}

	public int delete(int bbsID) {
		String SQL = "UPDATE MARKET_Bbs SET bbsAvailable = 0 WHERE bbsID = ?"; // 글을 삭제해도 정보가 남아있을 수 있도록 한다.
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL); // SQL문장으로 실행
			pstmt.setInt(1, bbsID);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;// 데이터베이스 오류
	}



}