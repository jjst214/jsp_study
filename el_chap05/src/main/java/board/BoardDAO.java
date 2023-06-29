package board;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import common.JDBCConnect;

public class BoardDAO extends JDBCConnect {
	public List<BoardDTO> getBoardList(Map<String, Object> map){
		List<BoardDTO> blist = new ArrayList<>();
		String sql = "select * from board";
		if(map.get("searchWord") != null) {
			sql = sql + " where " + map.get("searchField") + " like '%"
					+ map.get("searchWord") + "%'";
		}
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				BoardDTO dto = new BoardDTO();
				dto.setNum(rs.getInt("num"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setId(rs.getString("id"));
				dto.setPostdate(rs.getString("postdate"));
				dto.setVisitcount(rs.getInt("visitcount"));
				blist.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return blist;
	}
	
	//게시글 상세보기
	public BoardDTO getPost(int post_num) {
		viewCount(post_num);
		BoardDTO dto = new BoardDTO();
		String sql = "select * from board where num = ?";
		try {
			psmt = con.prepareStatement(sql);
			psmt.setInt(1, post_num);
			rs = psmt.executeQuery();
			if(rs.next()) {
				dto.setNum(rs.getInt("num"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setId(rs.getString("id"));
				dto.setPostdate(rs.getString("postdate"));
				dto.setVisitcount(rs.getInt("visitcount"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return dto;
	}
	//조회수 증가
	public void viewCount(int num) {
		String sql = "update board set visitcount = visitcount + 1"
				+ " where num = ?";
		try {
			psmt = con.prepareStatement(sql);
			psmt.setInt(1, num);
			psmt.executeUpdate();
			con.commit();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	//글 수정
	public int updatePost(int num, String title, String content, String id) {
		String sql = "update board set title = ? and content = ? where num = ?";
		String sql2 = "select id from board where id = ?";
		int result = 0;
		try {
			psmt = con.prepareStatement(sql2);
			psmt.setString(1, id);
			rs = psmt.executeQuery();
			if(rs.next()) {
				psmt = con.prepareStatement(sql);
				psmt.setString(1, title);
				psmt.setString(2, content);
				psmt.setInt(3, num);
				result = psmt.executeUpdate();
				if(result != 0) {
					con.commit();
					return 1;
				}else {
					con.rollback();
					return 0;
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
