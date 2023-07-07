package common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class JDBCConnect {
	//필드선언
	public Connection con;	//db 연결담당
	public Statement stmt;	//정적쿼리(?가 없는쿼리문) 처리담당
	public PreparedStatement psmt; //동적쿼리 처리담당
	public ResultSet rs;	//select문 결과를 저장
	
	//기본생성자
	public JDBCConnect() {
		try {
			//JDBC드라이버 로드
			Class.forName("oracle.jdbc.OracleDriver");
			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			String id = "green";
			String pwd = "1234";
			con = DriverManager.getConnection(url, id, pwd);
			System.out.println("DB 연결 성공");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	//연결해제
	public void close() {
		try {
			if(rs != null) rs.close();
			if(stmt != null) stmt.close();
			if(psmt != null) psmt.close();
			if(con != null) con.close();
			System.out.println("JDBC 연결 해제");
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
