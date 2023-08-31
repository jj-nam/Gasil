<%@ include file="../include/header.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style type="text/css">
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
<div class="row">
	<div class="col-lg-12">
	<div class="top-part">
	<br>
	<br>
	<c:if test="${not empty user}">
		<button id="regBtn" class="btn btn-xs pull-right btn-primary">새 게시글 등록</button>
	</c:if>
	<h3>동행</h3>
		<!-- <form action="/goWith/list" method="get" id="actionForm"></form> -->
		<div class="content-area" style="margin-top: 10px;">
		
			<div class="row">
				<div class="cardPlace">
					<div class="panel panel-default">
						<!-- /.panel-heading -->
						<div class="panel-body">
							<c:forEach var="withs" items="${list}">
								<div class="cardList">
									<div class="card" onclick="getWno(${withs.wno})">
									  <div class="card-body">
									  	<div>
											<table>
												<tr>
													<td colspan="2" rowspan="2"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-calendar3" viewBox="0 0 16 16">
													  <path d="M14 0H2a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2zM1 3.857C1 3.384 1.448 3 2 3h12c.552 0 1 .384 1 .857v10.286c0 .473-.448.857-1 .857H2c-.552 0-1-.384-1-.857V3.857z"/>
													  <path d="M6.5 7a1 1 0 1 0 0-2 1 1 0 0 0 0 2zm3 0a1 1 0 1 0 0-2 1 1 0 0 0 0 2zm3 0a1 1 0 1 0 0-2 1 1 0 0 0 0 2zm-9 3a1 1 0 1 0 0-2 1 1 0 0 0 0 2zm3 0a1 1 0 1 0 0-2 1 1 0 0 0 0 2zm3 0a1 1 0 1 0 0-2 1 1 0 0 0 0 2zm3 0a1 1 0 1 0 0-2 1 1 0 0 0 0 2zm-9 3a1 1 0 1 0 0-2 1 1 0 0 0 0 2zm3 0a1 1 0 1 0 0-2 1 1 0 0 0 0 2zm3 0a1 1 0 1 0 0-2 1 1 0 0 0 0 2z"/>
													</svg><span class="nickSpace"> 여행기간</span></td>
													<td class="dear">${withs.departure} ~ ${withs.arrive} </td>
												</tr>
												<tr>
													<td id="periodStyle">${withs.period}일</td>
												</tr>
												<tr>
													<td>
														<img class="userProfile" alt="profile" src="../resources/images/profile/${withs.user_pic }">
													</td>
													<td class="nickSpace">${withs.user_nick}&nbsp;</td>
													<td>
														<c:choose>
															<c:when test="${withs.gender =='남'}">
																<img id= "gender" alt="m" src="../resources/images/genderM.png"><span id="genderAgeM">${withs.age }0대</span>
															</c:when>
															<c:otherwise>
																<img id= "gender" alt="w" src="../resources/images/genderW.png"><span id="genderAgeW">${withs.age }0대</span>
															</c:otherwise>
														</c:choose>
													</td>
												</tr>
											</table>		  	
									  	</div>
									  	<hr>
									  	
									  	<div>
										  	<div>
											  	<img class="flagImg" alt="${withs.flag} flag" src="../resources/images/flags/${withs.flag}.png"><span id="cityName">&nbsp;${withs.city }</span>
										  	</div>
										  	<div>
											    <h6 class="card-title">${withs.wtitle }</h6>
										  	</div>
										  	<div>	<!-- style을 ','로 split하여 배열에 담아 출력 -->
											  	<c:set var="styles" value="${withs.style}"/>
											  	<c:set var="styleArr" value="${fn:split(styles, ',')}"/>
											  	
											  	<c:forEach var="chk" begin="0" end="2" step="1" items="${styleArr }">
											  		<c:choose>
											  			<c:when test="${chk == 'activity'}">
											  				<span class="card-text"><img id= "imageSize" alt="activity" src="../resources/images/activity.png"></span>
											  			</c:when>
											  			<c:when test="${chk == 'food'}">
											  				<span class="card-text"><img id= "imageSize" alt="food" src="../resources/images/food.jpg"></span>
											  			</c:when>
											  			<c:when test="${chk == 'museum'}">
											  				<span class="card-text"><img id= "imageSize" alt="museum" src="../resources/images/museum.jpg"></span>
											  			</c:when>
											  			<c:when test="${chk == 'nation'}">
											  				<span class="card-text"><img id= "imageSize" alt="nation" src="../resources/images/nation.jpg"></span>
											  			</c:when>
											  			<c:when test="${chk == 'shopping'}">
											  				<span class="card-text"><img id= "imageSize" alt="shopping" src="../resources/images/shopping.jpg"></span>
											  			</c:when>
											  			<c:when test="${chk == 'photo'}">
											  				<span class="card-text"><img id= "imageSize" alt="photo" src="../resources/images/photo.jpg"></span>
											  			</c:when>
											  		</c:choose>
											  	</c:forEach>
										  	</div>
										  	<div class="peoplePlace">
										  		<span id="people${withs.wno }">${withs.people }</span>
										  		<span> / ${withs.p_cnt }</span>
										  	</div>
										  </div>
									  </div>
									</div>
								</div>
							</c:forEach>
							
							
							<div class="modal fade" id = "MyModal" tabindex = "-1" role = "dialog" aria-labelledby = "myModalLabel" aria-hidden = "true">
							   <div class = "modal-dialog">
							      <div class = "modal-content">
							         <div class = "modal-body">
							            
							         
							         </div>
							      </div>
							   </div>
							</div>
							
							<!-- 페이징 -->
				            <div class="pull-right">
				               <ul class="pagination">
				                  <c:if test="${pageMaker.prev }">
				                     <li class="paginate_button previous">
				                        <a href="${pageMaker.startPage-1 }">&lt;</a>
				                     </li>
				                  </c:if>
				                  <c:forEach var="num" begin="${pageMaker.startPage }" end="${pageMaker.endPage }" step="1">
				                     <li class="paginate_button ${pageMaker.cri.pageNum == num ? 'active' : '' }">   
				                        <a href="${num }">${num }</a>
				                     </li>
				                  </c:forEach>
				                  <c:if test="${pageMaker.next }">
				                     <li class="paginate_button">
				                        <a href="${pageMaker.endPage+1 }">&gt;</a>
				                     </li>
				                  </c:if>
				               </ul>
				            </div>
							<!-- 페이징 끝 -->
							<form action="/goWith/list" method="get" id="actionForm">
								<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
								<input type="hidden" name="amount" value="${pageMaker.cri.amount }">
								<input type="hidden" name="wno" value="${withs.wno }">
							</form>
						</div>
						<!-- /.panel-body -->
					</div>
					<!-- /.panel -->
				</div>
				<!-- /.col-lg-12 -->
			</div>
			<!-- /.row -->
		</div>
		<!-- /.content area -->
		</div>
		<!-- /.top-part -->
	</div>
		<!-- /.col-lg-12 -->
