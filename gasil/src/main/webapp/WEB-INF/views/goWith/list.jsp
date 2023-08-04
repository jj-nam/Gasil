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
</style>
<div class="row">
	<div class="col-lg-12">
		<div style="float:left; width:140px; text-align: center;">
		<span style="font-size: large; font-weight: bold; margin: auto;"><a href="/list">동행게시판</a></span>
		</div>
		<div class="row">
			<div class="col-lg-12" style="margin:0px; padding:0px">
				<div class="panel panel-default">
					<!-- /.panel-heading -->
					<div class="panel-body">
					<c:if test="${not empty user}">
						<button id="regBtn" style="text-align: left" class="btn btn-xs pull-right btn-primary">새 게시글 등록</button>
					</c:if>
						<c:forEach var="with" items="${list}">
							<div class="card" style="width: 18rem;">
							  <div class="card-body">
							    <h5 class="card-title">${with.wtitle }</h5>
							    <h6 class="card-subtitle mb-2 text-muted">${with.user_id}</h6>
							    <p class="card-text">${with.content }, ${with.country }, ${with.flag}</p>
							    <a href="#" class="card-link">Card link</a>
							    <a href="#" class="card-link">Another link</a>
							  </div>
							</div>
						</c:forEach>
						<!-- 페이징 -->
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
						<form action="/board/list" method="get" id="actionForm">
							<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
							<input type="hidden" name="amount" value="${pageMaker.cri.amount }">
						</form>
					</div>
					<!-- /.panel-body -->
				</div>
				<!-- /.panel -->
			</div>
			<!-- /.col-lg-12 -->
		</div>
		<!-- /.row -->
	</div>
		<!-- /.col-lg-12 -->
</div>
<!-- /.row -->
<script type="text/javascript">
	history.replaceState({}, null, location.pathname);
	// 게시글 등록 버튼
	$(function(){
		$('#regBtn').click(function(){
			actionForm.attr('action', '/board/register');
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
	
	
	var actionForm = $("#actionForm");
	//-------------- 조회 화면 이동 이벤트 처리 ---------------
	$(".move").on('click',function(e){
		// <a> 클릭 시 페이지 이동이 이루어지지 않게 하기 위해
		e.preventDefault();
	
		// $(this)의 요소 중 href의 속성 값(value)
	
		actionForm.attr('action', '/board/get'); // 경로 변경
		var aa = '<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">';
		aa += '<input type="hidden" name="amount" value="${pageMaker.cri.amount }">';
		aa += "<input type='hidden' name='bno' value='"+ $(this).attr('href') + "'/>";
		actionForm.html(aa);
		actionForm.submit();
	});

	//-------------- 페이징 버튼 이벤트 처리 ---------------
	$(".paginate_button a").on('click', function(e) {
		e.preventDefault();
		
		actionForm.attr('action', '/board/list');
		actionForm.find("input[name='bno']").remove();
		actionForm.find("input[name='amount']").remove();
		actionForm.find("input[name='pageNum']").val($(this).attr("href"));
		actionForm.submit();
	});
</script>
<%@ include file="../include/footer.jsp" %>