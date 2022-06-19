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
	var err = "${ERR}";
	
	if(err != ""){
		alert(err);
	}
	
	$('.login_btn').click(function(){
		var id = $('#login_id').val();
		var pw = $('#login_pw').val();
		if(id == ""){
			alert("아이디를 입력해주세요.");
			$('#login_id').focus();
			return false;
		}
		
		if(pw == ""){
			alert("비밀번호를 입력해주세요.");
			$('#login_pw').focus();
			return false;
		}
	});
});
</script>
<title>로그인</title>
</head>
<body>
    <section id="login_section">
        <div>
            <h1>안녕하세요:)</h1>
            <div id="login_logo">
                <img id="login_logo_img" src="${path}/resources/images/logo.png"/>
                <h1>입니다.</h1>
            </div>
        </div>
        <form id="login_form" method="post" action="loginCheck?v=<%=System.currentTimeMillis() %>">
            <input class="login_input" id="login_id" type="text" placeholder="아이디 입력" name="mbrId" />
            <input class="login_input" id="login_pw" type="password" placeholder="비밀번호 입력" name="mbrPwd"/>
            <input class="login_btn" type="submit" value="로그인"/>
        </form>
        <div id="login_nav">
            <h4><a href="#">아이디 찾기</a></h4>
            <p>|</p>
            <h4><a href="#">비밀번호 찾기</a></h4>
            <p>|</p>
            <h4><a href="goJoin?v=<%=System.currentTimeMillis() %>">회원가입</a></h4>
        </div>
        <div id="login_home">
            <a href="loginCheck">
                <img id="login_home_btn" src="${path}/resources/images/house.png"/>홈으로 이동
            </a>
        </div>
    </section>
</body>
</html>