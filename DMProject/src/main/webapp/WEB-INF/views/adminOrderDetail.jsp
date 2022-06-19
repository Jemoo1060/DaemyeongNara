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
	var addr = "${deliveryDto.dlvyDetailAdres}";
	addrs = addr.split("/");
	var addr1 = addrs[0];
	var addr2 = addrs[1];
	
	$('.aod_deliver_addr').text(addr1);
	$('.aod_deliver_detail_addr').text(addr2);
	
	var state = "${sttus}";
	
	if(state == "결제완료"){
		$('#option_state_input').val("0501");
	} else if(state == "배송준비중"){
		$('#option_state_input').val("0502");
	} else if(state == "배송중"){
		$('#option_state_input').val("0503");
	} else if(state == "배송완료"){
		$('#option_state_input').val("0504");
	} else if(state == "취소대기중"){
		$('#option_state_input').val("0505");
	} else if(state == "취소완료"){
		$('#option_state_input').val("0506");
	}
	
});

</script>
<title>상세 주문관리</title>
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
	         <div><input type="button" value="상품관리" onclick='location.href="goAdmprdManagein"'></div>
	         <div><input type="button" value="주문관리" onclick='location.href="orderManage"'></div>
	         <div><input type="button" value="회원관리" onclick='location.href="mbrManage"'></div>
	         <div><input type="button" value="스쿨존관리" onclick='location.href="schoolZoneManage"'></div>
	     </div>
	     <div id="header_admin_btn">
	         <input type="button" value="메인페이지" onclick='location.href="main"'>
	     </div>
	</div>
    <section id="admin_order_detail">
        <h1>상세 주문관리</h1>
        <form method="post" action="updateDetailOrderInfo">
            <table class="aod_fir_table">
            	<tr>
	                <th class="aod_code">주문번호</th>
	                <th>주문일자</th>
	                <th>아이디</th>
	                <th>총 금액</th>
	                <th>배송현황</th>
	                <th>주문취소</th>
	            </tr>
                <tr>
                    <td class="aod_code">${orderDto.orderCode}</td>
                    <td class="aod_date">${orderDto.orderDate}</td>
                    <td class="aod_id">${memberDto.mbrId}</td>
                    <td class="aod_price">${orderDto.totalPc}</td>
                    <td class="aod_state">
                        <select name="progrsSttus" id="select_state_input">
		                    <option id="option_state_input">${sttus}</option>
		                    <option value="0501">결제완료</option>
		                    <option value="0502">배송준비중</option>
		                    <option value="0503">배송중</option>
		                    <option value="0504">배송완료</option>
		                    <option value="0505">취소대기중</option>
		                    <option value="0506">취소완료</option>
                		</select>
                    </td>
                    <td class="aod_cancel">
                        <input type="button" value="주문취소" onclick='location.href="orderCancel?orderCode=${orderCode}"'>
                    </td>
                </tr>
            </table>
            <table class="aod_sec_table">
            	<tr>
	                <th class="aod_prd_code">상품번호</th>
	                <th>상품명</th>
	                <th>금액</th>
	                <th>수량</th>
	                <th>비고</th>
	            </tr>
	            <c:forEach var="i" begin="0" end="${alProductDto.size()-1}">
                <tr>
                    <td class="aod_prd_code">${alProductDto[i].prdCode}</td>
                    <td class="aod_prd_name">${alProductDto[i].prdName}</td>
                    <td class="aod_prd_price">${alProductDto[i].prdPc}</td>
                    <td class="aod_prd_ea">${alOrderDetailDto[i].detailOrderQy}</td>
                    <td class="aod_prd_any"></td>
                </tr>
                </c:forEach>
            </table>
            <h3>주문자정보</h3>
            <table class="aod_thr_table">
                <tr>
                    <th class="aod_table_title">이름</th>
                    <td class="aod_order_name">${memberDto.mbrName}</td>
                </tr>
                <tr>
                    <th>연락처</th>    
                    <td class="aod_order_phone">${memberDto.mbrTelNo}</td>
                </tr>
            </table>
            <h3>수령자정보</h3>
            <table class="aod_for_table">
                <tr>
                    <th>수령방법</th>
                    <td class="aod_deliver">${orderDto.recptMth}</td>
                </tr>
                <tr>
                    <th>수령자</th>
                    <td class="aod_deliver_name">${deliveryDto.recptName}</td>
                </tr>
                <tr>
                    <th>연락처</th>
                    <td class="aod_deliver_phone">${deliveryDto.dlvyCttpc}</td>
                </tr>
                <tr>
                    <th>결제방법</th>
                    <td class="aod_deliver_pay">${orderDto.setleMth}</td>
                </tr>
                <tr>
                    <th>우편번호</th>
                    <td class="aod_deliver_addrnum">${deliveryDto.dlvyZip}</td>
                </tr>
                <tr>
                    <th>주소</th>
                    <td class="aod_deliver_addr"></td>
                </tr>
                <tr>
                    <th>상세주소</th>
                    <td class="aod_deliver_detail_addr"></td>
                </tr>
                <tr>
                    <th>요구사항</th>
                    <td class="aod_deliver_want">${orderDto.demand}</td>
                </tr>
            </table>
            <input type="hidden" name="orderCode" value="${orderDto.orderCode}">
            <div>
                <input type="submit" value="주문확인">
                <input type="button" value="뒤로가기" onclick='location.href="orderManage"'>
            </div>
        </form>
    </section>
</body>
</html>