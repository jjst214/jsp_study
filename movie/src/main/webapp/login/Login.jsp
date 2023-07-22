<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header/header.jsp" %>

<div class="sign-in inner">
	<h2>LOGIN</h2>
	<form action="${pageContext.request.contextPath }/member/login.do" method="post">
		<div>
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
		</div>
	</form>
</div>

<%@ include file="../footer/footer.jsp"%>