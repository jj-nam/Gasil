<%@ include file="../include/header.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="//code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" />
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<style type="text/css">
	.calendar{
		width:100px;
	}
	.content{
		border:1px solid lightgrey;
		padding: 30px;
		border-radius: 10px;
	}
	.continentSel{
		display: inline-block;
		width: 20%;
	}
</style>

<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">동행 구하기</h1>
	</div>
</div>
<div class="row">	<!-- 전체 -->
	<div class="content">	<!-- 테두리 -->
		<div class="cccSel" style="border:1px solid lightgrey; border-radius:10px;">	<!-- 대륙 국가 도시 -->
			<div class="continentSel">	<!-- 대륙 -->
				<div style="border-right: 1px solid lightgrey; text-align: center; margin: 10px;">
					<p><button id="eAsia" value="eAsia">동아시아</button><p>					
					<p><a id="esAsia">동남아시아</a></p>					
					<p><a id="wsAsia">서남아시아</a><p>					
					<p><a id="europe">유럽</a></p>					
					<p><a id="america">아메리카</a></p>					
					<p><a id="oceania">오세아니아</a></p>					
					<p><a id="africa">아프리카</a></p>					
				</div>
				<div>	<!-- 국가 도시 -->
					<div class="countries">	<!-- 국가 -->
						
						
					</div>
				</div>
			</div>
		</div>	<!-- /대륙국가도시 -->
		<div>	<!-- 모집인원 -->
			<span>모집인원</span>
			<span><span id="value"></span>명 <input type="range" class="form-range" value="1" min="1" max="10" step="1" id="myRange" style="width:80%"></span>
		</div>	<!-- /모집인원 -->
		<div>	<!-- 날짜 선택 -->
			<span>날짜 선택</span>
			<input class="calendar" name="departure" autocomplete="off" placeholder="날짜 선택" readonly="readonly">
			<input class="calendar" name="arrive" autocomplete="off" placeholder="날짜 선택" readonly="readonly">
		</div>	<!-- /날짜 선택 -->
		<div>	<!-- 스타일 -->
			<span>여행 스타일</span>
			<div class="form-check form-check-inline">
			  <input class="form-check-input" type="checkbox" id="inlineCheckbox1" value="option1">
			  <label class="form-check-label" for="inlineCheckbox1">액티비티매니아</label>
			</div>
			<div class="form-check form-check-inline">
			  <input class="form-check-input" type="checkbox" id="inlineCheckbox2" value="option2">
			  <label class="form-check-label" for="inlineCheckbox2">맛집탐방러</label>
			</div>
			<div class="form-check form-check-inline">
			  <input class="form-check-input" type="checkbox" id="inlineCheckbox3" value="option3">
			  <label class="form-check-label" for="inlineCheckbox3">파티피플</label>
			</div>
			<div class="form-check form-check-inline">
			  <input class="form-check-input" type="checkbox" id="inlineCheckbox4" value="option4">
			  <label class="form-check-label" for="inlineCheckbox4">자연인</label>
			</div>
			<div class="form-check form-check-inline">
			  <input class="form-check-input" type="checkbox" id="inlineCheckbox5" value="option5">
			  <label class="form-check-label" for="inlineCheckbox5">쇼퍼홀릭</label>
			</div>
			<div class="form-check form-check-inline">
			  <input class="form-check-input" type="checkbox" id="inlineCheckbox6" value="option6">
			  <label class="form-check-label" for="inlineCheckbox6">인스타그래머</label>
			</div>
			<div class="form-check form-check-inline">
			  <input class="form-check-input" type="checkbox" id="inlineCheckbox7" value="option7">
			  <label class="form-check-label" for="inlineCheckbox7">뇌섹남녀</label>
			</div>
		</div>	<!-- /스타일 -->
		<div class="form-group" style="margin-bottom: 10px">
			<input class="form-control" name="title" placeholder="제목을 입력하세요">
		</div>
		<div class="form-group" style="margin-bottom: 10px">
			<textarea class="form-control" id="ckeditor" rows="20" name="bcontent"></textarea>
		</div>
		<div class="form-group">
			<input type="hidden" class="form-control" name="writer" value="${user.user_nick }">
			<button style="float:right; margin-bottom: 5px; margin-left:5px;" type="reset" data-oper="list" class="btn btn-warning">취소</button>
			<button style="float:right; margin-bottom: 5px;" type="submit" data-oper="register" class="btn btn-primary">등록</button>
			<input type="hidden" name="pageNum" value="${cri.pageNum }">
			<input type="hidden" name="amount" value="${cri.amount }">
		</div>
	</div>	<!-- /content -->
	<br>
</div>	<!--  /row -->
<br>
	
		
					
			
<script type="text/javascript" src="../resources/ckeditor/ckeditor.js"></script>
<script type="text/javascript">
$(function(){
	// range Slider
	 var slider = document.getElementById("myRange");
     var output = document.getElementById("value");
     output.innerHTML = slider.value;
     
     slider.oninput = function() {
         output.innerHTML = this.value;
     }
     
	// 캘린더
	$( "input[name='departure']" ).datepicker(config);
	$( "input[name='arrive']" ).datepicker(config);
	
	// 에디터
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
			formObj.attr('action','/goWith/insert');
			
		}else if(operation === 'list'){
			formObj.attr('action','/goWith/list');
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
// 날짜 포맷
var config = {
	dateFormat: 'yy-mm-dd',
	prevText: '이전 달',
    nextText: '다음 달',
    monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
    monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
    dayNames: ['일','월','화','수','목','금','토'],
    dayNamesShort: ['일','월','화','수','목','금','토'],
    dayNamesMin: ['일','월','화','수','목','금','토'],
    yearSuffix: '년',
    changeMonth: true,
    changeYear: true
}
	
	
	// 대륙 선택
	var str ='';
	var country = $(".countries");
	var eAsia = $("#eAsia");
	eAsia.on("click", function(){
		var continent = eAsia.val();
		alert(continent);
		$.ajax({
			type : 'GET',
			url : '/goWith/getCountry/' + continent,
			dataType: 'json',
			success : function(result){
				var str ='';
				for(var i = 0; i<result.length; i++){
					str += '<p><button>' + result[i].country + '</button></p>';
					str += '<p>' + result[i].city + '</p>';
				}
				country.html(str);
			},
		})
	});
</script>
<%@ include file="../include/footer.jsp" %>