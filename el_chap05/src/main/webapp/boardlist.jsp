
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="board.BoardDTO"%>
<%@page import="java.util.List"%>
<%@page import="board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//사용자가 입력한 검색 조건을 Map에 저장
	Map<String, Object> param = new HashMap<>();
	String searchField = request.getParameter("searchField");
	String searchWord = request.getParameter("searchWord");
	if(searchWord != null){
		param.put("searchField", searchField);
		param.put("searchWord", searchWord);
	}
	
	
	BoardDAO dao = new BoardDAO();
	List<BoardDTO> list = dao.getBoardList(param); 
	dao.close();
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="common/link.jsp"/>
	<h2>글 목록</h2>
	<div>
		<form method="get">
			<select name="searchField">
				<option value="title">제목</option>
				<option value="content">내용</option>
			</select>
			<input type="text" name="searchWord"/>
			<input type="submit" value="검색"/>
		</form>
	</div>
	<table>
		<tr>
			<td>글번호</td>
			<td>제목</td>
			<td>아이디</td>
			<td>게시일자</td>
			<td>조회수</td>
		</tr>
	<%
	if(list.isEmpty()){
		%>
		<tr>
			<td colspan="6">글이 존재하지 않습니다.</td>
		</tr>
		<%
	}else{
		for(BoardDTO dto:list){
		%>
		<tr>
			<td><%=dto.getNum() %></td>
			<td><a href="boardView.jsp?num=<%=dto.getNum()%>"><%=dto.getTitle() %></a></td>
			<td><%=dto.getId() %></td>
			<td><%=dto.getPostdate() %></td>
			<td><%=dto.getVisitcount() %></td>
		</tr>
		<%
		}
	}
	%>
	</table>
	<div>
		<button onclick="location.href='boardwrite.jsp'">글쓰기</button>
	</div>
	<div>
		
	</div>
	
</body>
</html>