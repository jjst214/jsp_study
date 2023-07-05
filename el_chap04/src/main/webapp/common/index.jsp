<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="board.BoardDTO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="board.BoardDAO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="link.jsp"></jsp:include>
<%
	
	Map<String, Object> param = new HashMap<String,Object>();
	String searchField = request.getParameter("searchField");
	String searchWord = request.getParameter("searchWord");
	if(searchWord != null){
		param.put("searchField", searchField);
		param.put("searchWord", searchWord);
	}
	BoardDAO dao = new BoardDAO(application);
	List<BoardDTO> boardlist = dao.selectlist(param);
	dao.close();
	if(session.getAttribute("UserName") != null){
%>
	<%=session.getAttribute("UserName") %>님 로그인하셨습니다.
	<a href="logout_process.jsp">로그아웃</a>
<% 
	}
	else {
		out.println("로그인전입니다.");
	}
%>
	사이트에 오신것을 환영합니다.
	<h2>목록 보기</h2>
	<div>
	<form method="get">
		<select name="searchField">
			<option value="title">제목</option>
			<option value="content">내용</option>
		</select>
		<input type="text" name="searchWord"/>
		<input type="submit" value="검색하기" />
		</form>
	</div>
	<table>
		<tr>
			<td>번호</td>
			<td>제목</td>
			<td>작성자</td>
			<td>조회수</td>
			<td>작성일</td>
		</tr>
		<%
		if(boardlist.isEmpty()){
		%>
		<tr>
			<td colspan="5">게시글이 없습니다.</td>
		</tr>
		<% 	
		}else {
			out.println("Aaa");
			for(BoardDTO dto : boardlist){
				%>
				<tr>
					<td><%= dto.getNum() %></td>
					<td><%= dto.getTitle() %></td>
					<td><%= dto.getId() %></td>
					<td><%= dto.getVisitcount() %></td>
					<td><%= dto.getPostdate() %></td>
				</tr>
				<%
				
			}
		
		}
		%>
	</table>
</body>
</html>