<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="my_info_form.jsp" %>
<style type="text/css">
	.w_board{
		background-color: yellow;
	}
	.flagImg{
		width:30px;
	}
</style>
	<div class="listContainer" style="padding:10px;">
	<input type="button" name="boardList" value="커뮤니티" onclick="community()">
	<input type="button" name="goWithList" value="동행" onclick="goWith()">
		<div class="listPlace">
		
		
		
		</div>
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
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
<script type="text/javascript">
	var listPlace = $('.listPlace');
	$(function(){
		community()
	})
	// 게시글 버튼
	function community(){
		$.ajax({
			type : 'get',
			url : '/myInfo/list',
			dataType: 'json',
			success : function(result){
				var str = '';
				if(result == null || result.length == 0){
					listPlace.html('작성한 게시물이 없습니다.');
				}else{
					for(var i=0; i < result.length; i++){
						var time = moment(result[i].reg_date).format("YYYY-MM-DD");
						
						str += '<div class="wroteBoard" style="border: 1px solid black;">';
							str += '<div style="padding:10px">';
								str += '<table style="width:100%">';
									str += '<tbody>';
										str += '<tr>';
											str += '<td rowspan="2" style="width:25px; text-align: center">';
												str += '<input type="checkbox" name="checkbox' + result[i].bno  + '">';
											str += '</td>';
											str += '<td onclick="location.href=\'/board/get?bno=' + result[i].bno + '\'">';
												str += '&nbsp;<span>'+ result[i].title + '</span>';
											str += '</td>';
											str += '<td rowspan="2" style="border: 1px solid black; width:50px;">';
												str += '<div style="font-weight:bold; text-align:center; margin:0px;">' + result[i].r_cnt + '</div>';
												str += '<div style="font-weight:bold; text-align:center; margin:0px;">댓글</div>';
											str += '</td>';
										str += '</tr>';
										str += '<tr>';
											str += '<td style="color:grey; font-size: small" onclick="location.href=\'/board/get?bno=' + result[i].bno + '\'">';
												str += '<span>&nbsp;' + result[i].user_nick + '&nbsp;</span>';
												str += '<span>' + time + '</span>';
												str += '<span>&nbsp;조회 ' + result[i].bview + '</span>';
											str += '</td>';
										str += '</tr>';
									str += '</tbody>';
								str += '</table>';
							str += '</div>';
						str += '</div>';	<!-- /wroteBoard -->
					}	// end for
					
					listPlace.html(str);
				}	// end else
			}
		})
	}
	
	var modal = $(".modal");
	function getWno(wno){
		var modalPlace = $(".modal-body");
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
											str += '<td rowspan="2">이미지</td>';
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
					            str += '<button class = "btn btn-primary" onclick="removeBtn('+ result.wno + ')">삭제</button>';
					            str += '<a href="javascript:showRegisterBtn(' + result.wno +  ');">신청자보기</a>';
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
			var operForm = $("#operForm");
			
			
			modalCloseBtn.on('click', function(){
				modal.modal('hide');
			})
			
					}	// end inner ajax success
				})		// ens inner ajax
			}	// end ajax success
		})	// end ajax
		modal.modal('show');
	
		
		
		
	}
	
	function removeBtn(wno){
		if(confirm("삭제하시겠습니까?")){
			$.ajax({
				type : 'delete',
				url : '/goWith/remove/' + wno,
				data : JSON.stringify(wno),
				success : function(result){
					MyModal.modal('hide');
					goWith();
				}
			})
		}else{
			return;
		}
		
	};
	
	
	
		
		var MyModal = $("#MyModal");
		var showAppList = $("#showAppList");
		// 신청자 보기 버튼
		function showRegisterBtn(wno){
			var bodyList = $(".bodyNList");
			
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
									app += '<span class="col-4">이미지&nbsp;</span>';
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
					if(re==0){
						alert("수락 하셨습니다");
						con += "<a href='javascript:confirmation("+wno+",\""+user_id+"\");'>취소</a>";
					}else if(re==1){
						alert("취소 되었습니다.");
						con += "<a href='javascript:confirmation("+wno+",\""+user_id+"\");'>수락</a>";
					}
					else if(re==2){
						alert("더 이상 수락할 수 없습니다.")
						con += "<a href='javascript:confirmation("+wno+",\""+user_id+"\");'>수락</a>";
					}
					$('.confirmation'+user_id).html(con);
				}
			})	// end ajax
		}	// end confirm
		
		// 동행 버튼
		function goWith(){
			$.ajax({
				type : 'get',
				url : '/myInfo/goWith',
				dataType: 'json',
				success : function(result){
					var str = '';
					if(result == null || result.length == 0){
						listPlace.html('모집 중인 동행이 없습니다.');
					}else{
						for(var i=0; i < result.length; i++){
							var time = moment(result[i].reg_date).format("YYYY-MM-DD");
							str += '<div class="wroteBoard" style="border: 1px solid black;">';
							str += '<div style="padding:10px">';
							str += '<table style="width:100%">';
							str += '<tbody>';
							str += '<tr>';
							str += '<td rowspan="4" style="width:25px; text-align: center">';
							str += '<input type="checkbox" name="checkbox' + result[i].wno + '">';
							str += '</td>';
							str += '<td onclick="getWno(' + result[i].wno + ')">';
							str += '<span>&nbsp;' + result[i].departure + '~' + result[i].arrive + '</span>';
							str += '</td>';
							str += '</tr>';
							str += '<tr>';
							str += '<td onclick="getWno(' + result[i].wno + ')">';
							str += '<span>&nbsp;<img class="flagImg" alt="' + result[i].flag + 'flag" src="../resources/images/flags/' + result[i].flag + '.png">&nbsp;</span>';
							str += '<span>' + result[i].city + '</span>';
							if(result[i].gender == '남'){
								str += '<span>&nbsp;<img id= "gender" alt="m" src="../resources/images/genderM.png"></span>';
								str += '<span style="color:blue;">' + result[i].age + '0대</span>';
							}else{
								str += '<span>&nbsp;<img id= "gender" alt="w" src="../resources/images/genderW.png"></span>';
								str += '<span style="color:pink">' + result[i].age + '0대</span>';
							}
							str += '</td>';
							str += '</tr>';
							str += '<tr onclick="getWno(' + result[i].wno + ')">';
							str += '<td>&nbsp;<span>' + result[i].wtitle + '</span></td>';
							str += '</tr>';
							str += '<tr onclick="getWno(' + result[i].wno + ')">';
							str += '<td style="color:grey; font-size: small">';
							str += '<span>&nbsp;' + result[i].user_nick + '&nbsp;</span>';
							str += '<span>' + time + '</span>';
							str += '</td>';
							str += '</tr>';
							str += '</tbody>';
							str += '</table>';
							str += '</div>';
							str += '</div>';	<!-- /wroteBoard -->
						}	// end for
						
						listPlace.html(str);
					}	// end else
						
						
				}
			})
		
	}	// end goWith()
</script>

<%@include file="../include/footer.jsp" %>