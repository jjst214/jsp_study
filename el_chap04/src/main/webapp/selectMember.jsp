<%@page import="java.util.Date"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="common.JDBCConnect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>회원목록 조회 테스트</h2>
	<%
		//DB연결
		JDBCConnect jdbc = new JDBCConnect();
		//쿼리문 생성
		String sql = "select id, pass, name, regidate from member";
		Statement stmt = jdbc.con.createStatement();
		//쿼리수행
		ResultSet rs = stmt.executeQuery(sql);
		//결과 확인
		while(rs.next()){
			String id = rs.getString(1);
			String pw = rs.getString(2);
			String name = rs.getString("name");
			Date regidate = rs.getDate("regidate");
			out.println(String.format("%s %s %s %s", id, pw, name, regidate) + "<br>");
		}
		jdbc.close();
	%>
</body>
</html>