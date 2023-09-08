<%@page import="qna.QnaDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/header/header.jsp" %>
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/qna.css">
<title>Q&A 게시판</title>
<body>
	<h2>Q&A 게시판</h2>
	<div class="inner" id="board-tb-div">
		<!-- 목록 테이블 -->
		<table class="inner" id="boardTable" border="1">
			<tr>
				<td>번호</td>
				<td>카테고리</td>
				<td>제목</td>
				<td>작성자</td>
				<td>작성일</td>
				<td>조회수</td>
			</tr>
			<c:choose>
				<c:when test="${empty boardlists}">
				<tr>
					<td colspan="6">등록된 게시물이 없습니다</td>
				</tr>
				</c:when>
				<c:otherwise>
					<c:forEach items="${boardlists}" var="row" varStatus="loop">
					<tr>
						<td>${row.qID}</td>										
							<c:if test="${row.qCATE eq '1'}">
								<td>[상품]</td>							
							</c:if>
							<c:if test="${row.qCATE eq '2' }">
								<td>[교환/환불]</td>							
							</c:if>
							<c:if test="${row.qCATE eq '3' }">
								<td>[사이트이용]</td>							
							</c:if>
							<c:if test="${row.qCATE eq '4'}">
								<td>[기타]</td>							
							</c:if>
						<td><a href="view.do?qID=${row.qID}">${row.qTITLE}</a></td>
						<td>${row.mID}</td>
						<td>${row.qRDATE}</td>
						<td>${row.qHIT}</td>
					</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</table>
	</div>
	<div class="inner" id="qna-search">
		<form method="get">
			<select name="searchField">
				<option value="title">제목</option>
				<option value="content">내용</option>
			</select>
			<input name="searchWord" type="text" />
			<input type="submit" value="검색">
			<button type="button" onclick="isLogin(event)">글쓰기</button>
		</form>
	</div>
	
	<div class="inner" id="qna-paging">
		${map.pagingStr}		
	</div>
	<%@ include file="../footer/footer.jsp"%>
</body>
<script>
	function isLogin(e){
		e.preventDefault();
		//모든 이벤트 중지 후 로그인된 유저인지 판별하기 위해 세션값 획득
		let session = "<%=sessionId%>";
		if(session == "null"){
			alert("글 작성은 로그인 후 이용 가능합니다.");
			location.href="${pageContext.request.contextPath }/member/login.do";
		}else{
			location.href="${pageContext.request.contextPath }/qna/QnaWrite.do";
		}
	}
</script>
</html>