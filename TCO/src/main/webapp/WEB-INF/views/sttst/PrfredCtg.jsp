<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="row">
	<div class="col-12">
		<div
			class="page-title-box d-sm-flex align-items-center justify-content-between">
			<h4 class="mb-sm-0 font-size-18">연령대,성별 별 선호 카테고리 그래프</h4>

			<div class="page-title-right">
				<ol class="breadcrumb m-0">
					<li class="breadcrumb-item"><a href="javascript: void(0);">Statics</a></li>
					<li class="breadcrumb-item active">연령대,성별 별 선호 카테고리 그래프</li>
				</ol>
			</div>

		</div>
	</div>
</div>
<!-- 	<button class="btn btn-success" id='btg_line' type="button"><i class="bx bx-line-chart"></i>Line 출력</button> -->
<!-- 	<button class="btn btn-warning" id='btg_bar' type="button"><i class="bx bx-bar-chart-alt-2"></i>Bar 출력</button> -->

<div class="card" style="height: 800px; width: 1600px;">
	<div class="card-body">
		<div class="linechart" style="height: 100%; width: 100%;">
			<canvas id="myChart" width="1500px;" height="700px;"></canvas>
		</div>
	</div>
</div>
</body>


<script type="text/javascript">
	//chart.js
	//data:는 컨트롤러로 보내는값
	//success: function(data)에서 data는 컨트롤러에서 받아오는 값이다.
	//즉 컨트롤러Post에서 반환되는 String json이 들어간다.

	$(function() {
		$.ajax({
				url : "/sttst/PrfredCtg",
				async : true,
				//data: JSON.stringify(data),
				type : "POST",
				dataType : "json",
				contentType : "application/json; charset=utf-8",
				success : function(data) {
					console.log(data);
					var ageGroup = [];
					var TotalSoldQty = [];
					var TotalSlsAmt = [];
					var Slscount = [];
					var AvgPrsAmt = [];

					$.each(data, function() {
						ageGroup.push(this["ageGroup"])
						TotalSoldQty.push(this["TotalSoldQty"])
						TotalSlsAmt.push(this["TotalSlsAmt"])
						Slscount.push(this["Slscount"])
						AvgPrsAmt.push(this["AvgPrsAmt"])
					})

					const ctx = document.getElementById('myChart').getContext('2d');
					const myChart = new Chart(ctx, {
						type:'bar',
						 //bar,line,pie,doughnut,radar
						data : {
							labels : ageGroup,
							datasets : [ 
							{
								label : '총 방문횟수',
								type : 'bar',
								data : Slscount,
								backgroundColor : [ 'pink' ],
								borderColor : [ 'pink' ],
								borderWidth : 3
							},
							{
								label : '평균 구매 금액',
								type : 'bar',
								data : AvgPrsAmt,
								backgroundColor : [ 'orange' ],
								borderColor : [ 'orange' ],
								borderWidth : 3
							},
							{
								label : '총 판매수량',
								type : 'bar',
								data : TotalSoldQty,
								backgroundColor : [ 'yellow' ],
								borderColor : [ 'yellow' ],
								borderWidth : 3
							},
							{
								label : '총 판매금액',
								type : 'bar',
								data : TotalSlsAmt,
								backgroundColor : [ 'lightgreen' ],
								borderColor : [ 'lightgreen' ],
								borderWidth : 3
							}
							]
						},
						options : {
							scales : {
								y:{
									beginAtZero : true
								}
							}
						}
						//option끝
					});
				}
				//success:function(data)끝
			});
		});
</script>


</html>