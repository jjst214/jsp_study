package mvc_con;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import common.JDBCConnect;

public class ListDAO extends JDBCConnect {
	
	public List<ProductDTO> selectListPage(String type){
		List<ProductDTO> list = new ArrayList<>();
		if(type.equals("new")) {
			String sql = "select * from (select Tb.*, rownum rNum from ("
					+ "select * from product";
			sql += " order by prdate desc) Tb) where rNum between 1 and 5";
			try {
				stmt = con.createStatement();
				rs = stmt.executeQuery(sql);
				//게시물 목록을 list컬렉션에 추가
				while(rs.next()) {
					ProductDTO dto = new ProductDTO();
					dto.setPid(rs.getString("pid"));
					dto.setPname(rs.getString("pname"));
					dto.setPprice(rs.getString("pprice"));
					dto.setPimage(rs.getString("pimage"));
					list.add(dto);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}else if(type.equals("best")) {
			String sql = "select * from (select Tb.*, rownum rNum from ("
					+ "select * from product";
			sql += " order by psell desc) Tb) where rNum between 1 and 6";
			try {
				stmt = con.createStatement();
				rs = stmt.executeQuery(sql);
				//게시물 목록을 list컬렉션에 추가
				while(rs.next()) {
					ProductDTO dto = new ProductDTO();
					dto.setPid(rs.getString("pid"));
					dto.setPname(rs.getString("pname"));
					dto.setPprice(rs.getString("pprice"));
					dto.setPimage(rs.getString("pimage"));
					list.add(dto);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return list;
	}
}
