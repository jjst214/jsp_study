package qna;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import common.JDBCConnect;

public class QnaDAO extends JDBCConnect{
	//검색 조건에 맞는 게시물의 개수 반환
		public int selectCount (Map<String, Object> map) {
			int totalCount = 0;
			String query = "select count(*) from qna";
			//검색조건이 있으며 where절 추가
			if(map.get("searchWord") != null) {
				query += "where" + map.get("searchField")+" "
						+ " like '%"+map.get("searchWord")+"%'";
			}
			try {
				stmt = con.createStatement();  //쿼리문 생성
				rs = stmt.executeQuery(query); //쿼리문 실행
				rs.next();
				totalCount = rs.getInt(1);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return totalCount;  //게시물 수를 반환
		}
		
		//검색 조건에 맞는 게시물 목록을 반환
		public List<QnaDTO> selectListPage(Map<String, Object> map) {
			List<QnaDTO> board = new ArrayList<>();
			String query = "select * from ( select Tb.*,rownum rNum from ("
					+ "select * from qna";
			//검색 조건이 있다면 where절 추가
			if(map.get("searchWord") != null) {
				query += " where " + map.get("searchField")
					+ " like '%"+map.get("searchWord")+"%'";
			}
			query += " order by qid desc "
					+" ) Tb"
					+" ) "
					+" where rNum between ? and ?";
			try {
				psmt = con.prepareStatement(query);
				psmt.setString(1, map.get("start").toString());
				psmt.setString(2, map.get("end").toString());
				rs = psmt.executeQuery();
				//게시물 목록을 list 컬렉션에 추가
				while(rs.next()) {
					QnaDTO dto = new QnaDTO();
					dto.setqID(rs.getString(1));					
					dto.setqCATE(rs.getString(2));					
					dto.setqPW(rs.getString(3));
					dto.setqTITLE(rs.getString(4));
					dto.setqCONTENT(rs.getString(5));
					dto.setqFILE(rs.getString(6));
					dto.setqRDATE(rs.getString(7));					
					dto.setmID(rs.getString(8));				
					dto.setqHIT(rs.getString(9));				
					board.add(dto);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return board;
		}
		 //게시글 상세보기
		   public QnaDTO selectView(String qid) {
			   QnaDTO dto = new QnaDTO();
		      String sql = "select * from qna where qid = ?";
		      try {
		         psmt = con.prepareStatement(sql);
		         psmt.setString(1, qid);
		         rs = psmt.executeQuery();
		         if(rs.next()) {
		        	dto.setqID(rs.getString(1));					
		        	dto.setqCATE(rs.getString(2));					
					dto.setqPW(rs.getString(3));
					dto.setqTITLE(rs.getString(4));
					dto.setqCONTENT(rs.getString(5));
					dto.setqFILE(rs.getString(6));
					dto.setqRDATE(rs.getString(7));					
					dto.setmID(rs.getString(8));				
					dto.setqHIT(rs.getString(9));		
		         }
		      } catch (SQLException e) {
		         e.printStackTrace();
		      }
		      
		      return dto;
		   }
		//게시글 추가하기
		public int insertWrite(QnaDTO dto) {
			int result = 0;
			String query = "insert into qna(qid, qcate, qpw, qtitle, qcontent, "
					+ "qfile, qrdate, mid)"
					+ " values(seq_qna_num.nextval,?,?,?,?,?,sysdate,?)";
			try {
				psmt = con.prepareStatement(query);				
				psmt.setString(1, dto.getqCATE());
				psmt.setString(2, dto.getqPW());
				psmt.setString(3, dto.getqTITLE());
				psmt.setString(4, dto.getqCONTENT());				
				psmt.setString(5, dto.getqFILE());				
				psmt.setString(6, dto.getmID());				
				result = psmt.executeUpdate();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return result;
		}
		
		//레코드의 조회수를 1증가
		public void updateQhit(String qid) {		
			String query = "update qna set qhit = qhit+1"
					+ " where qid = ?";
			try {
				psmt = con.prepareStatement(query);
				psmt.setString(1, qid);
				psmt.executeUpdate();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}		
		}
		
		//입력한 비밀번호가 게시물의 비밀번호와 일치하는지 확인
		public boolean confirmPassword(String qpw, String qid) {
			boolean isCorr = true;
			String query = "select count(*) from qna"
					+ " where qpw=? and qid=?";
			System.out.println("비밀번호 : " + qpw +" | 게시글 번호 : " + qid);
			try {
				psmt = con.prepareStatement(query);
				psmt.setString(1, qpw);				
				psmt.setString(2, qid);				
				rs = psmt.executeQuery();
				rs.next();
				if(rs.getInt(1) == 0) {					
					isCorr = false;
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				isCorr = false;
				e.printStackTrace();
			}
			return isCorr;
		}
		
		//게시물 삭제하기
		public int deletePost(String qid) {
			int result = 0;
			String query = "delete from qna where qid =?";
			System.out.println("게시글 번호 입니다 : " +qid);
			try {
				psmt = con.prepareStatement(query);
				psmt.setString(1, qid);
				result = psmt.executeUpdate();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}		
			return result;
		}
		
		//게시물 수정하기
		public int updatePost(QnaDTO dto) {
			int result = 0;
			String query = "update qna set qcate=?, qtitle=?, qcontent=?"
					+ " , qfile=? where qid=? and qpw=?";
			try {
				psmt = con.prepareStatement(query);
				psmt.setString(1, dto.getqCATE());
				psmt.setString(2, dto.getqTITLE());
				psmt.setString(3, dto.getqCONTENT());
				psmt.setString(4, dto.getqFILE());
				psmt.setString(5, dto.getqID());
				psmt.setString(6, dto.getqPW());
				//쿼리문 실행
				result = psmt.executeUpdate();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return result;
		}
}
