<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="en">
<head>
<style type="text/css">
.navbar-brand {
	font-size: 50px;
}

.navbar-text {
	position: absolute;
	bottom: 8px;
	right: 16px;
}
</style>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>동행 함께 가실</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
</head>
<body>
	<div class="container" style="width: 1300px;">
		<!-- header -->
		<nav class="navbar navbar-expand-lg navbar navbar-light" style="background-color: #e3f2fd;">
			<div class="container-fluid">
				<a class="navbar-brand" href="../home"><img alt="logo" src="/resources/images/logo.png" style="width: 188px; height: 85px;"></a>
				<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarText" aria-controls="navbarText" aria-expanded="false" aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbarText">
					<ul class="nav justify-content-center">
						<li class="nav-item"><a class="nav-link active"	aria-current="page" href="../home">Home</a></li>
						<li class="nav-item"><a class="nav-link active"	aria-current="page" href="#">동행</a></li>
						<li class="nav-item"><a class="nav-link active"	aria-current="page" href="/board/list">커뮤니티</a></li>
						<li class="nav-item"><a class="nav-link disabled" aria-current="page" href="#">고객센터</a></li>
					</ul>
					<span class="navbar-text"> 
						<c:choose>
							<c:when test="${empty user}">
								<a class="nav-link active" aria-current="page" href="/user/joinPage">회원가입</a>
								<a class="nav-link active" aria-current="page" href="/user/loginPage">로그인</a>
							</c:when>
							<c:otherwise>
								<a class="nav-link active" aria-current="page" href="/user/my_info">개인정보</a>
								<a class="nav-link active" aria-current="page" href="/user/logout">로그아웃</a>
							</c:otherwise>
						</c:choose>
					</span>
				</div>
			</div>
		</nav>