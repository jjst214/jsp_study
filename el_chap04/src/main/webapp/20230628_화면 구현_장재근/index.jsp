<%@page import="java.util.List"%>
<%@page import="book.BookDTO"%>
<%@page import="java.util.Date"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="book.BookDAO"%>
<%@page import="book.JDBCConnect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="include/header.jsp" %>
<%
	
%>
<div id="wrap">
	<div id="content">
		<h3><a href="index.jsp">도서목록</a></h3>
		<table id="list">
			<tbody>
				<tr>
					<td>번호</td>
					<td>제목</td>
					<td>작가</td>
					<td>출판사</td>
					<td>가격</td>
					<td>출판날짜</td>
				</tr>
			
			<%
				request.setCharacterEncoding("utf-8");
				String oracleDriver = application.getInitParameter("OracleDriver");
				String oracleURL = application.getInitParameter("OracleURL");
				String oracleId = application.getInitParameter("OracleId");
				String oraclePw = application.getInitParameter("OraclePwd");
				BookDAO dao = new BookDAO(oracleDriver, oracleURL, oracleId, oraclePw);
				BookDTO dto = new BookDTO();
				for(BookDTO a:dao.getBooks()){
					out.println(String.format("<tr><td>%d</td> <td>%s</td> <td>%s</td> <td>%s</td> <td>%d</td> <td>%s</td></tr>",
							a.getBook_no(), a.getTitle(), a.getAuthor(), a.getPublisher(), a.getPrice(), a.getPub_date()));
				}
				dao.close();
			%>
			</tbody>
		</table>
	</div>
</div>
<%@ include file="include/footer.jsp"%>