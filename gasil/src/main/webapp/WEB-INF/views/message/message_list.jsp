<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../include/header.jsp" %>
<style type="text/css">
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap');
	img{
		width: 40px;
		height: 40px;
		border:0px;
		border-radius:50%;
	}
	p{
		font-family: 'Noto Sans KR', sans-serif;
		font-size: 20px;
	}
	.badge{
		margin-left:15px;
	}
	
	.msg-container{
		max-width:1770px;
		margin:auto;
	}
	.inbox_people{
		background: #f8f8f8 none repeat scroll 0 0;
		float: left;
		overflow:hidden;
		width:40%;
	}
	.inbox_msg{
		border: 1px solid #f7f7f7;
		border-radius: 15px;
		clear:both;
		overflow: hidden;	
	}
	.top_spac{
		margin:20px 0 0;
	}
	.chat_ib h5{
		font-size: 20px;
		color: #464646;
		margin: 0 0 8px 0;
		font-family: 'Noto Sans KR', sans-serif;
	}
	.chat_ib h5 span{
		font-size:17px;
		float:right;
	}	
	.chat_ib p{
		font-size:14px; 
		color:#989898; 
		margin:auto;
	}
	.chat_img{
		float: left;
		width: 11%;
	}
	.chat_ib{
		float:left;
		padding: 0 0 0 15px;
		width:88%;
	}
	.chat_people{
		overflow:hidden;
		clear:both;
	}
	chat_list{
		border-bottom: 1px solid #f7f7f7;
		margin: 0;
		padding: 18px 16px 10px;
	}
	.chat_list_box :hover{
		background-color: #d6ead0;
	}
	.inbox_chat{
		height:550px;
		overflow-y:scroll;
	}
	.active_chat{
		background: #ebebeb;
	}
	.incoming_msg_omg{
		display:inline-block;
		width: 6%;
	}
	.received_msg{
		display:inline-block;
		padding: 0 0 0 10px;
		vertical-align: top;
		width: 65%;
	}
	.received_width_msg p {
		background: #f4f4f4 none repeat scroll 0 0;
		border-radius: 7px;
		color: #646464;
		font-size:14px;
		margin:0;
		padding:10px 10px 10px 12px;
		width: 100%;
		font-family: 'Noto Sans KR', sans-serif;
	}
	.time_date{
		color:#747474;
		display:block;
		font-size: 12px;
		margin:5px 0 8px;
	}
	.received_withd_msg{
		width:57%;
	}
	.mesgs{
		float:left;
		padding: 30px 15px 0 25px;
		width: 60%;
	}
	.sent_msg p {
		background: #97df93 none repeat scroll 0 0;
		border-radius: 7px;
		font-size: 14px;
		margin: 0;
		color: #fff;
		padding: 10px 10px 10px 12px;
		width:100%;
		font-family: 'Noto Sans KR', sans-serif;
	}
	.outgoing_msg{
		overflow: hidden;
		margin: 26px 0 26px;
	}
	.sent_msg{
		float: right;
		width:60%;
		font-family: 'Noto Sans KR', sans-serif;
	}
	.input_msg_write input{
		background: rgba(0,0,0,0) none repeat scroll 0 0;
		border: medium none;
		color: #4c4c4c;
		font-size: 15px;
		min-height: 48px;
		width: 100%;
	}
	.type_msg{
		border-top: 1px solid #dfdfdf;
		position: relative;
	}
	.msg_send_btn{
		background: #97df93 none repeat scroll 0 0;
		border: medium none;
		border-radius: 50%;
		color:#fff;
		cursor: pointer;
		font-size: 17px;
		height: 33px;
		position: absolute;;
		right:0;
		top: 11px;
		width: 33px;
	}
	.msg_send_btn:hover{
		background: #5fcd58 none repeat scroll 0 0;
	}
	.messaging{
		padding: 0 0 50px 0;
	}
	.msg_history{
		height: 516px;
		overflow-y: auto;
	}	
	.chat_data{
		width:150px;
		color: #747474;
	}
</style>
<div class="msg-container">
	<div class="messaging">
		<div class="inbox_msg">
		<!-- 메세지 목록 영역 -->
			<div class="inbox_people">
				<div class="inbox_chat">
				
				</div>
			</div>	<!-- /inbox_people -->
			
			<!-- 메세지 내용 영역 -->
			<div class="mesgs">
				<!-- 메세지 내용 목록 -->
				<div class="msg_history">
					<!-- 메세지 내용이 올 자리 -->
				</div>
				<div class="send_message">
				</div>
				<!-- 메세지 입력란 -->
			</div>
		</div>	<!-- /inbox_msg -->
		
	</div>	<!-- /messaging -->
</div>	<!-- /msg-container -->

