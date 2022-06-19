<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="${path}/resources/css/style.css" rel="stylesheet">
<script type="text/javascript" src="${path}/resources/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$('#prd_add_btn').click(function(){
		// 등록날짜 넣기
		var t = new Date();
		var y = t.getFullYear();
		var m = t.getMonth()+1;
		var d = t.getDate();
		var ts = y.toString() + ("0" + m.toString()).slice(-2) + ("0" + d.toString()).slice(-2);
		
		$('#prd_add_date').val(ts);
	});
});
</script>
<title>상품 등록</title>
</head>
<body>
	<div id="header">
		<div id="header_top_ad">
	        <a href="main"><img id="header_logo" src="${path}/resources/images/logo.png"></a>
	        <div id="header_input">
	            <p id="login_welcome">관리자 : ${mbrId}님 환영합니다.</p>
	         </div>
	     </div>
	     <div id="header_list">
	         <div><input type="button" value="상품등록" onclick='location.href="goPrdAdd"'></div>
	         <div><input type="button" value="상품관리" onclick='location.href="prdManage"'></div>
	         <div><input type="button" value="주문관리" onclick='location.href="orderManage"'></div>
	         <div><input type="button" value="회원관리" onclick='location.href="mbrManage"'></div>
	         <div><input type="button" value="스쿨존관리" onclick='location.href="schoolZoneManage"'></div>
	     </div>
	     <div id="header_admin_btn">
	         <input type="button" value="메인페이지" onclick='location.href="main"'>
	     </div>
	</div>
    <section id="admin_prd_add">
        <h1>상품등록</h1>
        <div>
            <h3>상품 정보</h3>
            <form method="post" action="prdAdd">
                <div class="apa_flex apa_name">
                    <h4>상품명</h4>
                    <input class="apa_input" type="text" placeholder="상품명 입력" name="prdName" />
                    <h4>카테고리</h4>
                    <select id="pclCode_select" name="pclCode">
                        <option value="">===카테고리 선택===</option>
                        <option value="0101">문구류</option>
                        <option value="0102">완구류</option>
                        <option value="0103">제지류</option>
                        <option value="0104">잡화/팬시류</option>
                        <option value="0105">음악/미술/체육</option>
                        <option value="0106">기타</option>
                        <option value="">===먹거리코너===</option>
                        <option value="0201">패키지</option>
                        <option value="0202">껌/젤리/캔디</option>
                        <option value="0203">쿠키/스낵</option>
                        <option value="0204">커피/음료/푸딩</option>
                        <option value="0205">기타</option>
                    </select>
                </div>
                <div class="apa_flex apa_choice">
                    <h4>구분</h4>
                    <input type="radio" value="0201" name="prdSe" />
                    <h5>일반상품</h5>
                    <input type="radio" value="0202" name="prdSe" />
                    <h5>BEST</h5>
                    <input type="radio" value="0203" name="prdSe" />
                    <h5>HOT</h5>
                    <input type="radio" value="0204" name="prdSe" />
                    <h5>NEW</h5>
                </div>
                <div class="apa_flex apa_price">
                    <h4>가격</h4>
                    <input class="apa_input" type="number" placeholder="가격 입력" name="prdPc" />
                </div>
                <div class="apa_flex apa_stock">
                    <h4>수량</h4>
                    <input class="apa_input" type="number" placeholder="재고 입력" name="prdInvntry" />
                </div>
                <div class="apa_flex apa_detail">
                    <h4>상세정보</h4>
                    <input class="apa_input_text" type="text" placeholder="상세정보 입력" name="prdCn">
                </div>
                <div class="apa_flex apa_img">
                    <h4>이미지</h4>
                    <input type="file" accept="image/*" value="파일올리기">
                </div>
                <div class="apa_submit">
                	<input id="prd_add_date" type="hidden" name="prdRegistDate"/>
                	<input type="hidden" name="prdRecomendAt" value="N"/>
                	<input type="hidden" name="prdRecomendCnt" value="0"/>
                	<input type="hidden" name="prdImageCode" value="01"/>
                	<input type="hidden" name="prdImageUrl" value="carrot"/>
                    <input id="prd_add_btn" type="submit" value="등록하기">
                </div>
            </form>
        </div>
    </section>
</body>
</html>