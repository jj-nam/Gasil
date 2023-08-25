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
	.select_img img{
		margin:20px 0;
	}
	.select_img{
	text-align: center;
	}
</style>
<!-- 전체 창 사이즈 -->
	<div class="container" style="width: 400px; margin:auto;">
		<!-- 개인정보 수정 -->
		<div class="title">
			<h3>프로필 사진 수정</h3>
		</div>	<!-- end 개인정보 수정 -->
		<!-- 아이디, 비밀번호, 이메일 -->
		<form action="/myInfo/update_profile" method="POST" enctype="multipart/form-data" role="form">
		<div class="container_join">
			<input type="file" name="user_pic" id="user_pic">
			 <div class="select_img"><img src="" /></div>
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
		$("#update").click(function(){
			$("form").submit();
			alert("수정되었습니다.");
		});
		
		// 업로드 이미지 미리보기
		$("#user_pic").change(function(){
			if(this.files && this.files[0]) {
		    	var reader = new FileReader;
		    	reader.onload = function(data) {
		     		$(".select_img img").attr("src", data.target.result).width(200);        
		    	}
		    	reader.readAsDataURL(this.files[0]);
		   		}
		  });
		
	});
	
</script>
<%@include file="../include/footer.jsp" %>