<script type="text/javascript">
// 가장 처음 메세지 리스트를 가져온다.
var FirstMessageList = function(){
	$.ajax({
		url:"message_ajax_list.do",
		method:"get",
		success:function(data){
			$('.inbox_chat').html(data);
			
			// 메세지 리스트 중 하나를 클릭
			$('.chat_list').on('click', function(){
				var room = $(this).attr('room');
				var other_nick = $(this).attr('other-nick');
				
				// 선택 외 active 해제
				$('.chat_list_box').not('.chat_list_box.chat_list_box'+room).removeClass('active_chat');
				// 선택 메세지 active 효과
				$('.chat_list_box'+room).addClass('active_chat');
				
				var send_msg = "";
				send_msg += "<div class='type_msg'>";
				send_msg += "<div class='input_msg_write row'>";
				send_msg += "<div class='col-11'>";
				send_msg += "<input type='text' class='write_msg form-control' placeholder='메세지 입력'/>";
				send_msg += "</div>";
				send_msg += "<div class='col-1'>";
				send_msg += '<button class="msg_send_btn" type="button"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-send" viewBox="0 0 16 16"><path d="M15.854.146a.5.5 0 0 1 .11.54l-5.819 14.547a.75.75 0 0 1-1.329.124l-3.178-4.995L.643 7.184a.75.75 0 0 1 .124-1.33L15.314.037a.5.5 0 0 1 .54.11ZM6.636 10.07l2.761 4.338L14.13 2.576 6.636 10.07Zm6.787-8.201L1.591 6.602l4.339 2.76 7.494-7.493Z"/></svg></button>';
				send_msg += "</div>";
				send_msg += "</div>";
				send_msg += "</div>";
				
				// 메세지 입력, 전송 칸
				$('.send_message').html(send_msg);
				
				// 메세지 전송 버튼 눌렀을 떄
				$('.msg_send_btn').on('click', function(){
					
					// 메세지 전송 함수 호출
					SendMessage(room, other_nick);
				});
				
				// 메세지 내용 불러오기
				MessageContentList(room);
			});
		}
	})
};

var MessageList = function(){
	$.ajax({
		url:"message_ajax_list.do",
		method:"get",
		success:function(data){
			$('.inbox_chat').html(data);
			
			// 메세지 리스트 중 하나를 클릭
			$('.chat_list').on('click', function(){
				var room = $(this).attr('room');
				var other_nick = $(this).attr('other-nick');
				
				// 선택 외 active 해제
				$('.chat_list_box').not('.chat_list_box.chat_list_box'+room).removeClass('active_chat');
				// 선택 메세지 active 효과
				$('.chat_list_box'+room).addClass('active_chat');
				
				var send_msg = "";
				send_msg += "<div class='type_msg'>";
				send_msg += "<div class='input_msg_write row'>";
				send_msg += "<div class='col-11'>";
				send_msg += "<input type='text' class='write_msg form-control' placeholder='메세지 입력'/>";
				send_msg += "</div>";
				send_msg += "<div class='col-1'>";
				send_msg += '<button class="msg_send_btn" type="button"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-send" viewBox="0 0 16 16"><path d="M15.854.146a.5.5 0 0 1 .11.54l-5.819 14.547a.75.75 0 0 1-1.329.124l-3.178-4.995L.643 7.184a.75.75 0 0 1 .124-1.33L15.314.037a.5.5 0 0 1 .54.11ZM6.636 10.07l2.761 4.338L14.13 2.576 6.636 10.07Zm6.787-8.201L1.591 6.602l4.339 2.76 7.494-7.493Z"/></svg></button>';
				send_msg += "</div>";
				send_msg += "</div>";
				send_msg += "</div>";
				
				// 메세지 입력, 전송 칸
				$('.send_message').html(send_msg);
				
				// 메세지 전송 버튼 눌렀을 떄
				$('.msg_send_btn').on('click', function(){
					
					// 메세지 전송 함수 호출
					SendMessage(room, other_nick);
				});
				
				// 메세지 내용 불러오기
				MessageContentList(room);
			});
			$('.chat_list_box:first').addClass('active_chat');
		}
	})
};

var MessageContentList = function(room){
	$.ajax({
		url:"message_content_list.do",
		method:"GET",
		data:{
			room:room,
		},
		success:function(data){
			$('.msg_history').html(data);
			$('.msg_history').scrollTop($(".msg_history")[0].scrollHeight);
			
		},
		error : function(){
			alert('서버 에러');
		}
	})
	
	$('.unread'+room).empty();
	
};


var SendMessage = function(room, other_nick){
	var content = $('.write_msg').val();
	content = content.trim();
	if(content == ""){
		return;
	}else{
		$.ajax({
			url:"message_send_inlist.do",
			method:"GET",
			data:{
				room:room,
				other_nick:other_nick,
				content:content
			},
			success:function(data){
				$('.write_msg').val("");
				MessageContentList(room);
				MessageList();
			},
			error:function(){
				alert('서버에러');
			}
		});
	}
};

$(document).ready(function(){
	FirstMessageList();
});



</script>




<%@include file="../include/footer.jsp" %>