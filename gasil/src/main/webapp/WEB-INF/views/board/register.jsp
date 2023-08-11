<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../include/header.jsp" %>

<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">게시글 작성</h1>
		<hr>
	</div>
	<!-- /.col-lg-12 -->
</div>
<!-- /.row -->

<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading"></div>
			<!-- /.panel-heading -->
			<div class="panel-body">
				<form action="/board/register" method="post" role="form">
					<div class="form-group" style="margin-bottom: 10px">
						<select name="cate_id">
							<option value="0">게시판을 선택해주세요</option>
							<option value="자유게시판">자유게시판</option>
							<option value="QnA">QnA</option>
						</select>
	 					<button style="float:right; margin-bottom: 5px; margin-left:5px;" type="reset" data-oper="list" class="btn btn-warning">취소</button>
						<button style="float:right; margin-bottom: 5px;" type="submit" data-oper="register" class="btn btn-primary">등록</button>
	 					<input type="hidden" name="pageNum" value="${cri.pageNum }">
						<input type="hidden" name="amount" value="${cri.amount }">
					</div>
					<div class="form-group" style="margin-bottom: 10px">
						<input class="form-control" name="title" placeholder="제목을 입력하세요">
					</div>
					<div class="form-group" style="margin-bottom: 10px">
						<textarea class="form-control" id="ckeditor" rows="20" name="bcontent"></textarea>
					</div>
					<div class="form-group">
						<input type="hidden" class="form-control" name="writer" value="${user.user_id }">
						<input type="hidden" class="form-control" name="user_nick" value="${user.user_nick }">
					</div>
				</form>
			</div>
			<!-- /.panel-body -->
		</div>
		<!-- /.panel -->
	</div>
	<!-- /.col-lg-12 -->
</div>
<!-- /.row -->
<script type="text/javascript" src="../resources/ckeditor/ckeditor.js"></script>
<script type="text/javascript">
$(function(){
	
	CKEDITOR.replace('ckeditor',{
		width:'100%',
        height:'400px',
        filebrowserUploadUrl: "fileupload.do"
	});
	
	var formObj = $("form");
	
	$("button").on('click', function(e){
		e.preventDefault();
		
		var operation = $(this).data("oper");
		
		if(operation === 'register'){
			formObj.attr('action','/board/register');
			
		}else if(operation === 'list'){
			formObj.attr('action','/board/list');
			formObj.attr('method','get');
			
			// hidden 처리한 pageNum과 amount를 따로 저장해둔다
			var pageNumTag = $("input[name='pageNum']").clone();
			var amountTag = $("input[name='amount']").clone();
			
			formObj.empty();		// 해당 요소 내부 초기화
			
			formObj.append(pageNumTag);
			formObj.append(amountTag);
		}
		
		formObj.submit();
	});
	
})
	
	
</script>

<%@include file="../include/footer.jsp" %>