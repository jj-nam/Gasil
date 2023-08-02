<%@ include file="include/header.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div id="carouselExampleIndicators" class="carousel slide"
	data-bs-ride="true">
	<div class="carousel-indicators">
		<button type="button" data-bs-target="#carouselExampleIndicators"
			data-bs-slide-to="0" class="active" aria-current="true"
			aria-label="Slide 1"></button>
		<button type="button" data-bs-target="#carouselExampleIndicators"
			data-bs-slide-to="1" aria-label="Slide 2"></button>
		<button type="button" data-bs-target="#carouselExampleIndicators"
			data-bs-slide-to="2" aria-label="Slide 3"></button>
	</div>
	<div class="carousel-inner">
		<div>
			<div class="carousel-item active" data-bs-interval="2000">
				<img style="display: block; margin: auto; width: 1300px; height: 700px;"
					src="https://www.hilokal.com/blog/content/images/2022/10/--------00-2.jpg"
					class="d-block w-70" alt="...">
			</div>
			<div class="carousel-item" data-bs-interval="2000">
				<img style="display: block; margin: auto; width: 1300px; height: 700px;"
					src="https://images.chosun.com/resizer/k6L-J7LOYHpzi7J0o6f-LAfbtVw=/464x0/smart/cloudfront-ap-northeast-1.images.arcpublishing.com/chosun/RWXHN2ZUBBXGLLFHBULDVSWBAA.jpg"
					class="d-block w-70" alt="...">
			</div>
			<div class="carousel-item" data-bs-interval="2000">
				<img style="display: block; margin: auto; width: 1300px; height: 700px;"
					src="https://media.triple.guide/triple-cms/c_limit,f_auto,h_2048,w_2048/bd40e5b8-35f3-453d-abd8-54ecaa87305d.jpeg"
					class="d-block w-70" alt="...">
			</div>
		</div>
	</div>
	<button class="carousel-control-prev" type="button"
		data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
		<span class="carousel-control-prev-icon" aria-hidden="true"></span> <span
			class="visually-hidden">Previous</span>
	</button>
	<button class="carousel-control-next" type="button"
		data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
		<span class="carousel-control-next-icon" aria-hidden="true"></span> <span
			class="visually-hidden">Next</span>
	</button>
</div>
<%@ include file="include/footer.jsp"%>