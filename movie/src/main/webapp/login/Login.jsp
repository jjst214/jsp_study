<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header/header.jsp" %>

<div class="sign-in inner">
	<h2>LOGIN</h2>
	<form action="${pageContext.request.contextPath }/member/login.do" method="post">
		<div>
			<table>
				<tr>
					<td><input type="text" name="id" id="id" placeholder="아이디"></td>
				</tr>
				<tr>
					<td><input type="password" name="pwd" id="pwd" placeholder="비밀번호"></td>
				</tr>
			</table>
			<button type="submit">로그인</button>
			<ul>
				<li><a href="${pageContext.request.contextPath }/member/join.do">회원가입</a></li>
				<li><a href="#">아이디찾기</a></li>
				<li><a href="#">비밀번호찾기</a></li>
			</ul>
		</div>
	</form>
</div>

<%@ include file="../footer/footer.jsp"%>