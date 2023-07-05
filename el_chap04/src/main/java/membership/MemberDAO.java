package membership;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;

import common.JDBCConnect;

public class MemberDAO extends JDBCConnect {
	public MemberDAO(String driver, String url, String id, String pw) {
		super(driver, url, id, pw);
	}
	public MemberDAO(ServletContext application) {
		super(application);
	}
	//명시한 아이디/패스워드와 일치하는 회원정보를 반환하기
	public MemberDTO getMemberDTO(String id, String pw) {
		MemberDTO dto = new MemberDTO();
		String query = "select * from member where id=? and pass=?";
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, id);
			psmt.setString(2, pw);
			rs = psmt.executeQuery();
			if(rs.next()) {
				dto.setId(rs.getString("id"));
				dto.setPass(rs.getString("pass"));
				dto.setName(rs.getString("name"));
				dto.setRegidate(rs.getString("regidate"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return dto;
	}
	//멤버목록 반환하기
	public List<MemberDTO> getMemberList(){
		List<MemberDTO> memberlist = new ArrayList<MemberDTO>();
		String query = "select * from member";
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(query);
			while(rs.next()) {
				MemberDTO dto = new MemberDTO();
				dto.setId(rs.getString("id"));
				dto.setName(rs.getString("name"));
				dto.setPass(rs.getString("pass"));
				dto.setRegidate(rs.getString("regidate"));
				memberlist.add(dto);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return memberlist;
	}
	//멤버목록 추가하기
	public int insertMember(MemberDTO dto) {
		int result = 0;
		String query = "insert into member(id, pass, name, regidate) values(?,?,?,sysdate)";
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, dto.getId());
			psmt.setString(2, dto.getPass());
			psmt.setString(3, dto.getName());
			result = psmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}
}

