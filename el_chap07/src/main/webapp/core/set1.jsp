<%@page import="common.Person"%>
<%@page import="java.util.Date"%>
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
<!-- 변수선언 -->
<c:set var="directVar" value="100"/>
<c:set var="expVar" value="<%= new Date() %>"/>
<c:set var="betweenVar" scope="request">
변수값지정
</c:set>
<h2>EL을 이용한 출력</h2>
<ul>
	<li>${directVar }</li>
	<li>${betweenVar }</li>
	<li>${expVar }</li>
</ul>
<h2>자바빈즈 생성</h2>
<c:set var="person1" value='<%=new Person("김그린",23) %>'
scope="request"/>
<ul>
	<li>${person1.name }</li>
	<li>${person1.age }</li>
</ul>
<h2>자바빈즈 생성2</h2>
<c:set var="person2" value='<%=new Person() %>' />
<c:set target="${person2 }" property="name" value="이블루" />
<c:set target="${person2 }" property="age" value="32" />
<ul>
	<li>${person2.name }</li>
	<li>${person2.age }</li>
</ul>
</body>
</html>