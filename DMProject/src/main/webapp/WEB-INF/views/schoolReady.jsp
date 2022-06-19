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
	var gc = "${schulCode}";
	var g = gc.substring(1, 2);
	var c = gc.substring(3, 4);
	
	$('#school_ready_gc_output').text(g + "학년 " + c + "반");
});
</script>
<title>준비물 입력</title>
</head>
<body>
	<section id="school_ready">
        <h1>준비물 입력</h1>
        <form method="post" action="updateSchoolZone">
            <div class="grade_class">
                <h3>학년 반</h3>
                <h4 id="school_ready_gc_output"></h4>
            </div>
            <hr>
            <div class="school_ready_text">
                <h3>내용</h3>
                <div>
                    <input type="text" value="${schoolZoneDto.schulMsg}" name="schulMsg">
                </div>
            </div>
            <input type="hidden" value="${schulCode}" name="schulCode">
            <div id="school_ready_input_box">
	            <input class="schoolReadyBtn schoolReadyBtn_submit" type="submit" value="등록하기">
	            <input class="schoolReadyBtn schoolReadyBtn_delete" type="button" value="삭제하기" onclick='location.href="removeSchoolZone?schulCode=${schulCode}"'>
	            <input class="schoolReadyBtn schoolReadyBtn_back" type="button" value="뒤로가기" onclick='location.href="schoolZoneManage"'>
	        </div>
        </form>
    </section>
</body>
</html>