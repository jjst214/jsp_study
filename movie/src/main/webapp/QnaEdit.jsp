<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function validateForm(form) {
		if(form.title.value == "") {
			alert("제목을 입력하세요");
			form.name.focus();
			return false;
		}
		if(form.content.value == "") {
			alert("내용을 입력하세요");
			form.content.focus();
			return false;
		}
	}
</script>
</head>
<body>
	<h2>수정하기</h2>
	<form name="editForm" method="post" enctype="multipart/form-data" 
	action="edit.do" onsubmit="return validateForm(this)">
	<input type="hidden" name="qID" value="${dto.qID}">
		<table border="1">		
			<tr>
				<td>제목</td>
				<td><input type="text" name="title" value="${dto.qTITLE}"></td>
			</tr>
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
				<td>내용</td>
				<td><textarea name="content">${dto.qCONTENT}</textarea></td>
			</tr>
			<tr>
				<td>첨부파일</td>
				<td><input type="file" name="qFILE"></td>
			</tr>
			<tr>
				<td colspan="3">
					<button type="submit">수정</button>
					<button type="reset">취소</button>
					<button type="button" 
				onclick="location.href='${pageContext.request.contextPath }/qna/qna.do'">목록보기</button>
				</td>
			</tr>
		</table>	
	</form>
</body>
</html>