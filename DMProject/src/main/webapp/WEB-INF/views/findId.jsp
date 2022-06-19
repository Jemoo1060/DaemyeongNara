<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="${path}/resources/css/style.css" rel="stylesheet">
<title>아이디 찾기</title>
</head>
<body>
	<section id="find_info">
        <h1>아이디 찾기</h1>
        <div class="find_info_type">
            <div>휴대폰 인증</div>
            <div>실명 인증</div>
            <div>이메일 인증</div>
        </div>
        <div class="find_info_ag">
            <div>인증방법에 따라 바뀌는 창</div>
        </div>
        <input type="button" value="아이디 확인">
    </section>
</body>
</html>