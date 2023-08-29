<%@ include file="../include/header.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="//code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" />
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<style type="text/css">
	button[type="reset"]{
		float:right; 
		margin-bottom: 0 5px 5px 0; 
		background-color: #FFB400;
	}
	button[type="reset"]:hover{
		color: grey;
		background-color: #FFC81E;
	}
	button[type="submit"]{
		float:right; 
		color : black;
		margin: 0 5px;
		background-color: #73E1E1;
		border: none;
	}
	button[type="submit"]:hover{
		color : grey;
		background-color: #3CFBFF;
		
	}
	input[type="button"]{
		background: none;
		border:none;
	}
	.calendar{
		width:100px;
	}
	.content{
		border:1px solid lightgrey;
		padding: 30px;
		border-radius: 10px;
	}
	.cccSel{
		border:1px solid lightgrey;
		border-radius:10px;
	}
	.continentSel{
		float:left;
		width: 100%;
		padding:10px;
	}
	.continentMenu{
		border-right: 1px solid lightgrey;
		text-align: center;
		float: left;
		width: 150px;
	}
	input[type="button"]{
		font-weight: bold;
	}
	input[type="button"]:hover{
		background-color: #96FFFF;
		font-weight: bold;
	}
	.countries{
		float: left;
		width:82%;
	}
	.country, .select{
		float: left;
	}
	.country{
		margin-left: 20px;
		width:90px;
	}
	.peopleCnt{
		font-weight: bold;
		float: left;
		margin: 0 50px 0 35px;
		
	}
	input[type="radio"]{
		display:none;
	}
	
	input[type="radio"]+label{
		text-align: center;
		width:100px;		
	}
	input[type=radio]:checked+label{
	    color: #13C7A3;
	    font-weight: bold;
	    text-shadow: 0px 0px 4px #73E1E1;
	    blur-radius: 
	}
	input[type="checkbox"]{
		position: relative;
		left:30px;
	}
	#checkName{
		text-align: center;
		position: relative;
		bottom: 24px;
		background-color: lightgrey;
		opacity: 0.8;
		font-weight: bold;
	}
	#value{
		margin-left: 10px;
	}
	#myRange{
		width:70%;
	}
	#calendardate{
		font-weight: bold;
		margin: 0 57px 0 35px;
	}
	.styleTitle{
		font-weight: bold;
		margin: 0 35px;
	}
	.styleSpace{
		margin-left: 150px;
	}
	img:hover {
		transform: scale(1.2);
	}
</style>

<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">동행 구하기</h1>
	</div>
