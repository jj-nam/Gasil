<%@ include file="../include/header.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style type="text/css">
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
</style>
<div class="row">
	<div class="col-lg-12">
	<div class="top-part">
	<br>
	<br>
	<h3>동행</h3>
	<input type="text" name="search" placeholder="검색어를 입력하세요">
		<button id="country_filter" style="text-align: left" class="btn btn-xs pull-right btn-primary">모든 국가(필터 예정)</button>
		<button id="date_fileter" style="text-align: left" class="btn btn-xs pull-right btn-primary">조회 기간(필터 예정)</button>
	<c:if test="${not empty user}">
		<button id="regBtn" style="text-align: left" class="btn btn-xs pull-right btn-primary">새 게시글 등록</button>
	</c:if>
		<div class="content-area" style="margin-top: 10px;">
		
			<div class="row">
				<div class="col-lg-12">
					<div class="panel panel-default">
						<!-- /.panel-heading -->
						<div class="panel-body">
							<c:forEach var="withs" items="${list}">
								<div class="col" style="display:inline-block; width:24%; margin:10px 0px;">
									<div class="card" style="width: 17rem;" onclick="getWno(${withs.wno})">
									  <div class="card-body">
									  	<div>
											<table>
												<tr>
													<td rowspan="2">이미지</td>
													<td colspan="2">${withs.user_nick}</td>
													<td>여행기간</td>
												</tr>
												<tr>
													<c:choose>
														<c:when test="${withs.gender =='남'}">
															<td><img id= "gender" alt="m" src="../resources/images/genderM.png"></td>
															<td style="color:blue;">${withs.age }0대</td>
														</c:when>
														<c:otherwise>
															<td><img id= "gender" alt="w" src="../resources/images/genderW.png"></td>
															<td style="color:pink">${withs.age }0대</td>
														</c:otherwise>
													</c:choose>
													<td>${withs.period}일 ${withs.departure} ~ ${withs.arrive}</td>
												</tr>
											</table>		  	
									  	</div>
									  	<hr>
									  	
									  	<div>
										  	<div>
											  	<p> ${withs.flag}   ${withs.city }</p>
										  	</div>
										  	<div>
											    <h5 class="card-title">${withs.wtitle }</h5>
										  	</div>
										  	<div>	<!-- style을 ','로 split하여 배열에 담아 출력 -->
											  	<c:set var="styles" value="${withs.style}"/>
											  	<c:set var="styleArr" value="${fn:split(styles, ',')}"/>
											  	
											  	<c:forEach var="chk" items="${styleArr }">
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
										  	<div>
										  		<span>${withs.people } / ${withs.p_cnt }</span>
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
							<form action="/board/list" method="get" id="actionForm">
								<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
								<input type="hidden" name="amount" value="${pageMaker.cri.amount }">
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
				str += '<div style="border:1px solid lightgrey; border-radius:10px; padding:10px;">';
					str += '<div>' + result.flag + '  ' + result.city + '</div>';	//국기, 도시명
						str += '<div>';	// 닉네임, 기간 테이블
							str += '<table>';
								str += '<tr>';
									str += '<td rowspan="2">이미지</td>';
									str += '<td style="width:40%">' + result.user_nick + '</td>';
									str += '<td style="width:40%">여행기간</td>';
								str += '</tr>';
								str += '<tr>';
									str += '<td>'+ result.user_birth +'</td>';
									str += '<td>'+ result.period+ '일 ' + result.departure + '~' + result.arrive + '</td>';
								str += '</tr>';
							str += '</table>';
						str +='</div>';
						str += '<hr>';
						str += '<h4>' + result.wtitle + '</h4>';	// 제목
						str += '<hr>';
						str += '<div>' + result.content+ '</div>';	// 내용
						str += '<hr>';
						str += '<div>'
							str += '<div>모집 인원</div>';
							str += '<div>' + result.p_cnt + '</div>';
						str += '</div>'
						str += '<hr>';
						str += '<div>여행 스타일</div>';	// 여행스타일 문구
						
						var chkStyle = result.style;
						var styles = chkStyle.split(',');
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
						str += '<div style="float:right">';
						str += '<br>';
						str += '<br>';
						str += '<br>';
						if(loginUser != ""){
							if(result.user_id == loginUser){
						            str += '<button data-oper="remove" class = "btn btn-primary">삭제</button>';
						            str += '<button id = "showRegisterBtn" class = "btn btn-primary">신청자 보기</button>';
								}else{
						            str += '<button id = "modalRegisterBtn" class = "btn btn-primary">신청</button>';
								}
							}else{
					            str += '<button id = "modalLoginBtn" class = "btn btn-primary">신청</button>';
							}
					            str += '<button id = "modalCloseBtn" class = "btn btn-default">닫기</button>';
			         	str += '</div>';
			         	str += '<form action="/goWith/modify" method="get" id="operForm">';
							str += '<input type="hidden" name="wno" id="wno' + result.wno + '" value="' + result.wno + '">';
						str += '</form>';
					str += '</div>';					
			
				modalPlace.html(str);
				
				
			var modalCloseBtn = $("#modalCloseBtn");		// 닫기 버튼
			var modalLoginBtn = $("#modalLoginBtn");		// 비회원 신청 버튼
			var operForm = $("#operForm");
			
			// 댓글 취소 버튼 클릭 이벤트 
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
			
			
			}
		})
		modal.modal('show');
	
	}
</script>
<%@ include file="../include/footer.jsp" %>