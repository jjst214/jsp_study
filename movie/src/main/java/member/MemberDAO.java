package member;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import common.JDBCConnect;

public class MemberDAO extends JDBCConnect{
	//아이디와 패스워드에 일치하는 회원정보를 반환
		public MemberDTO getMemberDTO(String id, String pass) {
			
			MemberDTO dto = new MemberDTO();
			String sql = "select * from member where mID=? and mPW=?";
			try {
				psmt = con.prepareStatement(sql);
				psmt.setString(1, id);
				psmt.setString(2, pass);
				rs = psmt.executeQuery();
				if(rs.next()) {
					dto.setmID(rs.getString("mID"));
					dto.setmPW(rs.getString("mPW"));
					dto.setmNAME(rs.getString("mNAME"));
					dto.setmADDRESS(rs.getString("mADDRESS"));
					dto.setmPOST(rs.getString("mPOST"));
					dto.setmRDATE(rs.getString("mRDATE"));
					dto.setmBIRTH(rs.getString("mBIRTH"));
					dto.setmDROP(rs.getString("mDROP"));
					dto.setmGRADE(rs.getString("mGrade"));
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
			return dto;
		}
		//회원추가하기
		public int insertMember(MemberDTO dto) {
			int result = 0;
			String sql = "insert into member(mid,mpw,mname,maddress,mpost,mphone,mbirth)"
					+ " values(?,?,?,?,?,?,?)";
			try {
				psmt = con.prepareStatement(sql);
				psmt.setString(1, dto.getmID());
				psmt.setString(2, dto.getmPW());
				psmt.setString(3, dto.getmNAME());
				psmt.setString(4, dto.getmADDRESS());
				psmt.setString(5, dto.getmPOST());
				psmt.setString(6, dto.getmPHONE());
				psmt.setString(7, dto.getmBIRTH());
				
				result = psmt.executeUpdate();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return result;
		}
		
		//회원목록 반환
		public List<MemberDTO> getMemberList() {
			List<MemberDTO> memberlist = new ArrayList<>();
			String sql = "select * from member";
			try {
				stmt = con.createStatement();
				rs = stmt.executeQuery(sql);
				while(rs.next()) {
					MemberDTO dto = new MemberDTO();
					dto.setmID(rs.getString("mID"));
					dto.setmPW(rs.getString("mPW"));
					dto.setmNAME(rs.getString("mNAME"));
					dto.setmADDRESS(rs.getString("mADDRESS"));
					dto.setmPOST(rs.getString("mPOST"));
					dto.setmRDATE(rs.getString("mRDATE"));
					dto.setmBIRTH(rs.getString("mBIRTH"));	
					dto.setmDROP(rs.getString("mDROP"));
					memberlist.add(dto);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return memberlist;
		}
					
		public int joinIdCheck(String id){
			int result = 1;
			try {
				
				//2. sql 구문 & pstmt생성
				String sql = "select mid from member where mid=?";
				psmt = con.prepareStatement(sql);
				psmt.setString(1, id);

				//3. 실행 -> select -> rs저장
				rs = psmt.executeQuery();

				//4. 데이터처리

				if(rs.next()){	
					result = 0;
				}else{
					result = 1;
				}

				System.out.println("아이디 중복체크결과 : "+result);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				close();
			}
			return result;
		}//joinIdCheck 메서드
}
