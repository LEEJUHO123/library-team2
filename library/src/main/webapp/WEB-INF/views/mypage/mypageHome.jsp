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
	font-size : 25px;
	margin: 10px;
	display : inline-block;
	font-color:#58ACFA;
}

.my_list li a {
	color: black;
}

.my_list li a:hover {
	color: #7fad39;			
}


.my_list li img {
	background-size: contain;
	width: 20%;
	margin-right: 40px;
}
</style>
</head>
<body>
	<section class="from-blog spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="section-title from-blog__title">
						<h2>마이 페이지</h2>
						<p>
						<p>회원정보를 수정하고 내 대여기록을 확인할 수 있습니다.</p>
					</div>
				</div>
			</div>
			<div class="my_list">
				<ul>
					<li><a href="myInfo.do"><img src="img/mypage/myinfo.png" alt="">회원정보 확인</a></li>
					<br>
					<li><a href="nowRentalList.do"><img src="img/mypage/book-1.png" alt="">현재 대출목록</a></li>
					<br>
					<li><a href="myRentalList.do"><img src="img/mypage/book-2.png"" alt="">나의 대출목록</a></li>
					<br>
				</ul>
			</div>
		</div>
	</section>
</body>
</html>