<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="my_info_form.jsp" %>
<style type="text/css">
	.w_board{
		background-color: yellow;
	}
</style>
	<div class="listContainer" style="padding:10px;">
		<c:forEach var="board" items="${list}">
			<div class="wroteBoard" style="border: 1px solid black;">
				<div style="padding:10px">
				<table style="width:100%">
					<tbody>
						<tr>
							<td rowspan="2" style="width:25px; text-align: center">
								<input type="checkbox" name="checkbox${board.bno }">
							</td>
							<td onclick="location.href='/board/get?bno=${board.bno}'">
								&nbsp;<c:out value="${board.title}"></c:out>
							</td>
							<td rowspan="2" style="border: 1px solid black; width:50px;">
								<div style="font-weight:bold; text-align:center; margin:0px;">${board.r_cnt }</div>
								<div style="font-weight:bold; text-align:center; margin:0px;">댓글</div>
							</td>
						</tr>
						<tr>
							<td style="color:grey; font-size: small" onclick="location.href='/board/get?bno=${board.bno}'">
								<span>&nbsp;${board.user_nick }&nbsp;</span>
								<fmt:formatDate value="${board.reg_date}" pattern="yyyy-MM-dd"/>
								<span>&nbsp;조회 ${board.bview }</span>
							</td>
						</tr>
					</tbody>
				</table>
				</div>
			</div>	<!-- /wroteBoard -->
		</c:forEach>
	</div>	<!-- /listContainer -->
	
	
	
	
			</div>
		</div>
	</div>
</div>


<%@include file="../include/footer.jsp" %>