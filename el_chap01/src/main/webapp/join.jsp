<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	function check(){
		let email = document.f;
		if(f.email[0].selected){
			alert('다시');
			return false;
		}
		return true;
	}
</script>
<style>
	*{margin:0; padding:0; box-sizing:none;}
	#join{
		width:900px;
		border:2px solid #000;
	}
	li{
		width:100%;
		height:40px;
		display:flex;
		align-items:center;
	}
	li:not(:last-child){
		border-bottom:2px solid #000;
	}
	li span{
		padding:0 5px;
		width:130px;
		height:40px;
		line-height:40px;
		border-right:2px solid #000;
	}
	input{
		margin: 0 5px;
		height:20px;
	}
	select{
		margin:0 5px;
	}
	button{
		margin:0 5px;
		height:30px;
		padding:3px;
	}
</style>
</head>
<body>
	<jsp:include page="join_header.jsp" flush="false"/>
	<form action="join_process.jsp" method="post" id="f">
		<ul id="join">
			<li><span>이름</span><input type="text" name="name"></li>
			<li><span>아이디</span><input type="text" name="uid"></li>
			<li><span>비밀번호</span><input type="text" name="upw"></li>
			<li><span>비밀번호확인</span><input type="text" name="upw_chk"></li>
			<li><span>이메일</span><input type="text" name="email">@
				<select name="email_com">
					<option value="none" selected>선택</option>
					<option>naver.com</option>
					<option>daum.com</option>
					<option>google.com</option>
				</select>
			</li>
			<li><span>생년월일</span>
				<select name="year">
					<option value="1990" selected>1990</option>
					<option value="1991">1991</option>
					<option value="1992">1992</option>
					<option value="1993">1993</option>
					<option value="1994">1994</option>
					<option value="1995">1995</option>
					<option value="1996">1996</option>
					<option value="1997">1997</option>
					<option value="1998">1998</option>
					<option value="1999">1999</option>
				</select> - 
				<select name="month">
					<option value="none" selected>월</option>
					<option value="1">1</option>
					<option value="2">2</option>
					<option value="3">3</option>
					<option value="4">4</option>
					<option value="5">5</option>
					<option value="6">6</option>
					<option value="7">7</option>
					<option value="8">8</option>
					<option value="9">9</option>
					<option value="10">10</option>
					<option value="11">11</option>
					<option value="12">12</option>
				</select> - 
				<select name="day">
					<option value="none" selected>일</option>
					<option value="1">1</option>
					<option value="2">2</option>
					<option value="3">3</option>
					<option value="4">4</option>
					<option value="5">5</option>
					<option value="6">6</option>
					<option value="7">7</option>
					<option value="8">8</option>
					<option value="9">9</option>
					<option value="10">10</option>
				</select>
			</li>
			<li><span>휴대폰번호</span>
				<select name="phone1">
					<option value="none">선택</option>
					<option value="010">010</option>
					<option value="011">011</option>
					<option value="017">017</option>
				</select>-
				<input type="text" name="phone2">-
				<input type="text" name="phone3">
				<button disabled name="phone_chk">인증번호 발송</button>
				<button disabled name="phone_chk_re">인증번호 재발송</button>
			</li>
			<li><span>인증번호 입력</span><input type="text" name="phone_chk_value">
			<button type="submit" name="val_chk" onsubmit="return check()">확인</button></li>
		</ul>
	</form>
</body>
</html>