<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>가실 : 회원가입</title>
</head>
<style type="text/css">
	.icon{
		text-align: center;
	}
	
	td input{
		width:95%;
		border: none;
	}
	table{
		width:100%;
	}
	.container_join{
		border: 1px solid lightgrey;
		border-radius: 10px;
	}
	button[name=gender]{
		width:49%;
		background-color:white;
		border: none;
		margin:0;
		padding:0;
		border-radius:10px;
	}
	input[name=joincheck], input[name=mainchk]{
		width: 15px;
		margin:0;
		padding:0;
		accent-color: #FF8200;
	}
	input[name=joincheck]:checked, input[name=mainchk]:checked{
		color:white;
	}
	a{
		text-decoration-line: none;
		color: inherit;
		width:40%;
		font-size: small;
		color: grey;
	}
	.collapsible {
            background-color: white;
            color: grey;
            cursor: pointer;
            padding: 0px;
            border: none;
            text-align: left;
            outline: none;
    }
    .content {
        padding: 0px;
        max-height: 0;
        overflow: hidden;
        transition: max-height 0.2s ease-out;
        background-color: none;
    }
    .collapsible:after {
        content: '\002B';
        color: grey;
        float: right;
        margin:0px;
    }
    .active:after {
        content: "\2212";
    }
    label{
     color:grey;
    }
  
