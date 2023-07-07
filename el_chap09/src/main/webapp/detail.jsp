<%@page import="fileupload.MyFileDAO"%>
<%@page import="fileupload.MyFileDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script>
	function deletePost(){
		let comfirmed = confirm("정말 삭제하시겠습니까?");
		if(comfirmed){
			//name값이 deleteForm인 요소 선택
			let delform = document.deleteForm;
			//전송방식 지정
			delform.method = "post";
			//전송경로 지정
			delform.action = "delete_process.jsp";
			//전송
			delform.submit();
		}
	}
</script>
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
		pageContext.setAttribute("dto", dto);
		dao.close();
	%>
 	<div id="wrap">
		<h2>상세 페이지</h2>
		<div id="detail_view">
			<h3>제목 : <%=dto.getTitle() %></h3>
			<p>작성자 : <%=dto.getName() %></p>
			<p>게시일 <%=dto.getPostdate() %></p>
			<table border="1" style="border-collapse:collapse;">
				<tr>
					<td><img src="./uploads/<%=dto.getSfile()%>" width="600" height="400"/></td>
				</tr>
			</table>
			<p>원본파일명 : <%=dto.getOfile() %></p>
			<p>저장된 파일명 : <%=dto.getSfile() %></p>
			<div>
				<button onclick="location.href='updatePost.jsp?num=<%=dto.getIdx()%>'">글 수정</button>
				<form name="deleteForm">
						<input type="hidden" name="num" value="<%=dto.getIdx()%>"/>
						<button type="button" onclick="deletePost()">삭제하기</button>
				</form>
			</div>
			
		</div>
	</div>

<!-- 	<h2>상세 페이지</h2> -->
<!-- 	<table border="1"> -->
<!-- 		<tr> -->
<!-- 			<td>번호</td> -->
<%-- 			<td>${dto.idx }</td> --%>
<!-- 		</tr> -->
<!-- 		<tr> -->
<!-- 			<td>제목</td> -->
<%-- 			<td>${dto.title }</td> --%>
<!-- 		</tr> -->
<!-- 		<tr> -->
<%-- 			<td colspan="2"><img src="./uploads/${dto.sfile }"/></td> --%>
<!-- 		</tr> -->
<!-- 		<tr> -->
<!-- 			<td colspan="2"> -->
<!-- 				<button>수정하기</button> -->
<!-- 				<form action="delete_process.jsp" method="post"> -->
<%-- 				<input type="hidden" name="num" value="${dto.idx }"/> --%>
<!-- 				<button type="submit">삭제하기</button> -->
<!-- 				</form> -->
<!-- 			</td> -->
<!-- 		</tr> -->
<!-- 	</table> -->
</body>
</html>