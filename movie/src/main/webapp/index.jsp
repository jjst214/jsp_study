<%@page import="org.apache.catalina.Session"%>
<%@page import="mvc_con.ProductDTO"%>
<%@page import="java.util.List"%>
<%@page import="mvc_con.ListDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%@ include file="/header/header.jsp" %>
<title>멍냥</title>
<%
	request.setCharacterEncoding("utf-8");
	ListDAO dao = new ListDAO();
	List<ProductDTO> lists = dao.selectListPage();
	dao.close();
%>
<div id="wrap">
	<section>
		<div id="banner">
			<div><a href="#"><img src="images/mainSlide2.jpg" width=100%></a></div>
			<div><a href="#"><img src="images/mainSlide3.jpg" width=100%></a></div>
			<div><a href="#"><img src="images/mainSlide4.jpg" width=100%></a></div>
			<div><a href="#"><img src="images/mainSlide6.jpg" width=100%></a></div>
		</div>
	</section>
	
	<div class="text inner"><h2 class="non-cursor">신상품</h2><span><a href="${pageContext.request.contextPath }/mvc_con/list.do?cate=all">더 보기</a></span></div>
	<section id="product1" class="inner">
	<c:set var="lists" value="<%=lists%>" />
		<c:choose>
			<c:when test="${empty lists}">
				<h2>등록된 상품이 없습니다.</h2>
			</c:when>
			<c:otherwise>
				<c:forEach items="${lists}" var="items" varStatus="loop">
				<c:set var="producturl" value="${fn:split(items.pimage, '.') }"/>
				<div class="newest_items">
					<a href="${pageContext.request.contextPath }/mvc_con/product.do?p_type=detail&num=${items.pid}">
						<img src="./uploads/${producturl[fn:length(producturl)-2]}/${items.pimage}" width="200px" height="200px" />
						<p class="name">${items.pname }</p>
						<p class="price"><fmt:formatNumber value="${items.pprice}" pattern="#,###" />원</p>
					</a>
					<a href="#" class="size">
						<strong>Size View</strong>
					</a>
				</div>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</section>
</div>
<%@ include file="/footer/footer.jsp" %>