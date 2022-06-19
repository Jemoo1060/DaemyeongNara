<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="${path}/resources/js/jquery-3.4.1.min.js"></script>

<link href="${path}/resources/css1/reset.css" type="text/css" rel="stylesheet">
<link href="${path}/resources/css1/order.css" type="text/css" rel="stylesheet">
<link href="${path}/resources/css1/header.css" type="text/css" rel="stylesheet">
<link href="${path}/resources/css1/footer.css" type="text/css" rel="stylesheet">

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
		
		
	    $('#orderButton').click(function(){
	    	
	    	
	    	var num1 = $('.input_phone1').val();
	 		var num2 = $('.input_phone2').val();
	 		var num3 = $('.input_phone3').val();
	 		
	 		var number = num1 + num2 + num3;
	 		
	 		$('#phoneNumber').val(number);
	 		
	 		var num2 = $('.dvy2').val();
	        var num3 = $('.dvy3').val();

	        var number = num2 + " / " + num3;

	        $('#detailAddress').val(number);
	        
	        var t = new Date();
			var y = t.getFullYear();
			var m = t.getMonth()+1;
			var d = t.getDate();
			var ts = y.toString() + ("0" + m.toString()).slice(-2) + ("0" + d.toString()).slice(-2);

			$('#order_date').val(ts);    	
	    });
	});
