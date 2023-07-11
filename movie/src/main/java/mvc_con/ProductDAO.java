package mvc_con;

import java.sql.SQLException;

import common.JDBCConnect;

public class ProductDAO extends JDBCConnect {
	//상품등록
	public int addProduct(ProductDTO dto) {
		int result = 0;
		String sql = "insert into product(pid,pname,pprice,pstock,pimage1,pimage2,pdetail)"
				+ " values(seq_pid.nextval, ?, ?, ?, ?, ?, ?)";
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, dto.getPname());
			psmt.setString(2, dto.getPprice());
			psmt.setString(3, dto.getPstock());
			psmt.setString(4, dto.getPimage1());
			psmt.setString(5, dto.getPimage2());
			psmt.setString(6, dto.getPdetail());
			result = psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return result;
	}
}
