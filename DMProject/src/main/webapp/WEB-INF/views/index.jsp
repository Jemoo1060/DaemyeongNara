<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel="stylesheet" href="${path}/resources/css1/index.css">
<script src="/socket.io/socket.io.js"></script>
<script src="${path}/resources/js/index.js"></script>
<title>채팅</title>
</head>
<body>
	<div id="main">
      <div id="main_sub">대명나라에 보내실 메시지를 입력해주세요^^</div>
      <div id="chat">
        <!-- 채팅 메시지 영역 -->
      </div>
      <div id="chat_write">
        <input style="width: 80%; height: 60px;" type="text" id="test" placeholder="메시지를 입력해주세요..">
        <button onclick="send()">전송</button>
      </div>
    </div>
</body>
</html>