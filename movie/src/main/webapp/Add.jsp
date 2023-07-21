<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품등록 페이지</title>
<script>
	function validateForm(form){
		if(form.name.value == ""){
			alert("상품명을 입력하세요");
			form.name.focus();
			return false;
		}
		if(form.categori.value == ""){
			alert("카테고리를 선택해주세요.");
			return false;
		}
		if(form.price.value == ""){
			alert("상품가격을 입력하세요");
			form.price.focus();
			return false;
		}
		if(form.stock.value == ""){
			alert("재고수량을 입력하세요");
			form.stock.focus();
			return false;
		}
		if(form.file1.value == ""){
			alert("상품 사진을 첨부해주세요");
			return false;
		}
		if(form.file2.value == ""){
			alert("상품 상세 이미지를 첨부해주세요");
			return false;
		}
	}
</script>
</head>
<body>
	<h2>상품등록</h2>
	<form action="${pageContext.request.contextPath }/mvc_con/product.do?p_type=add" method="post" name="addForm"
	 enctype="multipart/form-data" onsubmit="return validateForm(this)">
		<table border="1">
			<tr>
				<td>상품명</td>
				<td><input type="text" name="name"/>
				<select name="categori" id="cate">
					<option>상품 카테고리</option>
					<option value="1">사료</option>
					<option value="2">간식</option>
					<option value="3">패션</option>
					<option value="4">장난감/훈련용품</option>
				</select></td>
				
			</tr>
			<tr>
				<td>가격</td>
				<td><input type="text" name="price"/></td>
			</tr>
			<tr>
				<td>재고수량</td>
				<td><input type="text" name="stock"/></td>
			</tr>
			<tr>
				<td>상품설명(1000자)</td>
				<td><textarea name="detail"></textarea></td>
			</tr>
			<tr>
				<td>상품 사진</td>
				<td><input type="file" name="file1"/></td>
			</tr>
			<tr>
				<td>상세 상품 이미지</td>
				<td><input type="file" name="file2"/></td>
			</tr>
			<tr>
				<td colspan="2">
					<button type="submit">등록</button>
					<button type="reset">취소</button>
					<button type="button" onclick="location.href='index.jsp'">목록</button>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>