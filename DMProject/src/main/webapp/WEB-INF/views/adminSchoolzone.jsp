<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="${path}/resources/css/style.css" rel="stylesheet">
<title>스쿨존 관리</title>
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
    <section id="admin_schoolzone">
        <h1>스쿨존관리</h1>
        <div class="as_fir_line">
            <div>
                <div class="as_grade1">1학년</div>
                <input type="button" value="1반" onclick='location.href="goReadyInput?schulCode=0101"'>
                <input type="button" value="2반" onclick='location.href="goReadyInput?schulCode=0102"'>
                <input type="button" value="3반" onclick='location.href="goReadyInput?schulCode=0103"'>
                <input type="button" value="4반" onclick='location.href="goReadyInput?schulCode=0104"'>
            </div>
            <div>
                <div class="as_grade2">2학년</div>
                <input type="button" value="1반" onclick='location.href="goReadyInput?schulCode=0201"'>
                <input type="button" value="2반" onclick='location.href="goReadyInput?schulCode=0202"'>
                <input type="button" value="3반" onclick='location.href="goReadyInput?schulCode=0203"'>
                <input type="button" value="4반" onclick='location.href="goReadyInput?schulCode=0204"'>
            </div>
            <div>
                <div class="as_grade3">3학년</div>
                <input type="button" value="1반" onclick='location.href="goReadyInput?schulCode=0301"'>
                <input type="button" value="2반" onclick='location.href="goReadyInput?schulCode=0302"'>
                <input type="button" value="3반" onclick='location.href="goReadyInput?schulCode=0303"'>
                <input type="button" value="4반" onclick='location.href="goReadyInput?schulCode=0304"'>
            </div>
        </div>
        <div class="as_sec_line">
            <div>
                <div class="as_grade4">4학년</div>
                <input type="button" value="1반" onclick='location.href="goReadyInput?schulCode=0401"'>
                <input type="button" value="2반" onclick='location.href="goReadyInput?schulCode=0402"'>
                <input type="button" value="3반" onclick='location.href="goReadyInput?schulCode=0403"'>
                <input type="button" value="4반" onclick='location.href="goReadyInput?schulCode=0404"'>
                <input type="button" value="5반" onclick='location.href="goReadyInput?schulCode=0405"'>
            </div>
            <div>
                <div class="as_grade5">5학년</div>
                <input type="button" value="1반" onclick='location.href="goReadyInput?schulCode=0501"'>
                <input type="button" value="2반" onclick='location.href="goReadyInput?schulCode=0502"'>
                <input type="button" value="3반" onclick='location.href="goReadyInput?schulCode=0503"'>
            </div>
            <div>
                <div class="as_grade6">6학년</div>
                <input type="button" value="1반" onclick='location.href="goReadyInput?schulCode=0601"'>
                <input type="button" value="2반" onclick='location.href="goReadyInput?schulCode=0602"'>
                <input type="button" value="3반" onclick='location.href="goReadyInput?schulCode=0603"'>
            </div>
        </div>
    </section>
</body>
</html>