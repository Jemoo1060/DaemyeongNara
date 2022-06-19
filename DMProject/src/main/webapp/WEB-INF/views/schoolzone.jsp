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
<link href="${path}/resources/css1/schoolzone.css" type="text/css" rel="stylesheet">
<link href="${path}/resources/css1/grade.css" type="text/css" rel="stylesheet">
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
<script>
  $(document).ready(function () {
    $('.info_container1').hide();
    $('#grade1').click(function (e) {
      e.stopPropagation();
      $('.info_container1').toggle();
    });
   
    $(document).on("click", function(e) {
      if (e.target.id != "grade1") {
        $('.info_container1').hide();
      }
    })
  });

  $(document).ready(function () {
    $('.info_container2').hide();
    $('#grade2').click(function (e) {
      e.stopPropagation();
      $('.info_container2').toggle();
    });
   
    $(document).on("click", function(e) {
      if (e.target.id != "grade2") {
        $('.info_container2').hide();
      }
    })
  });

  $(document).ready(function () {
    $('.info_container3').hide();
    $('#grade3').click(function (e) {
      e.stopPropagation();
      $('.info_container3').toggle();
    });
   
    $(document).on("click", function(e) {
      if (e.target.id != "grade3") {
        $('.info_container3').hide();
      }
    })
  });

  $(document).ready(function () {
    $('.info_container4').hide();
    $('#grade4').click(function (e) {
      e.stopPropagation();
      $('.info_container4').toggle();
    });
   
    $(document).on("click", function(e) {
      if (e.target.id != "grade4") {
        $('.info_container4').hide();
      }
    })
  });

  $(document).ready(function () {
    $('.info_container5').hide();
    $('#grade5').click(function (e) {
      e.stopPropagation();
      $('.info_container5').toggle();
    });
   
    $(document).on("click", function(e) {
      if (e.target.id != "grade5") {
        $('.info_container5').hide();
      }
    })
  });

  $(document).ready(function () {
    $('.info_container6').hide();
    $('#grade6').click(function (e) {
      e.stopPropagation();
      $('.info_container6').toggle();
    });
   
    $(document).on("click", function(e) {
      if (e.target.id != "grade6") {
        $('.info_container6').hide();
      }
    })
  });
  
