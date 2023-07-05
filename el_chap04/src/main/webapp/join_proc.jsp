<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
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
		String uid = request.getParameter("uid");
		String upw = request.getParameter("upw");
		String name = request.getParameter("name");
		String sql = "insert into member values(?,?,?, sysdate)";
		
		PreparedStatement psmt = jdbc.con.prepareStatement(sql);
		psmt.setString(1, uid);
		psmt.setString(2, upw);
		psmt.setString(3, name);
		psmt.executeUpdate();
		
		jdbc.close();
		
		response.sendRedirect("join_result.jsp");
	%>
</body>
</html>