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
  <link href="${path}/resources/css1/board1.css" type="text/css" rel="stylesheet">
  <link href="${path}/resources/css1/footer.css" type="text/css" rel="stylesheet">
  <link href="${path}/resources/css1/header.css" type="text/css" rel="stylesheet">
  <link href="${path}/resources/css1/category.css" type="text/css" rel="stylesheet">
<title>공지 게시판</title>
<style>
	.btnColor{
		color : red;
		font-weight : bolder;
	}
</style>
<script>
$(document).ready(function(){
		
	$('#pageNo${pageNo}').addClass('btnColor');
	
    $('#preButton').click(function(){
        if("${cutPageNo}" == 1){
        	return false;
        }
    });
    $('#nextButton').click(function(){
    	var maxPage = "${maxPage}";
    	var cutPageNo = parseInt("${cutPageNo}") + 4
        if(maxPage < cutPageNo){
        	return false;
        }
    });
    
    $('#submitBtn').click(function(){
        if($("#bbTitlSearch").val()  == ""){
        	alert("검색한 값이 없습니다");
        	return false;
        }
    });
    
});
</script>
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
<title>메인 페이지</title>
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
    <div id="body">
    <div class="content-box">
      <aside id="aside">

      </aside>
      
      <div id="main">
      
        <div style="margin-top: 100px; margin-left: 10px;">
          <a href="#"><img src="${path}/resources/images/review.png"></a>
        </div>

        <section style="position: relative;">
          <div style="position: absolute;"></div>
 			<form action = "info_boardSearchList" method = "get">
          	<input type ="hidden" name = "bbiCode" value ="${bbiCode}">
			<table border="1" style="position: absolute; left: 58%;">
            <tr>
              <td style="background-color: rgb(223, 221, 221);">
				<img src="${path}/resources/images/search.png" style=" width: 32px;">
              </td>
              <td>
                <input id="bbTitlSearch" type="text" name="bbTitl" style="width: 220px; padding: 10px; border:transparent">
              </td>
              <td>
              	<input id="submitBtn" style="width:40px; height:40px; font-size : 15px;" type="submit" value="검색">
              </td>
            </tr>
          </table>          
          </form>
        </section>



        <div class="table_box" style="margin-top: 45px;">

          <table class="notice_table">
            <thead>
              <tr>
                <th style="background-color: #98bcff;">번호</th>
                <th style="background-color: #98bcff;">제 목</th>
                <th style="background-color: #98bcff;">작성자</th>
                <th style="background-color: #98bcff;">작성일</th>
                <th style="background-color: #98bcff;">조회수</th>
              </tr>
            </thead>
            <tbody>
            <c:choose>
            	<c:when test="${bbList.size() > 0}">
	            	<c:forEach var = "cnt" begin = "0" end = "${bbList.size()-1}">
		            	<tr>
			                <td>${bbList[cnt].bbNum}</td>
			                <td class="notice_title">
			                  <a href="info_boardContent?bbiCode=${bbiCode}&bbNum=${bbList[cnt].bbNum}&writerId=${mbrList[cnt].mbrId}&pageNo=${pageNo}&cutPageNo=${cutPageNo}">${bbList[cnt].bbTitl}</a>
			                </td>
			                <td>${mbrList[cnt].mbrId}</td>
			                <th>${dateList[cnt]}</th>
			                <td>${bbList[cnt].bbRdcnt}</td>
		             	</tr>
	            	</c:forEach>
            	</c:when>
            	<c:otherwise>
            		<tr>
            			<td colspan = "5">
            				게시글이 없습니다.
            			</td>
            		</tr>
            	</c:otherwise>
            </c:choose>

            </tbody>
          </table>
          <section style="position: relative;">
            <div style="margin-top: 30px;">
	            <c:if test="${prdCode != null}">
	            	<input id="write_button" type="button" value="게시글작성" onclick="document.location.href='bbInputPage?bbiCode=${bbiCode}&pageNo=${pageNo}&cutPageNo=${cutPageNo}'">
	            </c:if>
            </div>
          </section>
          <div class="paging">
            	<a id = "preButton" href="info_boardSearchList?bbiCode=${bbiCode}&bbTitl=${bbTitl}&pageNo=${cutPageNo-1}&cutPageNo=${cutPageNo-5}">&#60;</a>
            	<c:choose>
            		<c:when test="${maxPage > cutPageNo+4}">
	            		<c:forEach var = "i" begin = "${cutPageNo}" end = "${cutPageNo+4}">
		            		<a href="info_boardSearchList?bbiCode=${bbiCode}&bbTitl=${bbTitl}&pageNo=${i}&cutPageNo=${cutPageNo}" id="pageNo${i}"class="num">${i}</a>
		            	</c:forEach>            		
            		</c:when>
            		<c:otherwise>
            			<c:forEach var = "i" begin = "${cutPageNo}" end = "${maxPage}">
		            		<a href="info_boardSearchList?bbiCode=${bbiCode}&bbTitl=${bbTitl}&pageNo=${i}&cutPageNo=${cutPageNo}" id="pageNo${i}" class="num">${i}</a>
		            	</c:forEach>   
            		</c:otherwise>
            	</c:choose>
                <a id = "nextButton" href="iinfo_boardSearchList?bbiCode=${bbiCode}&bbTitl=${bbTitl}&pageNo=${cutPageNo+5}&cutPageNo=${cutPageNo+5}">></a>
          </div>
        </div>
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