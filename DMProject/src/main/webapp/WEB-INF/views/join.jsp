<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${path}/resources/css/style.css"/>
<script type="text/javascript" src="${path}/resources/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="${path}/resources/js/join.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	var msg = "${ERR}";
	if(msg != ""){
		alert(msg);
		return false;
	}
	
	var result;
	
	$('#sec_pw').on("propertychange change keyup paste input", function(){
		if($('#fir_pw').val() != $('#sec_pw').val()){
			$('#pw_check_result').html("<span style='color:red'>비밀번호가 일치하지않습니다.</span>");
		} else {
			$('#pw_check_result').html("<span style='color:blue'>비밀번호가 일치합니다.</span>");
		}
	});
	
	$('.id_check').click(function(){
		var input_value = $("input[name='mbrId']").val();
		
		if(!input_value){
			alert("아이디를 입력하세요.");
			$("input[name='mbrId']").focus();
			return false;
		}
		
		var url = "/DMProject/checkId";
		
		$.getJSON(url,{
			"id" : input_value
		}, function(json){
			var result_text = json.result;
			result = eval(result_text);
			if(result){
				$('#login_check_result').html("<span style='color:blue'>사용가능한 아이디입니다.</span>");
			} else {
				$('#login_check_result').html("<span style='color:red'>이미 사용중인 아이디입니다.</span>");
			}
		})
	});
	
	$('#join_form').submit(function(){
		if($('#fir_pw').val() != $('#sec_pw').val()){
			alert("비밀번호를 확인해주세요.");
			return false;
		}
		
		if(result = null || !result){
			alert("아이디 중복 확인해주세요.");
			return false;
		}
		alert("회원가입에 성공했습니다.");
	});
});
</script>
<title>회원가입</title>
</head>
<body>
    <section id="join_section">
        <div id="join_top">
            <img id="join_logo_img" src="${path}/resources/images/logo.png"/>
            <h1>가입을 시작합니다!</h1>
        </div>
        <form id="join_form" method="post" action="mbrJoinOk">
            <div class="join_line">
                <h3>아이디</h3><p>*</p>
            </div>
            <input class="join_input join_input_id" type="text" placeholder="아이디 입력" name="mbrId"/>
            <input class="id_check" type="button" value="아이디 중복 조회">
            <div id="login_check_result"></div><br>
            <div class="join_line">
                <h3>비밀번호</h3><p>*</p>
            </div>
            <input class="join_input join_input_pw" id="fir_pw" type="password" placeholder="비밀번호 입력" name="mbrPwd"/><br>
            <input class="join_input join_input_pw" id="sec_pw" type="password" placeholder="비밀번호 재입력"/>
            <div id="pw_check_result"></div><br>
            <div class="join_line join_nb">
                <div class="join_name">
                    <div class="join_line">
                        <h3>성명</h3><p>*</p>
                    </div>
                    <input class="join_input join_input_name" type="text" placeholder="성명 입력" name="mbrName"/>
                </div>
                <div>
                    <div class="join_line">
                        <h3>생년월일</h3><p>*</p>
                    </div>
                    <input class="join_input join_input_birth" type="date"/>
                </div>
            </div>
            <div class="join_line">
                <h3>휴대폰 번호</h3><p>*</p>
            </div>
            <input class="join_input join_input_phone input_phone1" type="text" placeholder="010"/>
            <input class="join_input join_input_phone input_phone2" type="text" placeholder="0000"/>
            <input class="join_input join_input_phone input_phone3" type="text" placeholder="0000"/>
            <button class="join_phone_check" disabled="disabled">인증요청</button>
            <div class="join_line">
                <div class="join_ss">
                    <div class="join_line">
                        <h3>성별</h3><p>*</p>
                    </div>
                    <select id="sex" name="mbrSex">
                        <option value="">===선택===</option>
                        <option value="F">여자</option>
                        <option value="M">남자</option>
                    </select>
                </div>
                <div>
                    <div class="join_line join_input_school">
                        <h3>대구대명초등학교</h3>
                        <input type="checkbox" id="join_school_member">
                    </div>
                    <div class="join_line join_gc">
                        <h3>학년</h3>
                        <select id="grade">
                            <option value="">===선택===</option>
                            <option value="01">1학년</option>
                            <option value="02">2학년</option>
                            <option value="03">3학년</option>
                            <option value="04">4학년</option>
                            <option value="05">5학년</option>
                            <option value="06">6학년</option>
                        </select>
                        <h3>반</h3>
                        <select id="class">
                            <option value="">===선택===</option>
                            <option value="01">1반</option>
                            <option value="02">2반</option>
                            <option value="03">3반</option>
                            <option value="04">4반</option>
                            <option value="05">5반</option>
                        </select>
                    </div>
                </div>
            </div>
            <div class="join_email">
                <h3>이메일</h3>
                <input class="join_input" id="join_input_email" type="text" placeholder="이메일 입력" name="mbrEmail"/>
            </div>
            <div class="yackgwan">
                <h4>약관 내용</h4>
            </div>
            <div class="join_check">
                <h3>약관에 동의하시겠습니까?</h3>
                <h3>예</h3>
                <input type="checkbox" id="join_check_ok" />
            </div>
            <input id="join_input_birth" type="hidden" name="mbrBrthdy"/>
            <input id="join_school_info" type="hidden" name="mbrGrade"/>
            <input id="phoneNumber" type="hidden" name="mbrTelNo"/>
            <input id="gradeClass" type="hidden" name="schulGradeClass"/>
            <input id="join_timestamp" type="hidden" name="sbscrbDate"/>
            <div class="join_btn">
                <input id="join_btn_submit" type="submit" value="가입" />
                <input type="button" value="취소" onclick='location.href="goLogin?v=<%=System.currentTimeMillis() %>"'/>
            </div>
        </form>
    </section>
</body>
</html>