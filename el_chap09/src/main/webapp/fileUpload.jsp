<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	function validateForm(form){
		if(form.name.value == ""){
			alert("작성자를 입력하세요");
			form.name.focus();
			return false;
		}
		if(form.title.value == ""){
			alert("제목을 입력하세요");
			form.title.focus();
			return false;
		}
		if(form.attachedFile.value == ""){
			alert("첨부파일 입력은 필수입니다.");
			return false;
		}
	}
</script>
</head>
<body>
	<h3>파일 업로드</h3>
	<form action="uploads/uploadProcess.jsp" method="post" enctype="multipart/form-data"
	onsubmit="return validateForm(this)">
		<p>작성자 <input type="text" name="name"/></p>
		<p>제목 <input type="text" name="title"/></p>
		<p>카테고리(선택사항)
		<input type="checkbox" name="cate" value="사진"/>사진 
		<input type="checkbox" name="cate" value="과제"/>과제
		<input type="checkbox" name="cate" value="워드"/>워드
		<input type="checkbox" name="cate" value="음원"/>음원 
		</p>
		<p>
		첨부파일 <input type="file" name="attachedFile"/> 
		</p>
		<p><input type="submit" value="전송하기"/></p>
	</form>
</body>
</html>