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
<title>회원관리</title>
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
    <section id="admin_mbr_manage">
        <h1>회원관리</h1>
        <div id="ap_manage_category">
        <form method="get" action="gradeListManage" class="manage_search_form">
            <select name="mbrGrade">
                <option value="0100">===카테고리===</option>
                <option value="0101">관리자</option>
                <option value="0102">일반회원</option>
                <option value="0103">학교회원</option>
                <option value="0104">교사</option>
            </select>
            <input class="manage_search_btn" type="submit" value="검색">
        </form>
        </div>
        <table>
        	<tr>
	            <th class="amm_num" width="150">회원번호</th>
	            <th width="200">회원명</th>
	            <th width="200">회원등급</th>
	            <th width="210">전화번호</th>
	            <th width="150">비고</th>
            </tr>
            <c:if test="${mbrAl.size() >= 1}">
            <c:forEach var="i" begin="0" end="${mbrAl.size()-1}">
            <tr>
                <td class="amm_num">${mbrAl[i].mbrCode}</td>
                <td class="amm_name">${mbrAl[i].mbrName}</td>
                <td class="amm_grade">${alGrade[i]}</td>
                <td class="amm_total_price" style="text-align: center">${mbrAl[i].mbrTelNo}</td>
                <td class="amm_anything">
                    <div class="amm_update">
                        <a href="goMbrUpdate?mbrCode=${mbrAl[i].mbrCode}">수정</a>
                    </div>
                </td>
            </tr>
            </c:forEach>
            </c:if>
            <c:if test="${mbrAl.size() < 1}">
            <tr>
            	<td colspan="5" style="text-align: center; height: 50px">회원이 없습니다.</td>
            </tr>
            </c:if>
        </table>
        <c:if test="${mbrGradeBool == 1}">
        <div class="paging">
            	<a id = "preButton" href="mbrManage?pageNo=${cutPageNo-1}&cutPageNo=${cutPageNo-5}">&#60;</a>
            	<c:choose>
            		<c:when test="${maxPage > cutPageNo+4}">
	            		<c:forEach var = "i" begin = "${cutPageNo}" end = "${cutPageNo+4}">
		            		<a href="mbrManage?pageNo=${i}&cutPageNo=${cutPageNo}" id="pageNo${i}"class="num">${i}</a>
		            	</c:forEach>            		
            		</c:when>
            		<c:otherwise>
            			<c:forEach var = "i" begin = "${cutPageNo}" end = "${maxPage}">
		            		<a href="mbrManage?pageNo=${i}&cutPageNo=${cutPageNo}" id="pageNo${i}" class="num">${i}</a>
		            	</c:forEach>   
            		</c:otherwise>
            	</c:choose>
                <a id = "nextButton" href="mbrManage?pageNo=${cutPageNo+5}&cutPageNo=${cutPageNo+5}">></a>
          </div>
          </c:if>
          <c:if test="${mbrGradeBool == 2}">
          <div class="paging">
            	<a id = "preButton" href="gradeListManage?mbrGrade=${mbrGrade}&pageNo=${cutPageNo-1}&cutPageNo=${cutPageNo-5}&mbrGradeBool=${mbrGradeBool}">&#60;</a>
            	<c:choose>
            		<c:when test="${maxPage > cutPageNo+4}">
	            		<c:forEach var = "i" begin = "${cutPageNo}" end = "${cutPageNo+4}">
		            		<a href="gradeListManage?mbrGrade=${mbrGrade}&pageNo=${i}&cutPageNo=${cutPageNo}&mbrGradeBool=${mbrGradeBool}" id="pageNo${i}"class="num">${i}</a>
		            	</c:forEach>            		
            		</c:when>
            		<c:otherwise>
            			<c:forEach var = "i" begin = "${cutPageNo}" end = "${maxPage}">
		            		<a href="gradeListManage?mbrGrade=${mbrGrade}&pageNo=${i}&cutPageNo=${cutPageNo}&mbrGradeBool=${mbrGradeBool}" id="pageNo${i}" class="num">${i}</a>
		            	</c:forEach>   
            		</c:otherwise>
            	</c:choose>
                <a id = "nextButton" href="gradeListManage?mbrGrade=${mbrGrade}&pageNo=${cutPageNo+5}&cutPageNo=${cutPageNo+5}&mbrGradeBool=${mbrGradeBool}">></a>
          </div>
          </c:if>
    </section>
</body>
</html>