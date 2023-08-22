<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="my_info_form.jsp" %>
<style type="text/css">
	.proposal{
		background-color: yellow;
	}
</style>
<div class="listContainer" style="padding:10px;">
		<form action="/myInfo/proposal" method="get" id="actionForm"></form>
		<c:forEach var="prop" items="${list}">
			<div class="wroteBoard" style="border: 1px solid black;">
				<div style="padding:10px">
				<table style="width:100%">
					<tbody>
						<tr>
							<td rowspan="3" style="width:25px; text-align: center">
								<input type="checkbox" name="checkbox${prop.wno }">
							</td>
							<td>
								&nbsp;
								<span>${prop.flag }</span>
								<span>${prop.city }</span>
								<span>${prop.gender }&nbsp;${prop.age }</span>
								<span>[${prop.departure } ~ ${prop.arrive }]</span>
							</td>
						</tr>
						<tr>
							<td><c:out value="${prop.wtitle}"></c:out></td>
						</tr>
						<tr>
							<td style="color:grey; font-size: small">
								<span>&nbsp;${prop.user_nick }&nbsp;</span>
								<fmt:formatDate value="${prop.reg_date}" pattern="yyyy-MM-dd"/>
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