package com.shilla.aboutUs.benefits.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shilla.aboutUs.benefits.vo.AboutUsBenefitsVO;
import com.shilla.dbcon.ShillaStayDBConn;

public class AboutUsBenefitsDAO {
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	public AboutUsBenefitsDAO() throws ClassNotFoundException, SQLException {
		// TODO Auto-generated constructor stub
		conn = new ShillaStayDBConn().getConn();
	}

	public ArrayList<AboutUsBenefitsVO> getBenefits() throws SQLException {
		
		ArrayList<AboutUsBenefitsVO> alist = new ArrayList<AboutUsBenefitsVO> ();
		
		String sql = "select * from tbl_aboutUs_benefits";
		pstmt=conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		
		
		
		while(rs.next()) {
			AboutUsBenefitsVO aubvo = new AboutUsBenefitsVO();
			aubvo.setBenefits(rs.getInt(1));
			aubvo.setContext(rs.getString(2));
			
			alist.add(aubvo);
		}
		
		return alist;
	}

	public void UpdateBenefits(HttpServletRequest request, HttpServletResponse response) throws SQLException {
		
		String sql = "UPDATE tbl_aboutUs_benefits SET context = ? WHERE benefits = ?";
		for(int i = 1 ; i <= 5; i++) {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, request.getParameter("context"+i));
			pstmt.setInt(2, i);
			pstmt.executeUpdate();
		}
		
		
	}
	
	
}
