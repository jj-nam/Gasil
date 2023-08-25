<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="my_info_form.jsp" %>
<style type="text/css">
	.profile{
		width: 100px;
	}
	.profileSpace{
		text-align: center;
	}
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
	h3{
	text-align: center;
	}
</style>
<!-- 전체 창 사이즈 -->
	<div class="container" style="width: 400px; margin:auto;">
		<!-- 개인정보 수정 -->
		<div class="title">
			<h3>개인정보</h3>
		</div>	<!-- end 개인정보 수정 -->
		<!-- 아이디, 비밀번호, 이메일 -->
		<div class="container_join">
			<table class="user_ipe">
				<tr>
					<td class="profileSpace" colspan="2">
						<img class="profile" alt="${user.user_pic }" src="C:\\dev\\upload\\${user.user_pic }">
					</td>
				</tr>
				<tr>
					<td>
						아이디
					</td>
					<td>
						${user.user_id }
					</td>
				</tr>				
				<tr>
					<td>
						비밀번호	
					</td>
					<td>
						
					</td>
				</tr>				
				<tr>
					<td>
						이메일
					</td>
					<td>${user.user_email }</td>
				</tr>
			</table>
		</div>	<!-- end 아이디, 비밀번호, 이메일 -->
		<!-- 유저 정보 -->
		<div class="container_join" style="margin-top: 5px;">
			<table class="user_nbpn">
				<tr>
					<td>
						이름
					</td>
					<td>
						${user.user_name }
					</td>
				</tr>
				<tr>
					<td>
						생년월일
					</td>
					<td>
						${user.user_birth.substring(0,4) }년 ${user.user_birth.substring(4,6) }월 ${user.user_birth.substring(6) }일
					</td>
				<tr>
				<tr>
					<td>
						닉네임
					</td>
					<td>
						${user.user_nick }
					</td>
				</tr>
				<tr>
					<td>
						회원 등급
					</td>
					<td>
						${user.grade }
					</td>
				</tr>
				<tr>
					<td>
						성별
					</td>
					<td>
						${user.gender }자
					</td>
				</tr>
				<tr>
					<td>
						핸드폰 번호
					</td>
					<td>
						${user.user_phone.substring(0,3) } - ${user.user_phone.substring(3,7) } - ${user.user_phone.substring(7) } 
					</td>
				</tr>
				<tr>
					<td>
						가입 일자
					</td>
					<td>
						${user.joindate }
					</td>
				</tr>
			</table>
		</div>	<!-- end 유저 정보 -->
		<form action="/myInfo/update_info" method="get" id="operForm">
		</form>
		<div class="activeBtn" style="margin-top: 5px; text-align: center;">
			<button data-oper="updateBtn">수정</button>
		</div>
	</div>	<!-- end 전체 창 사이즈 -->	




			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
$(function(){
	var operForm = $("#operForm");
	$("button[data-oper='updateBtn']").on('click',function(){
		var chkPw = prompt('비밀번호를 입력하세요.','');
		var oriPw = '${user.user_pw}';
		if(chkPw == oriPw){
			operForm.submit();
		}else{
			alert("비밀번호가 틀렸습니다.")
			return;
		}
	});
});
</script>
<%@include file="../include/footer.jsp" %>