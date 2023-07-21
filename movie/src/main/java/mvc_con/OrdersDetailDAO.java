package mvc_con;

import java.util.ArrayList;
import java.util.List;

import common.JDBCConnect;

public class OrdersDetailDAO extends JDBCConnect {
	//주문정보 조회
	public List<OrdersDTO> orderList(String mid){
		String sql = "select * from orders where mid";
		OrdersDTO dto = new OrdersDTO();
		List<OrdersDTO> list = new ArrayList<>();
		return list;
	}
}
