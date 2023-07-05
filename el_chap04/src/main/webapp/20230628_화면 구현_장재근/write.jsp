<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="include/header.jsp" %>
<link rel="stylesheet" href="css/main.css">
<div id="wrap">
	<form action="insert_process.jsp" method="post" id="insert_form">
		<h3>도서등록하기</h3>
		<p><span>제목</span><input type="text" name="title"/></p>
		<p><span>글쓴이</span><input type="text" name="author"/></p>
		<p><span>출판사</span><input type="text" name="publisher"/></p>
		<p><span>가격</span><input type="text" name="price"/></p>
		<p><span>출판일자</span><input type="date" name="pub_date"/></p>
		<p><input type="submit" value="도서등록"/><input type="reset" value="취소"/></p>
	</form>
</div>
</body>
</html>