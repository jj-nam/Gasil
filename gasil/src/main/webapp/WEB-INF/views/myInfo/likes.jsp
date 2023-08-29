<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="my_info_form.jsp" %>
<style type="text/css">
	.likes{
		background-color: #97df93;
	}
</style>
	<div class="listContainer" style="padding:10px;">
		<c:forEach var="likes" items="${list}">
			<div class="wroteBoard" style="border: 1px solid black;">
				<div style="padding:10px">
				<table style="width:100%">
					<tbody>
						<tr>
							<td rowspan="2" style="width:25px; text-align: center">
								<input type="checkbox" name="checkbox${likes.hno }">
							</td>
							<td onclick="location.href='/board/get?bno=${likes.bno}'">
								&nbsp;<c:out value="${likes.title}"></c:out>
							</td>
							<td rowspan="2" style="border: 1px solid black; width:50px;">
								<div style="font-weight:bold; text-align:center; margin:0px;">${likes.r_cnt }</div>
								<div style="font-weight:bold; text-align:center; margin:0px;">댓글</div>
							</td>
						</tr>
						<tr>
							<td style="color:grey; font-size: small" onclick="location.href='/board/get?bno=${likes.bno}'">
								<span>&nbsp;${likes.user_nick }&nbsp;</span>
								<fmt:formatDate value="${likes.reg_date}" pattern="yyyy-MM-dd"/>
								<span>&nbsp;조회 ${likes.bview }</span>
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