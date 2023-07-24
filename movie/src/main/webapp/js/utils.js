/**
 * 
 */
$( document ).ready( function() {
	//slick slide
	$("#banner").slick({
		slidesToShow: 1,
		slidesToScroll: 1,
		autoplay: true,
		autoplaySpeed: 2000,
		arrows: false,
		dragging:true
	});
	//검색창 상품 검색 이벤트
	$("#searchWord").keydown(function(e){
		if(e.keyCode == '13'){
			if($("#searchWord").val() == ""){
				alert("검색어를 입력해주세요");
				return false;
			}else{
				$("#searchForm").submit();
			}
		}
	});
	
	$(".slide-items").slick({
		dots:false,
		slidesToShow: 4,
		slidesToScroll: 1,
		autoplay:true,
		autoplaySpeed:3500,
		arrows:false
	});
	
	$('input[type="radio"][id="pay1"]').on('click',function(){
		let chkValue = $('input[type="radio"][id="pay1"]:checked').val();
		if(chkValue){
			$('.payment-form').css('display','block');
		}else{
			$('.payment-form').css('display','none');
		}
	});
});






