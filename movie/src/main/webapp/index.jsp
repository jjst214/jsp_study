<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%@ include file="/header/header.jsp" %>
<div id="wrap">
	<section>
		<div id="banner" class="inner">
			<div><a href="#"><img src="images/mainSlide2.jpg"></a></div>
			<div><a href="#"><img src="images/mainSlide3.jpg"></a></div>
			<div><a href="#"><img src="images/mainSlide4.jpg"></a></div>
			<div><a href="#"><img src="images/mainSlide6.jpg"></a></div>
			<div><a href="#"><img src="images/mainSlide7.jpg"></a></div>
		</div>
	</section>
	<section id="product1" class="inner">
		<div class="text"><h2>신상품</h2><span><a href="#">더 보기</a></span></div>
		<div id="newest_product">
			db에서 등록일 순으로 리턴
		</div>
	</section>
</div>	
<%@ include file="/footer/footer.jsp" %>

			<div>
				<form>
					<input type="text" id="sample6_postcode" placeholder="우편번호">
					<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
					<input type="text" id="sample6_address" placeholder="주소"><br>
					<input type="text" id="sample6_detailAddress" placeholder="상세주소">
					<input type="text" id="sample6_extraAddress" placeholder="참고항목">
				</form>
			</div>