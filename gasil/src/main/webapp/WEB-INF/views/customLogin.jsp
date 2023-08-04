<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
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
</style>
</head>
<body>
	<div class="wrap-div">
        <form role="form" method="post" action="/login">
             <fieldset>
                 <div class="form-group">
                     <input class="form-control" placeholder="아이디" name="username" type="text" autofocus>
                 </div>
                 <div class="form-group">
                     <input class="form-control" placeholder="비밀번호" name="userpassword" type="password">
                 </div>
                 <div class="checkbox">
                     <label>
                         <input name="remember-me" type="checkbox">자동 로그인
                     </label>
                 </div>
                 
		         <button type="submit" class="btn btn-lg btn-success btn-block">로그인</button>
                 <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token }">
		         <button onclick="goToHome();" class="btn btn-lg btn-success btn-block">Home</button>
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
</html> --%>