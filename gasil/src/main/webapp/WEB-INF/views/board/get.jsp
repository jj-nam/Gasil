<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../include/header.jsp" %>
<style type="text/css">
a{
	text-decoration-line: none;
	color: inherit;
}
</style>
<div class="row">
	<!-- /.col-lg-12 -->
	<div style="margin-top:5px">
	<c:choose>
	<c:when test="${move.next != 9999}">	
		<button type="button" class="btn btn-warning mr-3 mb-3" style="float:right; margin-bottom: 5px; margin-left:5px;" onclick="location.href='/board/get?bno=${move.next}'"> <span class="glyphicon glyphicon-menu-up" aria-hidden="true"></span>다음글&gt;</button>
	</c:when>
	<c:when test="${move.next == 9999}">
	<button type="button" style="float:right; margin-bottom: 5px; margin-left:5px;" class="btn btn-warning mr-3 mb-3" disabled>다음글이 없습니다</button>
	</c:when>
	</c:choose>
	<c:choose>
	<c:when test="${move.last != 9999}">
		<button type="button" class="btn btn-info mr-3 " style="float:right; margin-bottom: 5px; margin-left:5px;" onclick="location.href='/board/get?bno=${move.last}'"> <span class="glyphicon glyphicon-menu-down" aria-hidden="true"></span>&lt;이전글</button>
	</c:when>
	<c:when test="${move.last == 9999}">
	<button type="button" style="float:right; margin-bottom: 5px; margin-left:5px;" class="btn btn-info mr-3" disabled>이전글이 없습니다</button>
	</c:when>
	</c:choose>
	</div>
</div>
<!-- /.row -->

<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default" style="border: 1px solid lightgrey; border-radius: 10px; padding: 20px">
			<div class="panel-body">
				<div class="form-group">
					<p style="margin:0px">${vo.cate_id } &nbsp;&gt;
					<button data-oper="list" class="btn btn-info" style="float: right; margin-right: 10px;">목록</button>
					<c:choose>
						<c:when test="${vo.writer == user.user_nick }">
							<button data-oper="remove" class="btn btn-primary" style="float: right; margin-right: 10px;">삭제</button>
							<button data-oper="modify" class="btn btn-primary" style="float: right; margin-right: 10px;">수정</button>
						</c:when>
					</c:choose>
					</p>
					<span style="font-weight: bold; font-size: x-large;">${vo.title }</span>
				</div>
				<div class="form-group">
				<table>
					<tr>
						<td rowspan="2" style="border: 1px solid black">이미지</td>
						<td>&nbsp;&nbsp;</td>
						<td>${vo.writer }</td>
					</tr>
					<tr>
						<td></td>
						<td style="color: lightgrey; font-size: small;"><fmt:formatDate value="${vo.reg_date}" pattern="yyyy.MM.dd hh:mm"/>&nbsp;조회 ${vo.bview }</td>
					</tr>
				</table>
				</div>
				<hr>
				<div class="form-group">
					<div style="white-space: pre-line; overflow:auto;">${vo.bcontent }</div>
				</div>
				<br><br><br>
				<div>
					<span style="border: 1px solid black">이미지</span>
					<span>${vo.writer } 님의 게시글 더보기 &gt;</span>
				</div>
				<table>
					<tr>
						<td><img alt="emptyHeart" src="/resources/images/emptyHeart.png"></td>
						<td> 좋아요 ${vo.blike }</td>
						<td>&nbsp;&nbsp;</td>
						<td><img alt="comment" src="/resources/images/comment1.png" style="width:25px; height:25px;"></td>
						<td>&nbsp;댓글 ${vo.r_cnt }</td>
					</tr>
				</table>
				
				<div class = 'row'>
				   <div class = "col-lg-12">
				      <!-- /.panel -->
				      <div class = "panel panel-default">
				         <div class= "panel-heading">
				         </div>
				         <!-- /.panel-heading -->
				         <div class = "panel-body">
				            <div class = "chat">
				               <!-- start reply -->
               
              
               
			               <!-- end reply -->
			            </div>
			            <!-- ./ end ul -->
			         </div>
			         <!-- /.panel .chat-panel -->
			         
			      </div>
			   </div>
			   <!-- ./end row -->
			</div>
			<!-- start of reply insert -->
			<div>
				<hr>
				<div class="reply_input" style="border: 1px solid lightgrey; border-radius: 10px; padding: 20px">
					<input type="hidden" name="writer" value="${user.user_id }"/>
					<textarea class="form-control" rows="3" name="content" style="resize:none; border:none; padding: 0px;" placeholder="댓글을 남겨보세요"></textarea>
					<p style="text-align: right; margin:0px;"><button id="reply_registerBtn" style="border:none; background-color: transparent; color: lightgrey;">등록</button></p>
				</div>
			</div>
			<!-- end of reply insert -->
				<form action="/board/modify" method="get" id="operForm">
					<input type="hidden" name="bno" id="bno" value="${vo.bno }">
					<input type="hidden" name="pageNum" value="${cri.pageNum }">
					<input type="hidden" name="amount" value="${cri.amount }">
				</form>
			</div>
			<!-- /.panel-body -->
		</div>
		<!-- /.panel -->
	</div>
	<!-- /.col-lg-12 -->
