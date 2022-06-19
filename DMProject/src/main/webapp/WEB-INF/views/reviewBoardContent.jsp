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
  <link href="${path}/resources/css1/board3.css" type="text/css" rel="stylesheet">
  <link href="${path}/resources/css1/footer.css" type="text/css" rel="stylesheet">
  <link href="${path}/resources/css1/header.css" type="text/css" rel="stylesheet">
  <link href="${path}/resources/css1/category.css" type="text/css" rel="stylesheet">
<title>게시글</title>
<script type="text/javascript">
$(document).ready(function(){
	
	$('#bbDeleteBtn').click(function(){
		
		var result = confirm('정말로 삭제 하시겠습니까?');

		if(!result){
			return false;
		} else{
			  location.replace('bbDelete?bbiCode=${bbdto.bbiCode}&bbNum=${bbdto.bbNum}');
		}
	});
});
</script>
<script>
$(document).ready(function(){
	
	$("#submitBtn").click(function(){
		
		if(!"${mbrId}"){
			alert("로그인 해주세요");
			return false;
		}
		
		var cn = $("#answerCn").val();	
		
		if(cn == ""){
			alert("댓글을 입력해주세요");
			return false;
		}
		
	});

	
    $("[id^='updateBtn_']").hide();
    $("[id^='updateBox']").hide();
    
	$("[id^='inputBtn_']").click(function(){
		
		var id = this.id;
		var cntArray = id.split("_");
		var answerNum = cntArray[1];
		
		$("#inputBtn_" + answerNum).hide();
		$("#bbaCnBox" + answerNum).hide();
		$("#updateBtn_" + answerNum).show();
		$("#updateBox" + answerNum).show();
	});
	
	$("[id^='updateBtn_']").click(function(){
		
		var id = this.id;
		var cntArray = id.split("_");
		var answerNum = cntArray[1];
		 
		var obj = $("#updateCn" + answerNum).val();	
		
		if(obj == ""){
			alert("댓글을 입력해주세요");
			return false;
		}
		
		var result = confirm('수정 하시겠습니까?');

		if(!result){
			return false;
		} else{
			  location.replace("answerUpdate?answerCn=" + obj +"&answerNum="+answerNum+"&bbiCode=${bbdto.bbiCode}&bbNum=${bbdto.bbNum}&writerId=${writerId}&chk=${chk}");

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
         <aside id ="aside">  
           
        </aside>
        
        <div id= "main">
          <div style="margin-top: 100px; margin-left: 10px;">
            <a href="#"><img src="${path}/resources/images/review.png"></a>
          </div>
          <section id="table1" style="margin-top: 30px; margin-left: 10px;">
              <table border="1">
                <tr id="tr1">
                  <td style="width: 70px; background-color: #98bcff;">제목</td>
                  <td style="width: 700px; background-color: #98bcff;">${bbdto.bbTitl}</td>
                </tr>
                <tr>
                  <td colspan="2" style="text-align: left;">
                   	 작성자:${writerId}&nbsp;  작성일:${regDate}&nbsp;    조회수:${bbdto.bbRdcnt}
                  </td>
                </tr>
                <tr>
                  <td colspan="2"  style="height: 200px; text-align: left;">
                    	${bbdto.bbCn}
                  </td>
                </tr>
              </table>
           </section>
           <section id="button" style="position: relative;">
             <div style="margin-top: 25px;">
             <c:if test="${mbrId == writerId}">
	              <input id = "bbUpdateBtn" type="button" value="수정" onclick="document.location.href='bbUpdatePage?bbTitl=${bbdto.bbTitl}&bbCn=${bbdto.bbCn}&bbNum=${bbdto.bbNum}&bbiCode=${bbdto.bbiCode}&pageNo=${pageNo}&cutPageNo=${cutPageNo}'">
	              <input id = "bbDeleteBtn" type="button" value="삭제" >
	         </c:if>
	         <c:choose>
	         	<c:when test="${!(chk == null || chk eq '') }">
	         		<input type="button" value="목록" onclick="document.location.href='info_boardPrdList?bbiCode=${bbdto.bbiCode}&prdCode=${bbdto.prdCode}&pageNo=${pageNo}&cutPageNo=${cutPageNo}'">
	         	</c:when>
	         	<c:otherwise>
	         		<input type="button" value="목록" onclick="document.location.href='info_boardList?bbiCode=${bbdto.bbiCode}&pageNo=${pageNo}&cutPageNo=${cutPageNo}'">	
	         	</c:otherwise>
	         </c:choose>
             
             </div>
           </section>                      
            <section style="margin-top: 80px; margin-left: 10px;">
            <div style="padding:5px; text-align:center; width:150px; background-color: #98bcff; border-radius: 5px;">댓글
            </div>
            <div>
            <form action = "answerInput">
            	<input type = "hidden" name = "bbiCode" value ="${bbdto.bbiCode}">
            	<input type = "hidden" name = "bbNum"   value ="${bbdto.bbNum}">
            	<input type = "hidden" name = "mbrCode" value ="${mbrCode}">
            	<input type = "hidden" name = "bbDto" value ="${bbdto}">
            	<input type = "hidden" name = "writerId" value ="${writerId}">
            	<input type = "hidden" name = "chk" value ="${chk}">
              <table id = "answer_table">
                 <tr>
                  <td style="text-align:left; width:600px; padding-left:20px ; border-bottom: solid black 1px;">
					<c:choose>
						<c:when test="${mbrId != null }">
							${mbrId}
						</c:when>
						<c:otherwise>
							로그인 후 이용 하실 수 있습니다.
						</c:otherwise>
					</c:choose>
                   
                   <br>
                    <textarea id = "answerCn" name= "answerCn" cols="80" rows="3" placeholder="댓글을 입력해주세요"></textarea><br>
                  </td>
                  <td style="width: 75px;border-bottom: solid black 1px;">
                    <input id="submitBtn" type="submit" value="댓글 입력" style="color:white; background-color:rgb(79,129,189); padding: 5px;">
                  </td>
                </tr>
	              <c:if test="${bbaList.size() > 0 }">
		              <c:forEach var ="cnt" begin = "0" end = "${bbaList.size()-1}">
						<tr>
		                  <td id = "bbaCnBox${bbaList[cnt].answerNum}" style="text-align:left; width:600px; padding-left:20px ; border-bottom: 1px solid black;">
		                    	${mbrList[cnt].mbrId}<br>
		                       	${bbaList[cnt].answerCn}<br>
		                    	${answerDtList[cnt]}
		                  </td>
		                  <td id = "updateBox${bbaList[cnt].answerNum}" style="text-align:left; width:600px; padding-left:20px ; border-bottom: 1px solid black;">
								<textarea id = "updateCn${bbaList[cnt].answerNum}" cols="80" rows="3" >${bbaList[cnt].answerCn}</textarea><br>
		                  </td>
		                  <td style="width: 75px;">
		                  <c:if test="${mbrId == mbrList[cnt].mbrId}">
		                  	<input type="button" id = "inputBtn_${bbaList[cnt].answerNum}" value="댓글 수정" style="color:white; background-color:rgb(79,129,189); padding: 3px; margin-bottom: 1px;">
		                  	<input type="button" id = "updateBtn_${bbaList[cnt].answerNum}" value="수정 완료" style="color:white; background-color:rgb(79,129,189); padding: 3px; margin-bottom: 1px;">
		                  	<input type="button" value="댓글 삭제" style="color:white; background-color:rgb(79,129,189); padding: 3px;" onclick="document.location.href='answerDelete?answerNum=${bbaList[cnt].answerNum}&bbiCode=${bbdto.bbiCode}&bbNum=${bbdto.bbNum}&writerId=${writerId}&chk=${chk}'">
		                  </c:if>                    	
		                  </td>
		                </tr>
		              </c:forEach>
	              </c:if>       
              </table>
            </form>
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