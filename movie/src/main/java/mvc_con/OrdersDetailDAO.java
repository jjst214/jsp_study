package mvc_con;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import common.JDBCConnect;

public class OrdersDetailDAO extends JDBCConnect {
	//주문정보 조회
	public OrdersDetailDTO orderItem(String oid){
		String sql = "select * from orders_detail where oid=?";
		OrdersDetailDTO dto = new OrdersDetailDTO();
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, oid);
			rs = psmt.executeQuery();
			if(rs.next()) {
				dto.setOdid(rs.getString(1));
				dto.setOid(rs.getString(2));
				dto.setPid(rs.getString(3));
				dto.setOdqty(rs.getString(4));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return dto;
	}
	//주문상세 저장
	public int addOrderDetail(String pid, String qty) {
		int result = 0;
		String sql = "insert into orders_detail values(seq_odid.nextval, (select max(oid) from orders), ?, ?)";
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, pid);
			psmt.setString(2, qty);
			
			result = psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
}
