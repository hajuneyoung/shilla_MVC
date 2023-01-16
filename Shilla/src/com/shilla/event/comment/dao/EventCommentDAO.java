package com.shilla.event.comment.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shilla.dbcon.ShillaStayDBConn;
import com.shilla.event.comment.vo.EventCommentVO;

public class EventCommentDAO {
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	public EventCommentDAO() throws ClassNotFoundException, SQLException {
		
		conn = new ShillaStayDBConn().getConn();
	}

	public void insertComment(HttpServletRequest request, HttpServletResponse response) throws SQLException {
		// TODO Auto-generated method stub
		String sql = "Insert into tbl_event_comment (comment_id,event_id,comment_writer_img,comment_writer_name,comment_write_date,comment_context,comment_cdepth) values (Comment_id_sequence.NEXTVAL,?,?,?,DEFAULT,?,DEFAULT)";
		
		int sevent_id = Integer.parseInt(request.getParameter("event_id"));
		
		
		String comment_writer_img ;
		
		if(request.getParameter("comment_writer_img") == null) {
			comment_writer_img = "../img/blog/img/icon_default_person.png" ;
		}else {
			comment_writer_img = request.getParameter("comment_writer_img");
		}
		String comment_writer_name = request.getParameter("comment_writer_name");
		String comment_context  = request.getParameter("comment_context");
		
		pstmt=conn.prepareStatement(sql);
		pstmt.setInt(1, sevent_id);
		pstmt.setString(2, comment_writer_img);
		pstmt.setString(3, comment_writer_name);
		pstmt.setString(4, comment_context);
		pstmt.executeQuery();
		
	}
	
	public void insertCommentComment(HttpServletRequest request, HttpServletResponse response) throws SQLException {
		// TODO Auto-generated method stub
		String sql = "Insert into tbl_event_comment (comment_id,event_id,comment_writer_img,comment_writer_name,comment_write_date,comment_context,comment_cdepth,comment_cparent) values (Comment_id_sequence.NEXTVAL,?,?,?,DEFAULT,?,1,?)";		
		int sevent_id = Integer.parseInt(request.getParameter("event_id"));
		
		
		String comment_writer_img ;
		
		if(request.getParameter("comment_writer_img") == null) {
			comment_writer_img = "../img/blog/img/icon_default_person.png" ;
		}else {
			comment_writer_img = request.getParameter("comment_writer_img");
		}
		String comment_writer_name = request.getParameter("comment_writer_name");
		String comment_context  = request.getParameter("comment_context");
		String comment_cparent = request.getParameter("comment_cparent");
		
		pstmt=conn.prepareStatement(sql);
		pstmt.setInt(1, sevent_id);
		pstmt.setString(2, comment_writer_img);
		pstmt.setString(3, comment_writer_name);
		pstmt.setString(4, comment_context);
		pstmt.setString(5, comment_cparent);
		pstmt.executeQuery();
		
	}

	public ArrayList<EventCommentVO> getEventComment(HttpServletRequest request, HttpServletResponse response) throws SQLException {
		
		String sql = "SELECT * FROM tbl_event_comment WHERE event_id=? ORDER BY comment_cdepth, comment_write_date";
		
		ArrayList<EventCommentVO> clist = new ArrayList<EventCommentVO>();
	
		int event_id = Integer.parseInt(request.getParameter("event_id"));
		
		pstmt=conn.prepareStatement(sql);
		pstmt.setInt(1, event_id);
		rs=pstmt.executeQuery();
		
		while(rs.next()) {
		
			EventCommentVO ecvo = new EventCommentVO();
			
			ecvo.setComment_id(rs.getInt(1));
			ecvo.setEvent_id(rs.getInt(2));
			ecvo.setComment_writer_img(rs.getString(3));
			ecvo.setComment_writer_name(rs.getString(4));
			ecvo.setComment_write_date(rs.getString(5).substring(0));
			//System.out.println(rs.getString(5));
			ecvo.setComment_context(rs.getString(6));
			ecvo.setComment_cdepth(Integer.parseInt(rs.getString(7)));
			if(rs.getString(8) == null) {
				ecvo.setComment_cparent(0);	
			}else {
				ecvo.setComment_cparent(Integer.parseInt(rs.getString(8)));			
			}
			clist.add(ecvo);
		}
		
		return clist;
	}

	public void deleteCommentParent(HttpServletRequest request, HttpServletResponse response) throws SQLException {
		// TODO Auto-generated method stub
		String sql = "delete from tbl_event_comment where comment_id=? or comment_cparent=?";
		
		int comment_id = Integer.parseInt(request.getParameter("comment_id"));
		
		pstmt=conn.prepareStatement(sql);
		pstmt.setInt(1, comment_id);
		pstmt.setInt(2, comment_id );
		pstmt.executeUpdate();
		
	}
	
	public void deleteComment(HttpServletRequest request, HttpServletResponse response) throws SQLException {
		// TODO Auto-generated method stub
		String sql = "delete from tbl_event_comment where comment_id=?";
		
		int comment_id = Integer.parseInt(request.getParameter("comment_id"));
		
		pstmt=conn.prepareStatement(sql);
		pstmt.setInt(1, comment_id);
		pstmt.executeUpdate();
	}
	
}
