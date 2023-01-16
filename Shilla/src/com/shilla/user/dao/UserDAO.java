package com.shilla.user.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.shilla.dbcon.ShillaStayDBConn;
import com.shilla.user.vo.UserVO;

public class UserDAO {

	private Connection conn;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	// private static UserDAO dao = new UserDAO();

	public UserDAO() throws ClassNotFoundException, SQLException {
		conn = new ShillaStayDBConn().getConn();
	}
	
	/* public static UserDAO getInstance() {
		if (dao == null) {
			dao = new UserDAO();
		}
		return dao;
	} */

	public int login(String userID, String userPassword) {
		String SQL = "SELECT userPassword FROM tbl_userinfo WHERE userID=?";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				if (rs.getString(1).equals(userPassword))
					return 1; // 로그인 성공
				else
					return 0; // 비밀번호 불일치
			}
			return -1; // 아이디가 없음
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -2; // 데이터베이스 오류
	}

	public int registerCheck(String userID) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String SQL = "SELECT * FROM tbl_userinfo WHERE userID = ? ";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				return 1;
			}
			return 0;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return -1;
	}

	public int userinfo(String userID, String userPassword, String userName, String userAge, String userTel,
			String userGender, String userEmail) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String SQL = "INSERT INTO tbl_userinfo VALUES(?, ?, ?, ?, ?, ?,?)";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			pstmt.setString(2, userPassword);
			pstmt.setString(3, userName);
			pstmt.setString(4, userTel);
			pstmt.setInt(5, Integer.parseInt(userAge));
			pstmt.setString(6, userGender);
			pstmt.setString(7, userEmail);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return -1;
	}
	
	public UserVO getUser(String userID) {
		UserVO user = new UserVO();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String SQL = "SELECT * FROM tbl_userinfo WHERE userID = ? ";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				user.setUserID(userID);
				user.setUserPassword(rs.getString("userPassword"));
				user.setUserName(rs.getString("userName"));
				user.setUserAge(rs.getInt("userAge"));
				user.setUserTel(rs.getString("userTel"));
				user.setUserGender(rs.getString("userGender"));
				user.setUserEmail(rs.getString("userEmail"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return user;
	}
	
	public boolean updateUser(UserVO user) {
		
		boolean flag = false;

		String SQL = "UPDATE tbl_userinfo SET userPassword=?,userName=?, userGender=?,userAge=?,userTel=?,userEmail=? WHERE userID=?";
		
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, user.getUserPassword());
			pstmt.setString(2, user.getUserName());
			pstmt.setString(3, user.getUserGender());
			pstmt.setInt(4, user.getUserAge());
			pstmt.setString(5, user.getUserTel());
			pstmt.setString(6, user.getUserEmail());
			pstmt.setString(7, user.getUserID());

			int i = pstmt.executeUpdate();
			if (i == 1) 
				flag = true;
			else 
				flag = true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;
	}
	
	public boolean deleteUser(String userID) {
		boolean flag = false;
		String sql = "DELETE FROM tbl_userinfo WHERE userID = ?";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setNString(1, userID);

			int i = pstmt.executeUpdate();
			if (i == 1)
				flag = true;
			else 
				flag = false;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;
	}
	
}
