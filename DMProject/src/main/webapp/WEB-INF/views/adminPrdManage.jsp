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
<style>
	.btnColor{
		color : red;
		font-weight : bolder;
	}
</style>
<script>
$(document).ready(function(){

	$('#pageNo${pageNo}').addClass('btnColor');
	
    $('#preButton').click(function(){
        if("${cutPageNo}" == 1){
        	return false;
        }
    });
    $('#nextButton').click(function(){
    	var maxPage = "${maxPage}";
    	var cutPageNo = parseInt("${cutPageNo}") + 4
        if(maxPage < cutPageNo){
        	return false;
        }
    });
    
    $('#submitBtn').click(function(){
        if($("#bbTitlSearch").val()  == ""){
        	alert("검색한 값이 없습니다");
        	return false;
        }
    });
    
});
</script>
<title>상품 관리</title>
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
    <section id="admin_prd_manage">
        <h1>상품관리</h1>
        <div id="ap_manage_category">
        	<form method="get" action="pclListManage" class="manage_search_form">
	            <select id="pclCode_select" name="pclCode">
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
	            <input class="manage_search_btn" type="submit" value="검색">
        	</form>
        </div>
        <table>
        	<tr>
	            <th class="apm_prd_num" width="100">상품번호</th>
	            <th class="apm_prd_name" width="500">상품명</th>
	            <th width="115">금액</th>
	            <th width="115">재고량</th>
	            <th class="apm_prd_anything" width="100">비고</th>
	        </tr>
	        <c:if test="${prdAl.size() >= 1}">
	        <c:forEach var="i" begin="0" end="${prdAl.size()-1}">
            <tr id="apm_tr">
                <td class="apm_prd_num">${prdAl[i].prdCode}</td>
                <td class="apm_prd_name">${prdAl[i].prdName}</td>
                <td class="apm_prd_price">${prdAl[i].prdPc}</td>
                <td class="apm_prd_stock">${prdAl[i].prdInvntry}</td>
                <td class="apm_prd_anything">
                    <input type="button" value="수정" onclick='location.href="goPrdModify?prdCode=${prdAl[i].prdCode}"'>
                </td>
            </tr>
        	</c:forEach>
        	</c:if>
        	<c:if test="${prdAl.size() < 1}">
            <tr>
            	<td colspan="5" style="text-align: center; height: 50px">상품 내역이 없습니다.</td>
            </tr>
            </c:if>
        </table>
        <c:if test="${prdGradeBool == 1}">
        <div class="paging">
            	<a id = "preButton" href="prdManage?pageNo=${cutPageNo-1}&cutPageNo=${cutPageNo-5}">&#60;</a>
            	<c:choose>
            		<c:when test="${maxPage > cutPageNo+4}">
	            		<c:forEach var = "i" begin = "${cutPageNo}" end = "${cutPageNo+4}">
		            		<a href="prdManage?pageNo=${i}&cutPageNo=${cutPageNo}" id="pageNo${i}"class="num">${i}</a>
		            	</c:forEach>            		
            		</c:when>
            		<c:otherwise>
            			<c:forEach var = "i" begin = "${cutPageNo}" end = "${maxPage}">
		            		<a href="prdManage?pageNo=${i}&cutPageNo=${cutPageNo}" id="pageNo${i}" class="num">${i}</a>
		            	</c:forEach>   
            		</c:otherwise>
            	</c:choose>
                <a id = "nextButton" href="prdManage?pageNo=${cutPageNo+5}&cutPageNo=${cutPageNo+5}">></a>
          </div>
          </c:if>
          <c:if test="${prdGradeBool == 2}">
          <div class="paging">
            	<a id = "preButton" href="pclListManage?pclCode=${pclCode}&pageNo=${cutPageNo-1}&cutPageNo=${cutPageNo-5}&mbrGradeBool=${mbrGradeBool}">&#60;</a>
            	<c:choose>
            		<c:when test="${maxPage > cutPageNo+4}">
	            		<c:forEach var = "i" begin = "${cutPageNo}" end = "${cutPageNo+4}">
		            		<a href="pclListManage?pclCode=${pclCode}&pageNo=${i}&cutPageNo=${cutPageNo}&mbrGradeBool=${mbrGradeBool}" id="pageNo${i}"class="num">${i}</a>
		            	</c:forEach>            		
            		</c:when>
            		<c:otherwise>
            			<c:forEach var = "i" begin = "${cutPageNo}" end = "${maxPage}">
		            		<a href="pclListManage?pclCode=${pclCode}&pageNo=${i}&cutPageNo=${cutPageNo}&mbrGradeBool=${mbrGradeBool}" id="pageNo${i}" class="num">${i}</a>
		            	</c:forEach>   
            		</c:otherwise>
            	</c:choose>
                <a id = "nextButton" href="pclListManage?pclCode=${pclCode}&pageNo=${cutPageNo+5}&cutPageNo=${cutPageNo+5}&mbrGradeBool=${mbrGradeBool}">></a>
          </div>
          </c:if>
    </section>
</body>
</html>