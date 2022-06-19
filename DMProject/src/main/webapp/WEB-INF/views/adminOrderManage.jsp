<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="${path}/resources/css/style.css" rel="stylesheet">
<script type="text/javascript" src="${path}/resources/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$('#orderDateInput').submit(function(){
		var start = $('#startDate').val();
		var end = $('#endDate').val();
		
		if(start == "" || end == ""){
			alert("날짜를 다시 입력해주세요.");
			return false;
		}
	});
});
</script>
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
<title>주문 관리</title>
</head>
<body>
	<div id="header">
		<div id="header_top_ad">
	        <a href="main"><img id="header_logo" src="${path}/resources/images/logo.png"></a>
	        <div id="header_input">
	            <p id="login_welcome">관리자 : ${mbrId}님 환영합니다.</p>
	         </div>
	     </div>
	     <div id="header_list">
	         <div><input type="button" value="상품등록" onclick='location.href="goPrdAdd"'></div>
	         <div><input type="button" value="상품관리" onclick='location.href="prdManage"'></div>
	         <div><input type="button" value="주문관리" onclick='location.href="orderManage"'></div>
	         <div><input type="button" value="회원관리" onclick='location.href="mbrManage"'></div>
	         <div><input type="button" value="스쿨존관리" onclick='location.href="schoolZoneManage"'></div>
	     </div>
	     <div id="header_admin_btn">
	         <input type="button" value="메인페이지" onclick='location.href="main"'>
	     </div>
	</div>
    <section id="admin_order_manage">
        <h1>주문관리</h1>
        <div>
            <div class="aom_date">
                <h3>조회기간 설정</h3>
                <form id="orderDateInput" method="post" action="orderManage">
	                <input class="aom_date_input" id="startDate" type="date" name="startDate" value="${startDate}" min="2020-01-01" max="${currentTime}">
	                <h3>~</h3>
	                <input class="aom_date_input" id="endDate" type="date" name="endDate" value="${endDate}" min="2020-01-01" max="${currentTime}">
		            <input class="aom_date_submit" type="submit" value="검색">
                </form>
                <form method="get" action="orderListManage" class="manage_search_form">
	                <select name="progrsSttus" id="select_progrsSttus">
	                    <option value="">===진행현황===</option>
	                    <option value="0501">결제완료</option>
	                    <option value="0502">배송준비중</option>
	                    <option value="0503">배송중</option>
	                    <option value="0504">배송완료</option>
	                    <option value="0505">취소대기중</option>
	                    <option value="0506">취소완료</option>
	                </select>
	                <input class="manage_search_btn" type="submit" value="검색">
        		</form>
            </div>
        </div>
        <table>
            <tr>
            	<th class="aom_code" width="120">주문번호</th>
            	<th width="150">주문일자</th>
            	<th width="210">회원번호</th>
            	<th width="210">총 금액</th>
            	<th width="120">주문상태</th>
            	<th width="100">상세보기</th>
            </tr>
            <c:if test="${orderAl.size() >= 1}">
            <c:forEach var="i" begin="0" end="${orderAl.size()-1}">
            <tr>
                <td class="aom_code">${orderAl[i].orderCode}</td>
                <td class="aom_order_date">${orderAl[i].orderDate}</td>
                <td class="aom_id">${orderAl[i].mbrCode}</td>
                <td class="aom_price">${orderAl[i].totalPc}</td>
                <td class="aom_state">${alState[i]}</td>
                <td class="aom_detail">
                    <input type="button" value="자세히" onclick='location.href="orderDetail?orderCode=${orderAl[i].orderCode}"'>
                </td>
            </tr>
            </c:forEach>
            </c:if>
            <c:if test="${orderAl.size() < 1}">
            <tr>
            	<td colspan="6" style="text-align: center; height: 50px">주문 내역이 없습니다.</td>
            </tr>
            </c:if>
        </table>
        <c:if test="${mbrGradeBool == 1}">
        <div class="paging">
            	<a id = "preButton" href="orderManage?pageNo=${cutPageNo-1}&cutPageNo=${cutPageNo-5}">&#60;</a>
            	<c:choose>
            		<c:when test="${maxPage > cutPageNo+4}">
	            		<c:forEach var = "i" begin = "${cutPageNo}" end = "${cutPageNo+4}">
		            		<a href="orderManage?pageNo=${i}&cutPageNo=${cutPageNo}" id="pageNo${i}"class="num">${i}</a>
		            	</c:forEach>            		
            		</c:when>
            		<c:otherwise>
            			<c:forEach var = "i" begin = "${cutPageNo}" end = "${maxPage}">
		            		<a href="orderManage?pageNo=${i}&cutPageNo=${cutPageNo}" id="pageNo${i}" class="num">${i}</a>
		            	</c:forEach>   
            		</c:otherwise>
            	</c:choose>
                <a id = "nextButton" href="orderManage?pageNo=${cutPageNo+5}&cutPageNo=${cutPageNo+5}">></a>
          </div>
          </c:if>
          <c:if test="${mbrGradeBool == 2}">
          <div class="paging">
            	<a id = "preButton" href="orderListManage?progrsSttus=${progrsSttus}&pageNo=${cutPageNo-1}&cutPageNo=${cutPageNo-5}&mbrGradeBool=${mbrGradeBool}">&#60;</a>
            	<c:choose>
            		<c:when test="${maxPage > cutPageNo+4}">
	            		<c:forEach var = "i" begin = "${cutPageNo}" end = "${cutPageNo+4}">
		            		<a href="orderListManage?progrsSttus=${progrsSttus}&pageNo=${i}&cutPageNo=${cutPageNo}&mbrGradeBool=${mbrGradeBool}" id="pageNo${i}"class="num">${i}</a>
		            	</c:forEach>            		
            		</c:when>
            		<c:otherwise>
            			<c:forEach var = "i" begin = "${cutPageNo}" end = "${maxPage}">
		            		<a href="orderListManage?progrsSttus=${progrsSttus}&pageNo=${i}&cutPageNo=${cutPageNo}&mbrGradeBool=${mbrGradeBool}" id="pageNo${i}" class="num">${i}</a>
		            	</c:forEach>   
            		</c:otherwise>
            	</c:choose>
                <a id = "nextButton" href="orderListManage?progrsSttus=${progrsSttus}&pageNo=${cutPageNo+5}&cutPageNo=${cutPageNo+5}&mbrGradeBool=${mbrGradeBool}">></a>
          </div>
          </c:if>
    </section>
</body>
</html>