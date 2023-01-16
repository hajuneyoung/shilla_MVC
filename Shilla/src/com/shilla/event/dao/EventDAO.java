package com.shilla.event.dao;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.shilla.dbcon.ShillaStayDBConn;
import com.shilla.event.criteria.Criteria;
import com.shilla.event.vo.EventVO;

public class EventDAO {

	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	public EventDAO() throws ClassNotFoundException, SQLException {
		conn=new ShillaStayDBConn().getConn();
	}
	
	public void EventInsert(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {

		//String bang = request.getContextPath()+"/Webapp/img/blog/img";
		//String url = request.getRequestURL().toString();
		
		String rPath = request.getSession().getServletContext().getRealPath("/");
		System.out.println(rPath);
		String LoadPath ="img\\blog\\img";
		String UploadPath_meta = rPath+LoadPath;
		System.out.println(UploadPath_meta);
		
		MultipartRequest mr=null;
		
			mr = new MultipartRequest(request, UploadPath_meta, 10*1024*1024,"UTF-8", new DefaultFileRenamePolicy());
			/*
			 * ======================================================================================================================
			 */
	
	//		String projectName = request.getContextPath();
	//		String WebappPath = "\\Webapp\\img\\blog\\img";
	//		String thisRealPath = request.getSession().getServletContext().getRealPath("");
	//		//C:\Users\lenovo\Desktop\Multi_Web_Project\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\sona_home_page
	//		String Slice = "\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps"+projectName;
	//		
	//		String UploadPath = thisRealPath.substring(0, (thisRealPath.length()-Slice.length()))+projectName.substring(1)+WebappPath;
	//		System.out.println(UploadPath);
	//		MultipartRequest mr2 = new MultipartRequest(request, UploadPath, 10*1024*1024,"UTF-8", new DefaultFileRenamePolicy());
			
			String kategorieOnboard = mr.getParameter("kategorieOnboard");
			String title_name = mr.getParameter("title_name");
			String write_date = mr.getParameter("write_date");
			String writerOnboard = mr.getParameter("writerOnboard");
			String prologOnBoard = mr.getParameter("prologOnBoard");
			
			String img_title = ("../"+LoadPath+"\\"+mr.getFilesystemName("img_title")).replace("\\", "/");
			String img_out = ("../"+LoadPath+"\\"+mr.getFilesystemName("img_out")).replace("\\", "/");
			String imgOne = "../"+LoadPath+"\\"+mr.getFilesystemName("imgOne");
			String imgTwo = "../"+LoadPath+"\\"+mr.getFilesystemName("imgTwo");	
			String imgThree = "../"+LoadPath+"\\"+mr.getFilesystemName("imgThree");
			
			String subTitleOnBoard = mr.getParameter("subTitleOnBoard");
			String textOnsubTitle = mr.getParameter("textOnsubTitle");
			
			System.out.println(img_out);
			
			String sql = "INSERT INTO tbl_event VALUES (event_id_sequence.NEXTVAL,?,?,to_date(?),?,?,?,?,?,?,?,?,?)";
	
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, kategorieOnboard);
			pstmt.setString(2, title_name);
			pstmt.setString(3, write_date);
			pstmt.setString(4, writerOnboard);
			pstmt.setString(5, prologOnBoard);
			
			pstmt.setString(6, img_title);
			pstmt.setString(7, img_out);
			pstmt.setString(8, imgOne);
			pstmt.setString(9, imgTwo);
			pstmt.setString(10, imgThree);
			
			pstmt.setString(11, subTitleOnBoard);
			pstmt.setString(12, textOnsubTitle);
			
			pstmt.executeUpdate();

	}

	public EventVO getEvent(HttpServletRequest request, HttpServletResponse response) throws SQLException {

		String sql = "SELECT * FROM tbl_event WHERE title_name=? and event_id = ?";
		
		String title_name = request.getParameter("title_name");
		int event_id = Integer.parseInt(request.getParameter("event_id"));
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, title_name);
		pstmt.setInt(2, event_id);
		rs = pstmt.executeQuery();
		
		EventVO vo1 = new EventVO();
		
//		String nullImg = "../img\\defaultIMG\\u_default.jpg";
		String nullImgT = "../img/defaultIMG/t_default.jpg";
		String nullImgOt = "../img/defaultIMG/Ot_default.jpg";
		
