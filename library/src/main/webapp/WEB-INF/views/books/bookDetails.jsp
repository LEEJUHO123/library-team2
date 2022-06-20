<%@page import="co.team.library.book.vo.BookVO"%>
<%@page import="co.team.library.book.serviceImpl.BookServiceImpl"%>
<%@page import="co.team.library.book.service.BookService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="js/jquery-3.3.1.min.js"></script>

</head>
<body>

	<!-- Breadcrumb Section Begin -->
	<section class="breadcrumb-section set-bg" data-setbg="img/banner3.jpg">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
					<div class="breadcrumb__text">
						<h2>상세보기</h2>
						<div class="breadcrumb__option">
							<a href="home.do">Home</a> <a href="home.do">상세보기</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Breadcrumb Section End -->

	<!-- Product Details Section Begin -->
	<section class="product-details spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-6 col-md-6">
					<div class="product__details__pic">
						<div class="product__details__pic__item">
							<img class="product__details__pic__item--large"
								src="${book.image }" alt="">
						</div>
					</div>
				</div>
				<div class="col-lg-6 col-md-6">
					<div class="product__details__text">
						<h4>${book.bookTitle }</h4><br>
						<h5>${book.writer }</h5><br>						
						<h5 id="bookCode" name="bookCode">${book.bookCode }</h5><br>
		
						<div class="product__details__quantity"></div>
						<a href="#" class="primary-btn" onclick="rentalBook();">대여하기</a>						
						
					</div>
				</div>
				<div class="col-lg-12">
					<div class="product__details__tab">
						<ul class="nav nav-tabs" role="tablist">
							<li class="nav-item"><a class="nav-link active"
								data-toggle="tab" href="#tabs-1" role="tab" aria-selected="true">책소개</a>
							</li>
						</ul>
						<div class="tab-content">
							<div class="tab-pane active" id="tabs-1" role="tabpanel">
								<div class="product__details__tab__desc">									
									<p>${book.story }</p>									
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<script>
		function rentalBook() {
			let bookCode = document.getElementById("bookCode").innerText;
			console.log(bookCode);

			$.ajax({
				url : "rentalBook.do",
				method : "POST",
				dataType : "json",
				data : {
					"bookCode" : bookCode
				},
				success : function(data) {
					console.log(data);
					if (data == 1) {
						alert("대여성공")
						console.log("1")
					} else {
						console.log("2")
						alert("대여실패")
					}
				}

			});

		}
	</script>

</body>
</html>