package comment;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import common.JDBCConnect;

public class CommentDAO extends JDBCConnect{
	//검색 조건에 맞는 게시물의 개수 반환
			public int selectCount(Map<String, Object> map) {
			    int totalCount = 0;
			    String query = "select count(*) from board_comment where qid = ?";
			    System.out.println(map.get("qid"));
			    try {
			        psmt = con.prepareStatement(query);
			        psmt.setObject(1, map.get("qid"));
		
			        rs = psmt.executeQuery();
			        rs.next();
			        totalCount = rs.getInt(1);
			    } catch (SQLException e) {
			        e.printStackTrace();
			    }
			    return totalCount;
			}
			
			//검색 조건에 맞는 게시물 목록을 반환
			public List<CommentDTO> selectListPage(Map<String, Object> map) {
				List<CommentDTO> board = new ArrayList<>();
				String query ="select * from board_comment where qID = ? order by comID desc";
				try {
					psmt = con.prepareStatement(query);
					psmt.setString(1, map.get("qid").toString());
					rs = psmt.executeQuery();
					//게시물 목록을 list 컬렉션에 추가
					while(rs.next()) {
						CommentDTO dto = new CommentDTO();
						dto.setComID(rs.getString(1));					
						dto.setqID(rs.getString(2));					
						dto.setmID(rs.getString(3));
						dto.setComDate(rs.getString(4));						
						dto.setComContent(rs.getString(5));										
						board.add(dto);
					}
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				return board;
			}			 
			//게시글 추가하기
			public int insertWrite(CommentDTO dto) {
				int result = 0;
				String query = "insert into board_comment(comID, qID, mID, comDate, comContent)"						
						+ " values(com_seq_num.nextval,?,?,sysdate,?)";							
				try {
					psmt = con.prepareStatement(query);									
					psmt.setString(1, dto.getqID());
					psmt.setString(2, dto.getmID());		
					psmt.setString(3, dto.getComContent());											
					result = psmt.executeUpdate();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				return result;
			}
					
			//게시물 삭제하기
			public int deletePost(String comID) {
				int result = 0;
				String query = "delete from board_comment where comID =?";
				System.out.println("게시글 번호 입니다 : " +comID);
				try {
					psmt = con.prepareStatement(query);
					psmt.setString(1, comID);
					result = psmt.executeUpdate();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}		
				return result;
			}
			
			//게시물 수정하기
			public int updatePost(CommentDTO dto) {
				int result = 0;
				String query = "update board_comment set comContent=? where comID=?";
				try {
					psmt = con.prepareStatement(query);
					psmt.setString(1, dto.getComContent());
					psmt.setString(2, dto.getComID());				
					//쿼리문 실행
					result = psmt.executeUpdate();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				return result;
			}
}
