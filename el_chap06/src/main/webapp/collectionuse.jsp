<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>List 컬렉션</h2>
	<%
		List<Object> aList = new ArrayList<>();
		aList.add("재미있는");
		aList.add("jsp");
		pageContext.setAttribute("green", aList);
	%>
	<ul>
		<li>0번째 요소 : ${green[0] }</li>
		<li>1번째 요소 : ${green[1] }</li>
	</ul>
	<h2>Map 컬렉션</h2>
	<%
		Map<String, String> map = new HashMap<>();
		map.put("한글", "훈민정음");
		map.put("Eng", "English");
		pageContext.setAttribute("langmap", map);
	%>
	<ul>
		<li>${langmap["한글"] }, ${langmap["Eng"] }</li>
	</ul>
</body>
</html>