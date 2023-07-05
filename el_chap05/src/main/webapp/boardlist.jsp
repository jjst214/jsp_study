
<%@page import="utils.BoardPage"%>
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
	//게시글 수 확인
	int selectCount = dao.selectCount(param);
	out.println("게시글 수는 : " + selectCount);
	//1페이지당 보여지는 게시글 수 10
	int pageSizes = 10;
	//블럭단위
	int blockPages = 5;
	//전체 페이지 수 = 전체 게시글/1페이지당 보여지는 게시글 수 --> 올림하여 정수로 리턴
	int totalPages = (int)Math.ceil((double)selectCount / pageSizes);
	//현재 페이지
	int pageNum = 1;
	//페이지 클릭 시 요청하는 값을 받아서 pageTemp에 할당
	String pageTemp = request.getParameter("pageNum");
	//pageTemp가 null이 아니거나 ""이 아닐때
	//페이지 문자를 숫자로 변환해서 pageNum에 할당
	if(pageTemp != null && !pageTemp.equals("")){
		pageNum = Integer.parseInt(pageTemp);
	}
	//게시글 페이징 10개 단위 출력
	int start = (pageNum-1)*pageSizes+1; //(현재페이지-1) * 페이지출력범위 + 1
	int end = pageNum * pageSizes; // 현재페이지 * 페이지출력범위
	param.put("start", start);
	param.put("end", end);
	
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
	<!-- 페이징 처리 -->
	<div>
		<%= BoardPage.pagingStr(selectCount, totalPages, pageSizes, 
				blockPages, pageNum, request.getRequestURI(),
				request.getParameter("searchField"),
				request.getParameter("searchWord"))%>
	</div>
</body>
</html>
