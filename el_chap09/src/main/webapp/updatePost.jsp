<%@page import="fileupload.MyFileDTO"%>
<%@page import="fileupload.MyFileDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
	*{margin:0; padding:0; box-sizing:none;}
	li{list-style:none;}
	#wrap{
		width:100%;
		height:100%;
		max-width:1200px;
		margin:0 auto;
	}
	#wrap>h2{
		padding: 100px 0;
		text-align:center;
	}
	#detail_view h3{
		padding:30px 20px;
	}
	#detail_view p{
		text-align:right;
		padding: 5px 20px;
	}
	table{
		margin:50px auto;
		
	}
	td{
		width:1000px;
		height:500px;
		margin: 0 auto;
		padding:30px;
		text-align:center;
	}
	#detail_view div{
		display:flex;
		justify-content:right;
	}
	#detail_view div button{
		padding: 5px 10px;
		margin:15px 10px;
	}
</style>
<body>
	<%
		String idx = request.getParameter("num");
		MyFileDAO dao = new MyFileDAO();
		MyFileDTO dto = dao.detailview(idx);
		out.println(dto.getIdx());
		dao.close();
	%>
	<div id="wrap">
		<h2>글 수정 페이지</h2>
		<div id="detail_view">
			<form action="updateProcess.jsp" method="post" enctype="multipart/form-data">
				<input type="hidden" name="num" value="<%=dto.getIdx() %>"/>
				<h3>제목 : <input type="text" name="title" value="<%=dto.getTitle() %>"/></h3>
				<p>작성자 : <%=dto.getName() %></p>
				<p>카테고리(선택사항)
				<input type="checkbox" name="cate" value="사진"/>사진 
				<input type="checkbox" name="cate" value="과제"/>과제
				<input type="checkbox" name="cate" value="워드"/>워드
				<input type="checkbox" name="cate" value="음원"/>음원 
				</p>
				<p>
				첨부파일 <input type="file" name="attachedFile"/> 
				</p>
				<p><input type="submit" value="수정하기"/></p>
			</form>
		</div>
	</div>
	<script>
		//수정하는 게시글의 체크
		let str = "<%=dto.getCate()%>";
		let strarr = str.split(",");
		let checks = document.querySelectorAll("input[type='checkbox']");
		checks.forEach(ch=>{
			if(strarr.includes(ch.value)){
				ch.checked=true;
			}
		});
	</script>
</body>
</html>