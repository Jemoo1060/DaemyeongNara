<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="${path}/resources/js/jquery-3.4.1.min.js"></script>
<link href="${path}/resources/css/style.css" rel="stylesheet">
<script>
$(document).ready(function(){
    $('#login_welcome').hide();
    $('#header_logout').hide();
    $('#main_admin_btn').hide();
    
	var user = "${mbrId}";
    
    if(user != ""){
        $('#login_welcome').show();
        $('#header_logout').show();
        $('#header_login').hide();
    }
    
    $('#btn1').click(function(){
        $('.menuSelect').html("<div id=\"categoryBtn\"><a href = \"prdList?pclCode=0101\">문구류</a><a href = \"prdList?pclCode=0102\">완구류</a><a href = \"prdList?pclCode=0103\">제지류</a><a href = \"prdList?pclCode=0104\">잡화/펜시류</a><a href = \"prdList?pclCode=0105\">미술/음악/체육</a><a href = \"prdList?pclCode=0106\">기타</a></div>");
    });
    
    $('#btn2').click(function(){
        $('.menuSelect').html("<div id=\"foodBtn\"><a href = \"prdList?pclCode=0201\">패키지</a><a href = \"prdList?pclCode=0202\">껌/젤리/캔디</a><a href = \"prdList?pclCode=0203\">쿠키/스낵</a><a href = \"prdList?pclCode=0204\">커피/음료/푸딩</a><a href = \"prdList?pclCode=0205\">기타</a></div>");
    });
    
    $('#btn3').click(function(){
        $('.menuSelect').html("<div id=\"bbBtn\"><a href = \"info_boardList?bbiCode=1\">공지게시판</a><a href = \"info_boardList?bbiCode=3\">문의게시판</a><a href = \"info_boardList?bbiCode=2\">리뷰게시판</a></div>");
    });
    
    $('#btn4').click(function(){
    	if( "${mbrId}" != ""){
    		$('.menuSelect').html("<div id=\"myPageBtn\"><a href = \"cstCheck?mbrCode=${mbrCode}\">회원정보 조회</a><a href = \"orderInfo?mbrCode=${mbrCode}\">주문목록 조회</a></div>");	
    	} else {
    		alert("로그인 해주세요");	
    	}
    });
    
    $('#btn5').click(function(){
    	if("${mbrGrade}" == "0101" || "${mbrGrade}" == "0103" || "${mbrGrade}" == "0104"){
    		location.replace('goSchoolZone');
    	} else {
    		alert("학교회원 전용 메뉴입니다.");
    	}
    });
    
	var adminUser = "${mbrGrade}";
    
    if("0101" == adminUser) {
    	$('#main_admin_btn').show();
    }
    
    $('#header_cart').click(function() {
    	if("${mbrCode}" == "") {
    		alert("로그인 해주세요.");
    	} else { 
    		location.replace('cartList?mbrCode=${mbrCode}');
    	}
    });
});
</script>
<script>
$(document).ready(function(){
	$('.schoolsel').hide();
	
	if("${memberDto.mbrGrade}" == "0103"){
		$('#schoolchk').prop("checked", true);
		$('.schoolsel').show();
	} else {
		$('#schoolchk').prop("checked", false);
		$('.schoolsel').hide();
	}
	
	$('#schoolchk').change(function(){

		if($('#schoolchk').is(":checked")){
			
			$('.schoolsel').show();
			$('#mbrGrade').val("0103");
		} else {
			$('.schoolsel').hide();
			$('#grade').val("");
			$('#class').val("");
			$('#mbrGrade').val("0102");
		}
	});
	
	
	if("${memberDto.schulGradeClass}" != ""){		
		var gradeClass = "${memberDto.schulGradeClass}";
		var grade = gradeClass.substring(0,2);
		var schulclass = gradeClass.substring(2,4);
		 $('#grade').val(grade);
		 $('#class').val(schulclass);
	}
	
	$('#submitBtn').click(function(){	
		
		if($('#upEmail').val() == ""){
			alert("변경할 이메일을 입력해주세요.");
			$('#upEmail').focus();
			return false;
		}
		
		if($('#upTel').val() == ""){
			alert("변경할 전화번호를 입력해주세요.");
			$('#upTel').focus();
			return false;
		}
		
		if($('#upPwd1').val() == ""){
			alert("변경할 비밀번호를 입력해주세요.");
			$('#upPwd1').focus();
			return false;
		}
		
		if($('#upPwd2').val() == ""){
			alert("변경할 비밀번호를 입력해주세요.");
			$('#upPwd2').focus();
			return false;
		}
		
		if($('#upPwd3').val() == ""){
			alert("변경할 비밀번호를 입력해주세요.");
			$('#upPwd3').focus();
			return false;
		}
		
		if($('#upPwd1').val() != "${memberDto.mbrPwd}"){
			alert("비밀번호가 일치하지 않습니다.");
			$('#upPwd1').focus();
			return false;
		}
		
		if($('#upPwd2').val() != $('#upPwd3').val()){
			alert("새 비밀번호가 일치 하지 않습니다.");
			$('#upPwd2').focus();
			return false;
		}
	});
	
	
	$('#cstUpform').submit(function(){	
		var grade = $('#grade').val();
		var cls = $('#class').val();
		
		var gradeCls = grade + cls;
		
		$('#schulGradeClass').val(gradeCls);
		
		
	});
					
});
</script>
<title>회원 관리</title>
</head>
<body>
	<div id="header">
	    <div id="header_top">
	        <a href="main"><img id="header_logo" src="${path}/resources/images/logo.png"></a>
	        <div id="header_input">
	        	<form id="main_search_form" method="post" action="prdSearch?mbrCode=${mbrCode}">
		            <img id="header_search" src="${path}/resources/images/search.png">
		            <input id="header_search_input" type="search" placeholder="검색어를 입력하세요." name="prdName">
		            <input id="header_search_btn" type = "submit" value="검색">
		            <p id="login_welcome">${mbrId}님 환영합니다.</p>
	            </form>
	            <script> 
	            $(document).ready(function(){
	            	if("${prdNameErr}" != ""){
			        	alert("검색한 결과가 없습니다.");
			        	return false;
			        }
	            	$('#header_search_btn').click(function(){
				        if($("#header_search_input").val()  == ""){
				        	alert("검색한 값이 없습니다");
				        	return false;
				        }
				    });
	            });
				</script>
	            <div>
	                <a>
	                    <img id="header_cart" src="${path}/resources/images/cart.png">
	                </a>
	                <a href="goLogin?v=<%=System.currentTimeMillis() %>">
	                    <img id="header_login" src="${path}/resources/images/login.png">
	                </a>
	                <a href="logout">
	                    <img id="header_logout" src="${path}/resources/images/logout.png">
	                 </a>
	             </div>
	         </div>
	     </div>
	     <div id="header_list">
	         <div><input id="btn1" type="button" value="카테고리"></div>
	         <div><input id="btn2" type="button" value="먹거리코너"></div>
	         <div><input id="btn3" type="button" value="커뮤니티"></div>
	         <div><input id="btn4" type="button" value="마이페이지"></div>
	         <div><input id="btn5" type="button" value="스쿨존"></div>
	     </div>
	     <div id="header_admin_btn">
	         <input id="main_admin_btn" type="button" value="관리자페이지" onclick='location.href="goAdmin"'>
	     </div>
	     <div class="menuSelect"></div>
	</div>
    <section id="main_section">
        <div id="mainContent">
            <h1 id="cstUpdatemainfont"> 회원 정보 수정</h1>
            <form id="cstUpform"action = "cstInfoUpdate" method ="post">
                <table id="cstInfoUpTable">
                    <tr>
                        <th>아이디</th>
                        <td>${memberDto.mbrId}</td>
                    </tr>
                    <tr>
                        <th>이메일</th>
                        <td><input type="text" id = "upEmail" name="mbrEmail" placeholder="변경할 이메일 입력"/></td>
                    </tr>
                    <tr>
                        <th>휴대폰 번호</th>
                        <td><input type="text" id = "upTel" name="mbrTelNo" placeholder="변경할 휴대번호 입력"/> </td>
                    </tr>
                    <tr>
                        <th>비밀번호</th>
                        <td>
                            <div>
                                <div class="passwordInput">
                                    <div class="passwordtext">현재비밀번호</div>
                                    <div><input class="passwordsub" type="password"  id = "upPwd1" placeholder="현재비밀번호 입력"/></div>
                                </div>
                                <div class="passwordInput">
                                    <div class="passwordtext">새 비밀번호</div> 
                                    <div ><input class="passwordsub" type="password" id = "upPwd2" placeholder="새 비밀번호 입력"/> </div>
                                </div>
                                <div class="passwordInput2">
                                    <div class="passwordtext">비밀번호 다시 입력</div>
                                    <div><input class="passwordsub" type="password"  id = "upPwd3" name="mbrPwd" placeholder="비밀번호 다시 입력"/></div> 
                                </div>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <th>대명초등학교 회원</th>
                        <td>
                            <label>대구대명초등학교 <input id="schoolchk" type="checkbox" name="schoolChk" value="schoolstudent"></label> 
                            <select class="schoolsel" id = "grade">
                            <option value="">===학년===</option>
                            <option value="01">1학년</option>
                            <option value="02">2학년</option>
                            <option value="03">3학년</option>
                            <option value="04">4학년</option>
                            <option value="05">5학년</option>
                            <option value="06">6학년</option>
                            </select>
                            <select class="schoolsel" id="class">
                            <option value="">===반===</option>
                            <option value="01">1반</option>
                            <option value="02">2반</option>
                            <option value="03">3반</option>
                            <option value="04">4반</option>
                            <option value="05">5반</option>
                            </select>
                        </td>
                    </tr>
                </table>
                <input type = "hidden" name = "mbrCode" value="${memberDto.mbrCode}" />
                <input type = "hidden" id = "mbrGrade" name = "mbrGrade" />
                <input type = "hidden" id = "schulGradeClass" name = "schulGradeClass" />
                <div id="InfoUpdatebuttoninput">
                    <input id = "submitBtn" type="submit" value="수정완료">
                    <input type="button" value="취소" onclick="document.location.href='cstInfoInquiry?mbrCode=${memberDto.mbrCode}'">
                </div>
            </form>
        </div>
    </section>
    <footer id="footer_box">
        <div id="footer" class="footer_new">
          <div>
            <div id="footer-title">
               <div><img width="100px" src="${path}/resources/images/black.png"></div>
              <h1 id="title"><strong><a href="/" title="대명나라문구">대명나라문구</a></strong></h1>
            </div>
            <div class="footer-content">
              <address>
                상호명 : 대명나라문구<br>
                대표 : 김**<br>
                대구 대명동 <br>
                사업자 등록번호 : 123-456-789 <br>
                통신판매업신고 : 11111<br>
                <!--<a href="http://www.ftc.go.kr/info/bizinfo/communicationViewPopup.jsp?wrkr_no=1208800767" target="_blank" class="licensee" title="사업자정  보 확인">사업자정보 확인 &gt;</a>-->
              </address>
              <div class="contact-info" style="margin: 0px 20px;">
    
                <strong>고객센터</strong><br>
                <h2>053-111-1111</h2><br>
                <span class="contact-fax">email : jjy@naver.com</span>
    
              </div>
              <p class="safe-service">
                <strong>채무지급보증 안내</strong><br>
                <span>
                  당사는 고객님이 현금 결제한 금액에 대해<br>dd은행과 채무지급보증 계약을 체결하여<br>안전거래를 보장하고 있습니다.<br>
                </span>
                <!--<a href="javascript:;" id="serviceCheck" class="service-check" title="서비스 가입사실 확인">서비스 가입사실 확인 &gt;</a>-->
              </p>
            </div>
          </div>
        </div>
      </footer>

</body>
</html>