<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script src="js/jquery-3.6.0.min.js"></script>
</head>
<body>
	<section class="breadcrumb-section set-bg" data-setbg="img/banner1.png">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
					<div class="breadcrumb__text">
						<h2>문의 목록</h2>
						<div class="breadcrumb__option">
							<a href="home.do">Home</a> <span>QnA</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<div class="container">
	<br>
		<table id="ta" class="table table-striped">
			<thead>
				<tr>
					<th>게시글 번호</th>
					<th>작성자</th>
					<th>문의 제목</th>
					<th>문의 날짜</th>
				</tr>
			</thead>
			<tbody id="tb">
				<c:forEach items="${list}" var="qna">
					<tr onclick="qnaDetail('${qna.boardNumber}')">
						<td>${qna.boardNumber }</td>
						<td>${qna.id }</td>
						<td>${qna.title }</td>
						<td>${qna.wdate }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<div>
			<button type="button" id="bn1" class="btn btn-dark" onclick="location.href = 'home.do'">
				<i class="fa-solid fa-house"></i> 메인화면으로
			</button>
		</div>
		<br />
	</div>
	<div style="display: block; text-align: center;">
		<c:if test="${paging.startPage != 1 }">
			<a
				href="qnaList.do?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">&lt;</a>
		</c:if>
		<c:forEach begin="${paging.startPage }" end="${paging.endPage }"
			var="p">
			<c:choose>
				<c:when test="${p == paging.nowPage }">
					<b>${p }</b>
				</c:when>
				<c:when test="${p != paging.nowPage }">
					<a href="qnaList.do?nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a>
				</c:when>
			</c:choose>
		</c:forEach>
		<c:if test="${paging.endPage != paging.lastPage}">
			<a
				href="qnaList.do?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">&gt;</a>
		</c:if>
	</div>

	<br>
	<div>
		<form id="frm" action="qnaDetail.do" method="post">
			<input type="hidden" id="id" name="boardNumber">
		</form>
	</div>



	<script type="text/javascript">
		function search2() {
			$.ajax({
				url : "ajaxSearchList.do",
				type : "POST",
				data : {
					"key" : $("#key").val(),
					"val" : $("#val").val()
				},
				dataType : "json",
				success : function(data) {
					htmlConvert(data);
				},
				error : function() {
					//실패시 구현
				}
			});
		}

		function htmlConvert(data) {
			$("tbody").remove();
			let tb = $("<tbody />");
			$.each(data, function(index, item) {
				let tr = $("<tr />").append($("<td />").text(item.boardNumber),
						$("<td />").text(item.reply.content),
						$("<td />").text(item.title),
						$("<td />").text(item.wdate));
				tb.append(tr);
			});
			$("#ta").append(tb);
		}
	</script>
	<script type="text/javascript">
		function qnaDetail(boardNumber) {
			frm.id.value = boardNumber;
			frm.submit();
		}
	</script>
</body>
</html>