		if(rs.next()) {
			vo1.setEvent_id(rs.getInt(1));
			vo1.setKategorieOnEvnet(rs.getString(2));
			vo1.setTitle_name(rs.getString(3));
			vo1.setWrite_date(rs.getString(4).substring(0,10));
			vo1.setWriterOnEvnet(rs.getString(5));
			vo1.setPrologOnevnet(rs.getString(6));
			
//			System.out.println(rs.getString(7).contains(("/null")));
//			System.out.println(rs.getString(8));
//			System.out.println(rs.getString(9).contains(("\\null")));
//			System.out.println(rs.getString(10).contains(("\\null")));

			if(rs.getString(7).contains("/null")) {
				vo1.setImg_title(nullImgT);
			}else {
				vo1.setImg_title(rs.getString(7));
			}
			
			if(rs.getString(8).contains("/null")) {
				vo1.setImg_out(nullImgOt);
			}else {
				vo1.setImg_out(rs.getString(8));
			}
//			
//			if(rs.getString(9).contains("\\null")) {
//				vo1.setImgOne(nullImg);
//			}else {
//				vo1.setImgOne(rs.getString(9));
//			}
//			if(rs.getString(10).contains("\\null")) {
//				vo1.setImgTwo(nullImg);
//			}else {
//				vo1.setImgTwo(rs.getString(10));
//			}
//			if(rs.getString(11).contains("\\null")) {
//				vo1.setImgThree(nullImg);
//			}else {
//				vo1.setImgThree(rs.getString(11));
//			}
			vo1.setImgOne(rs.getString(9));
			vo1.setImgTwo(rs.getString(10));
			vo1.setImgThree(rs.getString(11));
			
			vo1.setSubTitleOnEvnet(rs.getString(12));
			vo1.setTextOnsubTitle(rs.getString(13));	
		}
		
