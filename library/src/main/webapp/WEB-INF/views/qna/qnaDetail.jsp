<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.banner_section {
	align-items: center;
	padding: 45px 0 40px;
}

.banner_section h2 {
	font-size: 46px;
	color: #ffffff;
	font-weight: 700;
}
#ta {
	font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif;
	width: 1000px;
	line-height: 1;
	color: #585858;
	padding: 22px 10px;
	padding-bottom: 55px;
	border : 1px solid black;
}
#ta thead tr th {
	font-weight: bold;
	padding: 12px 30px;
	padding-left: 42px;
	text-align : center;
	border : 1px solid black;
}

#ta thead tr th span {
	padding-right: 20px;
	background-repeat: no-repeat;
	background-position: 100% 100%;
}
#ta tbody tr td {
	text-align: center;
	padding: 15px 10px;
	border : 1px solid black;
}


#reply_table {
	font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif;
	width: 1000px;
	line-height: 1;
	color: #585858;
	padding: 22px 10px;
	padding-bottom: 55px;
	border : 1px solid black;
}
#reply_table thead tr th {
	font-weight: bold;
	padding: 5px;
	text-align : center;
	border : 1px solid black;
	
}

#reply_table thead tr th span {
	padding-right: 5px;
	background-repeat: no-repeat;
	background-position: 100% 100%;
	text-align: center;
}
#reply_table tbody tr td {
	text-align: center;
	padding: 5px;
	border : 1px solid black;
}
</style>
</head>
<body>
<section class="banner_section set-bg" data-setbg="img/banner1.png">
		<div class="qna_detail">
			<div class="row">
				<div class="col-lg-12 text-center">
					<div class="breadcrumb__text">
						<h2>문의 상세보기</h2>
						<div class="breadcrumb__option">
							<a href="home.do">Home</a> <span>QnA</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<div class="qna__detail" align="center">
	<br>
	<br>
		<table id="ta">
			<thead>
				<tr>
					<th>작성자</th>
					<td>${qna.id }</th>
					<th>문의 날짜</th>
					<td>${qna.wdate }</th>
				</tr>
			</thead>
			<tbody id="tb">
				<tr>
					<td align="center">문의 제목</td>
					<td align="center" colspan='3'>${qna.title }</td>
				</tr>
					<td align="center" height="200px">문의 내용</td>
					<td align="center" colspan='3' height="200px">${qna.content }</td>
				</tr>
					<c:if test="${id eq qna.id}">
					<td align="center" colspan='4'>
							<button type="button" class="btn btn-dark"
								onclick="location.href = 'qnaUpdateForm.do?boardNumber=${qna.boardNumber}'">수정</button>
							<button type="button" class="btn btn-dark"
								onclick="location.href = 'qnaDelete.do?boardNumber=${qna.boardNumber}'">삭제</button>
					</td>
					</c:if>
					
				</tr>
			</tbody>
		</table>
		<br />
		<div>
			<h4 align="center">답변</h4>
		</div>
		<br>
		<div class="reply">
			<table id="reply_table">
					<c:forEach items="${reply}" var="data">
				<thead>
					<tr>
						<th width="150px">게시글 번호</th>
						<td align="center">${data.boardNumber}</td>
						<th>답변 번호</th>
						<td align="center">${data.replyNumber }</td>
						<th>답변 날짜</th>
						<td align="center">${data.rdate }</td>
					</tr>
				</thead>
				<tbody>
						<tr>
							<th align="center">답변 내용</th>
							<td colspan='5' height="200px">${data.replyContent }</td>
						</tr>
				</tbody>
					</c:forEach>
			</table>
		</div>

		<c:if test="${id eq 'abc@abc.com' }">
			<div align="center">
				<div>
					<h4>답변 등록</h4>
				</div>
				<br>
				<div>
					<form id="frm" action="replyInput.do" method="POST">
						<div>
							<table border="1">
								<tr>
									<th>게시글 번호</th>
									<td><input type="hidden" id="boardNumber"
										name="boardNumber" value="${qna.boardNumber}">${qna.boardNumber}</td>
									<th>작성 일자</th>
									<td><input type="date" id="rdate" name="rdate"
										required="required"></td>
								</tr>

								<tr>
									<th>답변 내용</th>
									<td colspan="3"><textarea rows="6" cols="66"
											id="replyContent" name="replyContent"></textarea></td>
								</tr>
							</table>
						</div>
						<br />
						<div>
							<input type="reset" class="btn btn-dark" value="글 지우기">&nbsp;&nbsp; <input
								type="submit" class="btn btn-dark" value="답변 저장">&nbsp;&nbsp; <input
								type="button" class="btn btn-dark" value="목록으로 돌아가기"
								onclick="location.href='qnaList.do'">
						</div>
						<br />
					</form>
				</div>
			</div>

		</c:if>
		<button type="button" id="bn1" onclick="location.href = 'qnaList.do'"
			class="btn btn-default btn-xs pull-right">목록가기</button>
	</div>

</body>
</html>