</div>
<!-- /.row -->
<script type="text/javascript">
	history.replaceState({}, null, location.pathname);
	var actionForm = $("#actionForm");
	// 게시글 등록 버튼
	$(function(){
		
		$('#regBtn').click(function(){
			actionForm.attr('action', '/goWith/insert');
			actionForm.submit();
		});
	});
	
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
				
				// 신청 판별
				$.ajax({
					type : 'get',
					url : '/goWith/appYN/' + wno + '.json',
					data : JSON.stringify(wno),
					success : function(data){
						
						
						str += '<div class="modalTotal">';
						
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
								if(loginUser != ""){
									if(result.user_id == loginUser){
								            str += '<button class="removeBtn" data-oper="remove" class = "btn btn-primary">삭제</button>';
								            str += '<a class="showAppBtn" href="javascript:showRegisterBtn(' + result.wno +  ');">신청자보기</a>';
										}else{
											if(data==0){
												str += '<a id="modalRegisterBtn"  href="javascript:modalRegisterBtn(' + result.wno + ');">신청</a>';
											}else{
												str += '<a id="modalRegisterBtn"  href="javascript:modalRegisterBtn(' + result.wno + ');">신청 취소</a>';
											}
										}
									}else{
							            str += '<button id = "modalLoginBtn" class = "btn btn-primary">신청</button>';
									}
							            
					         	str += '</div>';
					         	str += '<form action="/goWith/modify" method="get" id="operForm">';
									str += '<input type="hidden" name="wno" id="wno' + result.wno + '" value="' + result.wno + '">';
								str += '</form>';
							str += '</div>';
							// 신청자 리스트 모달
							str += '<div class="modal fade" id = "showAppList" tabindex = "-1" role = "dialog" aria-labelledby = "showAppListLabel" aria-hidden = "true">';
							str += '<div class="modal-dialog modal-dialog-centered" style="margin:auto; position:relative; left:100px;">';
							str += '<div class = "modal-content" style="width:60%; background-color: lightgrey; border:1px solid grey; border-radius:10px; padding:10px;">';
							str += '<div class="bodyNList">';
							str += '</div>';
							str += '</div>';
							str += '</div>';
							str += '</div>';
					
					
					
				modalPlace.html(str);
				
			var modalCloseBtn = $("#modalCloseBtn");		// 닫기 버튼
			var modalLoginBtn = $("#modalLoginBtn");		// 비회원 신청 버튼
			var modalRegisterBtn = $("#modalRegisterBtn");	// 신청 버튼
			var operForm = $("#operForm");
			
			
			modalCloseBtn.on('click', function(){
				modal.modal('hide');
			})
			modalLoginBtn.on('click', function(){
				alert("회원만 신청 할 수 있습니다.")
			})
			
			$("button[data-oper='remove']").on('click',function(){
				if(confirm("삭제하시겠습니까?")){
					operForm.attr('method', 'post');
					operForm.attr('action', '/goWith/remove');
					operForm.submit();
				}else{
					return;
				}
				
			});
			
					}	// end inner ajax success
				})		// ens inner ajax
			}	// end ajax success
		})	// end ajax
		modal.modal('show');
	
	}
	
	// 동행 신청 버튼
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
					alert("취소 되었습니다.");
				}else{
					alert("신청 되었습니다");
				}
				modalBtn.innerHTML = mrb;
				modal.modal('hide');
			}
		})		
	}
	
	
	
	// 신청자 보기 버튼
	function showRegisterBtn(wno){
		var bodyList = $(".bodyNList");
		var showAppList = $("#showAppList");
		
		var app = '';
		$.ajax({
			type : 'get',
			url : '/goWith/apply/' + wno + '.json',
			data : JSON.stringify(wno),
			success : function(result){
				
						if(result == null || result.length == 0){
								app += '<div>';
								app += '<p>신청자가 없습니다</p>';
								app += '</div>';
								app += '<hr>';
								app += '<button id = "closeBtn" class = "btn btn-default">닫기</button>';
								bodyList.html(app);
						}else{
							for(var i=0; i < result.length; i++){
								app += '<div>';
								app += '<span class="col-4"><img class="userProfile" alt="profile" src="../resources/images/profile/' + result[i].user_pic + '">&nbsp;</span>';
								app += '<span class="nickSpace">' + result[i].user_id + '</span>';
								app += "<div class='confirmation"+ result[i].user_id + "'>";
								if(result[i].confirmation == 1){
									app += "<a class='cancelBtn' href='javascript:confirmation("+result[i].wno+",\""+result[i].user_id+"\");'>취소 <input class='cancelBtn' id='chat"+result[i].wno+"_\""+result[i].user_id+ "\"' type='button' value='대화하기' onclick='chat(" + result[i].wno + ",\"" + result[i].user_id + "\")'></a>";
								}else{
									app += "<a class='btnBtn' href='javascript:confirmation("+result[i].wno+",\""+result[i].user_id+"\");'>수락 <input class='btnBtn' id='chat"+result[i].wno+"_\""+result[i].user_id+ "\"' type='button' disabled value='대화하기' onclick='chat(" + result[i].wno + ",\"" + result[i].user_id + "\")'></a>";
								}
								app += "</div>";
								app += '<hr>';
								app += '</div>';
							}
							app += '<button class="btnBtn" id="closeBtn" class="btn btn-default">닫기</button>';
							bodyList.html(app);
						}
						showAppList.modal('show');
						
						
						var closeBtn = $("#closeBtn");				// 닫기 버튼
						closeBtn.on('click', function(){
							showAppList.modal('hide');
						})
						
			}	// end success
		})		// end ajax
		
	}
	
	function chat(wno, user_id){
		var aa = '<input type="hidden" name="wno" value="' + wno + '">';
		aa += '<input type="hidden" name="user_id" value="' + user_id + '">';
		actionForm.html(aa);
		actionForm.attr('action', '/message/createRoom');
		actionForm.attr('method', 'post');
		actionForm.submit();
	}
	
	
	function confirmation(wno, user_id){
		var con = '';
		var peo = '';
		$.ajax({
			type : 'post',
			url : '/goWith/confirmation',
			dataType:'json',
			contentType : 'application/json',
			data : JSON.stringify({
				'wno':wno,
				'user_id':user_id
			}),
			success : function(re){					
				
				// 신청자 수 늘리기
				$.ajax({
					type : 'get',
					url : '/goWith/people/' + wno + '.json',
					data : JSON.stringify(wno),
					success : function(result){
					
				if(re==0){
					alert("수락 하셨습니다");
					con = "<a class='cancelBtn' href='javascript:confirmation("+wno+",\""+user_id+"\");'>취소 <input class='cancelBtn' id='chat"+wno+"_\""+user_id+ "\"' type='button' value='대화하기' onclick='chat(" + wno +  ",\"" + user_id + "\")'></a>";
					
					peo = "<span id='people" + wno + "'>"+ result + "</span>";
					
					
				}else if(re==1){
					alert("취소 되었습니다.");
					con = "<a class='btnBtn' href='javascript:confirmation("+wno+",\""+user_id+"\");'>수락 <input class='btnBtn' id='chat"+wno+"_\""+user_id+ "\"' type='button' disabled value='대화하기' onclick='chat(" + wno + ",\"" + user_id + "\")'></a>";
					
					peo = "<span id='people" + wno + "'>"+ result + "</span>";
				}
				else if(re==2){
					alert("더 이상 수락할 수 없습니다.")
					con = "<a class='btnBtn' href='javascript:confirmation("+wno+",\""+user_id+"\");'>수락 <input class='btnBtn' id='chat"+wno+"_\""+user_id+ "\"' type='button' disabled value='대화하기' onclick='chat(" + wno + ",\"" + user_id + "\")'></a>";
				}
				$('.confirmation'+user_id).html(con);
				$('#people'+wno).html(peo);
				
					}	// end inner success
				})	// end inner ajax
			}	// end success
		})	// end ajax
	}	// end confirm
	
	//-------------- 페이징 버튼 이벤트 처리 ---------------
	$(".paginate_button a").on('click', function(e) {
		e.preventDefault();
		
		actionForm.attr('action', '/goWith/list');
		actionForm.find("input[name='wno']").remove();
		actionForm.find("input[name='amount']").remove();
		actionForm.find("input[name='pageNum']").val($(this).attr("href"));
		actionForm.submit();
	});
	
</script>
<%@ include file="../include/footer.jsp" %>