</style>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
	function collapse(element) {
	    var before = document.getElementsByClassName("active")[0]               // 기존에 활성화된 버튼
	    if (before && document.getElementsByClassName("active")[0] != element) {  // 자신 이외에 이미 활성화된 버튼이 있으면
	        before.nextElementSibling.style.maxHeight = null;   // 기존에 펼쳐진 내용 접고
	        before.classList.remove("active");                  // 버튼 비활성화
	    }
	    element.classList.toggle("active");         // 활성화 여부 toggle
	
	    var content = element.nextElementSibling;
	    if (content.style.maxHeight != 0) {         // 버튼 다음 요소가 펼쳐져 있으면
	        content.style.maxHeight = null;         // 접기
	    } else {
	        content.style.maxHeight = content.scrollHeight + "px";  // 접혀있는 경우 펼치기
	    }
	}
	// 필수 동의 체크 이벤트
	$(document).ready(function(){
	var chk1 = false;
	var chk2 = false;
	var chk3 = false;
	var chk4 = false;
	var chk5 = false;
	var chk6 = true;
		
	var activePostion = $(".activeBtn");
	    $("#pilsu").change(function(){
	        if($("#pilsu").is(":checked")){
	        	$('input:checkbox').prop('checked',true);
	        	$("#welcome").attr("disabled",false);
	        }else{
	        	$('input:checkbox').prop('checked',false);
	        	$("#welcome").attr("disabled",true);
	        }
	    });
	    
	    $("input[name=joincheck]").click(function() {
			var total = $("input[name=joincheck]").length;
			var checked = $("input[name=joincheck]:checked").length;
			if(total != checked){
				$("#pilsu").prop("checked", false);
				$("#welcome").attr("disabled",true);
			}else{
				$("#pilsu").prop("checked", true); 
				$("#welcome").attr("disabled",false);
			}
		});
	    
		// id 체크
		$('#user_id').keyup(function(){
			var user_id = $('#user_id').val();
			var regId = /^[0-9a-z]{8,16}$/;
			$.ajax({
				url : "${cpath}/idCheck.do",
				type : "post",
				data : {user_id:user_id},
				dataType : 'json',
				success : function(result){
					if(!regId.exec(user_id)){
						$('#id_feedback').html('아이디를 8~16자 소문자+숫자로 입력하세요.');
						$('#id_feedback').attr('color','##3c3c3c');
						chk1 = false;
					}else if(result == 1){
						$('#id_feedback').html('이미 사용중인 아이디입니다.');
						$('#id_feedback').attr('color','#dc3545');
						chk1 = false;
					}else{
						var str = '';
						str += "<font id='id_feedback' size='2' style='color:#2fb380'>사용 가능한 아이디 입니다.</font>";
						str += "<input type='hidden' name='user_nick' id='user_nick' value='" + user_id + "'>";
						/* $('#id_feedback').html('사용 가능한 아이디입니다.');
						$('#id_feedback').attr('color','#2fb380'); */
						
						$('#id_feedback').html(str);
						chk1 = true;
					}
				},
				error : function(){
					alert("서버요청 실패");
				}
			})
		})
		
		// 비밀번호 체크
		$('#user_pw').keyup(function() {
			var user_pw = $("#user_pw").val();
			var regPw = /^[0-9a-zA-Z]{8,16}$/;
	  		// 비밀번호 유효성 검사 
	  		if (!regPw.exec(user_pw)){
				$('#pw_feedback').html('비밀번호를 8~16자 대문자+소문자+숫자로 입력하세요.');
				$('#pw_feedback').attr('color','red');
				chk2 = false;
	  		}else{
				$('#pw_feedback').html('사용 가능합니다.');
				$('#pw_feedback').attr('color','#2fb380');
				chk2 = true;
				// 입력값 검증 성공 표시 
	  		}
	  	});
		
		
		$('#user_email').keyup(function() {
			// 이메일 유효성 검사
			var regEmail = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
			var email = $('#user_email').val(); // 이메일 주소값 얻어오기
			if(!regEmail.exec(email)){
				$('#email_feedback').html("이메일을 다시 입력해주세요.");
				$('#email_feedback').attr('color','red');
				$('#user_email').focus();
				chk3 = false;
				return;
			}else{
				$('#email_feedback').html("");
				chk3 = true;
			}
		})
		

		 
		 // 이름 체크
		 $('#user_name').keyup(function() {
				var user_name = $("#user_name").val();
				var regName = /^[가-힣]{2,6}$/;
		  		// 비밀번호 유효성 검사 
		  		if (!regName.exec(user_name)){
					$('#name_feedback').html('성함을 다시 적어주세요 (한글 2~6자)');
					$('#name_feedback').attr('color','red');
					chk4 = false;
		  		}else{
					$('#name_feedback').html('사용 가능합니다.');
					$('#name_feedback').attr('color','#2fb380');
					chk4 = true;
					// 입력값 검증 성공 표시 
		  		}
		  	});
		 
		 // 생년월일
		 $('#user_birth').keyup(function(){
			var user_birth = $("#user_birth").val();
			var regBirth = /^(19[0-9][0-9]|20\d{2})(0[0-9]|1[0-2])(0[1-9]|[1-2][0-9]|3[0-1])$/;
			if(!regBirth.exec(user_birth)){
				$('#birth_feedback').html('생년월일 8자리를 입력해주세요.');
				$('#birth_feedback').attr('color','red');
				chk5 = false;
			 }else{
				$('#birth_feedback').html('');
				chk5 = true;
			 }
		 })
		 
		 // 핸드폰 인증 문자 
		 var code2 = "";
		 
		 $("#phoneChk").click(function(){
			 var regPhone = /^(01[016789]{1})[0-9]{3,4}[0-9]{4}$/;
			 var user_phone = $("#user_phone").val();
			 if(!regPhone.exec(user_phone)){
         		alert("휴대폰 번호가 올바르지 않습니다.")
 				$("#user_phone").attr("autofocus",true);
				return;				 
			 }else{
			 	$.ajax({
			         type:"GET",
			         url:"phoneCheck?user_phone=" + user_phone,
			         cache : false,
			         success:function(data){
						 	alert("인증번호 발송이 완료되었습니다.\n인증번호를 입력해주십시오.");
			         		$("#phone2").attr("disabled",false);
			         		code2 = data;
			         }
			     });
			 }
		 });
		 
		 
		 // 전화 인증 확인 버튼 
		 $("#phoneChk2").click(function(){
			if($("#phone2").val() == code2){
				$("#phone_feedback").text("인증되었습니다.");
				$("#phone_feedback").css("color","green");
				$("#phoneDoubleChk").val("true");
				$("#user_phone").attr("disabled",true);
				$("#phoneChk").attr("disabled",true);
				$("#phone2").attr("disabled",true);
				$("#phoneChk2").attr("disabled",true);
				chk6 = true;
			}else{
				$("#phone_feedback").text("인증번호가 일치하지 않습니다. 다시 확인해주시기 바랍니다.");
				$("#phone_feedback").css("color","red");
				$("#phoneDoubleChk").val("false");
				$(this).attr("autofocus",true);
				chk6 = false;
			}
		})
		 
	
	
	$("#welcome").click(function(){
			if(chk1 == false){
				alert("아이디를 다시 입력해주세요");
				$("#user_id").focus();
				
				return;
			}
			if(chk2 == false){
				alert("비밀번호를 다시 입력해주세요");
				$("#user_pw").focus();
				return;
			}
			if(chk3 == false){
				alert("이메일을 다시 입력해주세요");
				$("#user_email").focus();
				return;
			}
			if(chk4 == false){
				alert("이름을 다시 입력해주세요");
				$("#user_name").focus();
				return;
			}
			if(chk5 == false){
				alert("생년월일을 다시 입력해주세요");
				$("#user_birth").focus();
				return;
			}
			if(chk6 == false){
				alert("본인인증이 되지 않았습니다.")
				$("#user_phone").focus();
				return;
			}
			$("form").submit();
			alert("가입을 축하드립니다.");
	})
})
</script>
<body>
	<!-- 전체 창 사이즈 -->
	<div class="container" style="width: 400px; margin:auto;">
		<!-- 로고 -->
		<div class="title">
			<a href="/home"><img alt="logo" src="/resources/images/logo.png" style="width:188px; height:85px;"></a>
		</div>	<!-- end 로고 -->
		<!-- 아이디, 비밀번호, 이메일 -->
		<form action="/user/joinUser" method="get" role="form">
		<div class="container_join">
			<table class="user_ipe">
				<tr>
					<td style="width:37px" class="icon"><svg xmlns="http://www.w3.org/2000/svg" width="16px" height="16px" fill="currentColor" class="bi bi-person" viewBox="0 0 16 16">
						  <path d="M8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6Zm2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0Zm4 8c0 1-1 1-1 1H3s-1 0-1-1 1-4 6-4 6 3 6 4Zm-1-.004c-.001-.246-.154-.986-.832-1.664C11.516 10.68 10.289 10 8 10c-2.29 0-3.516.68-4.168 1.332-.678.678-.83 1.418-.832 1.664h10Z"/></svg>
					</td>
					<td>
						<input type="text" id="user_id" name="user_id" placeholder="아이디"><div><font id="id_feedback" size="2"></font></div>
					</td>
				</tr>				
				<tr>
					<td class="icon"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-lock" viewBox="0 0 16 16">
						 	<path d="M8 1a2 2 0 0 1 2 2v4H6V3a2 2 0 0 1 2-2zm3 6V3a3 3 0 0 0-6 0v4a2 2 0 0 0-2 2v5a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V9a2 2 0 0 0-2-2zM5 8h6a1 1 0 0 1 1 1v5a1 1 0 0 1-1 1H5a1 1 0 0 1-1-1V9a1 1 0 0 1 1-1z"/></svg>
					</td>
					<td><input type="password" id="user_pw" name="user_pw" placeholder="비밀번호"><div><font id="pw_feedback" size="2"></font></div></td>
				</tr>				
				<tr>
					<td class="icon"> <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-envelope" viewBox="0 0 16 16">
						  <path d="M0 4a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v8a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V4Zm2-1a1 1 0 0 0-1 1v.217l7 4.2 7-4.2V4a1 1 0 0 0-1-1H2Zm13 2.383-4.708 2.825L15 11.105V5.383Zm-.034 6.876-5.64-3.471L8 9.583l-1.326-.795-5.64 3.47A1 1 0 0 0 2 13h12a1 1 0 0 0 .966-.741ZM1 11.105l4.708-2.897L1 5.383v5.722Z"/></svg>
					</td>
					<td><input type="text" id="user_email" name="user_email" placeholder="이메일" style="width:223px"><div><font id="email_feedback" size="2"></font></div></td>
				</tr>
			</table>
		</div>	<!-- end 아이디, 비밀번호, 이메일 -->
		<!-- 유저 정보 -->
		<div class="container_join" style="margin-top: 5px;">
			<table class="user_nbpn">
				<tr>
					<td class="icon"><svg style="margin: 0 5px 0 5px;" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-person" viewBox="0 0 16 16">
						  <path d="M8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6Zm2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0Zm4 8c0 1-1 1-1 1H3s-1 0-1-1 1-4 6-4 6 3 6 4Zm-1-.004c-.001-.246-.154-.986-.832-1.664C11.516 10.68 10.289 10 8 10c-2.29 0-3.516.68-4.168 1.332-.678.678-.83 1.418-.832 1.664h10Z"/></svg>
					</td>
					<td colspan="2">
						<input type="text" id="user_name" name="user_name" placeholder="이름"><div><font id="name_feedback" size="2"></font></div>
					</td>
				</tr>
				<tr>
					<td class="icon"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-calendar3" viewBox="0 0 16 16">
						<path d="M14 0H2a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2zM1 3.857C1 3.384 1.448 3 2 3h12c.552 0 1 .384 1 .857v10.286c0 .473-.448.857-1 .857H2c-.552 0-1-.384-1-.857V3.857z"/>
						<path d="M6.5 7a1 1 0 1 0 0-2 1 1 0 0 0 0 2zm3 0a1 1 0 1 0 0-2 1 1 0 0 0 0 2zm3 0a1 1 0 1 0 0-2 1 1 0 0 0 0 2zm-9 3a1 1 0 1 0 0-2 1 1 0 0 0 0 2zm3 0a1 1 0 1 0 0-2 1 1 0 0 0 0 2zm3 0a1 1 0 1 0 0-2 1 1 0 0 0 0 2zm3 0a1 1 0 1 0 0-2 1 1 0 0 0 0 2zm-9 3a1 1 0 1 0 0-2 1 1 0 0 0 0 2zm3 0a1 1 0 1 0 0-2 1 1 0 0 0 0 2zm3 0a1 1 0 1 0 0-2 1 1 0 0 0 0 2z"/></svg>
					</td>
					<td colspen="2">
						<input type="text" id="user_birth" name="user_birth" placeholder="생년월일 8자리"><div><font id="birth_feedback" size="2"></font></div>
					</td>
				<tr>
					<td style="text-align: center;">
						<img alt="antenna" src="/resources/images/antenna.png" style="width:16px; height:16px;">
					</td>
					<td colspan="2">
						<select class="form-select form-select-sm" aria-label=".form-select-sm example" style="border:none; width:95%;">
							<option selected disabled style="display:none">통신사를 선택하세요</option>
							<option value="skt">SKT</option>
							<option value="kt">KT</option>
							<option value="lg">LG U+</option>
							<option value="sktAl">SKT알뜰폰</option>
							<option value="ktAl">KT알뜰폰</option>
							<option value="lgAl">LG U+알뜰폰</option>
						</select>
					</td>
				</tr>
				<tr>
					<td class="icon"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-phone" viewBox="0 0 16 16">
						<path d="M11 1a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1H5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1h6zM5 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H5z"/>
						<path d="M8 14a1 1 0 1 0 0-2 1 1 0 0 0 0 2z"/></svg>
					</td>
					<td colspan="2">
						<input type="text" id="user_phone" name="user_phone" placeholder="휴대전화번호" style="width:230px"><span class="input-group-addon">
						<button type="button" class="doubleChk" id="phoneChk">인증번호 발송</button></span>
						<input id="phone2" type="text" name="phone2" title="인증번호 입력" disabled style="width:261px "/>
						<span><button id="phoneChk2" class="doubleChk">인증 확인</button></span>
						<div><font id="phone_feedback" size="2"></font></div>
						<input type="hidden" id="phoneDoubleChk"/>
					</td>
				</tr>
			</table>
		</div>	<!-- end 유저 정보 -->
		<div class="container_join">
			<div class="container_join" style="text-align: center;">
				<label><input type="radio" name="gender" value="남" checked>남자</label>
				<label><input type="radio" name="gender" value="여">여자</label>
			</div>
		</div>
		</form>
		<!-- 인증 약관 동의 -->
		<div  class="container_join" style="margin-top: 5px;">
			<table>
				<tr>
					<td>
						<input type="checkbox" id="pilsu" name="mainchk" style="vertical-align: middle; margin-left: 5px;">
						<label class="form-check-label" for="pilsu">
							<span style="color:#DB631F">[필수]</span> 인증 약관 전체 동의
						</label>
						<button type="button" class="collapsible" onclick="collapse(this);" style="width:146px; margin-top:0px; vertical-align: middle">
						</button>
					    <div class="content">
					    	<table>
					    		<tr>
					    			<td>
					    				<input type="checkbox" id="gaein" name="joincheck" style="vertical-align: middle; margin-left:3px;">
					    				<label class="form-check-label" for="gaein">
					    					개인정보 이용
									    </label>
					    				<a href="/terms/gaein"> &gt;</a>  
					    			</td>
					    			<td>
					    				<input type="checkbox" id="goyou" name="joincheck" style="vertical-align: middle; margin-left:3px;">
					    				<label class="form-check-label" for="goyou">
					    					고유식별정보 처리
									    </label>
					    				<a href="/terms/goyou"> &gt;</a>  
					    			</td>
					    		</tr>
					    		<tr>
					    			<td>
					    				<input type="checkbox" id="tongxin" name="joincheck" style="vertical-align: middle; margin-left:3px;">
					    				<label class="form-check-label" for="tongxin">
					    					통신사 이용약관
									    </label>
					    				<a href="/terms/tongxin"> &gt;</a>  
					    			</td>
					    			<td>
					    				<input type="checkbox" id="inzeng" name="joincheck" style="vertical-align: middle; margin-left:3px;">
					    				<label class="form-check-label" for="inzeng">
					    					인증사 이용약관
									    </label>
					    				<a href="/terms/inzeng"> &gt;</a>  
					    			</td>
					    		</tr>
					    		<tr>
					    			<td>
					    				<input type="checkbox" id="gasilcc" name="joincheck" style="vertical-align: middle; margin-left:3px;">
					    				<label class="form-check-label" for="gasilcc">
						    				가실 개인정보수집
									    </label>
					    				<a href="/terms/gasilcc"> &gt;</a>  
					    			</td>
					    			<td>
					    			</td>
					    		</tr>
					    	</table>
					    </div>
					</td>
				</tr>
			</table>
		</div>	<!-- end 인증약관 관의 -->
		<div class="activeBtn" style="margin-top: 5px; text-align: center;">
			<button id="welcome" disabled>가입</button>
			<button type="reset">취소</button>
		</div>
	</div>	<!-- end 전체 창 사이즈 -->
</body>
</html>