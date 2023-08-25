<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="my_info_form.jsp" %>
<style type="text/css">
	.personal_info{
		background-color: yellow;
	}
	td input{
		width:95%;
		border: none;
	}
	table{
		width:100%;
	}
	.icon{
		text-align: center;
	}
	.container_join{
		border: 1px solid lightgrey;
		border-radius: 10px;
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
</style>
<!-- 전체 창 사이즈 -->
	<div class="container" style="width: 400px; margin:auto;">
		<!-- 개인정보 수정 -->
		<div class="title">
			<h3>개인정보 수정</h3>
		</div>	<!-- end 개인정보 수정 -->
		<!-- 아이디, 비밀번호, 이메일 -->
		<form action="/myInfo/update_info" method="POST" role="form">
		<div class="container_join">
			<table class="user_ipe">
				<tr>
					<td class="icon"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-image" viewBox="0 0 16 16">
						  <path d="M6.002 5.5a1.5 1.5 0 1 1-3 0 1.5 1.5 0 0 1 3 0z"/>
						  <path d="M2.002 1a2 2 0 0 0-2 2v10a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V3a2 2 0 0 0-2-2h-12zm12 1a1 1 0 0 1 1 1v6.5l-3.777-1.947a.5.5 0 0 0-.577.093l-3.71 3.71-2.66-1.772a.5.5 0 0 0-.63.062L1.002 12V3a1 1 0 0 1 1-1h12z"/>
						</svg>
					</td>
					<td colspen="2">
						<input type="file" id="user_pic" name="user_pic">
					</td>
				</tr>
				<tr>
					<td style="width:37px" class="icon"><svg xmlns="http://www.w3.org/2000/svg" width="16px" height="16px" fill="currentColor" class="bi bi-person" viewBox="0 0 16 16">
						  <path d="M8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6Zm2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0Zm4 8c0 1-1 1-1 1H3s-1 0-1-1 1-4 6-4 6 3 6 4Zm-1-.004c-.001-.246-.154-.986-.832-1.664C11.516 10.68 10.289 10 8 10c-2.29 0-3.516.68-4.168 1.332-.678.678-.83 1.418-.832 1.664h10Z"/></svg>
					</td>
					<td>
						<input type="text" id="user_id" name="user_id" value="${user.user_id }" readonly="readonly"><div><font id="id_feedback" size="2"></font></div>
					</td>
				</tr>				
				<tr>
					<td class="icon"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-lock" viewBox="0 0 16 16">
						 	<path d="M8 1a2 2 0 0 1 2 2v4H6V3a2 2 0 0 1 2-2zm3 6V3a3 3 0 0 0-6 0v4a2 2 0 0 0-2 2v5a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V9a2 2 0 0 0-2-2zM5 8h6a1 1 0 0 1 1 1v5a1 1 0 0 1-1 1H5a1 1 0 0 1-1-1V9a1 1 0 0 1 1-1z"/></svg>
					</td>
					<td><input type="password" id="user_pw" name="user_pw" value="${user.user_pw }"placeholder="변경할 비밀번호"><div><font id="pw_feedback" size="2"></font></div></td>
				</tr>				
				<tr>
					<td class="icon"> <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-envelope" viewBox="0 0 16 16">
						  <path d="M0 4a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v8a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V4Zm2-1a1 1 0 0 0-1 1v.217l7 4.2 7-4.2V4a1 1 0 0 0-1-1H2Zm13 2.383-4.708 2.825L15 11.105V5.383Zm-.034 6.876-5.64-3.471L8 9.583l-1.326-.795-5.64 3.47A1 1 0 0 0 2 13h12a1 1 0 0 0 .966-.741ZM1 11.105l4.708-2.897L1 5.383v5.722Z"/></svg>
					</td>
					<td><input type="text" id="user_email" name="user_email" value="${user.user_email }" style="width:223px"><div><font id="email_feedback" size="2"></font></div></td>
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
						<input type="text" id="user_name" name="user_name" value="${user.user_name }" readonly="readonly"><div><font id="name_feedback" size="2"></font></div>
					</td>
				</tr>
				<tr>
					<td class="icon"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-calendar3" viewBox="0 0 16 16">
						<path d="M14 0H2a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2zM1 3.857C1 3.384 1.448 3 2 3h12c.552 0 1 .384 1 .857v10.286c0 .473-.448.857-1 .857H2c-.552 0-1-.384-1-.857V3.857z"/>
						<path d="M6.5 7a1 1 0 1 0 0-2 1 1 0 0 0 0 2zm3 0a1 1 0 1 0 0-2 1 1 0 0 0 0 2zm3 0a1 1 0 1 0 0-2 1 1 0 0 0 0 2zm-9 3a1 1 0 1 0 0-2 1 1 0 0 0 0 2zm3 0a1 1 0 1 0 0-2 1 1 0 0 0 0 2zm3 0a1 1 0 1 0 0-2 1 1 0 0 0 0 2zm3 0a1 1 0 1 0 0-2 1 1 0 0 0 0 2zm-9 3a1 1 0 1 0 0-2 1 1 0 0 0 0 2zm3 0a1 1 0 1 0 0-2 1 1 0 0 0 0 2zm3 0a1 1 0 1 0 0-2 1 1 0 0 0 0 2z"/></svg>
					</td>
					<td colspen="2">
						<input type="text" id="user_birth" name="user_birth" value="${user.user_birth }" readonly="readonly"><div><font id="birth_feedback" size="2"></font></div>
					</td>
				<tr>
				<tr>
					<td class="icon"><svg style="margin: 0 5px 0 5px;" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-person" viewBox="0 0 16 16">
						  <path d="M8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6Zm2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0Zm4 8c0 1-1 1-1 1H3s-1 0-1-1 1-4 6-4 6 3 6 4Zm-1-.004c-.001-.246-.154-.986-.832-1.664C11.516 10.68 10.289 10 8 10c-2.29 0-3.516.68-4.168 1.332-.678.678-.83 1.418-.832 1.664h10Z"/></svg>
					</td>
					<td colspen="2">
						<input type="text" id="user_nick" name="user_nick" value="${user.user_nick}" placeholder="닉네임"><div><font id="nick_feedback" size="2"></font></div>
					</td>
				</tr>
				<tr>
					<td class="icon"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-phone" viewBox="0 0 16 16">
						<path d="M11 1a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1H5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1h6zM5 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H5z"/>
						<path d="M8 14a1 1 0 1 0 0-2 1 1 0 0 0 0 2z"/></svg>
					</td>
					<td colspan="2">
						<input type="text" id="user_phone" name="user_phone" value="${user.user_phone }" style="width:230px"><span class="input-group-addon">
						<button type="button" class="doubleChk" id="phoneChk">인증번호 발송</button></span>
						<input id="phone2" type="text" name="phone2" title="인증번호 입력" disabled style="width:261px "/>
						<span><button id="phoneChk2" class="doubleChk">인증 확인</button></span>
						<div><font id="phone_feedback" size="2"></font></div>
						<input type="hidden" id="phoneDoubleChk"/>
					</td>
				</tr>
			</table>
		</div>	<!-- end 유저 정보 -->
		</form>
		<div class="activeBtn" style="margin-top: 5px; text-align: center;">
			<button type="button" id="update">수정</button>
			<button type="reset" onclick="history.go(-1)">취소</button>
		</div>
	</div>	<!-- end 전체 창 사이즈 -->	
	
	
	
	
	
	
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
	$(document).ready(function(){
		
		var chk2 = false;
		var chk3 = false;
		var chk6 = false;
		
		// 새로운 비밀번호 체크
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
		$("#update").click(function(){
			var user_pw = $("#user_pw").val();
			var user_email = $("#user_email").val();
			var user_phone= $("#user_phone").val();
			if(user_pw == "${user.user_pw}"){
				chk2 = true;
			}
			if(user_email == '${user.user_email}'){
				chk3 = true;
			}
			if(user_phone == '${user.user_phone}'){
				chk6 = true;
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
			if(chk6 == false){
				alert("본인인증이 되지 않았습니다.")
				$("#user_phone").focus();
				return;
			}
			$("form").submit();
			alert("수정되었습니다.");
		})
	})
</script>
<%@include file="../include/footer.jsp" %>