package com.shilla.aboutUs.dao;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.shilla.aboutUs.vo.AboutUsVO;
import com.shilla.dbcon.ShillaStayDBConn;

public class AboutUsDAO {
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	public AboutUsDAO() throws ClassNotFoundException, SQLException {
		// TODO Auto-generated constructor stub
		conn = new ShillaStayDBConn().getConn();
	}

	public AboutUsVO getAboutUs() throws SQLException {
		String sql = "select * from tbl_aboutUs";
		
		AboutUsVO vo = null;
		
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		
		if(rs.next()) {
			vo = new AboutUsVO(rs.getString(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),
					rs.getString(6),rs.getString(7),rs.getString(8),rs.getString(9),rs.getString(10),
					rs.getString(11),rs.getString(12),rs.getString(13),rs.getString(14),rs.getString(15),
					rs.getString(16),rs.getString(17),rs.getString(18),rs.getString(19));
		}
		
		return vo;
	}

	public void Update(HttpServletRequest request, HttpServletResponse response) throws IOException, SQLException {
		// TODO Auto-generated method stub
		String sql = "UPDATE tbl_aboutUs SET"
				+ " welcome_title = ?,"
				+ " welcome_context = ?,"
				+ " img_one = ?,"
				+ " img_one_title = ?,"
				+ " img_two = ?,"
				+ " img_two_title = ?,"
				+ " img_three = ?,"
				+ " img_three_title = ?,"
				+ " video_title = ?,"
				+ " video_context = ?,"
				+ " video_href_address = ?,"
				+ " img_four = ?,"
				+ " img_four_title = ?,"
				+ " img_five = ?,"
				+ " img_five_title = ?,"
				+ " img_six = ?,"
				+ " img_six_title = ?,"
				+ " img_seven = ?,"
				+ " img_seven_title = ?";
		
		String rPath = request.getSession().getServletContext().getRealPath("/");
		//System.out.println(rPath);
		String LoadPath ="img\\about\\img";
		String UploadPath_meta = rPath+LoadPath;
		//System.out.println(UploadPath_meta);
		
		MultipartRequest mr=null;
		
		mr = new MultipartRequest(request, UploadPath_meta, 10*1024*1024,"UTF-8", new DefaultFileRenamePolicy());
		
		String img_one = ("../"+LoadPath+"\\"+mr.getFilesystemName("img_one")).replace("\\", "/");
		String img_two = ("../"+LoadPath+"\\"+mr.getFilesystemName("img_two")).replace("\\", "/");
		String img_three = ("../"+LoadPath+"\\"+mr.getFilesystemName("img_three")).replace("\\", "/");
		String img_four = ("../"+LoadPath+"\\"+mr.getFilesystemName("img_four")).replace("\\", "/");
		String img_five = ("../"+LoadPath+"\\"+mr.getFilesystemName("img_five")).replace("\\", "/");
		String img_six = ("../"+LoadPath+"\\"+mr.getFilesystemName("img_six")).replace("\\", "/");
		String img_seven = ("../"+LoadPath+"\\"+mr.getFilesystemName("img_seven")).replace("\\", "/");
		
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, mr.getParameter("welcome_title"));
		pstmt.setString(2, mr.getParameter("welcome_context"));
		pstmt.setString(3, img_one);
		pstmt.setString(4, mr.getParameter("img_one_title"));
		pstmt.setString(5, img_two);
		pstmt.setString(6, mr.getParameter("img_two_title"));
		pstmt.setString(7, img_three);
		pstmt.setString(8, mr.getParameter("img_three_title"));
		pstmt.setString(9, mr.getParameter("video_title"));
		pstmt.setString(10, mr.getParameter("video_context"));
		pstmt.setString(11, mr.getParameter("video_href_address"));
		pstmt.setString(12,  img_four);
		pstmt.setString(13, mr.getParameter("img_four_title"));
		pstmt.setString(14, img_five);
		pstmt.setString(15, mr.getParameter("img_five_title"));
		pstmt.setString(16, img_six);
		pstmt.setString(17, mr.getParameter("img_six_title"));
		pstmt.setString(18, img_seven);
		pstmt.setString(19, mr.getParameter("img_seven_title"));
		
		pstmt.executeUpdate();
	}
	
}
