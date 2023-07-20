<%@page import="java.text.NumberFormat"%>
<%@page import="mvc_con.ProductDAO"%>
<%@page import="mvc_con.ProductDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header/header.jsp" %>
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/productList.css">
<title>상품상세</title>
<%
	NumberFormat numberFormat = NumberFormat.getInstance();
	String num = request.getParameter("num");
	ProductDAO dao = new ProductDAO();
	ProductDTO dto = dao.selectProduct(num);
	dao.close();
	String url = dto.getPimage().substring(0,dto.getPimage().lastIndexOf("."));
	//if(grade.equals("5") || grade.equals("10")){
		%>
		
		<div class="wrap">
			<c:if test="${sessionScope.Grade eq '5' or sessionScope.Grade eq '10'}">
			<h2 style="text-align:center; padding: 50px 0;">상품 상세(관리자)</h2>
			</c:if>
			
			<div id="productInfo" class="inner">
				<div id="pimage">
					<img src="uploads/<%=url %>/<%=dto.getPimage()%>"/>
				</div>
				<div>
					<h2><%=dto.getPname() %></h2>
					<p style="font-weight:bold;"><span>가격</span>&emsp;&emsp;<%=numberFormat.format(Integer.parseInt(dto.getPprice())) %>원</p>
					<p style="font-weight:bold;"><span>재고</span>&emsp;&emsp;<%=dto.getPstock() %></p>
					<p>상품설명</p>
					<textarea rows="20" cols="60" id="detailArea" readonly><%=dto.getPdetail() %></textarea>
					<c:choose>
					<c:when test="${sessionScope.Grade eq '5' || sessionScope.Grade eq '10' }">
					<button type="submit" id="editbtn"
					 onclick="location.href='${pageContext.request.contextPath }/mvc_con/product.do?p_type=edit&pid=<%=dto.getPid()%>'">상품수정</button>
					</c:when>
					<c:otherwise>
					<div class="pdt_btn">
						<a href="#" onclick="loginChk(this);" id="buy">BUY IT NOW</a>
						<a href="#" onclick="loginChk(this);">ADD TO CART</a>
					</div>
					</c:otherwise>
					</c:choose>
					
				</div>
			</div>
			<div id="detailView" class="inner">
				<img src="uploads/<%=url%>/<%=dto.getPimage2()%>"/>
			</div>
		</div>
		<script>
			//제품 구매 시 로그인 여부 체크
			function loginChk(e){
				let isLogin = "<%=sessionId%>";
				
				if(isLogin == null){
					location.href="${pageContext.request.contextPath }/member/login.do";
				}else{
					if(e.id == "buy"){
						//구매 버튼을 클릭하면 주문화면으로 이동
						location.href="${pageContext.request.contextPath }/mvc_con/order.do?pid=<%=dto.getPid()%>";	
					}else{
						//장바구니 버튼 클릭이면 카트에 추가 
						location.href="${pageContext.request.contextPath }/mvc_con/addcart.do";
					}
				}
			}
		</script>
		<%
	//}else{
		%>
		
		<%
	//}
%>

<%@ include file="/footer/footer.jsp" %>