<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../include/header.jsp" %>
<style type="text/css">
	a{
		text-decoration-line: none;
		color: inherit;
		display : block; 
		width : 100 %; 
		height : 100 %;
	}
	hr{
		margin:0;
	}
	.my-container{
		width:100%;
		margin: auto;
		height: 900px;
	}
	.top-menu{
		width: 100%;
		height: 10%;
		font-weight: bold;
		font-size: xx-large;
		vertical-align: middle;
		padding: 20px;
	}
	.body-menu{
		/* background-color: gray; */
		width: 100%;
		height: 100%;
	}
	.left-menu{
		height: 100%;
		width: 20%;
		float:left;
		text-align: center;
		font-size: large;
	}
	.right-menu{
		height:100%;
		width:80%;
		float:left;
	}
	.right-top-menu{
		height:100%;
		width: 100%;
	}
</style>
<div class="my-container">
	<div class ="top-menu">마이페이지</div>
	<hr>
	<div class ="body-menu">
		<div class="left-menu">
			<div class="personal_info"><a href="personal_info">개인 정보</a></div>
			<div class="w_board"><a href="/myInfo/list">작성 글</a></div>
			<div class="w_reply"><a href="/myInfo/replyList">작성 댓글</a></div>
			<div class="likes"><a href="/myInfo/likes">좋아요한 글</a></div>
			<div class="proposal"><a href="/myInfo/proposal">신청한 동행</a></div>
		</div>
		<div class="right-menu">
			<div class="right-top-menu">