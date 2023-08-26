<%@ include file="../include/header.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style type="text/css">
	.userProfile{
		width:30px;
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
		<form action="/goWith/list" method="get" id="actionForm"></form>
		<div class="content-area" style="margin-top: 10px;">
		
			<div class="row">
				<div class="col-lg-12">
					<div class="panel panel-default">
						<!-- /.panel-heading -->
						<div class="panel-body">
						
						
						
						
							<c:forEach var="withs" items="${list}">
								<div class="col" style="display:inline-block; width:19%; margin:10px 0px;">
									<div class="card" style="width: 15rem;" onclick="getWno(${withs.wno})">
									  <div class="card-body">
									  	<div>
											<table>
												<tr>
													<td colspan="2">여행기간</td>
													<td>${withs.period}일 ${withs.departure} ~ ${withs.arrive}</td>
												</tr>
												<tr>
													<td>
														<img class="userProfile" alt="profile" src="../resources/images/profile/${withs.user_pic }">
													</td>
													<td>${withs.user_nick}</td>
													<td>
														<c:choose>
															<c:when test="${withs.gender =='남'}">
																<img id= "gender" alt="m" src="../resources/images/genderM.png"><span style="color:blue;">${withs.age }0대</span>
															</c:when>
															<c:otherwise>
																<img id= "gender" alt="w" src="../resources/images/genderW.png"><span style="color:pink;">${withs.age }0대</span>
															</c:otherwise>
														</c:choose>
													</td>
												</tr>
											</table>		  	
									  	</div>
									  	<hr>
									  	
									  	<div>
										  	<div>
											  	<p><img class="flagImg" alt="${withs.flag} flag" src="../resources/images/flags/${withs.flag}.png"> ${withs.city }</p>
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
				
				
				$.ajax({
					type : 'get',
					url : '/goWith/appYN/' + wno + '.json',
					data : JSON.stringify(wno),
					success : function(data){
						
						
						str += '<div style="border:1px solid lightgrey; border-radius:10px; padding:10px;">';
						
							str += '<div><img class="flagImg" alt="' + result.flag + 'flag" src="../resources/images/flags/' + result.flag + '.png">&nbsp;' + result.city + '</div>';	//국기, 도시명
								str += '<div>';	// 닉네임, 기간 테이블
									str += '<table>';
										str += '<tr>';
											str += '<td rowspan="2"><img class="userProfile" alt="profile" src="../resources/images/profile/' + result.user_pic + '"></td>';
											str += '<td style="width:40%">' + result.user_nick + '</td>';
											str += '<td style="width:40%">여행기간</td>';
										str += '</tr>';
										str += '<tr>';
										if(result.gender == "남"){
											str += '<td><img id= "gender" alt="m" src="../resources/images/genderM.png"><span style="color:blue;">' + result.age + '0대</span></td>';
										}else{
											str += '<td><img id= "gender" alt="w" src="../resources/images/genderW.png"><span style="color:pink;">' + result.age + '0대</span></td>';
										}
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
								str += '<div style="float:right">';
								str += '<br>';
								str += '<br>';
								str += '<br>';
								if(loginUser != ""){
									if(result.user_id == loginUser){
								            str += '<button data-oper="remove" class = "btn btn-primary">삭제</button>';
								            str += '<a href="javascript:showRegisterBtn(' + result.wno +  ');">신청자보기</a>';
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
							            str += '<button id = "modalCloseBtn" class = "btn btn-default">닫기</button>';
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
								app += '<span class="col-4">' + result[i].user_id + '</span>';
								app += "<div class='confirmation"+ result[i].user_id + "'>";
								if(result[i].confirmation == 1){
									app += "<a href='javascript:confirmation("+result[i].wno+",\""+result[i].user_id+"\");'>취소</a>";
								}else{
									app += "<a href='javascript:confirmation("+result[i].wno+",\""+result[i].user_id+"\");'>수락</a>";
								}
								app += "</div>";
								app += '<hr>';
								app += '</div>';
							}
							app += '<button id = "closeBtn" class = "btn btn-default">닫기</button>';
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
					con = "<a href='javascript:confirmation("+wno+",\""+user_id+"\");'>취소</a>";
					
					peo = "<span id='people" + wno + "'>"+ result + "</span>";
					
					
				}else if(re==1){
					alert("취소 되었습니다.");
					con = "<a href='javascript:confirmation("+wno+",\""+user_id+"\");'>수락</a>";
					peo = "<span id='people" + wno + "'>"+ result + "</span>";
				}
				else if(re==2){
					alert("더 이상 수락할 수 없습니다.")
					con = "<a href='javascript:confirmation("+wno+",\""+user_id+"\");'>수락</a>";
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