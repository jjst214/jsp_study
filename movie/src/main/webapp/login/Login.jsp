<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header/header.jsp" %>

<div>
	<h2>로그인 페이지</h2>
	<form action="${pageContext.request.contextPath }/member/login.do" method="post">
		<table>
			<tr>
				<td>아이디</td>
				<td><input type="text" name="id" id="id"></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="pwd"></td>
			</tr>
		</table>
		<button type="submit">로그인</button>
	</form>
</div>

<%@ include file="../footer/footer.jsp"%>