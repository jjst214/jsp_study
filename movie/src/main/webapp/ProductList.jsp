<%@page import="utils.BoardPaging"%>
<%@page import="mvc_con.ProductDTO"%>
<%@page import="java.util.List"%>
<%@page import="mvc_con.ProductDAO"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
	//사용자가 입력한 검색 조건을 Map에 저장
	Map<String, Object> param = new HashMap<>();
	String searchField = request.getParameter("searchField");
	String searchWord = request.getParameter("searchWord");
	if(searchWord != null){
		param.put("searchField", searchField);
		param.put("searchWord", searchWord);
	}
	
	ProductDAO dao = new ProductDAO();
	//게시글 수 확인
	int selectCount = dao.selectCount(param);
	out.println("게시글 수는 : " + selectCount);
	//1페이지당 보여지는 게시글 수 10
	int pageSizes = 10;
	//블럭단위
	int blockPages = 5;
	//전체 페이지 수 = 전체 게시글/1페이지당 보여지는 게시글 수 --> 올림하여 정수로 리턴
	int totalPages = (int)Math.ceil((double)selectCount / pageSizes);
	//현재 페이지
	int pageNum = 1;
	//페이지 클릭 시 요청하는 값을 받아서 pageTemp에 할당
	String pageTemp = request.getParameter("pageNum");
	//pageTemp가 null이 아니거나 ""이 아닐때
	//페이지 문자를 숫자로 변환해서 pageNum에 할당
	if(pageTemp != null && !pageTemp.equals("")){
		pageNum = Integer.parseInt(pageTemp);
	}
	//게시글 페이징 10개 단위 출력
	int start = (pageNum-1)*pageSizes+1; //(현재페이지-1) * 페이지출력범위 + 1
	int end = pageNum * pageSizes; // 현재페이지 * 페이지출력범위
	param.put("start", start);
	param.put("end", end);
	
	List<ProductDTO> list = dao.getBoardList(param); 
	dao.close();
	
%>
<%@ include file="../header/header.jsp" %>
<title>상품 관리 페이지</title>
</head>
<body>
	<div id="wrap" class="inner">
		<h2>상품 목록</h2>
		<%
		if(session.getAttribute("Grade").equals("5") || session.getAttribute("Grade").equals("10")){
			
		
		%>
		<table border="1" style="border-collapse:collapse; text-align:center;">
			<tr>
				<td><input type="checkbox" name="chkbox" value="all" onclick="selectAll(this)">모두선택</td>
				<td>상품번호</td>
				<td>상품명</td>
				<td>가격</td>
				<td>남은재고</td>
				<td>상품이미지</td>
				<td>상품설명</td>
				<td>상품등록일</td>
				<td>판매량</td>
			</tr>
		<%
		if(list.isEmpty()){
			%>
			<tr>
				<td colspan="6">글이 존재하지 않습니다.</td>
			</tr>
		<form action="${pageContext.request.contextPath }/mvc_con/product.do?p_type=delete" method="post">
			<%
		}else{
			
			for(ProductDTO dto:list){
			%>
			<tr>
				<td><input type="checkbox" name="chkbox" value="<%=dto.getPid()%>"></td>
				<td><%=dto.getPid() %></td>
				<td><%=dto.getPname() %></td>
				<td><%=dto.getPprice() %></td>
				<td><%=dto.getPstock() %></td>
				<td><img src="uploads/<%=dto.getPimage()%>" width="50px" height="50px"></td>
				<td><%=dto.getPdetail() %></td>
				<td><%=dto.getPrdate() %></td>
				<td><%=dto.getPsell() %></td>
			</tr>
			<%
			}
		}
		%>
		</form>
		</table>
		<%
		}
		%>
		<div>
			<form method="get">
				<select name="searchField">
					<option value="pname">상품명</option>
					<option value="content">내용</option>
				</select>
				<input type="text" name="searchWord"/>
				<input type="submit" value="검색"/>
			</form>
		</div>
		
		<!-- 페이징 처리 -->
		<div>
		<%= 
		BoardPaging.pagingStr(selectCount, totalPages, pageSizes, 
			blockPages, pageNum, request.getRequestURI(),
			request.getParameter("searchField"),
			request.getParameter("searchWord"))
		%>
		</div>
	</div>
</body>
<script>
	//전체선택/해제
	function selectAll(selectAll)  {
	  const checkboxes 
	     = document.querySelectorAll('input[type="checkbox"]');
	  
	  checkboxes.forEach((checkbox) => {
	    checkbox.checked = selectAll.checked
	  })
	}
</script>
</html>