</script>
<title>주문</title>
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
    <!-- -------body box---------------------------------------------------------------- -->

  <div id="body">
    <div class="content-box">
      <aside id="aside">
      </aside>

      <div id="main">
      	<form method = "post" action = "payment">
        <!-- -------오더 box---------------------------------------------------------------- -->
        
        <div id="orderh1">
          <h1>주문하기</h1>
        </div>

        <section>
          <h2 class="orderh2">주문상품 정보</h2>
          <table class="order_table">
            <tr>
              <th></th>
              <th style="text-align: center;">상품명</th>
              <th style="text-align: center;">옵션</th>
              <th>주문금액</th>
            </tr>
             <c:forEach var = "i" begin ="0" end ="${prdList.size()-1}">
             	<tr>
	              <td width="10%" style="padding-left: 10px; padding-right: 10px;">
	                <div>
	                  <a href="#"><img style="width: 80px; padding-top:3px;" src="${path}/resources/images/${prdImgList[i].prdImageUrl}"></a>
	                </div>
	              </td>
	              <td class="content" width="10%" style="padding-left: 15px;">${prdList[i].prdName}</td>
	               <c:choose>
                    	<c:when test="${qy == null}">
                    		<td width="30%" style="text-align: center;">
                    			<input id="plus" style="HEIGHT:20px; cursor: pointer;" onclick='location.href="#"' type="button" value="+">
                    			<input id="num" style="text-align: center;" size="2" value="${cartList[i].qy}" readonly> 
								<input id="minus" style="HEIGHT:20px; cursor: pointer;" onclick='location.href="#"' type="button" value="-">
                   			</td>
              				<td width="20%" style="font-weight: bold; font-size: 25px;">${prdList[i].prdPc * cartList[i].qy}원</td>
                    	</c:when>
                    	<c:otherwise>
                    		<td width="30%" style="text-align: center;">
	                    		<input id="plus" style="HEIGHT:20px; cursor: pointer;" onclick='location.href="#"' type="button" value="+">
	                    		<input id="num" style="text-align: center;" size="2" value="${qy}" readonly> 
								<input id="minus" style="HEIGHT:20px; cursor: pointer;" onclick='location.href="#"' type="button" value="-">
                   			</td>
              				<td width="20%" style="font-weight: bold; font-size: 25px;">${prdList[i].prdPc * qy}원</td>	                    	
                    	</c:otherwise>
                   </c:choose>
	            </tr>
             </c:forEach>
          </table>

        </section>
        <h2 class="orderh2">주문자 정보</h2>
        <table class="order_table">
          <tr>
            <th style="width: 150px; font-weight: bold;">이름</th>
            <th class="content">${memberDto.mbrName}</th>
          </tr>
          <tr>
            <td style="width: 150px; font-weight: bold;">휴대폰</td>
            <td class="content">${memberDto.mbrTelNo}</td>
          </tr>
        </table>
        <section>

        </section>
        <h2 class="orderh2">수령방법 선택</h2>
        
          <input type="radio" name="recptMth" value="0401">
          <label for="recptMth">배송</label>
          <input type="radio" name="recptMth" value="0402">
          <label for="recptMth">직접 수령</label>
       
        <table class="order_table">
          <tr>
            <th style="width: 150px; font-weight: bold;">수령자</th>
            <th class="content">
              <input name = "recptName" type="text" placeholder="수령자를 입력해주세요">
            </th>
          </tr>
          <tr>
            <th style="width: 150px; font-weight: bold;">휴대폰</th>
            <th>
              <input class = "input_phone1" type="text" size="3" maxlength="3" placeholder="010"> -
              <input class = "input_phone2" type="text" size="3" maxlength="4" placeholder="0000"> -
              <input class = "input_phone3" type="text" size="3" maxlength="4" placeholder="0000">
            </th>
          </tr>
          <tr>
            <th style="width: 150px; font-weight: bold;">요구사항</th>
            <th class="content">
              <textarea name ="demand" style="margin: 10px 0px 7px 0px;" cols="80" rows="5" placeholder="요구사항을 입력해주세요"></textarea>
            </th>
          </tr>
          <tr>
            <td style="width: 150px; font-weight: bold;">주소</td>
            <td class="content">
              <input name="dlvyZip" class="dvy1" readonly size="10" type="text" id="sample6_postcode"placeholder="우편번호">
              <input id="zip" type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
              <input class="dvy2" readonly size="50" type="text" id="sample6_address" placeholder="주소"><br>
              <input class="dvy3" size="50" type="text" id="sample6_detailAddress" placeholder="상세주소">
              <input type="text" id="sample6_extraAddress" placeholder="참고항목">
              

              <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
              <script>
                function sample6_execDaumPostcode() {
                  new daum.Postcode({
                    oncomplete: function (data) {
                      // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                      // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                      // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                      var addr = ''; // 주소 변수
                      var extraAddr = ''; // 참고항목 변수

                      //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                      if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                        addr = data.roadAddress;
                      } else { // 사용자가 지번 주소를 선택했을 경우(J)
                        addr = data.jibunAddress;
                      }

                      // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                      if (data.userSelectedType === 'R') {
                        // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                        // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                        if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
                          extraAddr += data.bname;
                        }
                        // 건물명이 있고, 공동주택일 경우 추가한다.
                        if (data.buildingName !== '' && data.apartment === 'Y') {
                          extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                        }
                        // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                        if (extraAddr !== '') {
                          extraAddr = ' (' + extraAddr + ')';
                        }
                        // 조합된 참고항목을 해당 필드에 넣는다.
                        document.getElementById("sample6_extraAddress").value = extraAddr;

                      } else {
                        document.getElementById("sample6_extraAddress").value = '';
                      }

                      // 우편번호와 주소 정보를 해당 필드에 넣는다.
                      document.getElementById('sample6_postcode').value = data.zonecode;
                      document.getElementById("sample6_address").value = addr;
                      // 커서를 상세주소 필드로 이동한다.
                      document.getElementById("sample6_detailAddress").focus();
                    }
                  }).open();
                }
              </script>


          </tr>
          <tr>
            <td style="width: 150px; font-weight: bold;">결제수단</td>
            <td class="content">
              
                <input type="radio" name="setleMth" value="0301">
                <label for="setleMth">카드결제</label>
                <input type="radio" name="setleMth" value="0302">
                <label for="setleMth">계좌이체</label>
                <input type="radio" name="setleMth" value="0303">
                <label for="setleMth">직접결제</label>
             
            </td>
          </tr>
          
        </table>
	
		
		<input id="order_date" type="hidden" name="orderDate"/>
		<input id="phoneNumber" type="hidden" name="dlvyCttpc"/>
		<input id="detailAddress" type="hidden" name="dlvyDetailAdres" />
		<input id="progress" type="hidden" name="progrsSttus" value="0501" />
		<input id="hdrlName" type="hidden" name="hdrlName" value="no" />
		<input id="waybilNum" type="hidden" name="waybilNum" value="no" />
		<input id="totalPc" type="hidden" name="totalPc" value="${total}" />
		<input id="mbrCode" type="hidden" name="mbrCode" value="${mbrCode}" />
		<input id="directQy" type="hidden" name="directQy" value="${qy}"/>
		<input id="directPrdCode" type="hidden" name="directPrdCode" value="${prdList[0].prdCode}"/>
		
		
        <section id="button_box">
          <input id="orderButton" type="submit" value="결제하기">
        </section>
        </form>

        <!-- -------오더 box------------------------------------------------------------------>
      </div>
      <aside id="aside2">

      </aside>
    </div>
  </div>
  <!-- -------footer box---------------------------------------------------------------- -->
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