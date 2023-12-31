<%@page import="java.text.NumberFormat"%>
<%@page import="mvc_con.ProductDAO"%>
<%@page import="mvc_con.ProductDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header/header.jsp" %>
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/productList.css">
<title>상품상세</title>
<%
	String pid = request.getParameter("pid");
	ProductDAO dao = new ProductDAO();
	ProductDTO dto = dao.selectProduct(pid);
	dao.close();
	String url = dto.getPimage().substring(0, dto.getPimage().lastIndexOf("."));
	if(grade.equals("5") || grade.equals("10")){
		%>
		<div class="wrap">
			<h2 style="text-align:center; padding: 50px 0;">상품 상세(관리자)</h2>
			<form action="${pageContext.request.contextPath }/mvc_con/product.do" method="post" enctype="multipart/form-data">
			<input type=hidden name="p_type" value="edit">
			<input type=hidden name="pid" value="<%=dto.getPid() %>">
			<div id="productInfo" class="inner">
				
				<div id="pimage">
					<img src="uploads/<%=url %>/<%=dto.getPimage()%>"/>
					<p style="padding:35px 0; font-weight:bold;">상품 이미지 변경&nbsp;<input type="file" name="updateFile"></p>
					
				</div>
				
				<div>
					<h2><span>상품명&emsp;&nbsp;</span><input type="text" value="<%=dto.getPname() %>" name="pname"></h2>
					
					<p style="font-weight:bold;"><span>가격</span>&emsp;&emsp;<input type="text" value="<%=dto.getPprice() %>" name="pprice"></p>
					<p style="font-weight:bold;"><span>재고</span>&emsp;&emsp;<input type="text" value="<%=dto.getPstock() %>" name="pstock"></p>
					<p>상품설명</p>
					<textarea rows="20" cols="60" name="pdetail" id="pdetail"><%=dto.getPdetail() %></textarea>
					<button type="submit" id="editbtn">수정</button>
					<button type="button" onclick="history.back();" style="float:right; padding:5px 10px; margin:5px 10px;">돌아가기</button>
				</div>
			</div>
			<div class="inner">
				<p style="padding:35px 0; font-weight:bold;">상품하단 상세 이미지 변경&nbsp;<input type="file" name="updateFile2"></p>
				<div>
					<img alt="상품 상세" src="uploads/<%=url %>/<%=dto.getPimage2()%>">
				</div>
			</div>
			
			</form>
		</div>
		
		<%
	}else{
		
	}
%>

<%@ include file="/footer/footer.jsp" %>