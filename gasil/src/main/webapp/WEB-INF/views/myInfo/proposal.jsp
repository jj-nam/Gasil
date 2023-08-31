<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="my_info_form.jsp" %>
<style type="text/css">
	.proposal{
		background-color: #97df93;
	}
	h3{
		font-weight: bold;
		font-family: 'Noto Sans KR', sans-serif;
		margin-left: 10px;
	}
	.userProfile{
		width:30px;
		border-radius: 50%;
	}
	a{
		text-decoration-line: none;
		color: inherit;
		display : block; 
		width : 100 %; 
		height : 100 %;
	}
	.pagination{
		display:block;
		text-align: center;
	}
	li{
		display: inline-block;
	}
	#regBtn{
		float:right;
	}
	td{
		font-size: x-small;
	}
	#imageSize{
		height: 50px;
		width:50px;
	}
	hr{
		margin:5px;
	}
	.closeBtn{
		padding:0px;
	}
	.flagImg{
		width:30px;
	}
	.cardList{
		display:inline-block; 
		margin:10px 9px;
	}
	.card{
		width: 230px;
	}
	.cardPlace{
		padding:0px;
	}
	.panel-body{
		padding: 15px;
	}
	#periodStyle, .modalPeriod{
		color: #20B2AA;
		font-weight: bold;
		font-family: 'Noto Sans KR', sans-serif;
		font-size: 11px;
	}
	.card-title{
		margin-top: 10px;
		text-overflow: ellipsis;
		overflow: hidden;
		white-space: nowrap;
		font-family: 'Noto Sans KR', sans-serif;
	}
	.nickSpace, .modalNick{
		font-family: 'Noto Sans KR', sans-serif;
		font-weight: bold;
		font-size: 12px;
	}
	.dear{
		font-family: 'Noto Sans KR', sans-serif;
		font-size: 10px;
	}
	#cityName, .modalMenu{
		font-family: 'Noto Sans KR', sans-serif;
		font-size: 15px;
		font-weight: bold;
	}
	#genderAgeM{
		color: blue;
		font-family: 'Noto Sans KR', sans-serif;
		font-size: 11px;
	}
	#genderAgeW{
		font-family: 'Noto Sans KR', sans-serif;
		color: #FF5675;
		font-size: 11px;
	}
	.modalTotal{
		border:1px solid lightgrey; 
		border-radius:10px; 
		padding:10px;
	}
	.modalNick{
		width:40%;
	}
	.modalContent{
		font-family: 'Noto Sans KR', sans-serif;
		font-size: 15px;
	}
	.modalCnt{
		font-family: 'Noto Sans KR', sans-serif;
		font-size: 20px;
	}
	.btnPlace{
		float:right;
	}
	.peoplePlace{
		margin-top:5px;
	}
	#modalCloseBtn, #modalRegisterBtn{
		font-family: 'Noto Sans KR', sans-serif;
		float:right; 
		color : black;
		margin: 0 5px;
		border: none;
		padding: 0;
	}
	.removeBtn:hover{
		color : #FF7878	;
	}
	.removeBtn{
		font-family: 'Noto Sans KR', sans-serif;
		padding:0;
		margin: 0 5px;
		float:right;
		color: #FF3232;
		background: none;
		border:none;
	}
	.showAppBtn{
		font-family: 'Noto Sans KR', sans-serif;
		padding:0;
		margin: 0 5px;
		float:right;
	}
	.cancelBtn, .btnBtn{
		font-family: 'Noto Sans KR', sans-serif;
		border:none;
		background: none;
		margin-right : 10px;
	}
	.showAppBtn:hover, .cancelBtn:hover, .btnBtn:hover, #modalCloseBtn:hover, #modalRegisterBtn:hover{
		color: grey;
	}
	#regBtn{
		font-family: 'Noto Sans KR', sans-serif;
		background-color: #97df93;
		border: none;
		text-align: left
	}
	#regBtn:hover{
		background-color: #96F56E;
		color: grey;
	}
