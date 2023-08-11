<%@ include file="../include/header.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style type="text/css">
	a{
		text-decoration-line: none;
		color: inherit;
		display : block; 
		width : 100 %; 
		height : 100 %;
	}
	.pagination{
		display:block;
		text-align: center;
	}
	li{
		display: inline-block;
	}
	#regBtn{
		float:right;
	}
	td{
		font-size: x-small;
	}
</style>
<div class="row">
	<div class="col-lg-12">
	<div class="top-part">
	<br>
	<br>
	<h3>동행</h3>
	<input type="text" name="search" placeholder="검색어를 입력하세요">
		<button id="country_filter" style="text-align: left" class="btn btn-xs pull-right btn-primary">모든 국가(필터 예정)</button>
		<button id="date_fileter" style="text-align: left" class="btn btn-xs pull-right btn-primary">조회 기간(필터 예정)</button>
	<c:if test="${not empty user}">
		<button id="regBtn" style="text-align: left" class="btn btn-xs pull-right btn-primary">새 게시글 등록</button>
	</c:if>
		<div class="content-area" style="margin-top: 10px;">
		
			<div class="row">
				<div class="col-lg-12">
					<div class="panel panel-default">
						<!-- /.panel-heading -->
						<div class="panel-body">
								<c:forEach var="with" items="${list}">
							<div class="col" style="display:inline-block; width:24%; margin:10px 0px;">
								<div class="card" style="width: 17rem;">
								  <div class="card-body">
								  	<div>
										<table>
											<tr>
												<td rowspan="2">이미지</td>
												<td>${with.user_id}</td>
												<td>여행기간</td>
											</tr>
											<tr>
												<td>나이</td>
												<td>${with.period}일 ${with.departure} ~ ${with.arrive}</td>
											</tr>
										</table>		  	
								  	</div>
								  	<hr>
								  	
								  	<div>
									  	<div>
										  	<p> ${with.flag}   ${with.city }</p>
									  	</div>
									  	<div>
										    <h5 class="card-title">${with.wtitle }</h5>
									  	</div>
									  	<div>
										    <p class="card-text">${with.style }</p>
									  	</div>
									  	<div>
									  		<button>${with.people } / ${with.p_cnt }</button>
									  	</div>
								  	</div>
								  	
								  </div>
								</div>
								</div>
							</c:forEach>
							<%-- <!-- 페이징 -->
				            <div class="pull-right">
				               <ul class="pagination">
				               	<c:choose>
				               		<c:when test="${pageMaker.prev }">
					                     <li class="paginate_button previous"><a href="${pageMaker.startPage-1 }">&lt;</a></li>
				               		</c:when>
									<c:otherwise>
					                     <li class="paginate_button previous">&lt;</li>
									</c:otherwise>			                  
				               	</c:choose>
				                  <c:forEach var="num" begin="${pageMaker.startPage }" end="${pageMaker.endPage }" step="1">
				                     <li class="paginate_button ${pageMaker.cri.pageNum == num ? 'active' : '' }"><a href="${num }">${num }</a></li>
				                  </c:forEach>
				                  <c:choose>
				               		<c:when test="${pageMaker.next }">
					                     <li class="paginate_button previous"><a href="${pageMaker.endPage+1 }">&gt;</a></li>
				               		</c:when>
									<c:otherwise>
					                     <li class="paginate_button previous">&gt;</li>
									</c:otherwise>			                  
				               	</c:choose>
				               </ul>
				            </div>
							<!-- 페이징 끝 -->
 							<form action="/goWith/list" method="get" id="actionForm">
								<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
								<input type="hidden" name="amount" value="${pageMaker.cri.amount }">
							</form> --%>
						</div>
						<!-- /.panel-body -->
					</div>
					<!-- /.panel -->
				</div>
				<!-- /.col-lg-12 -->
			</div>
			<!-- /.row -->
		</div>
		<!-- /.content area -->
		</div>
		<!-- /.top-part -->
	</div>
		<!-- /.col-lg-12 -->
</div>
<!-- /.row -->
<script type="text/javascript">
	history.replaceState({}, null, location.pathname);
	// 게시글 등록 버튼
	$(function(){
		$('#regBtn').click(function(){
			actionForm.attr('action', '/goWith/insert');
			actionForm.submit();
		});
	});
	
	var result = '<c:out value="${result}"/>';
	
	if(result != ''){
		checkResult(result);
	}
	
	function checkResult(result){
		if(result ==='' || history.state){ // 뒤로가기 방지
			return;
		}
		if(result === 'ok'){	// 삽입
			alert("게시글이 등록 되었습니다.")
			return;
		}
		if(result === 'success'){	// 수정 or 삭제
			alert("수정 / 삭제 되었습니다.")
			return;
		}
	}
	
</script>
<%@ include file="../include/footer.jsp" %>