</div>
<div class="row">	<!-- 전체 -->
	<div class="content">	<!-- 테두리 -->
	<form action="/goWith/insert" id="goWithForm" method="post">

		<div class="cccSel">	<!-- 대륙 국가 도시 -->
			<div class="continentSel">	<!-- 대륙 -->
				<div class="continentMenu">
					<input type="button" id="eAsia" value="아시아">	
					<br>		
					<input type="button" id="esAsia" value="동남아시아">	
					<br>		
					<input type="button" id="wsAsia" value="중동아시아">	
					<br>		
					<input type="button" id="europe" value="유럽">	
					<br>		
					<input type="button" id="america" value="아메리카">	
					<br>		
					<input type="button" id="oceania" value="오세아니아">	
					<br>		
					<input type="button" id="africa" value="아프리카">	
				</div>
				<div class="countries">	<!-- 국가 도시 -->
					
					
					
			</div>
		</div>	<!-- /cccSel -->
		<div>	<!-- 모집인원 -->
			<div class="peopleCnt">모집인원 <span id="value"></span>명</div>
			<span><input type="range" name="p_cnt" class="form-range" value="1" min="1" max="10" step="1" id="myRange"></span>
		</div>	<!-- /모집인원 -->
		<div>	<!-- 날짜 선택 -->
			<span id="calendardate">날짜 선택</span>
			<input class="calendar" name="departure" autocomplete="off" placeholder="날짜 선택" readonly="readonly">
			<input class="calendar" name="arrive" autocomplete="off" placeholder="날짜 선택" readonly="readonly">
		</div>	<!-- /날짜 선택 -->
		<div>	<!-- 스타일 -->
			<div class="styleTitle">여행 스타일</div>
			
			
			<div class="styleSpace">
			
			
					<div class="form-check form-check-inline">
					  <input class="form-check-input" type="checkbox" name="style" id="inlineCheckbox1" value="activity">
					  <div>
						  <label class="form-check-label" for="inlineCheckbox1"><img alt="activity" src="../resources/images/activity.png"></label>
					  </div>
					  <div id="checkName">액티비티</div>
					</div>
					<div class="form-check form-check-inline">
					  <input class="form-check-input" type="checkbox" name="style" id="inlineCheckbox2" value="food">
					  <div>
						  <label class="form-check-label" for="inlineCheckbox2"><img alt="food" src="../resources/images/food.jpg"></label>
					  </div>
					  <div id="checkName">맛집</div>
					</div>
					
					<div class="form-check form-check-inline">
					  <input class="form-check-input" type="checkbox"  name="style" id="inlineCheckbox3" value="museum">
					  <div>
						  <label class="form-check-label" for="inlineCheckbox3"><img alt="museum" src="../resources/images/museum.jpg"></label>
					  </div>
					  <div id="checkName">문화</div>
					</div>
					
					<div class="form-check form-check-inline">
					  <input class="form-check-input" type="checkbox" name="style" id="inlineCheckbox4" value="nation">
					  <div>
						  <label class="form-check-label" for="inlineCheckbox4"><img alt="nation" src="../resources/images/nation.jpg"></label>
					  </div>
					  <div id="checkName">자연</div>
					</div>
					
					<div class="form-check form-check-inline">
					  <input class="form-check-input" type="checkbox"  name="style" id="inlineCheckbox5" value="shopping">
					  <div>
						  <label class="form-check-label" for="inlineCheckbox5"><img alt="shopping" src="../resources/images/shopping.jpg"></label>
					  </div>
					  <div id="checkName">쇼핑</div>
					</div>
					
					<div class="form-check form-check-inline">
					  <input class="form-check-input" type="checkbox"  name="style" id="inlineCheckbox6" value="photo">
					  <div>
						  <label class="form-check-label" for="inlineCheckbox6"><img alt="photo" src="../resources/images/photo.jpg"></label>
					  </div>
					  <div id="checkName">사진</div>
					</div>
					
				</div>
					
			</div>
		</div>	<!-- /스타일 -->
		<div class="form-group" style="margin-bottom: 10px">
			<input class="form-control" id="wtitle" name="wtitle" placeholder="제목을 입력하세요">
		</div>
		<div class="form-group" style="margin-bottom: 10px">
			<textarea class="form-control" id="ckeditor" rows="20" name="content"></textarea>
		</div>
		<div class="form-group">
			<input type="hidden" class="form-control" name="user_id" value="${user.user_id }">
			<button type="reset" data-oper="list" class="btn btn-warning">취소</button>
			<button type="submit" data-oper="register" class="btn btn-primary">등록</button>
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
	$("input[name='departure']").datepicker(config);
	$("input[name='arrive']").datepicker(config);
	
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
		var chk = false;
		var title = $("#wtitle");
		var checkbox1 = document.getElementById('inlineCheckbox1');
		var checkbox2 = document.getElementById('inlineCheckbox2');
		var checkbox3 = document.getElementById('inlineCheckbox3');
		var checkbox4 = document.getElementById('inlineCheckbox4');
		var checkbox5 = document.getElementById('inlineCheckbox5');
		var checkbox6 = document.getElementById('inlineCheckbox6');
		var editor = CKEDITOR.replace('content');
			
		if(operation === 'register'){
			// 도시 선택 유효성
			if($("input[name=city]:radio:checked").length < 1){
				alert("도시를 선택해주세요.");
				return;
			}
			if($("input[name='departure']").val() == '' || $("input[name='arrive']").val() == ''){
				alert("날짜를 선택해주세요");
				return;
			}
			if(checkbox1.checked == false && checkbox2.checked == false && checkbox3.checked == false && checkbox4.checked == false && checkbox5.checked == false && checkbox6.checked == false){
				alert("여행 스타일을 선택해주세요")
				return;
			}
			if(title.val() == ''){
				alert("제목을 입력해주세요.");
				title.focus();
				return;
			}
			if(CKEDITOR.instances.ckeditor.getData() == '' || CKEDITOR.instances.ckeditor.getData().length ==0){
				alert("내용을 입력해주세요.");
				$("#ckeditor").focus();
				return;
			}
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
	
	var countries = $(".countries");
	var continent = eAsia.val();
	$.ajax({
		type : 'GET',
		url : '/goWith/getCountry/' + continent,
		dataType: 'json',
		success : function(result){
			var str ='';
			for(var i = 0; i<result.length; i++){
				str += '<div>';
				str += '<div class="country">' + result[i].country + '</div>';
				str += '<div class="select" id="country' + result[i].country + '">' + getCity(result[i].country) + '</div>';
				str += '<br>';
				str += '</div>';
			}
			countries.html(str);
		},
	});
	
	function getCity(country){
		$.ajax({
			type : 'GET',
			url : '/goWith/getCity/' + country,
			dataType: 'json',
			success : function(result){
				str = '';
				for(var i= 0; i<result.length; i++ ){
					str += '<input type="radio" name="city" id="city' + result[i].city + '" value="'+result[i].city+'"><label for="city' + result[i].city + '">' + result[i].city + '</label>';
				}
				$('#country'+country).html(str);
				
			}
		})
	}
	
	
	
	
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
	
	// 아시아
	eAsia.on("click", function(){
		var continent = eAsia.val();
		$.ajax({
			type : 'GET',
			url : '/goWith/getCountry/' + continent,
			dataType: 'json',
			success : function(result){
				var str ='';
				for(var i = 0; i<result.length; i++){
					str += '<div>';
					str += '<div class="country">' + result[i].country + '</div>';
					str += '<div class="select" id="country' + result[i].country + '">' + getCity(result[i].country) + '</div>';
					str += '<br>';
					str += '</div>';
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
					str += '<div>';
					str += '<div class="country">' + result[i].country + '</div>';
					str += '<div class="select" id="country' + result[i].country + '">' + getCity(result[i].country) + '</div>';
					str += '<br>';
					str += '</div>';
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
					str += '<input type="radio" name="city" id="city' + result[i].city + '" value="'+result[i].city+'"><label for="city' + result[i].city + '">' + result[i].city + '</label>';
				}
				$('#country'+country).html(str);
				
			}
		})
	}
	
	
	
</script>
<%@ include file="../include/footer.jsp" %>