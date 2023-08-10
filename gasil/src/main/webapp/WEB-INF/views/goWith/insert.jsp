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
</style>

<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">동행 구하기</h1>
	</div>
</div>
<div class="row">	<!-- 전체 -->
	<div class="content">	<!-- 테두리 -->
	<form action="/goWith/insert" method="post">

		<div class="cccSel" style="border:1px solid lightgrey; border-radius:10px;">	<!-- 대륙 국가 도시 -->
			<span class="continentSel">	<!-- 대륙 -->
				<span style="border-right: 1px solid lightgrey; text-align: center; margin: 20px;">
					<input type="button" id="eAsia" value="아시아">	
					<br>		
					<input type="button" id="esAsia" value="동남아시아">	
					<br>		
					<a id="wsAsia">중동</a>				
					<br>		
					<a id="europe">유럽</a>					
					<br>		
					<a id="america">아메리카</a>					
					<br>		
					<a id="oceania">오세아니아</a>					
					<br>		
					<a id="africa">아프리카</a>				
				</span>
				<span>	<!-- 국가 도시 -->
					<span class="countries" style="megint-left: 100px">	<!-- 국가 -->
						
						
						
						
						
						
						
						
						
					</span> 
				</span>
			</span>
		</div>	<!-- /대륙국가도시 -->
		<div>	<!-- 모집인원 -->
			<span>모집인원</span>
			<span><input type="range" name="p_cnt" class="form-range" value="1" min="1" max="10" step="1" id="myRange" style="width:80%"><span id="value"></span>명 </span>
		</div>	<!-- /모집인원 -->
		<div>	<!-- 날짜 선택 -->
			<span>날짜 선택</span>
			<input class="calendar" name="departure" autocomplete="off" placeholder="날짜 선택" readonly="readonly">
			<input class="calendar" name="arrive" autocomplete="off" placeholder="날짜 선택" readonly="readonly">
		</div>	<!-- /날짜 선택 -->
		<div>	<!-- 스타일 -->
			<span>여행 스타일</span>
			<div class="form-check form-check-inline">
			  <input class="form-check-input" type="checkbox" name="style" id="inlineCheckbox1" value="activity">
			  <label class="form-check-label" for="inlineCheckbox1">액티비티매니아</label>
			</div>
			<div class="form-check form-check-inline">
			  <input class="form-check-input" type="checkbox" name="style" id="inlineCheckbox2" value="food">
			  <label class="form-check-label" for="inlineCheckbox2">맛집탐방러</label>
			</div>
			<div class="form-check form-check-inline">
			  <input class="form-check-input" type="checkbox" name="style" id="inlineCheckbox3" value="party">
			  <label class="form-check-label" for="inlineCheckbox3">파티피플</label>
			</div>
			<div class="form-check form-check-inline">
			  <input class="form-check-input" type="checkbox"  name="style" id="inlineCheckbox4" value="nation">
			  <label class="form-check-label" for="inlineCheckbox4">자연인</label>
			</div>
			<div class="form-check form-check-inline">
			  <input class="form-check-input" type="checkbox"  name="style" id="inlineCheckbox5" value="shopping">
			  <label class="form-check-label" for="inlineCheckbox5">쇼퍼홀릭</label>
			</div>
			<div class="form-check form-check-inline">
			  <input class="form-check-input" type="checkbox"  name="style" id="inlineCheckbox6" value="photo">
			  <label class="form-check-label" for="inlineCheckbox6">인스타그래머</label>
			</div>
			<div class="form-check form-check-inline">
			  <input class="form-check-input" type="checkbox"  name="style" id="inlineCheckbox7" value="museum">
			  <label class="form-check-label" for="inlineCheckbox7">뇌섹남녀</label>
			</div>
		</div>	<!-- /스타일 -->
		<div class="form-group" style="margin-bottom: 10px">
			<input class="form-control" name="wtitle" placeholder="제목을 입력하세요">
		</div>
		<div class="form-group" style="margin-bottom: 10px">
			<textarea class="form-control" id="ckeditor" rows="20" name="content"></textarea>
		</div>
		<div class="form-group">
			<input type="hidden" class="form-control" name="user_id" value="${user.user_nick }">
			<button style="float:right; margin-bottom: 5px; margin-left:5px;" type="reset" data-oper="list" class="btn btn-warning">취소</button>
			<button style="float:right; margin-bottom: 5px;" type="submit" data-oper="register" class="btn btn-primary">등록</button>
			<input type="hidden" name="pageNum" value="${cri.pageNum }">
			<input type="hidden" name="amount" value="${cri.amount }">
		</div>
		</form>
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
     var p_cnt_value = 0;
     output.innerHTML = slider.value;
     
     slider.oninput = function() {
         output.innerHTML = this.value;
         p_cnt_value=this.value;
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
	var esAsia = $("#esAsia");
	
	// 동아시아
	eAsia.on("click", function(){
		var continent = eAsia.val();
		$.ajax({
			type : 'GET',
			url : '/goWith/getCountry/' + continent,
			dataType: 'json',
			success : function(result){
				var str ='';
				for(var i = 0; i<result.length; i++){
					str += '<span>' + result[i].country + '</span>&nbsp;&nbsp;&nbsp;';
					str += '<span class="select" id="country' + result[i].country + '">';
					str += getCity(result[i].country);
					str += '</span>';
					str += '<br>';
				}
				country.html(str);
			},
		})
	});
	
	// 동남아시아
	esAsia.on("click", function(){
		var continent = esAsia.val();
		$.ajax({
			type : 'GET',
			url : '/goWith/getCountry/' + continent,
			dataType: 'json',
			success : function(result){
				var str ='';
				for(var i = 0; i<result.length; i++){
					str += '<span>' + result[i].country + '</span>&nbsp;&nbsp;&nbsp;';
					str += '<span id="country' + result[i].country + '">';
					str += getCity(result[i].country);
					str += '</span>';
					str += '<br>';
				}
				country.html(str);
			},
		})
	});
	
	// 국가별 도시
	function getCity(country){
		$.ajax({
			type : 'GET',
			url : '/goWith/getCity/' + country,
			dataType: 'json',
			success : function(result){
				str = '';
				for(var i= 0; i<result.length; i++ ){
					str += '<input type="radio" name="city" id="city' + result[i].city + '" value="'+result[i].city+'">';
					str += result[i].city;
					str += '&nbsp;&nbsp;</label>';
				}
				$('#country'+country).html(str);
				
			}
		})
	}
	
	
	
</script>
<%@ include file="../include/footer.jsp" %>