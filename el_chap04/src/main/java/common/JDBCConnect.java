package common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletContext;

public class JDBCConnect {
	public Connection con;
	public Statement stmt;
	public PreparedStatement psmt;
	public ResultSet rs;
	
	//첫 번째 생성자
	public JDBCConnect() {
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			String id = "green";
			String pw = "1234";
			con = DriverManager.getConnection(url, id, pw);
			System.out.println("DB 연결 성공 : 첫번째 생성자");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	//두 번째 생성자
	public JDBCConnect(String driver, String url, String id, String pwd) {
		try {
			// JDBC 드라이버 로드
			Class.forName(driver);
			// DB에 연결
			con = DriverManager.getConnection(url,id,pwd);
			System.out.println("DB 연결 성공 : 두번째 생성자");
		}
		catch (Exception e) {
			e.printStackTrace();
		}
	}
	//세 번째 생성자
	public JDBCConnect(ServletContext application) {
		String driver = application.getInitParameter("OracleDriver");
		String url = application.getInitParameter("OracleURL");
		String id = application.getInitParameter("OracleId");
		String pwd = application.getInitParameter("OraclePwd");
		try {
			// JDBC 드라이버 로드
			Class.forName(driver);
			// DB에 연결
			con = DriverManager.getConnection(url,id,pwd);
			System.out.println("DB 연결 성공 : 세번째 생성자");
		}
		catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void close() {
		try {
			if(rs != null) rs.close();
			if(stmt != null) stmt.close();
			if(psmt != null) psmt.close();
			if(con != null) con.close();
			System.out.println("자원회수");
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}

