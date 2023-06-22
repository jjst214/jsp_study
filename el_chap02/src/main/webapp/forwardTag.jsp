<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	*{margin:5px; padding:0; box-sizing:none;}
	li{list-style:none;}
</style>
</head>
<body>
	<jsp:include page="bloodtype/forwardTagHeader.jsp" flush="false"/>
	<form action="bloodtype/view.jsp" method="post">
		<p>혈액형별로 성격 테스트</p>
		<p>당신의 혈액형은?</p>
		<ul>
			<li><input type="radio" name="bloodtype" value="A">A</li>
			<li><input type="radio" name="bloodtype" value="B">B</li>
			<li><input type="radio" name="bloodtype" value="O">O</li>
			<li><input type="radio" name="bloodtype" value="AB">AB</li>
		</ul>
		<button type="submit">보내기</button>
	</form>
</body>
</html>