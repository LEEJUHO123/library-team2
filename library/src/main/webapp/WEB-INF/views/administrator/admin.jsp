<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
</style>
</head>
<body>
	<section class="breadcrumb-section set-bg" data-setbg="img/banner5.jpg">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
					<div class="breadcrumb__text">
						<h2>관리자 페이지</h2>
						<div class="breadcrumb__option">
							<a href="home.do">Home</a><span>Admin</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<div class="admin_list">
		<ul>
			<li><a href="memberList.do"><img src="img/mem.png" alt="">회
					원 리 스 트</a></li>
			<br>
			<li><a href="rentalList.do"><img src="img/ren.png" alt="">대
					여 리 스 트</a></li>
			<br>
			<li><a href="blackList.do"><img src="img/black.png" alt="">블
					랙 리 스 트</a></li>
			<br>
			<li><a href="addBlacklist.do"><img src="img/addblack.png"
					alt="">블랙리스트 추가</a></li>
			<br>
			<li><a href="rentalChart.do"><img src="img/bookchart.png"
					alt="">책 대여별 차트</a></li>
			<br>
			<li><a href="categoryChart.do"><img src="img/cate.png"
					alt="">카테고리별 대여 차트</a></li>
		</ul>
	</div>
</body>
</html>