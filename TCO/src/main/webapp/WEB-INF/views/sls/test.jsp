<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<script type="text/javascript">

	
	$(function(){
		$.ajax({
			url:"/sttst/BrnChart",
			async:true,
			type: "POST",
			dataType:"json",
			contentType: "application/json; charset=utf-8",
			success:function(data){
				var salelist=[];
				var datelist=[];
				
				$.each(data,function(){
					salelist.push(this["sale"])
					datelist.push(this["date"])
				})
				
				console.log(salelist);
				console.log(datelist);
				const ctx = document.getElementById('myChart').getContext('2d');
				// 그래픽 엔진으로 유명한 것 (DirectX, OpenGL)
				const myChart = new Chart(ctx, {
				    type: 'bar', //bar,line,pie,doughnut,radar
				    //labels : x축의 값
				    //datasets : y축의 값 data의 값, 속성들 지정
				    data: {
				        labels: datelist,
				        datasets: [{
				            label: '년간 매출 현황',
				            data: salelist,
				            backgroundColor: [
				                'lightgreen'
				            ],
				            borderColor: [
				            	'lightgreen'
				            ],
				            borderWidth: 3
				        }]
				    },
				    options: {
				        scales: {
				            y: {
				                beginAtZero: true
				            }
				        }
				    }
				});
			}
		});			
	})
</script>

<body>
	<div class="row">
		<div class="card" style="height:800px; width: 1600px;">
			<div class="card-body">
				<div class="linechart" style="height:100%; width: 100%;">
					<canvas id="myChart" width="1500px;" height="700px;"></canvas>
				</div>
			</div>
		</div>
	</div>
</body>
</html>