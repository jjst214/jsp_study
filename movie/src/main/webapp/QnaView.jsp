<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ include file="/header/header.jsp" %>
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/qnaView.css">
<body>
	<h2 style="text-align:center; padding:50px 0;">상세보기</h2>
	<div class="inner" style="min-height:570px;">
		<table>
			<tr>
				<td>번호</td>
				<td>${dto.qID}</td>
				<td>작성자</td>
				<td>${dto.mID}</td>
			</tr>
			<tr>
				<td>작성일</td>
				<td>${dto.qRDATE}</td>
				<td>조회수</td>
				<td>${dto.qHIT}</td>
			</tr>
			<tr>
				<td>제목</td>
				<td colspan="3">${dto.qTITLE}</td>			
			</tr>
			<c:if test="${!empty dto.qFILE}">
				<tr>
					<td colspan="4"><img src="../uploads/${dto.qFILE}" width="600"></td>
				</tr>
			</c:if>
			<tr id="qnaContent">
				<td>내용</td>
				<td colspan="3">${dto.qCONTENT}</td>
			</tr>
			<tr>
				<td colspan="4">
					<button onclick="location.href='./pass.do?mode=edit&qID=${dto.qID}'">수정하기</button>
					<button onclick="location.href='./pass.do?mode=delete&qID=${dto.qID}'">삭제하기</button>				
					<button type="button" 
					onclick="location.href='${pageContext.request.contextPath }/qna/qna.do'">목록보기</button>
				</td>			
			</tr>
		</table>
		<table>
			<tr>
				<td colspan="2">댓글</td>			
			</tr>
			<c:choose>
				<c:when test="${empty comlists}">
				<tr>
					<td colspan="2">등록된 댓글이 없습니다</td>
				</tr>
				</c:when>
				<c:otherwise>
					<c:forEach items="${comlists}" var="com" varStatus="loop">
					<tr>
						<td>${com.mID}</td>
						<td>${com.comDate}</td>
					</tr>
					<tr>																							
						<td colspan="2">${com.comContent}</td>									
					</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</table>
		<form name="writeForm" method="post" action="${pageContext.request.contextPath }/comment/CommentWrite.do">
		<input name="qid" type="hidden" value="${dto.qID}">
		<table>
			<tr>			
				<td><textarea name="content" placeholder="댓글을 입력하세요"></textarea></td>
				<td>
					<input type="submit" value="입력">
					<input type="hidden" name="mid" value="<%= session.getAttribute("UserId") %>">
				</td>
			</tr>
		</table>
		</form>	
	</div>
	
	
	
</body>
<%@ include file="/footer/footer.jsp" %>