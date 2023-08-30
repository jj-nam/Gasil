<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:forEach var="tmp" items="${list }">
	<div class="chat_list_box${tmp.room } chat_list_box">
		<div type="button" class="chat_list" room="${tmp.room }" other-nick="${tmp.other_nick }">
		<!-- active-chat -->
			<div class="chat_poeple">
				<div class="chat_img">
					<img src="../resources/images/profile/${tmp.profile }" alt="${tmp.profile }">
				</div>
				<div class="chat_ib">
					<!-- 현재 사용자가 안읽은 메세지 갯수가 0보다 클때 badge를 표시 -->
					<h5>${tmp.other_nick }
						<c:if test="${tmp.unread > 0 }">
							<span class="col-2 unread${tmp.room }">
								<span class="badge text-bg-danger" style="font-size:small">${tmp.unread }</span>
							</span>
						</c:if>
					</h5>
					<div class="row">
						<div class="col-10">
							<p>${tmp.content }</p>
						</div>
					</div>
					<div class="chat_data">
						<fmt:formatDate value="${tmp.send_time }" pattern="MM-dd HH:mm"/>
					</div>
				</div>
			</div>
		</div>
	</div>
</c:forEach>
    
    
    
    
    
    
    
