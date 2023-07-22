package mvc_con;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import common.JDBCConnect;

public class OrdersDAO extends JDBCConnect {
	//주문추가
	public int insertOrders(OrdersDTO dto) {
		int result = 0;
		String sql = "insert into orders values(seq_oid.nextval, ?, sysdate, ?, ?, ?, ?, ?, ?)";
		
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, dto.getMid());
			psmt.setString(2, dto.getOname());
			psmt.setString(3, dto.getOphone());
			psmt.setString(4, dto.getOaddress());
			psmt.setString(5, dto.getOpost());
			psmt.setString(6, dto.getOamount());
			psmt.setString(7, dto.getOpayment());
			
			result = psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	//주문내역리스트
	public List<OrdersDTO> orderLists(String mid){
		List<OrdersDTO> lists = new ArrayList<>();
		String sql = "select * from orders where mid=?";
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, mid);
			rs = psmt.executeQuery();
			while(rs.next()) {
				OrdersDTO dto = new OrdersDTO();
				dto.setOid(rs.getString(1));
				dto.setMid(rs.getString(2));
				dto.setOrdate(rs.getString(3));
				dto.setOname(rs.getString(4));
				dto.setOphone(rs.getString(5));
				dto.setOaddress(rs.getString(6));
				dto.setOpost(rs.getString(7));
				dto.setOamount(rs.getString(8));
				dto.setOpayment(rs.getString(9));
				lists.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return lists;
	}
}
