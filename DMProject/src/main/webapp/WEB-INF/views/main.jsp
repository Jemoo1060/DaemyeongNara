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
    
    $('#orderSelGo').click(function(){
        if( "${mbrId}" == ""){
           alert("로그인 해주세요");   
        } else {
           location.replace('orderInfo?mbrCode=${mbrCode}');
        }
     });
    
    $('#header_cart').click(function() {
    	if("${mbrCode}" == "") {
    		alert("로그인 해주세요.");
    	} else { 
    		location.replace('cartList?mbrCode=${mbrCode}');
    	}
    });

    $('#cartSelGo').click(function(){
        if( "${mbrId}" == ""){
           alert("로그인 해주세요");   
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
    <section id="main_section">
    	<div id="main_center_area">
        <h1 class="mainPrdfont">BEST 상품</h1>
	        <div id="bestPrd">
	            <div class="bestslidebox">
	                <input type="radio" name="bestslide" id="bestslide01" checked>
	                <input type="radio" name="bestslide" id="bestslide02">
	                <input type="radio" name="bestslide" id="bestslide03">
	                <input type="radio" name="bestslide" id="bestslide04">
	                <ul class="bestslidelist">
	                    <li class="bestslideitem">
	                        <div>
	                            <label for="bestslide04" class="bestleft">
	                                <img class="left_arrow" src="${path}/resources/images/left-arrow.png">
	                            </label>
	                            <label for="bestslide02" class="bestright">
	                                <img class="right_arrow" src="${path}/resources/images/right-arrow.png">
	                            </label>
	                            <a href="#"><img class="main_best_img" src="${path}/resources/images/${bestPrdList[0].prdImageUrl}"></a>
	                        </div>
	                    </li>
	                    <li class="bestslideitem">
	                        <div>
	                            <label for="bestslide01" class="bestleft">
	                                <img class="left_arrow" src="${path}/resources/images/left-arrow.png">
	                            </label>
	                            <label for="bestslide03" class="bestright">
	                                <img class="right_arrow" src="${path}/resources/images/right-arrow.png">
	                            </label>
	                            <a href="#"><img class="main_best_img" src="${path}/resources/images/${bestPrdList[1].prdImageUrl}"></a>
	                        </div>
	                    </li>
	                    <li class="bestslideitem">
	                        <div>
	                            <label for="bestslide02" class="bestleft">
	                                <img class="left_arrow" src="${path}/resources/images/left-arrow.png">
	                            </label>
	                            <label for="bestslide04" class="bestright">
	                                <img class="right_arrow" src="${path}/resources/images/right-arrow.png">
	                            </label>
	                            <a href="#"><img class="main_best_img" src="${path}/resources/images/${bestPrdList[2].prdImageUrl}"></a>
	                        </div>
	                    </li>
	                    <li class="bestslideitem">
	                        <div>
	                            <label for="bestslide03" class="bestleft">
	                                <img class="left_arrow" src="${path}/resources/images/left-arrow.png">
	                            </label>
	                            <label for="bestslide01" class="bestright">
	                                <img class="right_arrow" src="${path}/resources/images/right-arrow.png">
	                            </label>
	                            <a href="#"><img class="main_best_img" src="${path}/resources/images/${bestPrdList[3].prdImageUrl}"></a>
	                        </div>
	                    </li>
	                </ul>
	            </div>
	        </div>
	        <h1 class="mainPrdfont">HOT 상품</h1>
	        <div id="hotPrd">
	            <div class="slidebox">
	                <input type="radio" name="slide" id="slide01" checked>
	                <input type="radio" name="slide" id="slide02">
	                <input type="radio" name="slide" id="slide03">
	                <input type="radio" name="slide" id="slide04">
	                <ul class="slidelist">
	                    <li class="slideitem">
	                        <div class="hotNewprd">
	                            <c:forEach var="cnt" begin="0" end="2">
	                                <div class="hotNewBox">
	                                    <div class="hotNewImg">
	                                        <a href="#"><img src="${path}/resources/images/${hotPrdImgList[cnt].prdImageUrl}"></a>
	                                    </div>
	                                    <div class="hotNewInfo">
	                                        <h1>${hotPrdList[cnt].prdName}</h1>
	                                        <h2>${hotPrdList[cnt].prdPc}원</h2>
	                                    </div>
	                                    <div class="hotNewGood">
	                                        <a href="#"><img class="heart_img" src="${path}/resources/images/heart.png"></a>
	                                        <h1>좋아요</h1>
	                                        <h2>${hotPrdList[cnt].prdRecomendCnt}개</h2>
	                                    </div>
	                                </div>
	                            </c:forEach>
	                        </div>
	                    </li>
	                    <li class="slideitem">
	                        <div class="hotNewprd">
	                            <c:forEach var="cnt" begin="3" end="5">
	                                <div class="hotNewBox">
	                                    <div class="hotNewImg">
	                                        <a href="#"><img src="${path}/resources/images/${hotPrdImgList[cnt].prdImageUrl}"></a>
	                                    </div>
	                                    <div class="hotNewInfo">
	                                        <h1>${hotPrdList[cnt].prdName}</h1>
	                                        <h2>${hotPrdList[cnt].prdPc}원</h2>
	                                    </div>
	                                    <div class="hotNewGood">
	                                        <a href="#"><img class="heart_img" src="${path}/resources/images/heart.png"></a>
	                                        <h1>좋아요</h1>
	                                        <h2>${hotPrdList[cnt].prdRecomendCnt}개</h2>
	                                    </div>
	                                </div>
	                            </c:forEach>
	                        </div>
	                    </li>
	                    <li class="slideitem">
	                        <div class="hotNewprd">
	                            <c:forEach var="cnt" begin="6" end="8">
	                                <div class="hotNewBox">
	                                    <div class="hotNewImg">
	                                        <a href="#"><img src="${path}/resources/images/${hotPrdImgList[cnt].prdImageUrl}"></a>
	                                    </div>
	                                    <div class="hotNewInfo">
	                                        <h1>${hotPrdList[cnt].prdName}</h1>
	                                        <h2>${hotPrdList[cnt].prdPc}원</h2>
	                                    </div>
	                                    <div class="hotNewGood">
	                                        <a href="#"><img class="heart_img" src="${path}/resources/images/heart.png"></a>
	                                        <h1>좋아요</h1>
	                                        <h2>${hotPrdList[cnt].prdRecomendCnt}개</h2>
	                                    </div>
	                                </div>
	                            </c:forEach>
	                        </div>
	                    </li>
	                    <li class="slideitem">
	                        <div class="hotNewprd">
	                            <c:forEach var="cnt" begin="9" end="11">
	                                <div class="hotNewBox">
	                                    <div class="hotNewImg">
	                                        <a href="#"><img src="${path}/resources/images/${hotPrdImgList[cnt].prdImageUrl}"></a>
	                                    </div>
	                                    <div class="hotNewInfo">
	                                        <h1>${hotPrdList[cnt].prdName}</h1>
	                                        <h2>${hotPrdList[cnt].prdPc}원</h2>
	                                    </div>
	                                    <div class="hotNewGood">
	                                        <a href="#"><img class="heart_img" src="${path}/resources/images/heart.png"></a>
	                                        <h1>좋아요</h1>
	                                        <h2>${hotPrdList[cnt].prdRecomendCnt}개</h2>
	                                    </div>
	                                </div>
	                            </c:forEach>
	                        </div>
	                    </li>
	                </ul>
	                <div class="slide-control">
	                    <div class="control01">
	                        <label for="slide04" class="prev"><img class="click_img_main" src="${path}/resources/images/left-click.png"></label>
	                        <label for="slide02" class="next"><img class="click_img_main" src="${path}/resources/images/right-click.png"></label>
	                    </div>
	                    <div class="control02">
	                        <label for="slide01" class="prev"><img class="click_img_main" src="${path}/resources/images/left-click.png"></label>
	                        <label for="slide03" class="next"><img class="click_img_main" src="${path}/resources/images/right-click.png"></label>
	                    </div>
	                    <div class="control03">
	                        <label for="slide02" class="prev"><img class="click_img_main" src="${path}/resources/images/left-click.png"></label>
	                        <label for="slide04" class="next"><img class="click_img_main" src="${path}/resources/images/right-click.png"></label>
	                    </div>
	                    <div class="control04">
	                        <label for="slide03" class="prev"><img class="click_img_main" src="${path}/resources/images/left-click.png"></label>
	                        <label for="slide01" class="next"><img class="click_img_main" src="${path}/resources/images/right-click.png"></label>
	                    </div>
	                </div>
	            </div>
	        </div>
	        <h1 class="mainPrdfont">NEW 상품</h1>
	        <div id="NewPrd">
	            <div class="slidebox">
	                <input type="radio" name="slide2" id="slide05" checked>
	                <input type="radio" name="slide2" id="slide06">
	                <input type="radio" name="slide2" id="slide07">
	                <input type="radio" name="slide2" id="slide08">
	                <ul class="slidelist">
	                    <li class="slideitem">
	                        <div class="hotNewprd">
	                            <c:forEach var="cnt" begin="0" end="2">
	                                <div class="hotNewBox">
	                                    <div class="hotNewImg">
	                                        <a href="#"><img src="${path}/resources/images/${newPrdImgList[cnt].prdImageUrl}"></a>
	                                    </div>
	                                    <div class="hotNewInfo">
	                                        <h1>${newPrdList[cnt].prdName}</h1>
	                                        <h2>${newPrdList[cnt].prdPc}원</h2>
	                                    </div>
	                                    <div class="hotNewGood">
	                                        <a href="#"><img class="heart_img" src="${path}/resources/images/heart.png"></a>
	                                        <h1>좋아요</h1>
	                                        <h2>${newPrdList[cnt].prdRecomendCnt}개</h2>
	                                    </div>
	                                </div>
	                            </c:forEach>
	                        </div>
	                    </li>
	                    <li class="slideitem">
	                        <div class="hotNewprd">
	                            <c:forEach var="cnt" begin="3" end="5">
	                                <div class="hotNewBox">
	                                    <div class="hotNewImg">
	                                        <a href="#"><img src="${path}/resources/images/${newPrdImgList[cnt].prdImageUrl}"></a>
	                                    </div>
	                                    <div class="hotNewInfo">
	                                        <h1>${newPrdList[cnt].prdName}</h1>
	                                        <h2>${newPrdList[cnt].prdPc}원</h2>
	                                    </div>
	                                    <div class="hotNewGood">
	                                        <a href="#"><img class="heart_img" src="${path}/resources/images/heart.png"></a>
	                                        <h1>좋아요</h1>
	                                        <h2>${newPrdList[cnt].prdRecomendCnt}개</h2>
	                                    </div>
	                                </div>
	                            </c:forEach>
	                        </div>
	                    </li>
	                    <li class="slideitem">
	                        <div class="hotNewprd">
	                            <c:forEach var="cnt" begin="6" end="8">
	                                <div class="hotNewBox">
	                                    <div class="hotNewImg">
	                                        <a href="#"><img src="${path}/resources/images/${newPrdImgList[cnt].prdImageUrl}"></a>
	                                    </div>
	                                    <div class="hotNewInfo">
	                                        <h1>${newPrdList[cnt].prdName}</h1>
	                                        <h2>${newPrdList[cnt].prdPc}원</h2>
	                                    </div>
	                                    <div class="hotNewGood">
	                                        <a href="#"> <img class="heart_img" src="${path}/resources/images/heart.png"></a>
	                                        <h1>좋아요</h1>
	                                        <h2>${newPrdList[cnt].prdRecomendCnt}개</h2>
	                                    </div>
	                                </div>
	                            </c:forEach>
	                        </div>
	                    </li>
	                    <li class="slideitem">
	                        <div class="hotNewprd">
	                            <c:forEach var="cnt" begin="9" end="11">
	                                <div class="hotNewBox">
	                                    <div class="hotNewImg">
	                                        <a href="#"><img src="${path}/resources/images/${newPrdImgList[cnt].prdImageUrl}"></a>
	                                    </div>
	                                    <div class="hotNewInfo">
	                                        <h1>${newPrdList[cnt].prdName}</h1>
	                                        <h2>${newPrdList[cnt].prdPc}원</h2>
	                                    </div>
	                                    <div class="hotNewGood">
	                                        <a href="#"><img class="heart_img" src="${path}/resources/images/heart.png"></a>
	                                        <h1>좋아요</h1>
	                                        <h2>${newPrdList[cnt].prdRecomendCnt}개</h2>
	                                    </div>
	                                </div>
	                            </c:forEach>
	                        </div>
	                    </li>
	                </ul>
	                <div class="slide-control">
	                    <div class="control05">
	                        <label for="slide08" class="prev"><img class="click_img_main" src="${path}/resources/images/left-click.png"></label>
	                        <label for="slide06" class="next"><img class="click_img_main" src="${path}/resources/images/right-click.png"></label>
	                    </div>
	                    <div class="control06">
	                        <label for="slide05" class="prev"><img class="click_img_main" src="${path}/resources/images/left-click.png"></label>
	                        <label for="slide07" class="next"><img class="click_img_main" src="${path}/resources/images/right-click.png"></label>
	                    </div>
	                    <div class="control07">
	                        <label for="slide06" class="prev"><img class="click_img_main" src="${path}/resources/images/left-click.png"></label>
	                        <label for="slide08" class="next"><img class="click_img_main" src="${path}/resources/images/right-click.png"></label>
	                    </div>
	                    <div class="control08">
	                        <label for="slide07" class="prev"><img class="click_img_main" src="${path}/resources/images/left-click.png"></label>
	                        <label for="slide05" class="next"><img class="click_img_main" src="${path}/resources/images/right-click.png"></label>
						</div>
		        	</div>
		    	</div>
		    </div>
		</div>
        <div id="mainRight">
            <div id="fixed">
                <input id="cartSelGo" type="button" value="장바구니">
                <input id = "orderSelGo" type="button" value="주문조회">
                <div id="recordsilde">
                    <div class="recorditem">
                        <img src="${path}/resources/images/among.jpg">
                    </div>
                    <div class="recorditem">
                        <img src="${path}/resources/images/duck.png">
                    </div>
                    <div class="recorditem">
                        <img src="${path}/resources/images/malrang.PNG">
                    </div>
                    <div class="recorditem">
                        <img src="${path}/resources/images/carrot.png">
                    </div>
                </div>
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