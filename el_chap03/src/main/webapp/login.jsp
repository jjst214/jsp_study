<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
	*{margin:0; padding:0; box-sizing:none}
	li{list-style:none}
	a{text-decoration:none; color:black;}
	#login_form{
		margin:0 auto;
		width:100%;
		max-width:1200px;
		height:500px;
		display:flex;
		flex-direction:column;
		justify-content:center;
		align-items:center;
	}
	#login_form p{
		width:300px;
		height:40px;
		padding:auto 0;
	}
	#login_form span{
		display:inline-block;
		width:100px;
		margin-right:20px;
	}
	#log_form{
		display:flex;
		flex-direction:column;
		justify-content:center;
		align-items:center;
	}
	#sub_btn{
		width:60px;
		height:30px;
	}
	h2{
		margin-bottom:15px;
	}
</style>
<%@include file="header.jsp" %>
<div id="login_form">
	<h2>로그인페이지입니다.</h2>
	<form action="login_process.jsp" method="post" id="log_form">
		<p><span>아이디</span><input type="text" name="uid"/></p>
		<p><span>비밀번호</span><input type="password" name="upw"/></p>
		<button type="submit" id="sub_btn">로그인</button>
	</form>
</div>
</body>
</html>