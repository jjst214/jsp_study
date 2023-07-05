package board;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;

import common.JDBCConnect;

public class BoardDAO extends JDBCConnect {
	public BoardDAO(ServletContext application) {
		super(application);
	}
	//검색 조건에 따라 리스트 검색하기
	public List<BoardDTO> selectlist(Map<String, Object> map){
		List<BoardDTO> boardList = new ArrayList<BoardDTO>();
		String query = "select * from board";
		if(map.get("searchWord")!=null) {
			query += " where "+map.get("searchField") + " like '%"+map.get("searchWord")+"%'";
		}else {
			query = "select * from board";
		}
		System.out.println(query);
		//query += "order by num desc";
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(query);
			while(rs.next()) {
				BoardDTO dto = new BoardDTO();
				dto.setNum(rs.getString("num"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setPostdate(rs.getDate("postdate"));
				dto.setId(rs.getString("id"));
				dto.setVisitcount(rs.getString("visitcount"));
				dto.setContent(rs.getString("content"));
				boardList.add(dto);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return boardList;
		
	}
}