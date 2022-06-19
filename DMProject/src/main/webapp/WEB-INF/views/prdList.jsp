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
<link href="${path}/resources/css1/product_list.css" type="text/css" rel="stylesheet">
<link href="${path}/resources/css1/detail_prd.css" type="text/css" rel="stylesheet">
<link href="${path}/resources/css1/header.css" type="text/css" rel="stylesheet">
<link href="${path}/resources/css1/footer.css" type="text/css" rel="stylesheet">
<link href="${path}/resources/css1/category.css" type="text/css" rel="stylesheet">

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
<style>
	.btnColor{
		color:red;
		font-weight: bolder;
	}
</style>
<script>
  // 상세상품정보
  $(document).ready(function () {
    $('#big_container').hide();
    $('.prd_img').click(function (e) {
      e.stopPropagation();
      $('#big_container').toggle();
    });

    $(document).on("click", function (e) {
      if (e.target.className != "prd_img") {
        $('#big_container').hide();
      }
    });
    
    // 페이징
    $('#pageNo${pageNo}').addClass('btnColor');
    
    $('#preButton').click(function () {
      if("${cutPageNo}" == 1){
    	  return false;
      }
    });

    $('#nextButton').click(function () {
        var maxPage = "${maxPage}";
        var cutPageNo = parseInt("${cutPageNo}") + 4
        
    	if(maxPage < cutPageNo){
      	  return false;
        }
      });
  }); 
</script>
<title>상품목록</title>
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
        <!-- -------상품목록 box---------------------------------------------------------------- -->
        <ul class="product_list">
        <c:forEach var ="i" begin="0" end="${prdList.size()-1}">
	        <li>
	            <dl>
	              <dt><a href="#a">${prdList[i].prdName}  ${prdList[i].prdPc}원</a></dt>
	              <dd><a href="#a"><img class="prd_img" src="${path}/resources/images/${prdImgList[i].prdImageUrl}"></a></dd>
	              <dd class="buttonbox">
	                <button id ="cartbtns_${prdList[i].prdCode}"  value="장바구니">장바구니</button>
	              	<button id = "orderbtns" onclick='location.href="directOrder?prdCode=${prdList[i].prdCode}&mbrCode=${mbrCode}&qy=1"'  value="주문하기">주문하기</button>
	              	<button id = "detailbtns" onclick='location.href="detailPrd?prdCode=${prdList[i].prdCode}&mbrCode=${mbrCode}"'  value="상세정보">상세정보</button>
	              </dd>
	              <dd class="like">
	                <div><a href="#a"><img class="like_img" src="${path}/resources/images/heart.png" style="width: 22px;"> 좋아요</a></div>
	                <div>${prdList[i].prdRecomendCnt}개</div>
	              </dd>
	            </dl>
	          </li>
        </c:forEach>
        </ul>
        



        <script>
        	$(document).ready(function(){
        		
        		if("${ERR}" != "") {
        			alert("${ERR}");
        		}
        		
        		$("[id^='cartbtns_']").click(function(){
        			
        			var id = this.id;
        			var cntArray = id.split("_");
        			var prdCode = cntArray[1];
        			
        			if("${mbrCode}" == null || "${mbrCode}" == ""){
     	          		alert("로그인이 필요합니다.");

        			}
        			
        			else {
        				location.replace("cartAdd?pclCode=${pclCode}&prdCode="+prdCode+"&mbrCode=${mbrCode}&qy=1");
        			}
        			
        		});
        		/*$(".orderbtns").click(function(){
        			 var error = ${ERR};
 	          		
 	          		if(error != null) {
 	          			alert(error);
 	          		}
 	          		
 	          		if {
        				alert("${ERR}");
        			}
        		})
        		$(".detailbtns").click(function(){
        			 var error = ${ERR};
 	          		
 	          		if(error != null) {
 	          			alert(error);
 	          		}
        		})*/
        	});
        </script>
        
        <div class="paging">
            <a id="preButton" href="prdList?pclCode=${pclCode}&pageNo=${cutPageNo-1}&cutPageNo=${cutPageNo-5}">&#60;</a>
            <c:choose>
            	<c:when test="${maxPage > cutPageNo+4}">
            		<c:forEach var = "i" begin ="${cutPageNo}" end="${cutPageNo+4}">
            			<a href="prdList?pclCode=${pclCode}&pageNo=${i}&cutPageNo=${cutPageNo}" id="pageNo${i}" class="num">${i}</a>
            		</c:forEach>
            	</c:when>
            	<c:otherwise>
            		<c:forEach var = "i" begin ="${cutPageNo}" end="${maxPage}">
            			<a href="prdList?pclCode=${pclCode}&pageNo=${i}&cutPageNo=${cutPageNo}" id="pageNo${i}" class="num">${i}</a>
            		</c:forEach>
            	</c:otherwise>
            </c:choose>
            <a id="nextButton" href="prdList?pclCode=${pclCode}&pageNo=${cutPageNo+5}&cutPageNo=${cutPageNo+5}">></a>
        </div> 
          
        <!--상품상세정보-------------------------------------------->
        <div id="big_container">
          <div id="container">
            <img id="arrow_left" src="${path}/resources/images/left-arrow.png">
            <img id="arrow_right" src="images/right-arrow.png">
            <div class="sub_container">
              <div id="prd_img"><img width="100%" src="${path}/resources/images/${IMAGE.prdImageUrl}"></div>
              <img id="arrow_left" src="${path}/resources/images/left-arrow.png">
              <img id="arrow_right" src="${path}/resources/images/right-arrow.png">
            </div>
            <div class="sub_container">
              <div id="prd_info">
                <h1>${PRD.prdName}   ${PRD.prdPc}원</h1>
              </div>
              <div id="prd_detail">
                ${PRD. prdCn}
              </div>
              <div id="button_box">
                <input type="button" value="장바구니"  onclick='location.href="cartAdd?prdCode=${PRD.prdCode}"'>
                <input type="button" value="주문" onclick='location.href="directOrder?prdCode=${PRD.prdCode}"'>
                <input type="button" value="상세정보"  onclick='location.href="detailPrd?prdCode=${PRD.prdCode}"'>
              </div>
            </div>
          </div> 
          <!--------상품목록 box---------------------------------------------------------------- -->
      </div>
      <aside id="aside2">

      </aside>
    </div>
  </div>
  </div>
  <!-- -------footer box---------------------------------------------------------------- -->


  <footer id="footer_box">
    <div id="footer" class="footer_new">
      <div>
        <div id="footer-title">
          <div><img width="100px" src="${path}/resources/images//black.png"></div>
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