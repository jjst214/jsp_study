package mvc_con;

import java.sql.SQLException;
import java.util.ArrayList;

import common.JDBCConnect;

public class OrdersDAO extends JDBCConnect {
	public int insertOrders(ArrayList<String> list) {
		
		int result = 0;
		
		if(!list.isEmpty()) {
			for(String a:list) {
				String sql = "insert into orders(oid, mid, ordate, oname, ophone, oaddress, opost, oamount, opayment)"
						+ " values(seq_oid.nextval, ?, ?, ?, ?, ?, ?, ?, ?)";
				try {
					psmt = con.prepareStatement(sql);
					psmt.setString(1, a);
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		
		
		return result;
	}
}
