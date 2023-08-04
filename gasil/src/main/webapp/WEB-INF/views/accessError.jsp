<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>Access Denied Page</h1>
	
	<h2>${SPRING_SECURITY_403_EXCEPTION.getMessage() }</h2>
	<h2>${msg }</h2>
</body>
</html>