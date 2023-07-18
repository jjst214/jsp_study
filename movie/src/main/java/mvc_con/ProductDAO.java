package mvc_con;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import common.JDBCConnect;

public class ProductDAO extends JDBCConnect {
	//상품 정보 조회
	public ProductDTO selectProduct(String pid) {
		ProductDTO dto = new ProductDTO();
		String sql = "select * from product where pid=?";
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, pid);
			rs = psmt.executeQuery();
			if(rs.next()) {
				dto.setPid(rs.getString(1));
				dto.setPname(rs.getString(2));
				dto.setPprice(rs.getString(3));
				dto.setPstock(rs.getString(4));
				dto.setPimage(rs.getString(5));
				dto.setPdetail(rs.getString(6));
				dto.setPrdate(rs.getString(7));
				dto.setPhit(rs.getString(8));
				dto.setPsell(rs.getString(9));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return dto;
	}
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
		String sql = "delete from product where pid=?";
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, pid);
			result = psmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return result;
	}
	//상품수정
	public int editProduct(ProductDTO dto) {
		String sql = "update product set pname = ?, pprice = ?, pstock = ?, pimage = ?, pdetail = ? where pid = ?";
		int result = 0;
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, dto.getPname());
			psmt.setString(2, dto.getPprice());
			psmt.setString(3, dto.getPstock());
			psmt.setString(4, dto.getPimage());
			psmt.setString(5, dto.getPdetail());
			psmt.setString(6, dto.getPid());
			result = psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	//검색 조건에 맞는 게시글의 개수 반환하기
	public int selectCount(Map<String, Object> map) {
		int totalCount = 0;
		//게시물 수를 얻어오는 쿼리작성
		String sql = "select count(*) from product";
		//검색 요청이 있을경우 where조건 추가
		if(map.get("searchWord") != null) {
			sql += " where " + map.get("searchField") + " like '%"
					+ map.get("searchWord") + "%'";
		}
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			rs.next();
			totalCount = rs.getInt(1);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return totalCount;
	}
	//검색 & 게시판 글 불러오기
	public List<ProductDTO> getBoardList(Map<String, Object> map){
		List<ProductDTO> plist = new ArrayList<>();
		String sql = "select * from("
				+ "select Tb.*, rownum rnum from ("
				+ "select * from product ";
		if(map.get("searchWord") != null) {
			sql += " where " + map.get("searchField") + " like '%"
					+ map.get("searchWord") + "%'";
		}
		sql += " order by pid desc) Tb"
				+ ") where rnum between ? and ?";
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, map.get("start").toString());
			psmt.setString(2, map.get("end").toString());
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				ProductDTO dto = new ProductDTO();
				dto.setPid(rs.getString(1));
				dto.setPname(rs.getString(2));
				dto.setPprice(rs.getString(3));
				dto.setPstock(rs.getString(4));
				dto.setPimage(rs.getString(5));
				dto.setPdetail(rs.getString(6));
				dto.setPrdate(rs.getString(7));
				dto.setPhit(rs.getString(8));
				dto.setPsell(rs.getString(9));
				plist.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return plist;
	}
}
