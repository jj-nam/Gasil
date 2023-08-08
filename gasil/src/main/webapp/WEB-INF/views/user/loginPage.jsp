<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Page</title>

<style type="text/css">
	.wrap-div{
	   width: 500px;
	   margin: auto;
	   text-align: center;
	   margin-top: 50px;
	}
	a{
	text-decoration-line: none;
	color: inherit;
	width : 100 %; 
	height : 100 %;
	font-size: small;
	color: grey;
}
</style>
</head>
<body>
	<div class="wrap-div">
        <form role="form" method="post" action="/login">
             <fieldset style="border:none">
                 <div class="form-group">
                     <input class="form-control" style="width: 170px; padding:0px" placeholder="아이디" name="user_id" type="text" autofocus>
                 </div>
                 <div class="form-group">
                     <input class="form-control" style="width: 170px; padding:0px" placeholder="비밀번호" name="user_pw" type="password">
                 </div>
                 <!-- <div class="checkbox">
                     <label>
                         <input name="remember-me" type="checkbox">자동 로그인
                     </label>
                 </div> -->
                 <!-- Change this to a button or input when using this as a form -->
		         <div>
			         <button type="submit" style="width: 170px; padding:0px" class="btn btn-lg btn-success btn-block">로그인</button>
		         </div>
		         <div>
		         	<span><a href="">아이디 찾기</a></span><span style="color:grey">&nbsp;|&nbsp;</span> 
		         	<span><a href="">비밀번호 찾기</a></span><span style="color:grey">&nbsp;|&nbsp;</span> 
		         	<span><a href="/user/joinPage">회원가입</a></span>
		         </div>
		         
		         <!-- <button onclick="goToHome();" class="btn btn-lg btn-success btn-block">Home</button> -->
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
   
</body>
</html>