</script>
<title>스쿨존</title>
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
         <aside id ="aside">  
        </aside>
        
        <div id= "main">

          <section id="main_container">

            <div id="school_main" >
              <img src="${path}/resources/images/schoolzone.png">
            </div>

            <section >
              <div class="class" style="background-color: pink; width=100%; ">
                <input  id="grade1" style="background-color: pink; " type="button" value="1학년" onclick="">
                <input  style="background-color: pink; " type="button" value="1반" onclick="">
                <input  style="background-color: pink; " type="button" value="2반" onclick="">
                <input  style="background-color: pink; " type="button" value="3반" onclick="">
                <input  style="background-color: pink; " type="button" value="4반" onclick="">
              </div>
            </section>
            

            <section>
              <div class="class" style="background-color: rgb(203, 234, 247);width=100%; ">
                <input  id="grade2" style="background-color: rgb(203, 234, 247); " type="button" value="2학년" onclick="">
                <input  style="background-color: rgb(203, 234, 247); " type="button" value="1반" onclick="">
                <input  style="background-color: rgb(203, 234, 247); " type="button" value="2반" onclick="">
                <input  style="background-color: rgb(203, 234, 247); " type="button" value="3반" onclick="">
                <input  style="background-color: rgb(203, 234, 247); " type="button" value="4반" onclick="">
              </div>
            </section>

            <section>
              <div class="class" style="background-color: rgb(248, 219, 164); width=100%; ">
                <input  id="grade3" style="background-color: rgb(248, 219, 164); " type="button" value="3학년" onclick="">
                <input  style="background-color: rgb(248, 219, 164); " type="button" value="1반" onclick="">
                <input  style="background-color: rgb(248, 219, 164) " type="button" value="2반" onclick="">
                <input  style="background-color: rgb(248, 219, 164); " type="button" value="3반" onclick="">
                <input  style="background-color: rgb(248, 219, 164); " type="button" value="4반" onclick="">
              </div>
            </section>

            <section>
              <div class="class" style="background-color: rgb(206, 245, 206);width=100%; ">
                <input  id="grade4" style="background-color: rgb(206, 245, 206); " type="button" value="4학년" onclick="">
                <input  style="background-color: rgb(206, 245, 206); " type="button" value="1반" onclick="">
                <input  style="background-color: rgb(206, 245, 206); " type="button" value="2반" onclick="">
                <input  style="background-color: rgb(206, 245, 206); " type="button" value="3반" onclick="">
                <input  style="background-color: rgb(206, 245, 206); " type="button" value="4반" onclick="">
                <input  style="background-color: rgb(206, 245, 206); " type="button" value="5반" onclick="">
              </div>
            </section>

            <section>
              <div class="class" style="background-color:rgb(212, 252, 250);width=100%;">
                <input  id="grade5" style="background-color: rgb(212, 252, 250) ; " type="button" value="5학년" onclick="">
                <input  style="background-color: rgb(212, 252, 250) ; " type="button" value="1반" onclick="">
                <input  style="background-color: rgb(212, 252, 250) ; " type="button" value="2반" onclick="">
                <input  style="background-color: rgb(212, 252, 250) ; " type="button" value="3반" onclick="">
              </div>
            </section>

            <section>
              <div class="class" style="background-color: rgb(255, 208, 255);width=100%;">
                <input  id="grade6" style="background-color: rgb(255, 208, 255); " type="button" value="6학년" onclick="">
                <input  style="background-color: rgb(255, 208, 255); " type="button" value="1반" onclick="">
                <input  style="background-color: rgb(255, 208, 255); " type="button" value="2반" onclick="">
                <input  style="background-color: rgb(255, 208, 255); " type="button" value="3반" onclick="">
              </div>
            </section>

            
              <div class="img">
                <img style="width:500px;" src="${path}/resources/images/children.png">
              </div>
              <div class="img">
                <img id="msg" style="width:100px;"src="${path}/resources/images/message.png" onclick="">
              </div>

              <div class="info_container1">
                <table>
                    <tr>
                        <td class="class1">1-1</td>
                        <td class="bin"></td>
                        <td class="class1">1-2</td>    
                    </tr>
                    <tr> 
                        <td class="content">${al[0].schulMsg}</td>
                        <td class="bin"></td>
                        <td class="content">${al[1].schulMsg}</td>
                    </tr>
                    <tr> 
                        <td class="bin2" class="class1"></td>
                        <td class="bin"></td>
                        <td class="bin2"class="class1"></td>
                    </tr>
                    <tr>   
                        <td class="class1">1-3</td>
                        <td class="bin"></td>
                        <td class="class1">1-4</td>
                    </tr>
                    <tr>
                        <td class="content">${al[2].schulMsg}</td>
                        <td class="bin"></td>
                        <td class="content">${al[3].schulMsg}</td>
                    </tr>
                </table>
            </div>

            <div class="info_container2">

              <table>
                  <tr>
                      <td class="class2">2-1</td>
                      <td class="bin"> </td>
                      <td class="class2">2-2</td>    
                  </tr>
                  <tr> 
                      <td class="content">${al[4].schulMsg}</td>
                      <td class="bin"></td>
                      <td class="content">${al[5].schulMsg}</td>
                  </tr>
                  <tr> 
                      <td class="bin2" class="class2"></td>
                      <td class="bin"></td>
                      <td class="bin2"class="class2"></td>
                  </tr>
                  <tr>   
                      <td class="class2">2-3</td>
                      <td class="bin"></td>
                      <td class="class2">2-4</td>
                  </tr>
                  <tr>
                      <td class="content">${al[6].schulMsg}</td>
                      <td class="bin"></td>
                      <td class="content">${al[7].schulMsg}</td>
                  </tr>
              </table>
          
          </div>

          <div class="info_container3">

            <table>
                <tr>
                    <td class="class3">3-1</td>
                    <td class="bin"> </td>
                    <td class="class3">3-2</td>    
                </tr>
                <tr> 
                    <td class="content">${al[8].schulMsg}</td>
                    <td class="bin"></td>
                    <td class="content">${al[9].schulMsg}</td>
                </tr>
                <tr> 
                    <td class="bin2" class="class3"></td>
                    <td class="bin"></td>
                    <td class="bin2"class="class3"></td>
                </tr>
                <tr>   
                    <td class="class3">3-3</td>
                    <td class="bin"></td>
                    <td class="class3">3-4</td>
                </tr>
                <tr>
                    <td class="content">${al[10].schulMsg}</td>
                    <td class="bin"></td>
                    <td class="content">${al[11].schulMsg}</td>
                </tr>
            </table>
        
        </div>

        <div class="info_container4">

          <table>
              <tr>
                  <td class="class4">4-1</td>
                  <td class="bin"> </td>
                  <td class="class4">4-2</td>    
              </tr>
              <tr> 
                  <td class="content">${al[12].schulMsg}</td>
                  <td class="bin"></td>
                  <td class="content">${al[13].schulMsg}</td>
              </tr>
              <tr> 
                  <td class="bin2" class="class4"></td>
                  <td class="bin"></td>
                  <td class="bin2"class="class4"></td>
              </tr>
              <tr>   
                  <td class="class4">4-3</td>
                  <td class="bin"></td>
                  <td class="class4">4-4</td>
              </tr>
              <tr>
                  <td class="content">${al[14].schulMsg}</td>
                  <td class="bin"></td>
                  <td class="content">${al[15].schulMsg}</td>
              </tr>
              <tr> 
                  <td class="bin2" class="class4">${al[16].schulMsg}</td>
                  <td class="bin"></td>
                  <td class="bin2"class="class4">${al[17].schulMsg}</td>
              </tr>
              <tr>   
                  <td class="class4">4-5</td>
                  <td class="bin"></td>
                  
              </tr>
              <tr>
                  <td class="content">${al[18].schulMsg}</td>
                  <td class="bin"></td>
              </tr>
          </table>
      
      </div>

      <div class="info_container5">

        <table>
            <tr>
                <td class="class5">5-1</td>
                <td class="bin"> </td>
                <td class="class5">5-2</td>    
            </tr>
            <tr> 
                <td class="content">${al[19].schulMsg}</td>
                <td class="bin"></td>
                <td class="content">${al[20].schulMsg}</td>
            </tr>
            <tr> 
                <td class="bin2" class="class5"></td>
                <td class="bin"></td>
                <td class="bin2"class="class5"></td>
            </tr>
            <tr>   
                <td class="class5">5-3</td>
                <td class="bin"></td>
    
            </tr>
            <tr>
                <td class="content">${al[21].schulMsg}</td>
                <td class="bin"></td>
    
            </tr>
        </table>
    
    </div>

    <div class="info_container6">

      <table>
          <tr>
              <td class="class6">6-1</td>
              <td class="bin"> </td>
              <td class="class6">6-2</td>    
          </tr>
          <tr> 
              <td class="content">${al[22].schulMsg}</td>
              <td class="bin"></td>
              <td class="content">${al[23].schulMsg}</td>
          </tr>
          <tr> 
              <td class="bin2" class="class6"></td>
              <td class="bin"></td>
              <td class="bin2"class="class6"></td>
          </tr>
          <tr>   
              <td class="class6">6-3</td>
              <td class="bin"></td>
  
          </tr>
          <tr>
              <td class="content">${al[24].schulMsg}</td>
              <td class="bin"></td>
  
          </tr>
      </table>
  
  		</div>

          </section>
        </div>
        <aside id ="aside2">  
            
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