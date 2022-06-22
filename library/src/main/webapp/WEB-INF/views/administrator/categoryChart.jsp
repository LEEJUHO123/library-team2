<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카테고리 현황</title>

<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">

      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawChart); // drawChart에 매개함수를 넣겠다

      function drawChart() {
            let result = [];
			$.ajax({
            url: "category.do",
            type : "POST",
            dataType: "json",
            success : function(data){
            	result.push(['카테고리', '카테고리별 대여현황']);
            	for(let resultData of data){
            		let resultList = new Array();
            		console.log(resultList);
            		resultList.push(resultData.category);
            		resultList.push(resultData.rentalCount);
            		result.push(resultList);
            	}

            	var options = {
					title: '카테고리별 차트 현황',
					pieHole: 0.4
				};
            	
            	var data1 = google.visualization.arrayToDataTable(result);
            	var chart = new google.visualization.PieChart(document.getElementById('donutchart'));
            	chart.draw(data1, options);

            }, error:function(){
            	alert("에러");
            }
            })
        }
</script>

</head>
<body>
<section class="breadcrumb-section set-bg" data-setbg="img/banner5.jpg">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
					<div class="breadcrumb__text">
						<h2>책 카테고리별 대여 차트</h2>
						<div class="breadcrumb__option">
							<a href="home.do">Home</a> <span>Admin</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<div id="donutchart" style="margin:auto; width: 900px; height: 500px;"></div>
	<div class="container">
	<button type="button" onclick="location.href='admin.do'" class="btn btn-outline-danger" style="margin-left:530px; margin-bottom : 100px" >뒤로가기</button>
	</div>
</body>
</html>