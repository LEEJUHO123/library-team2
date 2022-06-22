<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이 페이지</title>
<style>
.my_list {
	text-align: center;
}

.my_list ul {
	margin: 0 auto;
	width: 500px;
}

.my_list ul li {
	font-size: 25px;
	margin: 10px;
	display: inline-block;
	font-color: #58ACFA;
}

.my_list li a {
	color: black;
}

.my_list li a:hover {
	color: #6E4632;
}

.my_list li img {
	background-size: contain;
	width: 20%;
	margin-right: 40px;
}
</style>
</head>
<body>
	<section class="breadcrumb-section set-bg" data-setbg="img/banner6.jpg">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
					<div class="breadcrumb__text">
						<h2>마이페이지</h2>
						<div class="breadcrumb__option">
							<a href="home.do">Home</a><span>my page</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<section class="from-blog spad">
		<div class="container">
			<div class="my_list">
				<ul>
					<li><a href="myInfo.do"><img src="img/mypage/myinfo.png"
							alt="">회원정보 확인</a></li>
					<br>
					<li><a href="nowRentalList.do"><img
							src="img/mypage/book-1.png" alt="">현재 대출목록</a></li>
					<br>
					<li><a href="myRentalList.do"><img
							src="img/mypage/book-2.png" " alt="">나의 대출목록</a></li>
					<br>
				</ul>
			</div>
		</div>
	</section>
</body>
</html>