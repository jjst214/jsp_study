<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<style>
	#login_form{
		text-align:center;
		padding:200px 0;
		height:300px;
		width:100%;
		display:inline-block;
	}
	#login_form form{
		margin:0 auto;
		width:800px;
		height:300px;
		border:1px solid #ccc;
		display:flex;
		flex-direction:column;
		justify-content:center;
		align-items:center;
	}
	#login_form h2{
		height:40px;
		padding:20px 0;
	}
	#login_form span{
		display:inline-block;
		width:80px;
		margin: 0 20px;
		padding:10px 0;
	}
	#login_form p{
		text-align:right;
	}
</style>
<div id="login_form">
	<form action="login_process.jsp" method="post">
		<h2>로그인 해주세요.</h2>
		<div>
			<span>아이디</span><input type="text" name="userid"/><br>
			<span>비밀번호</span><input type="password" name="userpw"/>
			<p><button type="submit">로그인</button></p>
		</div>
	</form>
</div>

</body>
</html>