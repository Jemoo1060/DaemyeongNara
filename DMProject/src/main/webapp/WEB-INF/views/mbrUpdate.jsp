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
	var date = "${memberDto.mbrBrthdy}";
	var y = date.substring(0, 4);
	var m = date.substring(4, 6);
	var d = date.substring(6, 8);
	
	$('#mbrBrthday_output').text(y + "-" + m + "-" + d);
	
	var phone = "${memberDto.mbrTelNo}";
	var p1 = phone.substring(0, 3);
	var p2 = phone.substring(3, 7);
	var p3 = phone.substring(7, 10);
	
	$('#mbrTelNo_output').text(p1 + "-" + p2 + "-" + p3);
	
	var sex = "${memberDto.mbrSex}";
	
	if("F" == sex){
		$('#mbrSex_output').text("여자");	
	} else if ("M" == sex){
		$('#mbrSex_output').text("남자");	
	}
	
	var mbrGrade = "${memberDto.mbrGrade}";
	$('#default_mbrGrade').val(mbrGrade);
	
	var gc = "${memberDto.schulGradeClass}";
	var g = gc.substring(0, 2);
	var c = gc.substring(2, 4);
	
	$('#default_grade').val(g);
	$('#default_class').val(c);
	
	var gr = g.substring(1, 2);
	var cl = c.substring(1, 2);
	
	$('#default_grade').text(gr + "학년");
	$('#default_class').text(cl + "반");
	
	var grade;
	var clas;
	
	$("select[name=select_grade]").change(function(){
		grade = $(this).val(); //value값 가져오기
	});
	
	$("select[name=select_class]").change(function(){
		clas = $(this).val();
	});
	
	$('#ad_mbrUpdate_form').submit(function(){
		$('#admin_gc_input').val(grade + clas);
	});
	
});
</script>
<title>회원정보수정</title>
</head>
<body>
	<section id="mbr_update">
        <h1>회원정보 수정</h1>
        <form method="post" action="mbrUpdate" id="ad_mbrUpdate_form">
            <table>
                <tr>
                    <th>아이디</th>
                    <td>${memberDto.mbrId}</td>
                </tr>
                <tr>
                    <th>비밀번호</th>
                    <td>
                        <input name="mbrPwd" type="password" value="${memberDto.mbrPwd}">
                    </td>
                </tr>
                <tr>
                    <th>성명</th>
                    <td>${memberDto.mbrName}</td>
                </tr>
                <tr>
                    <th>생년월일</th>
                    <td id="mbrBrthday_output"></td>
                </tr>
                <tr>
                    <th>휴대폰번호</th>
                    <td id="mbrTelNo_output"></td>
                </tr>
                <tr>
                    <th>성별</th>
                    <td id="mbrSex_output"></td>
                </tr>
                <tr>
                    <th>회원등급</th>
                    <td id="mbrGrade_output">
                    	<select name="mbrGrade" id="select_mbrGrade">
	                        <option id="default_mbrGrade">===선택===</option>
	                        <option value="0101">관리자</option>
	                        <option value="0102">일반회원</option>
	                        <option value="0103">학교회원</option>
	                        <option value="0104">교사</option>
                    	</select>
                    </td>
                </tr>
                <tr>
                    <th>학교정보</th>
                    <td>
                        <div class="mbr_update_grade">
                            <h3>학년</h3>
                            <select id="select_grade1" name="select_grade">
                                <option id="default_grade"></option>
                                <option value="01">1학년</option>
                                <option value="02">2학년</option>
                                <option value="03">3학년</option>
                                <option value="04">4학년</option>
                                <option value="05">5학년</option>
                                <option value="06">6학년</option>
                            </select>
                            <h3>반</h3>
                            <select id="select_class1" name="select_class">
                                <option id="default_class"></option>
                                <option value="01">1반</option>
                                <option value="02">2반</option>
                                <option value="03">3반</option>
                                <option value="04">4반</option>
                                <option value="05">5반</option>
                            </select>
                        </div>
                    </td>
                </tr>
                <tr>
                    <th>이메일</th>
                    <td>${memberDto.mbrEmail}</td>
                </tr>
            </table>
            <div class="mbr_update_btn">
            	<input type="hidden" name="mbrCode" value="${memberDto.mbrCode}">
            	<input type="hidden" name="schulGradeClass" id="admin_gc_input">
                <input class="mbr_update_btn_submit" type="submit" value="수정">
                <input class="mbr_update_btn_cancel" type="button" value="취소" onclick='location.href="mbrManage"'>
            </div>
        </form>
    </section>
</body>
</html>