		return vo1;
	}
	
	public EventVO getEventForUpdate(HttpServletRequest request, HttpServletResponse response) throws SQLException {

		String sql = "SELECT * FROM tbl_event WHERE title_name=? and event_id = ?";
		
		String title_name = request.getParameter("title_name");
		int event_id = Integer.parseInt(request.getParameter("event_id"));
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, title_name);
		pstmt.setInt(2, event_id);
		rs = pstmt.executeQuery();
		
		EventVO vo1 = new EventVO();
		
		String nullImg = "../img\\defaultIMG\\u_default.jpg";
		String nullImgT = "../img/defaultIMG/t_default.jpg";
		String nullImgOt = "../img/defaultIMG/Ot_default.jpg";
		
		if(rs.next()) {
			vo1.setEvent_id(rs.getInt(1));
			vo1.setKategorieOnEvnet(rs.getString(2));
			vo1.setTitle_name(rs.getString(3));
			vo1.setWrite_date(rs.getString(4).substring(0,10));
			vo1.setWriterOnEvnet(rs.getString(5));
			vo1.setPrologOnevnet(rs.getString(6));
			
			System.out.println(rs.getString(7).contains(("/null")));
			System.out.println(rs.getString(8).contains(("/null")));
			System.out.println(rs.getString(9).contains(("\\null")));
			System.out.println(rs.getString(10).contains(("\\null")));
			System.out.println(rs.getString(11).contains(("\\null")));

			if(rs.getString(7).contains("/null")) {
				vo1.setImg_title(nullImgT);
			}else {
				vo1.setImg_title(rs.getString(7));
			}
			
			if(rs.getString(8).contains("/null")) {
				vo1.setImg_out(nullImgOt);
			}else {
				vo1.setImg_out(rs.getString(8));
			}
			
			if(rs.getString(9).contains("\\null")) {
				vo1.setImgOne(nullImg);
			}else {
				vo1.setImgOne(rs.getString(9));
			}
			if(rs.getString(10).contains("\\null")) {
				vo1.setImgTwo(nullImg);
			}else {
				vo1.setImgTwo(rs.getString(10));
			}
			if(rs.getString(11).contains("\\null")) {
				vo1.setImgThree(nullImg);
			}else {
				vo1.setImgThree(rs.getString(11));
			}

//			vo1.setImgOne(rs.getString(7));
//			vo1.setImgTwo(rs.getString(8));
//			vo1.setImgThree(rs.getString(9));
			
			vo1.setSubTitleOnEvnet(rs.getString(12));
			vo1.setTextOnsubTitle(rs.getString(13));	
		}
		
		return vo1;
	}

	public ArrayList<EventVO> getAllEvent(Criteria cri) throws SQLException {

		String sql = ""; // = "SELECT * FROM tbl_event ORDER BY write_date desc, title_name";
		
			sql =	"select"+ 
					" event_id, kategorieOnEvnet, title_name, write_date, img_out"+
					" from"+
					"	("+
					"	select /*+INDEX_DESC(tbl_event event_id_pk) */"+
					"		rownum rn, event_id, kategorieOnEvnet, title_name, write_date, img_out"+
					"			from"+
					"				tbl_event"+
					"			where rownum <= ? * ?"+
					"	)"+
					" where rn > (? -1 ) * ?";
		
		ArrayList<EventVO> alist= new ArrayList<EventVO>();
		
		pstmt=conn.prepareStatement(sql);
		pstmt.setInt(1, cri.getPageNum());
		pstmt.setInt(2, cri.getAmount());
		pstmt.setInt(3, cri.getPageNum());
		pstmt.setInt(4, cri.getAmount());
		rs = pstmt.executeQuery();

		String nullImgOt = "../img/defaultIMG/Ot_default.jpg";
		
		while(rs.next()) {
			
			int event_id = rs.getInt("event_id");
			
			String kategorieOnEvnet = rs.getString("kategorieOnEvnet");
			String title_name = rs.getString("title_name");
			String write_date = rs.getString("write_date").substring(0,10);

			String img_out = rs.getString("img_out");

			if(img_out.contains("/null")) {
				img_out = nullImgOt;
			}
					
			EventVO vo2 = new EventVO(event_id,kategorieOnEvnet,title_name,write_date,img_out);
			
			alist.add(vo2);
		}
		
		return alist;
	}

	public int getTotalCount(Criteria cri) throws SQLException {
		// TODO Auto-generated method stub
		String sql = "select count(*) from tbl_event where event_id > 0";
		
		pstmt=conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		if(rs.next()) {
			return rs.getInt(1);
		}else {
			return 0;
		}
		
		
	}

	public void EventUpdate(HttpServletRequest request, HttpServletResponse response) throws IOException, SQLException {
		
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String rPath = request.getSession().getServletContext().getRealPath("/");
		//System.out.println(rPath);
		String LoadPath ="img\\blog\\img";
		String UploadPath_meta = rPath+LoadPath;
		//System.out.println(UploadPath_meta);
		
		MultipartRequest mr = new MultipartRequest(request, UploadPath_meta, 10*1024*1024,"UTF-8", new DefaultFileRenamePolicy());
		
		String kategorieOnEvnet = mr.getParameter("kategorieOnEvnet");
		String title_name = mr.getParameter("title_name");
		String write_date = mr.getParameter("write_date");
		String writerOnEvnet = mr.getParameter("writerOnEvnet");
		String prologOnevnet = mr.getParameter("prologOnevnet");
		
		String img_title = "../"+(LoadPath+"\\"+mr.getFilesystemName("img_title")).replace("\\", "/");
		String img_out = "../"+(LoadPath+"\\"+mr.getFilesystemName("img_out")).replace("\\", "/");
		String imgOne = "../"+LoadPath+"\\"+mr.getFilesystemName("imgOne");
		String imgTwo = "../"+LoadPath+"\\"+mr.getFilesystemName("imgTwo");
		String imgThree = "../"+LoadPath+"\\"+mr.getFilesystemName("imgThree");
		
		String subTitleOnEvnet = mr.getParameter("subTitleOnEvnet");
		String textOnsubTitle = mr.getParameter("textOnsubTitle");
		String Stitle_name = mr.getParameter("Stitle_name");
		
		int event_id = Integer.parseInt(mr.getParameter("event_id"));
		
		String sql = "UPDATE tbl_event SET"
				+ " kategorieOnEvnet=?,"
				+ " title_name=?,"
				+ " write_date=to_date(?),"
				+ " writerOnEvnet=?,"
				+ " prologOnevnet=?,"
				+ " img_title=?,"
				+ " img_out=?,"
				+ " imgOne=?,"
				+ " imgTwo=?,"
				+ " imgThree=?,"
				+ " subTitleOnEvnet=?,"
				+ " textOnsubTitle=?"
				+ " where title_name=? and"
				+ " event_id=?";

		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, kategorieOnEvnet);
		pstmt.setString(2, title_name);
		pstmt.setString(3, write_date);
		pstmt.setString(4, writerOnEvnet);
		pstmt.setString(5, prologOnevnet);
		pstmt.setString(6, img_title);
		pstmt.setString(7, img_out);
		pstmt.setString(8, imgOne);
		pstmt.setString(9, imgTwo);
		pstmt.setString(10, imgThree);
		pstmt.setString(11, subTitleOnEvnet);
		pstmt.setString(12, textOnsubTitle);
		pstmt.setString(13, Stitle_name);
		pstmt.setInt(14, event_id);
		pstmt.executeUpdate();
		
//		System.out.println(kategorieOnEvnet);
//		System.out.println(title_name);
//		System.out.println(write_date);
//		System.out.println(writerOnEvnet);
//		System.out.println(prologOnevnet);
//		
//		System.out.println(img_title);
//		System.out.println(img_out);
//		System.out.println(imgOne);
//		System.out.println(imgTwo);
//		System.out.println(imgThree);
//		
//		System.out.println(subTitleOnEvnet);
//		System.out.println(Stitle_name);
//		System.out.println(event_id);
	}

	public void EventDelete(HttpServletRequest request, HttpServletResponse response) throws SQLException {
		// TODO Auto-generated method stub
		
		int event_id = Integer.parseInt(request.getParameter("event_id"));
		String title_name = request.getParameter("title_name");
		
		String sql_comment = "delete from tbl_event_comment where event_id=?";
		
		pstmt=conn.prepareStatement(sql_comment);
		pstmt.setInt(1, event_id );
		pstmt.executeUpdate();
		
		String sql = "DELETE tbl_event WHERE title_name=? and event_id=?";
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, title_name);
		pstmt.setInt(2, event_id );
		pstmt.executeUpdate();
	}

}
