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
	
	$('#subBtn').click(function(){
		var startDate = $('#startDate').val();
		var endDate = $('#endDate').val();

		if(startDate > endDate){
			alert("조회 기간 설정을 다시 해주세요.");
			return false;
		}
	});
});
</script>
<script type="text/javascript">
$(document).ready(function(){
	
	$('.cancelBtn').click(function(){
		
		var result = confirm('취소 신청을 하시겠습니까?');

		if(!result){
			return false;
		}
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
            <h1 id="orderInfomainfont">주문 상품 정보</h1>
            <form action = "orderInfo?mbrCode=${mbrCode}" method = "post">
                <div id="orderDate">
                    <h2 class="orderDateEl">조회 기간 설정</h2>
                    <div class="orderDateEl"><p><input type="date" id="startDate" name="startDate" value = "${startDate}" min="2020-01-01" max="${currentTime}"></p></div>
                    <h3 class="orderDateEl"> ~ </h3> 
                    <div class="orderDateEl"><p><input type="date" id="endDate" name="endDate"  value = "${endDate}" min="2020-01-01" max="${currentTime}"></p></div>
                    <div class="orderDateEl"><p><input id="subBtn" type="submit" value="검색"></p></div>
                </div>
              </form>
            <table id="orderTable">
                <tr>
                    <th>주문일자</th>
                    <th>이미지</th>
                    <th>상품정보</th>
                    <th>수량</th>
                    <th>상품구매금액</th>
                    <th>주문처리상태</th>
                </tr>
                <c:choose>
	                <c:when test="${list.size() == 0}">
		                <tr>
		                    <td colspan="6" id="orderNotice">주문 내역이 없습니다</td>
		                </tr>
	                </c:when>
	                <c:otherwise>
			            <c:forEach var = "cnt" begin="0" end="${list.size()-1}">
			                <tr>
			                    <td width="110px">${list[cnt].orderDate}</td>
			                    <td width="170px"><img src="${path}/resources/images/${infoList[cnt].imgUrl}" width="120px" height="60px" ></td>
			                    <td width="380px">
			                        <div class="orderInfoTable">
			                            <div class="orderInfoTd1">${infoList[cnt].content}</div>
			                            <div class="orderInfoTd2"><a href="detailOrderContent?orderCode=${list[cnt].orderCode}&orderContent=${infoList[cnt].content}">상세조회</a></div>
			                        </div>
			                    </td>
			                    <td>${infoList[cnt].totalQy}</td>
			                    <td width="130px">${list[cnt].totalPc}원</td>
			                    <td width="120px" class="orderState">
			                    	<c:choose>
			                    		<c:when test="${list[cnt].progrsSttus == '0501'}">
			                    			결제완료<br><a class="cancelBtn" href="cancelRequest?orderCode=${list[cnt].orderCode}&mbrCode=${mbrCode}">취소하기</a>
			                    		</c:when>
			                    		<c:when test="${list[cnt].progrsSttus == '0502'}">
			                    			준비중<br><a class="cancelBtn" href="cancelRequest?orderCode=${list[cnt].orderCode}&mbrCode=${mbrCode}">취소하기</a>
			                    		</c:when>
			                    		<c:when test="${list[cnt].progrsSttus == '0503'}">
			                    			<a href = "deliveryInquiry?orderCode=${list[cnt].orderCode}">배송중</a>
			                    		</c:when>
			                    		<c:when test="${list[cnt].progrsSttus == '0504'}">
			                    			<a href = "deliveryInquiry?orderCode=${list[cnt].orderCode}">배송완료</a>
			                    		</c:when>
			                    		<c:when test="${list[cnt].progrsSttus == '0505'}">
			                    			취소대기중
			                    		</c:when>
			                    		<c:otherwise>
			                    			취소완료
			                    		</c:otherwise>
			                    	</c:choose>
			                    </td>
			                </tr>  
		                </c:forEach>
	                </c:otherwise>
                </c:choose>
            </table>
            <div id="orderInfoButtonBox">
                <input id="myPageButton" type="button" value="회원정보 조회" onclick="document.location.href='cstCheck?mbrCode=${mbrCode}'">
                <input id="homeButton" type="button" value="홈으로 이동" onclick="document.location.href='main'">
            </div>
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