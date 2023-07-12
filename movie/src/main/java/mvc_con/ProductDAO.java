package mvc_con;

import java.sql.SQLException;

import common.JDBCConnect;

public class ProductDAO extends JDBCConnect {
	//상품등록
	public int addProduct(ProductDTO dto) {
		int result = 0;
		String sql = "insert into product(pid,pname,pprice,pstock,pimage,pdetail)"
				+ " values(seq_pid.nextval, ?, ?, ?, ?, ?)";
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, dto.getPname());
			psmt.setString(2, dto.getPprice());
			psmt.setString(3, dto.getPstock());
			psmt.setString(4, dto.getPimage());
			psmt.setString(5, dto.getPdetail());
			result = psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return result;
	}
	//상품삭제
	public int delProduct(String pid) {
		int result = 0;
		
		return result;
	}
}
