<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="/header/header.jsp" %>
<script type="text/javascript">
	function validateForm(form) {
		if(form.name.value == "") {
			alert("작성자를 입력하세요");
			form.name.focus();
			return false;
		}
		if(form.content.value == "") {
			alert("내용을 입력하세요");
			form.content.focus();
			return false;
		}
		if(form.pass.value == "") {
			alert("비밀번호를 입력하세요");
			form.pass.focus();
			return false;
		}
	}
</script>
</head>
<body>
	<h2>QNA 작성</h2>
	<form name="writeForm" method="post" enctype="multipart/form-data" 
	action="${pageContext.request.contextPath }/qna/QnaWrite.do" onsubmit="return validateForm(this)">
		<table border="1">
			<tr>
				<td>카테고리</td>
				<td>
					<input type="radio" name="cate" value="1" checked> 상품
					<input type="radio" name="cate" value="2"> 교환/환불
					<input type="radio" name="cate" value="3"> 사이트이용
					<input type="radio" name="cate" value="4"> 기타
				</td>
			</tr>
			<tr>
				<td>제목</td>				
				<td>
					<input type="text" name="title">
					<input type="hidden" name="mid" value="<%= session.getAttribute("UserId") %>">
				</td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea name="content"></textarea></td>
			</tr>
			<tr>
				<td>첨부파일</td>
				<td><input type="file" name="qfile"></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="pass"></td>
			</tr>
			<tr>
				<td colspan="3">
					<button type="submit">작성완료</button>
					<button type="reset">취소</button>
					<button type="button" 
					onclick="location.href='${pageContext.request.contextPath }/qna/qna.do'">목록 바로가기</button>
				</td>
			</tr>
		</table>	
	</form>
<%@ include file="/footer/footer.jsp" %>