package member;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import common.JDBCConnect;

public class MemberDAO extends JDBCConnect{
	
	//아이디와 패스워드에 일치하는 회원정보를 반환
	public MemberDTO getMemberDTO(String id, String pass) {
		MemberDTO dto = new MemberDTO();
		String sql = "select * from member where id = ? and pass = ?";
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, id);
			psmt.setString(2, pass);
			rs = psmt.executeQuery();
			if(rs.next()) {
				dto.setId(rs.getString("id"));
				dto.setPass(rs.getString("pass"));
				dto.setName(rs.getString("name"));
				dto.setRegidate(rs.getString("regidate"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return dto;
	}
	//회원추가하기
	public int insertMember(MemberDTO dto) {
		int inResult = 0;
		String sql = "insert into member values(?, ?, ?, sysdate)";
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, dto.getId());
			psmt.setString(2, dto.getPass());
			psmt.setString(3, dto.getName());
			inResult = psmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return inResult;
	}
	//회원목록 반환
	public List<MemberDTO> getMemberlist(){
		List<MemberDTO> memberList = new ArrayList<MemberDTO>();
		String sql = "select * from member";
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			while(rs.next()) {
				MemberDTO dto = new MemberDTO();
				dto.setId(rs.getString("id"));
				dto.setPass(rs.getString("pass"));
				dto.setName(rs.getString("name"));
				dto.setRegidate(rs.getString("regidate"));
				memberList.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return memberList;
	}
}
