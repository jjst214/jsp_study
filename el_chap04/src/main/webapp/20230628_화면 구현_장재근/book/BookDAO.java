package book;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class BookDAO extends JDBCConnect {
	
	/* --------------------DAO 미완성--------------------*/
	
	//데이터 베이스 연결이 완료된 객체 생성
	public BookDAO(String driver, String url, String id, String pwd) {
		super(driver, url, id, pwd);
	}
	//사용자가 입력한 아이디/패스워드와 일치하는 회원정보를 반환
	public List<BookDTO> getBooks() {
		List<BookDTO> list = new ArrayList<>();
		
		String sql = "select book_no,title,author,publisher,price,pub_date from books";
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			
			while(rs.next()){
				BookDTO dto = new BookDTO();
				dto.setBook_no(rs.getInt(1));;
				dto.setTitle(rs.getString(2));
				dto.setAuthor(rs.getString(3));
				dto.setPublisher(rs.getString(4));
				dto.setPrice(rs.getInt(5));
				dto.setPub_date(rs.getString(6));
				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public int insert_book(String title, String author, String publisher, int price, String pub_date) {
		String sql = "insert into books values(seq_book_num.nextval, ?, ?, ?, ?, ?)";
		int result = 0;
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, title);
			psmt.setString(2, author);
			psmt.setString(3, publisher);
			psmt.setInt(4, price);
			psmt.setString(5, pub_date);
			result = psmt.executeUpdate();
			
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
}