</style>


							
	<div class="listContainer" style="padding:10px;">
		<c:forEach var="prop" items="${list}">
			<div class="wroteBoard" style="border: 1px solid black;">
				<div style="padding:10px">
				<table style="width:100%">
					<tbody>
						<tr>
							<td rowspan="4" style="width:25px; text-align: center">
								<input type="checkbox" name="checkbox${prop.wno }">
							</td>
							<td onclick="getWno(${prop.wno})">
								<span>&nbsp;${prop.departure } ~ ${prop.arrive }</span>
							</td>
						</tr>
						<tr>
							<td onclick="getWno(${prop.wno})">
								<span>&nbsp;<img class="flagImg" alt="${prop.flag} flag" src="../resources/images/flags/${prop.flag}.png"></span>
								<span>&nbsp;${prop.city }</span>
								<c:choose>
									<c:when test="${prop.gender =='남'}">
										<span>&nbsp;<img id= "gender" alt="m" src="../resources/images/genderM.png"></span>
										<span style="color:blue;">${prop.age }0대</span>
									</c:when>
									<c:otherwise>
										<span>&nbsp;<img id= "gender" alt="w" src="../resources/images/genderW.png"></span>
										<span style="color:pink">${prop.age }0대</span>
									</c:otherwise>
								</c:choose>
							</td>
						</tr>
						<tr onclick="getWno(${prop.wno})">
							<td>&nbsp;<c:out value="${prop.wtitle}"></c:out></td>
						</tr>
						<tr onclick="getWno(${prop.wno})">
							<td style="color:grey; font-size: small">
								<span>&nbsp;${prop.user_nick }&nbsp;</span>
								<fmt:formatDate value="${prop.reg_date}" pattern="yyyy-MM-dd"/>
							</td>
						</tr>
					</tbody>
				</table>
				</div>
			</div>	<!-- /wroteBoard -->
		</c:forEach>
	</div>	<!-- /listContainer -->
	
	<div class="modal fade" id = "MyModal" tabindex = "-1" role = "dialog" aria-labelledby = "myModalLabel" aria-hidden = "true">
	   <div class = "modal-dialog">
	      <div class = "modal-content">
	         <div class = "modal-body">
	            
	         
	         </div>
	      </div>
	   </div>
	</div>
	
	
			</div>
		</div>
	</div>
</div>

<script type="text/javascript">
history.replaceState({}, null, location.pathname);

