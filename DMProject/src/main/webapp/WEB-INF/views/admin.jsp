<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="${path}/resources/css/style.css" rel="stylesheet">
<title>관리자페이지</title>
</head>
<body>
	<section id="admin_home">
        <div id="admin_home_title">
            <h1>관리자 페이지</h1>
        </div>
        <div id="admin_home_fir">
            <div class="admin_home_prd_add"><a href="goPrdAdd">상품등록</a></div>
            <div class="admin_home_prd_check"><a href="prdManage">상품관리</a></div>
        </div>
        <div id="admin_home_sec">
            <div class="admin_home_order_check"><a href="orderManage">주문관리</a></div>
            <div class="admin_home_member_check"><a href="mbrManage">회원관리</a></div>
        </div>
        <div id="admin_home_thr">
            <div class="admin_home_school_check"><a href="schoolZoneManage">스쿨존 관리</a></div>
        </div>
    </section>
</body>
</html>