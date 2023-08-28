<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../include/header.jsp" %>

<div class="msg-container">
	<div class="messaging">
		<div class="inbox_msg">
		<!-- 메세지 목록 영역 -->
			<div class="inbox_people">
				<div class="recent_heading">
					<h4>Recent</h4>
				</div>
				<!-- 메세지 리스트 -->
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
				send_msg += "<button class='msg_send_btn' type='button'><i class='fa fa-paper-plane-o' aria-hidden='true'></i></button>";
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
				send_msg += "<button class='msg_send_btn' type='button'><i class='fa fa-paper-plane-o' aria-hidden='true'></i></button>";
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