<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>입출현황통계</title>
</head>
<body>

	<div class="card" style="height:800px; width: 1600px;">
		<div class="card-body">
			<h5 class="card-title mb-4">입출 현황 통계</h5>
				<div class="linechart" style="height:100%; width: 100%;">
					<canvas id="myChart" width="1500px;" height="700px;"></canvas>
			</div>
		</div>
	</div>

<script type="text/javascript">
//chart.js
//data:는 컨트롤러로 보내는값
//success: function(data)에서 data는 컨트롤러에서 받아오는 값이다.
//즉 컨트롤러Post에서 반환되는 String json이 들어간다.
const ctx = document.getElementById('myChart').getContext('2d');
// 그래픽 엔진으로 유명한 것 (DirectX, OpenGL)
const myChart = new Chart(ctx, {
    type: 'bar', //bar,line,pie,doughnut,radar
    //labels : x축의 값
    //datasets : data의 값, 속성들 지정
    data: {
        labels: ['2022-01-11', '2022-01-12', '2022-01-13', '2022-01-15', '2022-01-17', '2022-01-19'],
        datasets: [{
            label: '입고수량',
            data: [12, 19, 3, 5, 2, 3],
            backgroundColor: [
                'rgba(255, 99, 132, 0.2)'
            ],
            borderColor: [
            	'rgba(255, 99, 132, 0.2)'
            ],
            borderWidth: 1
        },{
            label: '출고수량',
            data: [8, 15, 7, 5, 20, 10],
            backgroundColor: [
            	'rgba(54, 162, 235, 0.2)'
            ],
            borderColor: [
            	'rgba(54, 162, 235, 0.2)'
            ],
            borderWidth: 1
        },
        
        ]
    },
    options: {
        scales: {
            y: {
                beginAtZero: true
            }
        }
    }
});
</script>
</body>
</html>