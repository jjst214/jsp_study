package board;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import common.JDBCConnect;

public class BoardDAO extends JDBCConnect {
	//검색 조건에 맞는 게시글의 개수 반환하기
	public int selectCount(Map<String, Object> map) {
		int totalCount = 0;
		//게시물 수를 얻어오는 쿼리작성
		String sql = "select count(*) from board";
		//검색 요청이 있을경우 where조건 추가
		if(map.get("searchWord") != null) {
			sql += " where " + map.get("searchField") + " like '%"
					+ map.get("searchWord") + "%'";
		}
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			rs.next();
			totalCount = rs.getInt(1);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return totalCount;
	}
	//검색 & 게시판 글 불러오기
	public List<BoardDTO> getBoardList(Map<String, Object> map){
		List<BoardDTO> blist = new ArrayList<>();
		String sql = "select * from("
				+ "select Tb.*, rownum rnum from ("
				+ "select * from board ";
		if(map.get("searchWord") != null) {
			sql += " where " + map.get("searchField") + " like '%"
					+ map.get("searchWord") + "%'";
		}
		sql += " order by num desc) Tb"
				+ ") where rnum between ? and ?";
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, map.get("start").toString());
			psmt.setString(2, map.get("end").toString());
			rs = psmt.executeQuery();
			
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
	public int updatePost(BoardDTO dto) {
		String sql = "update board set title = ?, content = ? where num = ?";
		int result = 0;
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, dto.getTitle());
			psmt.setString(2, dto.getContent());
			psmt.setInt(3, dto.getNum());
			result = psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	//게시글 등록하기
	public int insertWrite(BoardDTO dto) {
		int result = 0;
		String query = "insert into board(num, title, content, id, postdate, visitcount)"
				+ " values(seq_board_num.nextval, ?, ?, ?, sysdate, 0)";
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, dto.getTitle());
			psmt.setString(2, dto.getContent());
			psmt.setString(3, dto.getId());
			result = psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return result;
	}
	//게시글 삭제하기
	public int deletePost(int num) {
		int result = 0;
		String sql = "delete from board where num = ?";
		try {
			psmt = con.prepareStatement(sql);
			psmt.setInt(1, num);
			result = psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return result;
	}
}
