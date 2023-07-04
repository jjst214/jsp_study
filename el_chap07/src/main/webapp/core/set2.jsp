<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="common.Person"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>List 컬렉션 사용하기</h2>
	<%
		List<Person> pList = new ArrayList<>();
		pList.add(new Person("송중기", 26)); 
		pList.add(new Person("이동욱", 28)); 
	%>
	<c:set var="personList" value="<%=pList %>" scope="request"/>
	<ul>
		<li>${personList[0].name }</li>
		<li>${personList[1].name }</li>
	</ul>
	<h2>Map 컬렉션 사용하기</h2>
	<%
		Map<String, Person> pMap = new HashMap<String, Person>();
		pMap.put("personArgs1", new Person("abc",32));
		pMap.put("personArgs2", new Person("deg",34));
	%>
	<c:set var="personMap" value="<%=pMap %>" scope="request"/>
	<ul>
		<li>이름 : ${personMap.personArgs1.name }</li>
		<li>나이 : ${personMap.personArgs1.age }</li>
	</ul>
</body>
</html>