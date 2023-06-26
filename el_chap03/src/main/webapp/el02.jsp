<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>map-el표현</h1>
	<%
		Map<String, String> map = new HashMap<>();
		map.put("lang", "java");
		map.put("song", "butter");
		map.put("singer", "bts");
		map.put("city", "seoul");
		map.put("food", "chocolate");
		pageContext.setAttribute("bean1", map);
		
		Map<String,String> map2 = (HashMap) pageContext.getAttribute("bean1");
		
		List<String> list = new ArrayList<>();
		list.add("coffee");
		list.add("beer");
		list.add("soju");
		pageContext.setAttribute("attr1",list);
	%>
	<p>map : ${bean1 }</p>
	<p>lang : ${bean1.lang }</p>
	<p>song : ${bean1.song }</p>
	<p>singer : ${bean1.singer }</p>
	<p>city : ${bean1.city }</p>
	<p>food : ${bean1.food }</p>
	
	<p>lang : <%= map2.get("lang") %>
	
	<p>list : ${attr1}</p>
	<p>list0번째 : ${attr1[0]}</p>
	<p>list1번째 : ${attr1[1]}</p>
	<p>list2번째 : ${attr1[2]}</p>
</body>
</html>