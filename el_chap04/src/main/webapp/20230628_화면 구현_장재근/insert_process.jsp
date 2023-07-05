<%@page import="book.BookDAO"%>
<%@page import="java.util.Date"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="book.JDBCConnect"%>
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
		request.setCharacterEncoding("utf-8");
		String oracleDriver = application.getInitParameter("OracleDriver");
		String oracleURL = application.getInitParameter("OracleURL");
		String oracleId = application.getInitParameter("OracleId");
		String oraclePw = application.getInitParameter("OraclePwd");
		BookDAO dao = new BookDAO(oracleDriver, oracleURL, oracleId, oraclePw);
		
		String title = request.getParameter("title");
		String author = request.getParameter("author");
		String publisher = request.getParameter("publisher");
		int price = Integer.parseInt(request.getParameter("price"));
		String pub_date = request.getParameter("pub_date");
		
		dao.insert_book(title, author, publisher, price, pub_date);
		response.sendRedirect("index.jsp");
	%>
</body>
</html>