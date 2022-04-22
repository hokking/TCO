<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>업로드 도움말</title>
<link href="/resources/skote/Skote_v3.3.2/HTML/Admin/dist/assets/css/bootstrap.min.css" 
id="bootstrap-style" rel="stylesheet" type="text/css" />
<style type="text/css">
.explain{
	border:solid 1px #CCCCCC;
	width: 573px;
}
.explain table{
	margin-left: 100px;
}
.explain table td{
	font-weight: bold;
}
</style>
<script src="/resources/skote/Skote_v3.3.2/HTML/Admin/dist/assets/libs/bootstrap/js/bootstrap.bundle.min.js"></script>

</head>
<body>
<br>
	<div class="card">
		<div class="card-title text-center">
			<br>
			<img alt="로고" src="/resources/images/TCO로고_가로1.png" style="width: 138px; height: 40px;" >
		</div>
		<div class="card-body">
		
		<div class="explain">
		<br>
			<h4 class="mb-sm-0 font-size-18 text-center">매입 자료 업로드 도움말</h4>
				<br>
					<img alt="매입예시" src="/resources/images/매입예시.png">
				<br><br>
				<table class="text-center">
					<tr>
						<td>매입아이디: </td>
						<td>PRCHS+5자리의 숫자로 이루어져있습니다.</td>
					</tr>
					<tr>
						<td>매입일: </td>
						<td>YYYY-MM-DD 형식으로 입력 (Y=년, M은 월, D는 일)</td>
					</tr>
					<tr>
						<td>매입거래처: </td>
						<td>CNPT+4자리의 숫자로 이루어져있습니다.</td>
					</tr>
					<tr>
						<td>매입구분: </td>
						<td>저장/매입만 입력이 가능합니다.</td>
					</tr>
				</table>
				<br>
		</div>
		<br>
		<hr>
		<br>
		<div class="explain">
		<br>
			<h4 class="mb-sm-0 font-size-18 text-center">매출 자료 업로드 도움말</h4>
				<br>
					<img alt="매출예시" src="/resources/images/매출예시.png">
				<br><br>
					<table class="text-center">
					<tr>
						<td>매출아이디: </td>
						<td>SLS+4자리의 숫자로 이루어져있습니다.</td>
					</tr>
					<tr>
						<td>지점아이디: </td>
						<td>BRN+5자리 숫자로 이루어져있습니다.</td>
					</tr>
					<tr>
						<td>매출일: </td>
						<td>YYYY-MM-DD 형식으로 입력 (Y=년, M은 월, D는 일)</td>
					</tr>
					<tr>
						<td>순이익: </td>
						<td>매출액-입고매입액의 값을 넣으셔야합니다.</td>
					</tr>
				</table>
				<br>
		</div>
		<br><br>
		<div class="text-center">
		<button class="btn btn-primary" type="button" onclick="window.close()">닫기</button>
		</div>
		</div>
	</div>
</body>
</html>