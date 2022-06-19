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
<link href="${path}/resources/css1/cart.css" type="text/css" rel="stylesheet">
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
<title>장바구니</title>
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
        <!-- -------오더 box---------------------------------------------------------------- -->
        <div id="carth1">
          <h1>장바구니</h1>
        </div>

        <section style="position: relative;">
          <input id="choice_delete" type="button" onclick='location.href="cartTotalPrdDel?mbrCode=${mbrCode}"' value="삭제">
        </section>
        

        <section style="margin-top: 70px;">
          <form>
            <script src="http://code.jquery.com/jquery-1.6.4.min.js"></script>
			<script type="text/javascript">
				$(function(){
					var chkObj = document.getElementsByName("RowCheck");
					var rowCnt = chkObj.length;
					
					$("input[name='allCheck']").click(function(){
						var chk_listArr = $("input[name='RowCheck']");
						for (var i=0; i<chk_listArr.length; i++){
							chk_listArr[i].checked = this.checked;
						}
					});
					$("input[name='RowCheck']").click(function(){
						if($("input[name='RowCheck']:checked").length == rowCnt){
							$("input[name='allCheck']")[0].checked = true;
						}
						else{
							$("input[name='allCheck']")[0].checked = false;
						}
					});
				});
			</script>
            
              <table class="order_table">
                <thead>
                  <tr>
                    <th><input type="checkbox" id="allCheck" name="allCheck" /></th>
                    <th>전체선택</th>
                    <th style="text-align: center;">상품정보</th>
                    <th style="text-align: center;">옵션</th>
                    <th>상품금액</th>
                  </tr>
                </thead>
                <tbody>
                <c:forEach items="${list}" var = "list" >
                	<tr>
                    <td><input type="checkbox" name="RowCheck" ></td>
                    <td width="10%" style="padding-left: 10px; padding-right: 10px;  ">
                      <div>
                        <a href="#"><img style="width: 80px; padding-top:3px;" src="${path}/resources/images/${list.prdImageUrl}"></a>
                      </div>
                    </td>
                    <td class="content" width="40%"
                      style="padding-left: 15px; text-align: left; border-right: gray solid 1px; ">
                      ${list.prdName}<br>
	                  ${list.prdPc}원
                    </td>
                    <td width="30%" style="text-align: center;">
	                    <input id="plus" style="HEIGHT: 20px; cursor: pointer;" onclick='location.href="cartPrdQuantity?prdCode=${list.prdCode}&mbrCode=${mbrCode}&check=plus"' type="button" value="+">
	                    
						<input id="num" style="text-align: center;" size="2" value="${list.qy}" name="amount" readonly> 
						<input id="minus" style="HEIGHT: 20px; cursor: pointer;" onclick='location.href="cartPrdQuantity?prdCode=${list.prdCode}&mbrCode=${mbrCode}&check=minus"' type="button" value="-">
                    </td>
                    <td width="20%" style="font-weight: bold; font-size: 25px; border-left: gray solid 1px;">
                       ${list.prdPc * list.qy}원<br>
                      <input onclick='location.href="directOrder?mbrCode=${mbrCode}&prdCode=${list.prdCode}&qy=${list.qy}"' id="order_btn" type="button" value="주문하기" 
	                  		style="color: white; background-color: rgb(77, 77, 77); border-radius: 5px; width: 90px; cursor: pointer;" >
                    </td>
                  </tr>
                  <!--  <script>
		        	function deleteValue() {
		        		var url = "cartPrdDel?mbrCode=${mbrCode}&prdCode=${list.prdCode}";
		        		var valueArr = new Array();
		        		var list = $("input[name='RowCheck']");
		        		for(var i = 0; i < list.length; i++) {
		        			if(list[i].checked) {
		        				valueArr.push(list[i].value);
		        			}
		        		}
		        		if(valueArr.length == 0) {
		        			alert("선택된 상품이 없습니다.");
		        		}
		        		else {
		        			var chk = confirm("정말 삭제하시겠습니까?");
		        			$.ajax({
		        				url : url,
		        				type : 'POST',
		        				traditional : true,
		        				data : {
		        					valueArr : valueArr
		        				},
		        				success : function(jdata) {
		        					if(jdata = 1) {
		        						alert("삭제성공");
		        						location.replace("cartList?mbrCode=${mbrCode}")
		        					}
		        					else {
		        						alert("삭제실패")
		        					}
		        				}
		        			});
		        		}
		        	}
        		</script> -->
                </c:forEach>
                
                </tbody>
              </table>
          </form>

        </section>
        <table id="charge_table">
          <tr>
            <th height="20px" style="border-top: gray solid 2px;"></th>
            <td style="border-top: gray solid 2px;"></td>
          </tr>
          <tr>
            <th style="border-right: gray solid 1px; width: 150px; font-weight: bold;">총 상품금액<br><span>${total}원</span></th>
            <td style="font-weight: bold;">총 주문금액<br><span id="result">${total}원</span></td>
          </tr>
          <tr>
            <th height="20px" style="border-bottom: gray solid 2px;"></th>
            <td style="border-bottom: gray solid 2px;"></td>
          </tr>
        </table>

          <section id="button_box">
            <input id="orderButton" type="button" value="구매하기" onclick='location.href="cartOrder?mbrCode=${mbrCode}"'>
          </section>

          <!-- -------오더 box---------------------------------------------------------------- -->
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