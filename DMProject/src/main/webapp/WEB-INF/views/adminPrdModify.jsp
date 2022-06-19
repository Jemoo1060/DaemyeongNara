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
	var pc = "${productDto.pclCode}";
	
	if(pc == "0101"){
		$('#prdModify_form_default').text("문구류");
	} else if(pc == "0102"){
		$('#prdModify_form_default').text("완구류");
	} else if(pc == "0103"){
		$('#prdModify_form_default').text("제지류");
	} else if(pc == "0104"){
		$('#prdModify_form_default').text("잡화/팬시류");
	} else if(pc == "0105"){
		$('#prdModify_form_default').text("음악/미술/체육");
	} else if(pc == "0106"){
		$('#prdModify_form_default').text("기타");
	} else if(pc == "0201"){
		$('#prdModify_form_default').text("패키지");
	} else if(pc == "0202"){
		$('#prdModify_form_default').text("껌/젤리/캔디");
	} else if(pc == "0203"){
		$('#prdModify_form_default').text("쿠키/스낵");
	} else if(pc == "0204"){
		$('#prdModify_form_default').text("커피/음료/푸딩");
	} else if(pc == "0205"){
		$('#prdModify_form_default').text("기타");
	}
	
	var check = "${productDto.prdSe}";
	if(check == "0201"){
		$('#prdSe_radio1').attr("checked", "true");
	} else if(check == "0202"){
		$('#prdSe_radio2').attr("checked", "true");
	} else if(check == "0203"){
		$('#prdSe_radio3').attr("checked", "true");
	} else if(check == "0204"){
		$('#prdSe_radio4').attr("checked", "true");
	}
	
	$('#prdModify_form').submit(function(){
		var pcl = $('#prdModify_form_pclCode').val();
		if(pcl == 0100 || pcl == 0200 || pcl == 0000){
			$('#prdModify_form_pclCode').val("${productDto.pclCode}");
		}
	});
});
</script>
<title>상품 수정</title>
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
    <section id="admin_prd_modify">
        <h1>상품수정</h1>
        <div>
            <h3>상품 정보</h3>
            <form method="post" action="prdModify" id="prdModify_form">
                <div class="apm_flex apm_name">
                    <h4>상품명</h4>
                    <input class="apm_input" type="text" value="${productDto.prdName}" name="prdName"/>
                    <h4>카테고리</h4>
                    <select name="pclCode" id="prdModify_form_pclCode">
                    	<option value="0000" id="prdModify_form_default">${productDto.pclCode}</option>
			            <option value="0100">===카테고리 선택===</option>
			            <option value="0101">문구류</option>
			            <option value="0102">완구류</option>
			            <option value="0103">제지류</option>
			            <option value="0104">잡화/팬시류</option>
			            <option value="0105">음악/미술/체육</option>
			            <option value="0106">기타</option>
			            <option value="0200">===먹거리코너===</option>
			            <option value="0201">패키지</option>
			            <option value="0202">껌/젤리/캔디</option>
			            <option value="0203">쿠키/스낵</option>
			            <option value="0204">커피/음료/푸딩</option>
			            <option value="0205">기타</option>
	            	</select>
                </div>
                <div class="apm_flex apm_choice">
                    <h4>구분</h4>
                    <input type="radio" value="0201" name="prdSe" id="prdSe_radio4"/>
                    <h5>일반</h5>
                    <input type="radio" value="0202" name="prdSe" id="prdSe_radio1"/>
                    <h5>BEST</h5>
                    <input type="radio" value="0203" name="prdSe" id="prdSe_radio2"/>
                    <h5>HOT</h5>
                    <input type="radio" value="0204" name="prdSe" id="prdSe_radio3"/>
                    <h5>NEW</h5>
                </div>
                <div class="apm_flex apm_price">
                	<div>
    	            	<h4>재고</h4>
	                    <input class="apm_input" type="number" value="${productDto.prdInvntry}" name="prdInvntry" />
                	</div>        	
                    <div>
    	                <h4>가격</h4>
	                    <input class="apm_input" type="number" value="${productDto.prdPc}" name="prdPc" />
                    </div>
                </div>
                <div class="apm_flex apm_detail">
                    <h4>상세정보</h4>
                    <input class="apm_input_text" type="text" value="${productDto.prdCn}" name="prdCn" />
                </div>
                <div class="apm_flex apm_img">
                    <h4>이미지</h4>
                    <div class="apm_img_list">
                        <div>
                            <div class="apm_img_line">
                                <div class="apm_img_div">
                                    <img class="apm_img_file" src="${path}/resources/images/${al[0].prdImageUrl}"/>
                                </div>
                                <div class="apm_img_div">
                                    <img class="apm_img_file" src="${path}/resources/images/${al[1].prdImageUrl}"/>
                                </div>
                             </div>
                            <div class="apm_img_submit">
                                <input type="button" value="파일 수정">
                            </div>
                        </div>
                    </div>
                </div>
                <input type="hidden" value="${productDto.prdCode}" name="prdCode">
                <div class="apm_submit">
                    <input type="submit" value="수정완료" style="background-color: blue; margin-right: 20px">
                    <input type="button" value="삭제하기" onclick='location.href="prdDelete?prdCode=${productDto.prdCode}"'>
                </div>
            </form>
        </div>
    </section>
</body>
</html>