package membership;

import java.sql.SQLException;

import common.JDBCConnect;

public class MemberDAO extends JDBCConnect {
	//데이터 베이스 연결이 완료된 객체 생성
	public MemberDAO(String driver, String url, String id, String pw) {
		super(driver, url, id, pw);
	}
	//사용자가 입력한 아이디/패스워드와 일치하는 회원정보를 반환
	public MemberDTO getMemberDTO(String uid, String upw) {
		MemberDTO dto = new MemberDTO();
		String query = "select * from member where id = ? and pass = ?";
		
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, uid);
			psmt.setString(2, upw);
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				//getString(컬럼명 또는 인덱스) --> 레코드의 값들을 가지고 옴
				dto.setId(rs.getString("id"));
				dto.setPass(rs.getString("pass"));
				dto.setName(rs.getString("name"));
				dto.setRegidate(rs.getString(4));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return dto;
	}
}
