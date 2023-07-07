package mvcboard;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import common.JDBCConnect;

public class MVCboardDAO extends JDBCConnect {
	//검색 조건에 맞는 게시물의 갯수를 반환
	public int selectCount(Map<String, Object> map) {
		int totalCount = 0;
		String sql = "select count(*) from mvcboard";
		//검색 조건이 있을경우 where절 추가
		if(map.get("selectWord") != null) {
			sql += " where " + map.get("searchField") + " like '%"+ map.get("searchWord") +"%'";
		}
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			rs.next();
			totalCount = rs.getInt(1);
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return totalCount;
	}
	//검색 조건에 맞는 게시물 목록을 반환
	public List<MVCboardDTO> selectListPage(Map<String, Object> map){
		List<MVCboardDTO> board = new ArrayList<>();
//		select * from (select Tb.*, rownum rNum from (select * from mvcboard order by idx desc) Tb) where rNum between 1 and 10;
		String sql = "select * from (select Tb.*, rownum rNum from ("
				+ "select * from mvcboard";
		//검색 조건이 있다면 where절 추가
		if(map.get("searchWord") != null) {
			sql += " where " + map.get("searchField") + " like '%"+map.get("searchWord")+"%'";
		}
		sql += " order by idx desc) Tb) where rNum between ? and ?";
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, map.get("start").toString());
			psmt.setString(2, map.get("end").toString());
			rs = psmt.executeQuery();
			//게시물 목록을 list컬렉션에 추가
			while(rs.next()) {
				MVCboardDTO dto = new MVCboardDTO();
				dto.setIdx(rs.getString(1));
				dto.setName(rs.getString(2));
				dto.setTitle(rs.getString(3));
				dto.setContent(rs.getString(4));
				dto.setPostdate(rs.getDate(5));
				dto.setOfile(rs.getString(6));
				dto.setSfile(rs.getString(7));
				dto.setPass(rs.getString(8));
				dto.setVisitcount(rs.getInt(9));
				board.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return board;
	}
	
	//게시글 추가하기
	public int insertWrite(MVCboardDTO dto) {
		int result = 0;
		String sql = "insert into mvcboard(idx, name, title, "
				+ "content, ofile, sfile, pass)"
				+ " values(seq_mvcboard_num.nextval, ?, ?, ?, ?, ?, ?)";
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, dto.getName());
			psmt.setString(2, dto.getTitle());
			psmt.setString(3, dto.getContent());
			psmt.setString(4, dto.getOfile());
			psmt.setString(5, dto.getSfile());
			psmt.setString(6, dto.getPass());
			result = psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	//게시글 상세보기
	public MVCboardDTO viewBoard(String idx) {
		MVCboardDTO dto = new MVCboardDTO();
		String sql = "select * from mvcboard where idx = ?";
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, idx);
			rs = psmt.executeQuery();
			if(rs.next()) {
				dto.setIdx(rs.getString(1));
				dto.setName(rs.getString(2));
				dto.setTitle(rs.getString(3));
				dto.setContent(rs.getString(4));
				dto.setPostdate(rs.getDate(5));
				dto.setOfile(rs.getString(6));
				dto.setSfile(rs.getString(7));
				dto.setPass(rs.getString(8));
				dto.setVisitcount(rs.getInt(9));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return dto;
	}
}
