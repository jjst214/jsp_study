<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>폼 값 전송하기</h2>
	<form action="formResult.jsp" method="post">
		<p>이름 : <input type="text" name="name"/></p>
		<p>성별 : 
			<input type="radio" name="gender" value="Man"/>남자
			<input type="radio" name="gender" value="Woman"/>여자
		</p>
		<p>
			관심사항 :
			<input type="checkbox" name="inter" value="pol"/>정치
			<input type="checkbox" name="inter" value="eco"/>경제
			<input type="checkbox" name="inter" value="ent"/>연예
			<input type="checkbox" name="inter" value="spo"/>스포츠
		</p>
		<p>
			학력 : 
			<select name="grade">
				<option value="ele">초딩</option>
				<option value="mid">중딩</option>
				<option value="high">고딩</option>
				<option value="uni">대딩</option>
			</select>
		</p>
		<p>
			<input type="submit" value="전송하기"/>
		</p>
	</form>
</body>
</html>