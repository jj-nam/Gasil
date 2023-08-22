<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="my_info_form.jsp" %>
<style type="text/css">
	.w_reply{
		background-color: yellow;
	}
</style>

<div class="listContainer" style="padding: 10px;">
	<c:forEach var="reply" items="${list}">
		<div class="wroteBoard" style="border: 1px solid black;">
			<div style="padding: 10px">
				<table style="width: 100%">
					<tr>
						<td rowspan="3" style="width: 25px; text-align: center"><input
							type="checkbox" name="checkbox${reply.rno }"></td>
						<td onclick="location.href='/board/get?bno=${reply.bno}'"><b>&nbsp;${reply.content }</b></td>
					</tr>
					<tr onclick="location.href='/board/get?bno=${reply.bno}'">
						<td style="color: grey; font-size: small">&nbsp;<fmt:formatDate
								value="${reply.reply_date}" pattern="yyyy-MM-dd" /></td>
					</tr>
					<tr onclick="location.href='/board/get?bno=${reply.bno}'">
						<td style="font-size: small">&nbsp;${reply.title } <span
							style="color: red">[${reply.r_cnt }]</span></td>
					</tr>
				</table>
			</div>
		</div>
		<!-- /wroteBoard -->
	</c:forEach>
</div>
<!-- /listContainer -->



</div>
		</div>
	</div>
</div>

<script type="text/javascript">
</script>
<%@include file="../include/footer.jsp" %>