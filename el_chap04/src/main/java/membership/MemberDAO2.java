package membership;

import java.sql.SQLException;

import common.JDBCConnect;

public class MemberDAO2 extends JDBCConnect{
	public MemberDAO2(String drv, String url, String id, String pw) {
		super(drv, url, id, pw);
	}
	
	public MemberDTO2 getMemberDAO2(String userId, String userPw) {
		MemberDTO2 dto = new MemberDTO2();
		String sql = "select * from member where id=? and pass=?";
		
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, userId);
			psmt.setString(2, userPw);
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				dto.setId(rs.getString("id"));
				dto.setPw(rs.getString("pass"));
				dto.setName(rs.getString("name"));
				dto.setRegidate(rs.getString(4));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return dto;
	}
}