</div>
<!-- /.row -->


 

<script type="text/javascript">	<!-- 화면 이동 스크립트 -->
	$(function(){
		var operForm = $("#operForm");
		var movePage = $("#move");
		// 수정 화면 이동 버튼 클릭 시 bno 값을 같이 전달 --> 기존 내부 input 태그 그대로 전달
		$("button[data-oper='modify']").on('click',function(){
			operForm.submit();
		});
		$("button[data-oper='remove']").on('click',function(){
			if(confirm("삭제하시겠습니까?")){
				operForm.attr('method', 'post');
				operForm.attr('action', '/board/remove');
				operForm.submit();
			}else{
				return;
			}
			
		});
		// 목록화면 이동 버튼 클릭 시 bno 값 없이 이동 --> 기존 내부 input 태그 삭제 후 이동 
		$("button[data-oper='list']").on('click',function(){
			operForm.find("#bno").remove();
			operForm.find("#pageNum").remove();
			operForm.attr('action', '/board/list');
			operForm.submit();
		});
		
	})
</script>
<script type="text/javascript" src="/resources/js/reply.js"></script>
<script type="text/javascript">	<!-- 댓글 & 모달 스크립트 -->
	console.log("============");
	console.log("JS TEST");
	
	var bnoValue = '${vo.bno}';
	
	
	$(function(){
		
		// 댓글 창 관련 스크립트
		var re_input = $(".reply_input");	// 댓글 입력 창 (id, writer)
		
		var inputWriter = re_input.find("input[name='writer']");		// 댓글 작성자 input
		var inputContent = re_input.find("textarea[name='content']");	// 댓글 input
		
		var RegisterBtn = $("#reply_registerBtn");						// 댓글 등록 버튼
		
		/* .replace(/\n/g,'<br>') */
		// 댓글 입력 버튼 클릭 이벤트
		RegisterBtn.on('click', function(){
			var inputContent = inputContent.val().replace(/\n/g,'<br>');
			replyService.add(
					{content:inputContent, 
						writer:inputWriter.val(), 
						bno:bnoValue},
					function(result){
						showList();
						re_input.find("textarea[name='content']").val('');
					}
				);
			});	// end 댓글 입력 클릭 이벤트
			
	})
	
			
	/* //대댓글 등록 버튼 클릭 이벤트	
	function rereply_regiBtn(){
		var re_input = $(".reply_input");
		var noValue = re_input.find("input[name='no']").val();
		var reInputReply = re_input.find("textarea[name='re_bcontent']");	// 댓글 input
		var reInputNick = re_input.find("input[name='rere_user_nick']");	// 댓글 input
		alert(1)
		reReplyService.add(
				{reply_c:reInputReply.val(), 
					user_id:reInputNick.val(), 
					no:noValue},
				function(result){
					showList();
					
				}
		);
	}; */
	
	// 댓글 삭제 클릭 이벤트
	function removeBtn(no){
		if(confirm("삭제하시겠습니까")){
			replyService.remove(
					no,
				function(result){
					showList();
				}
			);
		}else{
			return;
		}
	}	// end 댓글 삭제 클릭 이벤트
	
	// 댓글 수정 클릭 이벤트
	function updateBtn(no, content, writer){
		var content = content.replaceAll("<br>", "\r\n");
		var modiReply = "";
		modiReply += '<div style="border: 1px solid lightgrey; border-radius: 10px; padding: 20px">'
		modiReply += '<div id="reply_no' + no + '">';		
		modiReply += '<strong>' + writer + '</strong>';		
		modiReply += '<br>';
		modiReply += '<textarea id="reply_edit_content" name="content" class="form-control" rows="3" style="resize:none; border:none; padding:0px;" placeholder="댓글을 남겨보세요">' + content + '</textarea>';		
		modiReply += '<br>';	
		modiReply += '<p style="text-align: right; margin:0px;">';	
		modiReply += '<button style="border:none; background-color: transparent; color: lightgrey;" onclick="re_updateBtn(' + no + ',\'' + writer + '\');">수정</button>';
		modiReply += '<button style="border:none; background-color: transparent; color: lightgrey;" class=btn btn-outline-success" onclick="showList()">취소</button>';		
		modiReply += '</p>';		
		modiReply += '</div>';		
		modiReply += '</div>';		
		
		$('#reply_no' + no).html(modiReply);
		
	}	// end 댓글 수정 클릭 이벤트  
	
	
	// 댓글 내용 수정 js
	function re_updateBtn(no, writer){
		
		var reply_content = $("#reply_edit_content").val().replace(/\n/g,'<br>');
		$.ajax({
			url: '/replies/replyupdate/' + no + '/' + reply_content,
			type:'POST',
			dataType:'json',
			success: function(result){
				showList();
			}
			, error: function(error){
				console.log("에러 : " + error);
			}
		});
	};	// end 댓글 내용 수정 js
	
		
		var replyUL = $(".chat");	// 댓글 리스트 UL
		showList();					// 댓글 리스트 바인딩 함수 호출
		
		
		// 댓글 리스트 바인딩 함수
		function showList(){
			var loginUser = '$';
			var loginUser = '${user.user_id}';
			var writer = '${vo.writer}';
			replyService.getList(
				{bno:bnoValue, page:1}, 
				function(result){
					var str = '';
					
					if(result == null || result.length == 0){
						// 댓글 리스트가 없으면
						replyUL.html('');
					}else{
						// 댓글 리스트가 있으면
						for(var i=0; i<result.length; i++){
							str += '<hr>';
							str += '<div id="reply_no' + result[i].no + '">';
							str += '<table style="width:100%">';
							str += '<tr>';
							str += '<td>';
							str += '<table>';
							str += '<tr>';
							str += '<td rowspan="3" style="border:1px solid black">이미지</td>';
							str += '<td>&nbsp;</td>';
							str += '<td style="font-weight:bold;">' + result[i].writer;
							if(result[i].writer == writer){
								str += '&nbsp;<span style="display: inline-block; width: 43px; text-align: center; vertical-align:middle; color:red; border: 2px solid red; font-size : x-small; border-radius:15px; font-weight:bold;">작성자</span>';
							}
							str += '</td>';
							str += '</tr>';
							str += '<tr>';
							str += '<td>&nbsp;</td>';
							str += '<td style="white-space: pre-line;">' + result[i].content + '</td>';
							str += '</tr>';
							str += '<tr>';
							str += '<td>&nbsp;</td>';
							str += '<td><small class = "pull-right text-muted">' +  displayTime(result[i].reply_date) + '</small>&nbsp;<button style="border:none; background-color: transparent; color: lightgrey; font-size:small;" onclick="re_reBtn(' + result[i].no + ');">답글쓰기</button></td>';
							str += '</tr>';
							str += '</table>';
							str += '</td>';
							if(result[i].writer == loginUser ){
								str += '<td style="text-align : right; vertical-align: top;">';
								str += "<a href='javascript:updateBtn(" + result[i].no + ",\"" + result[i].content + "\",\""+ result[i].writer + "\");'>수정</a>";
								str += '<span style="color:lightgrey"> | </span>';
								str += '<a href="javascript:removeBtn(' + result[i].no +  ');">삭제</a>';
								str += '</td>';
							}
							str += '</table>';
							str += '</div>';
							
						}
						replyUL.html(str);
					}
				}	// function(result)
			);
		}	// end showList()
		
</script>
<%@include file="../include/footer.jsp" %>