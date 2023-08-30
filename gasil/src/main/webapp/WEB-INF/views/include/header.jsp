<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="en">
<head>
<style type="text/css">
@import url('https://fonts.googleapis.com/css2?family=Hi+Melody&family=Noto+Sans+KR&family=Pacifico&display=swap');

	.navbar-brand {
		font-size: 50px;
	}

	.navbar-text {
		position: absolute;
		bottom: 8px;
		right: 16px;
	}
	.container-fluid{
		background-color: #97df93;
		height: 80px;
	}
	.headMenu{
		font-family: 'Noto Sans KR', sans-serif;
		color: #4CA975;
		margin-left: 50px;
		text-decoration-line: none;
		font-size: 30px;
	}
	.headMenu:hover{
		color: #006400;
	}
	#gasilFont{
		font-family: 'Pacifico', cursive;
	}
	#together{
		font-family: 'Noto Sans KR', sans-serif;
	}
	#join, #login, #message{
		float:right;
		margin-left: 20px;
	}
	#join:hover, #login:hover, #message:hover{
		color: grey;
	}
</style>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>동행 함께 가실</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
</head>
<body>
	<div class="container" style="width: 1300px;">
		<!-- header -->
		<nav class="navbar navbar-expand-lg navbar navbar-light" style="padding: 0px">
			<div class="container-fluid">
				<a class="navbar-brand" href="../home"><span id="together">함께</span><span id="gasilFont"> Gasil</span></a>
				<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarText" aria-controls="navbarText" aria-expanded="false" aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbarText">
					<ul class="nav justify-content-center">
						<li class="nav-item"><a class="headMenu" aria-current="page" href="../home">Home</a></li>
						<li class="nav-item"><a class="headMenu" aria-current="page" href="/goWith/list">동행</a></li>
						<li class="nav-item"><a class="headMenu" aria-current="page" href="/board/list">커뮤니티</a></li>
					</ul>
					<span class="navbar-text"> 
						<c:choose>
							<c:when test="${empty user}">
								<a id="login" class="nav-link active" aria-current="page" href="/user/loginPage">로그인</a>
								<a id="join" class="nav-link active" aria-current="page" href="/user/joinPage">회원가입</a>
							</c:when>
							<c:otherwise>
								<a id="login" class="nav-link active" aria-current="page" href="/logoutPage">로그아웃</a>
								<a id="join" class="nav-link active" aria-current="page" href="/myInfo/personal_info">마이페이지</a>
								<a id="message" class="nav-link active" aria-current="page" href="/message_list.do"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-chat-dots" viewBox="0 0 16 16">
								  <path d="M5 8a1 1 0 1 1-2 0 1 1 0 0 1 2 0zm4 0a1 1 0 1 1-2 0 1 1 0 0 1 2 0zm3 1a1 1 0 1 0 0-2 1 1 0 0 0 0 2z"/>
								  <path d="m2.165 15.803.02-.004c1.83-.363 2.948-.842 3.468-1.105A9.06 9.06 0 0 0 8 15c4.418 0 8-3.134 8-7s-3.582-7-8-7-8 3.134-8 7c0 1.76.743 3.37 1.97 4.6a10.437 10.437 0 0 1-.524 2.318l-.003.011a10.722 10.722 0 0 1-.244.637c-.079.186.074.394.273.362a21.673 21.673 0 0 0 .693-.125zm.8-3.108a1 1 0 0 0-.287-.801C1.618 10.83 1 9.468 1 8c0-3.192 3.004-6 7-6s7 2.808 7 6c0 3.193-3.004 6-7 6a8.06 8.06 0 0 1-2.088-.272 1 1 0 0 0-.711.074c-.387.196-1.24.57-2.634.893a10.97 10.97 0 0 0 .398-2z"/>
								</svg></a>
							</c:otherwise>
						</c:choose>
					</span>
				</div>
			</div>
		</nav>