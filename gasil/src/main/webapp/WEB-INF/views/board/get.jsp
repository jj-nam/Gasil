<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../include/header.jsp" %>
<style type="text/css">
	a{
		text-decoration-line: none;
		color: inherit;
	}
	.userProfile{
		width:30px;
		border-radius: 50%;
	}
</style>
<div class="row">
	<!-- /.col-lg-12 -->
	<div style="margin-top:5px">
	<c:choose>
		<c:when test="${move.next == 9999}">
			<button type="button" style="float:right; margin-bottom: 5px; margin-left:5px;" class="btn btn-warning mr-3 mb-3" disabled>다음글이 없습니다</button>
		</c:when>
		<c:otherwise>
			<button type="button" class="btn btn-warning mr-3 mb-3" style="float:right; margin-bottom: 5px; margin-left:5px;" onclick="location.href='/board/get?bno=${move.next}'"> <span class="glyphicon glyphicon-menu-up" aria-hidden="true"></span>다음글&gt;</button>
		</c:otherwise>
	</c:choose>
	<c:choose>
	<c:when test="${move.last == 9999}">
		<button type="button" style="float:right; margin-bottom: 5px; margin-left:5px;" class="btn btn-info mr-3" disabled>이전글이 없습니다</button>
	</c:when>
		<c:otherwise>
			<button type="button" class="btn btn-info mr-3 " style="float:right; margin-bottom: 5px; margin-left:5px;" onclick="location.href='/board/get?bno=${move.last}'"> <span class="glyphicon glyphicon-menu-down" aria-hidden="true"></span>&lt;이전글</button>
		</c:otherwise>
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
						<c:when test="${vo.writer == user.user_id }">
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
						<td rowspan="2">
							<img class="userProfile" alt="profile" src="../resources/images/profile/${vo.user_pic }">
						</td>
						<td>&nbsp;&nbsp;</td>
						<td>${vo.user_nick}</td>
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
					<span><img class="userProfile" alt="profile" src="../resources/images/profile/${vo.user_pic }"></span>
					<span>${vo.user_nick} 님의 게시글 더보기 &gt;</span>
				</div>
				<div>
				<span class="likeReply">
			        <a id="likeBtn">
				        <span id="heart"></span>
				        좋아요
				        <span class="likeCnt"></span> &nbsp;
			        </a>
			    </span>
					<span>
						<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-chat-square-dots" viewBox="0 0 16 16">
						  <path d="M14 1a1 1 0 0 1 1 1v8a1 1 0 0 1-1 1h-2.5a2 2 0 0 0-1.6.8L8 14.333 6.1 11.8a2 2 0 0 0-1.6-.8H2a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1h12zM2 0a2 2 0 0 0-2 2v8a2 2 0 0 0 2 2h2.5a1 1 0 0 1 .8.4l1.9 2.533a1 1 0 0 0 1.6 0l1.9-2.533a1 1 0 0 1 .8-.4H14a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2z"/>
						  <path d="M5 6a1 1 0 1 1-2 0 1 1 0 0 1 2 0zm4 0a1 1 0 1 1-2 0 1 1 0 0 1 2 0zm4 0a1 1 0 1 1-2 0 1 1 0 0 1 2 0z"/>
						</svg>&nbsp;댓글 ${vo.r_cnt }
					</span>
				</div>
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
				<c:choose>
					<c:when test="${not empty user}">
						<input type="hidden" name="writer" value="${user.user_id }"/>
						<input type="hidden" name="user_nick" value="${user.user_nick }"/>
						<textarea class="form-control" rows="3" name="content" style="resize:none; border:none; padding: 0px;" placeholder="댓글을 남겨보세요"></textarea>
						<p style="text-align: right; margin:0px;"><button id="reply_registerBtn" style="border:none; background-color: transparent; color: lightgrey;">등록</button></p>
					</c:when>
					<c:otherwise>
						<p style="text-align: center; vertical-align: middle; font-weight: bold; font-size: x-large;">로그인 후 이용 가능합니다</p>
						<div style="text-align: center;">
							<button onclick="location.href='/user/loginPage'">로그인</button>
						</div>
					</c:otherwise>
				</c:choose>
				
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
		// 목록 화면 이동 버튼 클릭 시 bno 값 없이 이동 --> 기존 내부 input 태그 삭제 후 이동 
		$("button[data-oper='list']").on('click',function(){
			operForm.find("#bno").remove();
			operForm.find("#pageNum").remove();
			operForm.attr('action', '/board/list');
			operForm.submit();
		});
		
	})
