<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>if-else example</h2>
	<form method="post" action="if_process.jsp">
		<p>이름 : <input type="text" name="name"></p>
		<p>좋아하는 색깔 : 
			<select name="color">
				<option value="blue">파란색</option>
				<option value="red">빨간색</option>
				<option value="yellow">노란색</option>
			</select>
		</p>
		<p><button type="submit">보내기</button></p>
	</form>
</body>
</html>