<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String text1 = "green";
		String text2 = "blue";
		int grade = 10;
		if(grade < 10){
			out.println(text1);
		}else{
			out.println(text2);
		}
	%>
</body>
</html>