<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Page</title>
<!-- Bootstrap Core CSS -->
<link href="/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<!-- MetisMenu CSS -->
<link href="/resources/vendor/metisMenu/metisMenu.min.css" rel="stylesheet">
<!-- Custom CSS -->
<link href="/resources/dist/css/sb-admin-2.css" rel="stylesheet">
<!-- Custom Fonts -->
<link href="/resources/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<style type="text/css">
	.wrap-div{
	   width: 500px;
	   margin: auto;
	   text-align: center;
	   margin-top: 50px;
	}
</style>
</head>
<body>
	<div class="wrap-div">
        <form role="form" method="post" action="/login">
             <fieldset>
                 <div class="form-group">
                     <input class="form-control" placeholder="아이디" name="user_id" type="text" autofocus>
                 </div>
                 <div class="form-group">
                     <input class="form-control" placeholder="비밀번호" name="user_pw" type="password">
                 </div>
                 <div class="checkbox">
                     <label>
                         <input name="remember-me" type="checkbox">자동 로그인
                     </label>
                 </div>
                 <!-- Change this to a button or input when using this as a form -->
		         <button type="submit" class="btn btn-lg btn-success btn-block">로그인</button>
		         <button onclick="goToHome();" class="btn btn-lg btn-success btn-block">Home</button>
                 <input type="hidden" name="${_csrf.parameterName}" value="${_csfr.token }">
             </fieldset>
         </form>
         <br>
   </div>
   <script type="text/javascript">
	   function goToHome(){
			location.href='/home';
		}
   </script>
   
	<!-- jQuery -->
    <script src="/resources/vendor/jquery/jquery.min.js"></script>
    <!-- Bootstrap Core JavaScript -->
    <script src="/resources/vendor/bootstrap/js/bootstrap.min.js"></script>
    <!-- Metis Menu Plugin JavaScript -->
    <script src="/resources/vendor/metisMenu/metisMenu.min.js"></script>
    <!-- Custom Theme JavaScript -->
    <script src="/resources/dist/js/sb-admin-2.js"></script>
	<script type="text/javascript">
		$(function() {
			$("a").click(function(e) {
				e.preventDefault(); // 이벤트 막아주기
				$("form").submit();
			});
		});
	</script>
</body>
</html>