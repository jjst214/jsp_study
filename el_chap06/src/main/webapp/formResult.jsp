<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String name = request.getParameter("name");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<p>이름 : <%=name %></p>
	<h2>표현언어(el)로 폼값 출력</h2>
	<ul>
		<li>이름 ${param.name }</li>
		<li>성별 ${param.gender }</li>
		<li>학력 ${param.grade }</li>
		<li>관심사항 ${paramValues.inter[0]  } ${paramValues.inter[1]  } 
		${paramValues.inter[2]  } ${paramValues.inter[3]  }</li>
	</ul>
</body>
</html>