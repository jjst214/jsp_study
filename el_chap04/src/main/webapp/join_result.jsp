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
	<%
		JDBCConnect jdbc = new JDBCConnect();
		Statement stmt = jdbc.con.createStatement();
		String sql = "select id, pass, name, regidate from member";
		
		ResultSet rs = stmt.executeQuery(sql);
		%>
		<h2>회원 목록</h2>
		<%
		while(rs.next()){
			
			String id = rs.getString(1);
			String pw = rs.getString(2);
			String name = rs.getString("name");
			Date regidate = rs.getDate("regidate");
			%>
			<p>아이디 : <%=id %> / 비밀번호 : <%=pw %> / 닉네임 : <%=name %> / 가입일자 : <%=regidate %></p>
			<%
		}
		jdbc.close();
	%>
</body>
</html>