</script>
<script type="text/javascript" src="/resources/js/reply.js"></script>
<script type="text/javascript">	<!-- 댓글 -->
	console.log("============");
	console.log("JS TEST");
	
	var bnoValue = '${vo.bno}';
	var writer = '${vo.user_nick}';
	var cnt = '${vo.blike}';
	
	$(function(){
		// 댓글 창 관련 스크립트
		var re_input = $(".reply_input");	// 댓글 입력 창 (id, writer)
		
		var inputWriter = re_input.find("input[name='user_nick']");		// 댓글 작성자 input
		var inputContent = re_input.find("textarea[name='content']");	// 댓글 input
		
		var RegisterBtn = $("#reply_registerBtn");						// 댓글 등록 버튼
		
		/* .replace(/\n/g,'<br>') */
		// 댓글 입력 버튼 클릭 이벤트
		RegisterBtn.on('click', function(){
			if(inputContent.val() == ''){
				alert("댓글을 입력해주세요");
				return;
			}
			replyService.add(
					{content:inputContent.val().replace(/\n/g,'<br>'), 
						writer:inputWriter.val(), 
						bno:bnoValue},
					function(result){
						showList();
						re_input.find("textarea[name='content']").val('');
					}
				);
			});	// end 댓글 입력 클릭 이벤트
	})
			
	
	var like = ${like};
	var unlikeElement = 
    `
    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-heart" viewBox="0 0 16 16">
        <path d="m8 2.748-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01L8 2.748zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143c.06.055.119.112.176.171a3.12 3.12 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15z"/>
    </svg>
    `;

    var likeElement = 
    `
    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-heart-fill" viewBox="0 0 16 16">
        <path fill-rule="evenodd" d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314z"/>
    </svg>
    `;	
    
    var likeBtn_a = document.querySelector("#likeBtn");
    var heart = document.querySelector("#heart");
    var likeCnt = document.querySelector(".likeCnt");
    
    // 꽉찬 하트
    function changeLike(inc){
        likeBtn_a.setAttribute("class", "like");
        heart.innerHTML = likeElement;
        
        inc ? likeCnt.innerHTML = inc : likeCnt.innerHTML = ${vo.blike}; 
    }
    // 빈 하트
    function changeUnlike(dec){
        likeBtn_a.setAttribute("class", "unlike");
        heart.innerHTML = unlikeElement;
        
       	dec>=0 ? likeCnt.innerHTML = dec : likeCnt.innerHTML = ${vo.blike}; 
    }
    // 좋아요 안누름(count == 0) -> 빈하트 노츌
    if(like == 0){
        changeUnlike();
    }
    // 좋아요 누름(count != 0) -> 꽉찬 하트 노풀
    else{
        changeLike();
    }

    likeBtn_a.addEventListener("click", function(){
    	if ('${user.user_nick}'==''){
			alert('로그인한 사용자만 가능합니다.');
			return;
		}
    	var bno= ${vo.bno};
		var user_id = '${user.user_id}';
		
		$.ajax({
			type :'post',
			url : "/heart/like",
			dataType:'json',
			contentType : 'application/json',
			data : JSON.stringify({
				'bno' : bno,
				'user_id' : user_id
			}),
			success : function(result){
				likeBtn_a.getAttribute("class") === 'like' ?  changeUnlike(result) : changeLike(result);
			},
			error : function(){
				alert('좋아요 기능에서 오류가 발생했습니다.');
			}
		});
    	
    });
	
	//대댓글 : 답글쓰기 버튼 클릭 이벤트	
	function re_reBtn(no, rno){
		var rerere = $(".rerere");
		var reply_writer = '${user.user_nick}';		
		var rere = '';
		rere += '<div style="border: 1px solid lightgrey; border-radius: 10px; padding: 20px">'
		rere += '<div class="rerere" id="re_reply_no' + no + '">';		
		rere += '<strong>' + reply_writer + '</strong>';		
		rere += '<br>';
		rere += '<textarea id="rereply_content" name="rere_content" class="form-control" rows="3" style="resize:none; border:none; padding:0px;" placeholder="댓글을 남겨보세요"></textarea>';		
		rere += '<br>';	
		rere += '<p style="text-align: right; margin:0px;">';	
		rere += '<button style="border:none; background-color: transparent; color: lightgrey;" onclick="rere_registerBtn(' + no + ',\'' + reply_writer + '\',' + rno + ');">등록</button>';
		rere += '<button style="border:none; background-color: transparent; color: lightgrey;" class=btn btn-outline-success" onclick="showList()">취소</button>';		
		rere += '</p>';		
		rere += '</div>';		
		rere += '</div>';		
			
		$('#reply_no' + no).append(rere);
		
	};
	// 대댓글 insert
	function rere_registerBtn(no, writer, rno){
		var inputReply = $("#rereply_content");
		if(inputReply.val() == ''){
			alert("댓글을 입력해주세요.")
			return;
		}
		replyService.addre(
				{content:inputReply.val(), 
					writer:writer, 
					bno:bnoValue,
					no : no,
					rno : rno},
				function(result){
					showList();
				}
			);
	}
	
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
		modiReply += '<div style="border: 1px solid lightgrey; border-radius: 10px; padding: 20px 20px 0 20px;">'
		modiReply += '<div id="reply_no' + no + '">';		
		modiReply += '<strong>' + writer + '</strong>';		
		modiReply += '<br>';
		modiReply += '<textarea id="reply_edit_content" name="content" class="form-control" rows="3" style="resize:none; border:none; padding:0px;" placeholder="댓글을 남겨보세요">' + content + '</textarea>';		
		modiReply += '<br>';	
		modiReply += '<p style="text-align: right; margin:0px;">';	
		modiReply += '<button style="border:none; background-color: transparent; color: lightgrey;" onclick="re_updateBtn(' + no + ',\'' + writer + '\');">수정</button>';
		modiReply += '<button style="border:none; background-color: transparent; color: lightgrey; padding-top: 0" class=btn btn-outline-success" onclick="showList()">취소</button>';		
		modiReply += '</p>';		
		modiReply += '</div>';		
		modiReply += '</div>';		
		
		$('#reply_no' + no).html(modiReply);
		
	}	// end 댓글 수정 클릭 이벤트  
	
	// 대댓글 수정 클릭 이벤트
	function updateRereBtn(no, rno, content, writer){
		var content = content.replaceAll("<br>", "\r\n");
		var modiReply = "";
		modiReply += '<div style="border: 1px solid lightgrey; border-radius: 10px; margin-left:10%; padding: 20px 20px 0 20px;">'
		modiReply += '<div id="rereply_no' + no + '">';		
		modiReply += '<strong>' + writer + '</strong>';		
		modiReply += '<br>';
		modiReply += '<textarea id="reply_edit_content" name="content" class="form-control" rows="3" style="resize:none; border:none; padding:0px;" placeholder="댓글을 남겨보세요">' + content + '</textarea>';		
		modiReply += '<br>';	
		modiReply += '<p style="text-align: right; margin:0px;">';	
		modiReply += '<button style="border:none; background-color: transparent; color: lightgrey;" onclick="re_updateBtn(' + no + ',\'' + writer + '\');">수정</button>';
		modiReply += '<button style="border:none; background-color: transparent; color: lightgrey; padding-top: 0;" class=btn btn-outline-success" onclick="showList()">취소</button>';		
		modiReply += '</p>';		
		modiReply += '</div>';		
		modiReply += '</div>';		
		
		$('#rereply_no' + no).html(modiReply);
		
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
			var loginUser = '${user.user_nick}';
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
							if(result[i].rgp==0){
								str += '<hr>';
								str += '<div id="reply_no' + result[i].no + '">';
								str += '<table style="width:100%">';
								str += '<tr>';
								str += '<td>';
								str += '<table>';
								str += '<tr>';
								str += '<td rowspan="3"><img class="userProfile" alt="profile" src="../resources/images/profile/' + result[i].user_pic + '"></td>';
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
								str += '<td><small class = "pull-right text-muted">' +  displayTime(result[i].reply_date) + '</small>&nbsp;<button style="border:none; background-color: transparent; color: lightgrey; font-size:small;" onclick="re_reBtn(' + result[i].no + ',' + result[i].rno + ');">답글쓰기</button></td>';
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
								
							}else{
								str += '<hr>';
								str += '<div style="margin-left:10%;">'
								str += '<div id="rereply_no' + result[i].no + '">';		
								str += '<table style="width:100%">';
								str += '<tr>';
								str += '<td>';
								str += '<table>';
								str += '<tr>';
								str += '<td rowspan="3"><img class="userProfile" alt="profile" src="../resources/images/profile/' + result[i].user_pic + '"></td>';
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
								str += '<td><small class = "pull-right text-muted">' +  displayTime(result[i].reply_date) + '</small></td>';
								str += '</tr>';
								str += '</table>';
								str += '</td>';
								if(result[i].writer == loginUser ){
									str += '<td style="text-align : right; vertical-align: top;">';
									str += "<a href='javascript:updateRereBtn(" + result[i].no + "," + result[i].rno + ",\"" + result[i].content + "\",\""+ result[i].writer + "\");'>수정</a>";
									str += '<span style="color:lightgrey"> | </span>';
									str += '<a href="javascript:removeBtn(' + result[i].no +  ');">삭제</a>';
									str += '</td>';
								}
								str += '</table>';	
								str += '</div>';		
								str += '</div>';		
							}	
							
						}
						replyUL.html(str);
					}
				}	// function(result)
			);
		}	// end showList()
		
</script>
<%@include file="../include/footer.jsp" %>