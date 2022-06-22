<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.home-title {
	margin-bottom: 80px;
	margin-top: 30px;
	text-align: center;
}

.home-title h2 {
	color: #1c1c1c;
	font-weight: 700;
	position: relative;
}

.home-title h2:after {
	position: absolute;
	left: 0;
	bottom: -15px;
	right: 0;
	height: 4px;
	width: 80%;
	background: #5A3214;
	content: "";
	margin: 0 auto;
}

ul.tabs {
	margin: 0px;
	padding: 0px;
	list-style: none;
}

ul.tabs li {
	background: none;
	color: #6E6E6E;
	display: inline-block;
	padding: 10px 15px;
	cursor: pointer;
}

ul.tabs li.current {
	background: #ededed;
	border-top-left-radius: 10px;
	border-top-right-radius: 10px;
	color: #222;
	font-weight: 600;
}

.tab-content {
	display: none;
	padding: 15px;
	text-align: center;
	background: #ededed;
	border-radius: 20px;
}

.tab-content.current {
	display: inherit;
}

.item_box {
	display: inline-block;
	text-align: center;
	width: 220px;
	cursor: pointer;
}

.tab__controls {
	text-align: center;
	margin-bottom: 0px;
}

.best__item__text {
	text-align: center;
	text-shadow: 3px white;
	padding-top: 5px;
}

.best__item__text h5 {
	font-weight: 600;
}

.main__item__text {
	text-align: center;
	padding: 15px 10px;
	text-shadow: 10px white;
	background-color: white;
}

.main__item__text h5 {
	text-shadow: 10px white;
	text-shadow: 0 0 px #fff;
	font-weight: 600;
}
</style>
</head>
<body>
	<!-- Categories Section Begin -->
	<section class="categories">
		<div class="container">
			<div class="home-title">
				<h2 align="center">가장 많이 대여된 책</h2>
			</div>
			<div class="row">
				<div class="categories__slider owl-carousel">
					<c:forEach items="${bestseller }" var="best">
						<a href="bookDetails.do?title=${best.bookTitle }">
							<div class="col-lg-3">
								<div class="categories__item set-bg" data-setbg="${best.image }">
								</div>
								<div class="best__item__text">
									<h5>${best.bookTitle }</h5>
								</div>
							</div>
						</a>
					</c:forEach>
				</div>
			</div>
		</div>
	</section>
	<!-- Categories Section End -->

	<!-- Featured Section Begin -->
	<section class="featured spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="section-title">
						<h2>카테고리별 가장 많이 대여된 책</h2>
					</div>
					<div class="tab__controls">
						<div class="tab">
							<ul class="tabs">
								<li class="tab-link current" data-tab="tab-1">일반문학</li>
								<li class="tab-link" data-tab="tab-2">순수문학</li>
								<li class="tab-link" data-tab="tab-3">예술서적</li>
								<li class="tab-link" data-tab="tab-4">언어서적</li>
								<li class="tab-link" data-tab="tab-5">역사서적</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
			<div id="tab-1" class="tab-content current">
				<c:forEach items="${category800 }" var="tab1">
					<a href="bookDetails.do?title=${tab1.bookTitle }">
						<div class="item_box">
							<div class="featured__item__pic set-bg"
								data-setbg="${tab1.image }">
								<div class="main__item__text">
									<h5>${tab1.bookTitle }</h5>
								</div>
							</div>
						</div>
					</a>
				</c:forEach>
			</div>
			<div id="tab-2" class="tab-content">
				<c:forEach items="${category400 }" var="tab2">
					<a href="bookDetails.do?title=${tab2.bookTitle }">
						<div class="item_box">
							<div class="featured__item__pic set-bg"
								data-setbg="${tab2.image }">
								<div class="main__item__text">
									<h5>${tab2.bookTitle }</h5>
								</div>
							</div>
						</div>
					</a>
				</c:forEach>
			</div>
			<div id="tab-3" class="tab-content">
				<c:forEach items="${category600 }" var="tab3">
					<a href="bookDetails.do?title=${tab3.bookTitle }">
						<div class="item_box">
							<div class="featured__item__pic set-bg"
								data-setbg="${tab3.image }">
								<div class="main__item__text">
									<h5>${tab3.bookTitle }</h5>
								</div>
							</div>
						</div>
					</a>
				</c:forEach>
			</div>
			<div id="tab-4" class="tab-content">
				<c:forEach items="${category700 }" var="tab4">
					<a href="bookDetails.do?title=${tab4.bookTitle }">
						<div class="item_box">
							<div class="featured__item__pic set-bg"
								data-setbg="${tab4.image }">
								<div class="main__item__text">
									<h5>${tab4.bookTitle }</h5>
								</div>
							</div>
						</div>
					</a>
				</c:forEach>
			</div>
			<div id="tab-5" class="tab-content">
				<c:forEach items="${category900 }" var="tab5">
					<a href="bookDetails.do?title=${tab5.bookTitle }">
						<div class="item_box">
							<div class="featured__item__pic set-bg"
								data-setbg="${tab5.image }">
								<div class="main__item__text">
									<h5>${tab5.bookTitle }</h5>
								</div>
							</div>
						</div>
					</a>
				</c:forEach>
			</div>
			<div id="tabcontent"></div>
		</div>
	</section>
	<script type="text/javascript">
		
	</script>
</body>
</html>