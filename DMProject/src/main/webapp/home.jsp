<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="${path}/resources/css/style.css" rel="stylesheet">
<title>대명나라</title>
</head>
<body>
    <section id="home_section">
        <img src="${path}/resources/images/logo.png">
        <div>
            <h1 id="home_title1">대명나라</h1><h1>에 오신 것을 환영합니다.</h1>
        </div>
        <a href="main?v=<%=System.currentTimeMillis()%>">홈페이지로 이동</a>
    </section>
</body>
</html>