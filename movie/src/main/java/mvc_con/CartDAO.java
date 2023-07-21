package mvc_con;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import common.JDBCConnect;

public class CartDAO extends JDBCConnect {
	public int insertCart(String mid, String pid, String count) {
		int result = 0;
		String sql = "insert into cart values(seq_cid.nextval,"+mid+","+pid+","+count+"";
		try {
			stmt = con.createStatement();
			result = stmt.executeUpdate(sql);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	//카트에 담긴 주문목록 가져오기
	public List<CartDTO> selectCartList(String mid){
		List<CartDTO> list = new ArrayList<>();
		
		String sql = "select * from cart where mid='"+mid+"'";
		System.out.println(sql);
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
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
}
