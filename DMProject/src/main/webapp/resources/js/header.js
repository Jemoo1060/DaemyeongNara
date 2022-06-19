$(document).ready(function(){
	$('#login_welcome').hide();
	$('#header_logout').hide();
	
	$('#btn1').click(function(){
		$('.menuSelect').html("<div id=\"categoryBtn\"><a href = \"#\">문구류</a><a href = \"#\">완구류</a><a href = \"#\">제지류</a><a href = \"#\">잡화/펜시류</a><a href = \"#\">미술/음악/체육</a><a href = \"#\">기타</a></div>");
	});
	
	$('#btn2').click(function(){
		$('.menuSelect').html("<div id=\"foodBtn\"><a href = \"#\">패키지</a><a href = \"#\">껌/젤리/캔디</a><a href = \"#\">쿠키/스낵</a><a href = \"#\">커피/음료/푸딩</a><a href = \"#\">기타</a></div>");
	});
	
	$('#btn3').click(function(){
		$('.menuSelect').html("<div id=\"bbBtn\"><a href = \"#\">공지게시판</a><a href = \"#\">문의게시판</a><a href = \"#\">리뷰게시판</a></div>");
	});
	
	$('#btn4').click(function(){
		$('.menuSelect').html("<div id=\"myPageBtn\"><a href = \"cstCheck?mbrCode=${mbrCode}\">회원정보 조회</a><a href = \"#\">주문목록 조회</a></div>");
	});
	
	var user = "${mbrId}";
	
	if(user != ""){
		$('#login_welcome').show();
		$('#header_logout').show();
		$('#header_login').hide();
	}
});