var modal = $(".modal");
function getWno(wno){
	var modalPlace = $(".modal-body");
	var loginUser = '${user.user_id}';
	var str = "";
	
	$.ajax({
		type : 'get',
		url : '/goWith/' + wno + '.json',
		data : JSON.stringify(wno),
		success : function(result){
			
			// 신청 했는지 여부 체크
			$.ajax({
				type : 'get',
				url : '/goWith/appYN/' + wno + '.json',
				data : JSON.stringify(wno),
				success : function(data){
					
					
					str += '<div style="border:1px solid lightgrey; border-radius:10px; padding:10px;">';
					str += '<div><img class="flagImg" alt="' + result.flag + 'flag" src="../resources/images/flags/' + result.flag + '.png">&nbsp;<span id="cityName">' + result.city + '</span></div>';	//국기, 도시명
					str += '<div>';	// 닉네임, 기간 테이블
						str += '<table>';
							str += '<tr>';
								str += '<td rowspan="2"><img class="userProfile" alt="profile" src="../resources/images/profile/' + result.user_pic + '"></td>';
								str += '<td class="modalNick">' + result.user_nick + '</td>';
								str += '<td class="modalNick">여행기간</td>';
							str += '</tr>';
							str += '<tr>';
							if(result.gender == "남"){
								str += '<td><img id= "gender" alt="m" src="../resources/images/genderM.png"><span id="genderAgeM">' + result.age + '0대</span></td>';
							}else{
								str += '<td><img id= "gender" alt="w" src="../resources/images/genderW.png"><span id="genderAgeW">' + result.age + '0대</span></td>';
							}
								str += '<td><span class="modalNick"> ' + result.departure + '~' + result.arrive + '&nbsp;&nbsp; </span><span class="modalPeriod">'+ result.period+ '일 </span></td>';
							str += '</tr>';
						str += '</table>';
					str +='</div>';
					str += '<hr>';
					str += '<h4 class="card-title">' + result.wtitle + '</h4>';	// 제목
					str += '<hr>';
					str += '<div class="modalContent">' + result.content+ '</div>';	// 내용
					str += '<hr>';
					str += '<div>'
						str += '<div class="modalMenu">모집 인원</div>';
						str += '<div class="modalCnt">' + result.p_cnt + '</div>';
					str += '</div>'
					str += '<hr>';
					str += '<div class="modalMenu">여행 스타일</div>';	// 여행스타일 문구
					
					var chkStyle = result.style;
					var styles = (chkStyle||'').split(',');
					for(var i=0; i<styles.length; i++){
						if(styles[i] == 'activity'){
							str += '<span><span class="card-text"><img id= "imageSize" alt="activity" src="../resources/images/activity.png"></span>&nbsp;';
						}else if(styles[i] == 'food'){
							str += '<span><span class="card-text"><img id= "imageSize" alt="food" src="../resources/images/food.jpg"></span>&nbsp;';
						}else if(styles[i] == 'museum'){
							str += '<span><span class="card-text"><img id= "imageSize" alt="museum" src="../resources/images/museum.jpg"></span>&nbsp;';
						}else if(styles[i] == 'nation'){
							str += '<span><span class="card-text"><img id= "imageSize" alt="nation" src="../resources/images/nation.jpg"></span>&nbsp;';
						}else if(styles[i] == 'shopping'){
							str += '<span><span class="card-text"><img id= "imageSize" alt="shopping" src="../resources/images/shopping.jpg"></span>&nbsp;';
						}else if(styles[i] == 'photo'){
							str += '<span><span class="card-text"><img id= "imageSize" alt="photo" src="../resources/images/photo.jpg"></span>&nbsp;';
						}
					}
					str += '<div class="btnPlace">';
					str += '<br>';
					str += '<br>';
					str += '<br>';
							str += '<button id = "modalCloseBtn" class = "btn btn-default">닫기</button>';
							if(result.user_id != loginUser){
									if(data==0){
										str += '<a id="modalRegisterBtn"  href="javascript:modalRegisterBtn(' + result.wno + ');">신청</a>';
									}else{
										str += '<a id="modalRegisterBtn"  href="javascript:modalRegisterBtn(' + result.wno + ');">신청 취소</a>';
									}
								}
				         	str += '</div>';
				         	str += '<form action="/goWith/modify" method="get" id="operForm">';
								str += '<input type="hidden" name="wno" id="wno' + result.wno + '" value="' + result.wno + '">';
							str += '</form>';
						str += '</div>';
				
				
					modalPlace.html(str);
					
					var modalCloseBtn = $("#modalCloseBtn");
					
					modalCloseBtn.on('click', function(){
						modal.modal('hide');
					})
				}
			})
		}
	})
	modal.modal('show');
}
function modalRegisterBtn(wno){
	var modalBtn = $("#modalRegisterBtn");
	var mrb = '';
	$.ajax({
		type : 'post',
		url : "/goWith/appli",
		dataType:'json',
		contentType : 'application/json',
		data : JSON.stringify({
			'wno' : wno
		}),
		success : function(result){
			if(result==1){
				mrb += '<a href="javascript:modalRegisterBtn(' + result.wno + ');">신청</a>'
				alert("취소 되었습니다.");
			}else{
				mrb += '<a href="javascript:modalRegisterBtn(' + result.wno + ');">신청 취소</a>'
				alert("신청 되었습니다");
			}
			modalBtn.innerHTML = mrb;
			modal.modal('hide');
		}
	})		
}

</script>

<%@include file="../include/footer.jsp" %>