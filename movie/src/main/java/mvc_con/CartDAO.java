package mvc_con;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import common.JDBCConnect;

public class CartDAO extends JDBCConnect {
	//카트 추가
	public int insertCart(String mid, String pid, String count) {
		int result = 0;
		String sql = "insert into cart values(seq_cid.nextval,?,?,?)";
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, mid);
			psmt.setString(2, pid);
			psmt.setString(3, count);
			result = psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return result;
	}
	//카트물품 1개 조회(중복추가방지)
	public int cartCheck(String pid, String mid) {
		int result = 0;
		String sql = "select count(*) from cart where pid=? and mid=?";
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, pid);
			psmt.setString(2, mid);
			rs = psmt.executeQuery();
			if(rs.next()) {
				result = rs.getInt("count(*)");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	//카트에 담긴 주문목록 가져오기
	public List<CartDTO> selectCartList(String mid){
		List<CartDTO> list = new ArrayList<>();
		
		String sql = "select * from cart where mid=? order by cid";
		System.out.println(sql);
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, mid);
			rs = psmt.executeQuery();
			while(rs.next()) {
				CartDTO dto = new CartDTO();
				dto.setCid(rs.getString("cid"));
				dto.setMid(rs.getString("mid"));
				dto.setPid(rs.getString("pid"));
				dto.setCcount(rs.getString("cqty"));
				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	//카트물품삭제
	public int remove(String mid, String pid) {
		int result = 0;
		String sql = "delete from cart where pid=? and mid=?";
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, pid);
			psmt.setString(2, mid);
			result = psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
}
