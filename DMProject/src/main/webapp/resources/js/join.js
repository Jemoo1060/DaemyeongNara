$(document).ready(function(){
	$('.join_gc').hide();
	$('#join_school_info').val("0102");
	
	$('#join_school_member').change(function(){
		// 회원등급 넣기
		if($('#join_school_member').is(":checked")){
			$('.join_gc').show();
			$('#join_school_info').val("0103");
		} else {
			$('.join_gc').hide();
			$('#join_school_info').val("0102");
		}
	});
	
	$('#join_check_ok').change(function(){
		if($('#join_check_ok').is(":checked")){
			$('#join_btn_submit').attr("disalbed", false);
		} else {
			alert("약관에 동의하지 않으면 가입하실 수 없습니다.");
			$('#join_btn_submit').attr("disalbed", true);
		}
	});
	
	$('#join_form').submit(function(){
		// 전화번호 넣기
		var num1 = $('.input_phone1').val();
		var num2 = $('.input_phone2').val();
		var num3 = $('.input_phone3').val();
		
		var number = num1 + num2 + num3;
		
		$('#phoneNumber').val(number);
		
		// 학년반 넣기
		var grade = $('#grade').val();
		var cls = $('#class').val();
		
		var gradeCls = grade + cls;
		
		$('#gradeClass').val(gradeCls);
		
		// 생일넣기
		var date = $('.join_input_birth').val();
		var date1 = date.split('-');
		var date2 = date1[0] + date1[1] + date1[2];
		
		$('#join_input_birth').val(date2);
		
		// 가입날짜 넣기
		var t = new Date();
		var y = t.getFullYear();
		var m = t.getMonth()+1;
		var d = t.getDate();
		var ts = y.toString() + ("0" + m.toString()).slice(-2) + ("0" + d.toString()).slice(-2);
		
		$('#join_timestamp').val(ts);
	});
	
	$('#join_btn_submit').click(function(){
		if($('#join_check_ok').is(":checked")){
			$('#join_btn_submit').attr("disalbed", false);
		} else {
			alert("약관에 동의하지 않으면 가입하실 수 없습니다.");
			$('#join_btn_submit').attr("disalbed", true);
			return false;
		}
		
		if($('.join_input_id').val() == ""){
			alert("아이디를 입력해주세요.");
			$('.join_input_id').focus();
			return false;
		}
		
		if($('#fir_pw').val() == ""){
			alert("비밀번호를 입력해주세요.");
			$('#fir_pw').focus();
			return false;
		}
		
		if($('#sec_pw').val() == ""){
			alert("비밀번호를 확인해주세요.");
			$('#sec_pw').focus();
			return false;
		}
		
		if($('#fir_pw').val() != $('#sec_pw').val()){
			alert("비밀번호가 일치하지 않습니다.");
			$('#sec_pw').focus();
			return false;
		}
		
		if($('.join_input_name').val() == ""){
			alert("이름을 입력해주세요.");
			$('.join_input_name').focus();
			return false;
		}
		
		if($('.join_input_birth').val() == ""){
			alert("생년월일을 입력해주세요.");
			$('.join_input_birth').focus();
			return false;
		}
		
		if($('.input_phone1').val() == "" || $('.input_phone2').val() == "" || $('.input_phone3').val() == ""){
			alert("휴대폰 번호를 입력해주세요.");
			$('.input_phone1').focus();
			return false;
		}
		
		if($('#sex').val() == ""){
			alert("성별을 선택해주세요.");
			$('#sex').focus();
			return false;
		}
	});
});