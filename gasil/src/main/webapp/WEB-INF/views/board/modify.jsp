<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../include/header.jsp" %>

<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">게시글 수정</h1>
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
				<form action="/board/modify" method="post" role="form">
					<div class="form-group" style="margin-bottom: 10px">
						<select name="cate_id">
							<option value="${vo.cate_id }">${vo.cate_id }</option>
							<option value="자유게시판">자유게시판</option>
							<option value="QnA">QnA</option>
						</select>
						<button style="float:right; margin-bottom: 5px; margin-left:5px;" type="submit" data-oper="list" class="btn btn-info">목록</button>
						<button type="submit" style="float:right; margin-bottom: 5px; margin-left:5px;" data-oper="modify" class="btn btn-primary">수정</button>
	 					<input type="hidden" name="pageNum" value="${cri.pageNum }">
						<input type="hidden" name="amount" value="${cri.amount }">
						<input type="hidden" name="bno" value="${vo.bno }">
					</div>
					<div class="form-group" style="margin-bottom: 10px">
						<input class="form-control" name="title" value="${vo.title }" placeholder="제목을 입력하세요">
					</div>
					<div class="form-group" style="margin-bottom: 10px">
						<textarea class="form-control" id="ckeditor" rows="20" name="bcontent" style="resize:none" placeholder="내용을 입력하세요" >${vo.bcontent }</textarea>
					</div>
					<div class="form-group">
						<input type="hidden" class="form-control" name="writer" value="user">
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
			
			if(operation === 'list'){
				formObj.attr('action','/board/list');
				formObj.attr('method','get');
				
				var pageNumTag = $("input[name='pageNum']").clone();
				var amountTag = $("input[name='amount']").clone();
				
				formObj.empty();		
				
				formObj.append(pageNumTag);
				formObj.append(amountTag);
			}else if(operation === 'modify'){
				
				console.log("submit clicked");
				var str = "";
				
				$(".uploadResult ul li").each(function(i, obj){
					var jobj = $(obj);
					
					console.dir(jobj);
					
					str += "<input type='hidden' name='attachList[" + i + "].fileName' value='" + jobj.data("filename") + "'>";
					str += "<input type='hidden' name='attachList[" + i + "].uuid' value='" + jobj.data("uuid") + "'>";
					str += "<input type='hidden' name='attachList[" + i + "].uploadPath' value='" + jobj.data("uploadPath") + "'>";
				});
				formObj.append(str).submit();
			}
			formObj.submit();
		});
		
	})
</script>
<%@include file="../include/footer.jsp" %>