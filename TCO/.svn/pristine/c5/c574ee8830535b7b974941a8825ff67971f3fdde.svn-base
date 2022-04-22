<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript" src="/resources/js/jsQR.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/js-cookie@3.0.0/dist/js.cookie.min.js"></script>
<html>
<style>
body {
	/* border : 1px solid black; */
	width: 100%;
	height: auto;
}

main {
	text-align: center;

	/*  border : 2px solid red; */
}

main>div {
	float: left;
	width: 1%;
	height: 98%;
}

main>div:first-child {
	width: 49%;
}

main>div:last-child {
	background-color: #D3D3D3;
	width: 49%;
}

div#output {
	background-color: #BDBEBD;
	padding-left: 10px;
	padding-right: 10px;
	padding-top: 10px;
	padding-bottom: 10px;
}

div#frame {
	width: 90%;
	border: 2px solid #005666;
	background-color: #FFFFFF;
	margin-left: 10px;
	margin-right: 10px;
	padding-left: 8px;
	padding-right: 8px;
	padding-top: 8px;
	padding-bottom: 8px;
}

div#outputLayer {
	text-align: left;
}

canvas {
	width: 100%;
}

.back {
	background-color: white;
}

input[type=button] {
	padding: 0px;
	border-bottom: 4px solid saddlebrown;
	height: 50px;
	width: 105px;
}

input[type=reset] {
	padding: 0px;
	border-bottom: 4px solid saddlebrown;
	height: 50px;
	width: 80px;
}

input[type=text] {
	text-align: right;
	height: 50px;
	width: 320px;
}

.control {
	margin: 0px auto;
	height: 350px;
	width: 390px;
	background-color: thistle;
	border-radius: 12px;
	border-bottom: 4px solid saddlebrown;
	margin-right: 500px;
}

#xoxo {
	float: left;
	margin-top: 20px;
	margin-left: 20px;
}

table {
	font-size: 20px;
}

#QRscreen {
	width: 600px;
}

.pospannel {
	position: absolute;
	top: 460px;
	left: 1200px;
	width: 300px;
	/*  border: 2px solid blue; */
	background-color: white;
	/*  margin-left: 850px;
    margin-top: 10px; */
	height: 550px;
}

.posform {
	position: absolute;
	top: 0px;
	left: -30px;
	width: 380px;
}

.control {
	position: absolute;
	top: 110px;
	left: 20px;
	width: 500px;
}

.pt {
	margin-left: 50px;
}

#test {
	overflow: scroll;
	border: 2px solid red;
	height: 800px;
	width: 900px;
}
</style>

<head>
<title>Calculater</title>
<script language="javascript">
	function Calc(Val) {
		if (Val != "=")
			document.form.txtVal.value = document.form.txtVal.value + Val;
		else
			document.form.txtVal.value = eval(document.form.txtVal.value);
	}
</script>

</head>
<body class="back">

	<main>

		<div id="test">
			<h1>
				TCO <label class="form-label"> <select class="form-select"
					name="selectBrn" id="selectBrn">
						<option value="BRN00001"><h1>대전점</h1>
						</option>
						<option value="BRN00002"><h1>인천점</h1>
						</option>
						<option value="BRN00003"><h1>부산점</h1>
						</option>

				</select></label> POS 입니다
			</h1>

			<div id="output">

				<div id="outputMessage">QR코드를 카메라에 노출시켜 주세요</div>

				<div id="outputLayer" hidden>

					<span id="outputData"></span>
				</div>
			</div>

			<!-- 여기에 테이블 넣고 싶어요  -->

			<table border="1">
				<colgroup>
					<col style='width: 100px;'>
					<col style='width: 140px;'>
					<col style='width: 140px;'>
					<col style='width: 230px;'>
					<col style='width: 140px;'>
					<col style='width: 140px;'>
					<col style='width: 140px;'>
				</colgroup>
				<thead>
					<tr>
						<th>선택</th>
						<th>품목번호</th>
						<th>상품코드</th>
						<th>상품명</th>
						<th>상품수량</th>
						<th>상품가격</th>
						<th>총액</th>
					</tr>
				</thead>
				<tfoot>
					<tr class="alltotal">
						<td>회원번호<span id="CustId"></span></td>
						<td></td>
						<td>지점명 <span id="spanBrn"></span></td>
						<td></td>
						<td></td>
						<td></td>
						<td>합계 금액 <span id="alltotal"></span></td>
					</tr>
				</tfoot>
				<tbody id="itemListTable">

				</tbody>
			</table>

		</div>
		<div>&nbsp;</div>
		<div id="QRscreen" align="center">
			<h1>QR코드 스캔</h1>
			<div id="frame">
				<div id="loadingMessage">

					🎥 비디오 스트림에 액세스 할 수 없습니다<br />웹캠이 활성화되어 있는지 확인하십시오

				</div>

				<canvas id="canvas"></canvas>
			</div>
		</div>

		<div class="pospannel" style="background: white;">
			<!-- POS 조작버튼 시작 -->
			<form name="form2" style="width: 550px;" class="posform">
				<table class="pt">
					<tr>
						<td><input type="button" value="전체취소" class="btn btn-primary"
							onclick="deltable()"></td>
						<td><input type="button" value="선택취소" class="btn btn-primary"
							onclick="delRow()"></td>
						<td><input type="button" value="수량변경" class="btn btn-primary"
							onclick=></td>
						<td><input type="button" value="현금" class="btn btn-primary"
							onclick=></td>
						<td><input type="button" value="카드" class="btn btn-primary"
							onclick=></td>
					</tr>
					<tr>
						<td><input type="button" value="항목 ↑ " class="btn btn-info"
							onclick=></td>
						<td><input type="button" value="항목 ↓" class="btn btn-info"
							onclick=></td>
						<td><input type="button" value="수량 + " class="btn btn-info"
							onclick="addQty()"></td>
						<td><input type="button" value="수량 - " class="btn btn-info"
							onclick="minusQty()"></td>
						<td><input type="button" value="계산" class="btn btn-info"
							 onclick="PosCalPostBtn()">
						</td>
					</tr>
				</table>
			</form>
			<!-- POS 조작버튼 끝 -->
			<!--  계산기 시작 -->
			<form name="form">
				<div class="control">
					<table border="0" height="300px" width="300px" align="center"
						class="forming" id="xoxo">
						<tr>
							<td><input type="reset" name="button" value="C"
								class="btn btn-danger"></td>
							<td colspan="3"><input type="text" name="txtVal"
								class="form-control" placeholder="0"></td>

						</tr>

						<tr>
							<td><input type="button" value="7" class="btn btn-primary"
								onclick="Calc(7);"></td>
							<td><input type="button" value="8" class="btn btn-primary"
								onclick="Calc(8);"></td>
							<td><input type="button" value="9" class="btn btn-primary"
								onclick="Calc(9);"></td>
							<td><input type="button" value="+" class="btn btn-info"
								onclick="Calc('+');"></td>
						</tr>

						<tr>
							<td><input type="button" value="4" class="btn btn-primary"
								onclick="Calc(4);"></td>
							<td><input type="button" value="5" class="btn btn-primary"
								onclick="Calc(5);"></td>
							<td><input type="button" value="6" class="btn btn-primary"
								onclick="Calc(6);"></td>
							<td><input type="button" value="-" class="btn btn-info"
								onclick="Calc('-');"></td>
						</tr>

						<tr>
							<td><input type="button" value="1" class="btn btn-primary"
								onclick="Calc(1);"></td>
							<td><input type="button" value="2" class="btn btn-primary"
								onclick="Calc(2);"></td>
							<td><input type="button" value="3" class="btn btn-primary"
								onclick="Calc(3);"></td>
							<td><input type="button" value="X" class="btn btn-info"
								onclick="Calc('*');"></td>
						</tr>

						<tr>
							<td><input type="button" value="0" class="btn btn-primary"
								onclick="Calc(0);"></td>
							<td><input type="button" value="." class="btn btn-primary"
								onclick="Calc('.');"></td>
							<td><input type="button" value="=" class="btn btn-warning"
								onclick="Calc('=');"></td>
							<td><input type="button" value="/" class="btn btn-info"
								onclick="Calc('/');"></td>
						</tr>

					</table>
				</div>
			</form>
		</div>
		<!--  계산기 폼 끝. -->

	</main>
</body>
</html>
<script type="text/javascript">
	document
			.addEventListener(
					"DOMContentLoaded",
					function() {

						var video = document.createElement("video");

						var canvasElement = document.getElementById("canvas");

						var canvas = canvasElement.getContext("2d");

						var loadingMessage = document
								.getElementById("loadingMessage");

						var outputContainer = document.getElementById("output");
						var outputMessage = document
								.getElementById("outputMessage");
						var outputData = document.getElementById("outputData");

						function drawLine(begin, end, color) {

							canvas.beginPath();

							canvas.moveTo(begin.x, begin.y);

							canvas.lineTo(end.x, end.y);

							canvas.lineWidth = 4;

							canvas.strokeStyle = color;

							canvas.stroke();

						}

						// 카메라 사용시

						navigator.mediaDevices.getUserMedia({
							video : {
								facingMode : "environment"
							}
						}).then(function(stream) {

							video.srcObject = stream;

							video.setAttribute("playsinline", true); // iOS 사용시 전체 화면을 사용하지 않음을 전달

							video.play();

							requestAnimationFrame(tick);

						});
						function tick() {

							loadingMessage.innerText = "⌛ 스캔 기능을 활성화 중입니다."

							if (video.readyState === video.HAVE_ENOUGH_DATA) {

								loadingMessage.hidden = true;

								canvasElement.hidden = false;

								outputContainer.hidden = false;

								// 읽어들이는 비디오 화면의 크기
								canvasElement.height = video.videoHeight;
								canvasElement.width = video.videoWidth;

								canvas.drawImage(video, 0, 0,
										canvasElement.width,
										canvasElement.height);

								var imageData = canvas.getImageData(0, 0,
										canvasElement.width,
										canvasElement.height);
								var code = jsQR(imageData.data,
										imageData.width, imageData.height, {

											inversionAttempts : "dontInvert",

										});

								// QR코드 인식에 성공한 경우

								if (code) {
									// 인식한 QR코드의 영역을 감싸는 사용자에게 보여지는 테두리 생성

									drawLine(code.location.topLeftCorner,
											code.location.topRightCorner,
											"#FF0000");
									drawLine(code.location.topRightCorner,
											code.location.bottomRightCorner,
											"#FF0000");
									drawLine(code.location.bottomRightCorner,
											code.location.bottomLeftCorner,
											"#FF0000");
									drawLine(code.location.bottomLeftCorner,
											code.location.topLeftCorner,
											"#FF0000");

									outputMessage.hidden = true;

									outputData.parentElement.hidden = false;

									// QR코드 메시지 출력

									outputData.innerHTML = code.data;
									
// 									swal.fire(code.data,"",'success');
									alert(code.data)
									var qrCode = code.data
									var arr = qrCode.split(",");
									str = "";
									custId = "";
									// 									alert("index[0] : " + arr[0] + "  index[1] : "+ arr[1] + "  index[1] : "+ arr[2]  )
									console.log("index[0] : " + arr[0]
											+ "  index[1] : " + arr[1]
											+ "  index[2] : " + arr[2])
									custId = null;
									if (!isNaN(arr[0]) && arr[0] != null
											&& arr[0] != ""
											&& arr[0] != undefined) {
										custId = arr[0];
// 										alert(custId)
										swal.fire(custId,"",'success');
										
											$.ajax({
													type : "POST",
													url : "/calculate/custValChk",
													data : {
														"custId" : custId
													},
													//contentType : "application/json; charset=utf-8",
													dataType : "text",
													success : function(data) {
														console.log("고객 select 잘됨? : "
																		+ data);
														if (data == "success") {
// 															alert("회원인증 성공"+ custId);
															swal.fire("회원인증 성공"+ custId,"",'success');
															
															CustId.innerHTML = custId;
														} else {
															swal.fire("가입된 회원이 아닙니다.","",'success');
															
// 															alert("가입된 회원이 아닙니다. 회원가입하세요");
														}
													}
												});

									} else {//상품번호 체크 
										var selectBrn = $(
												'#selectBrn option:selected')
												.val();

										if (selectBrn == 'BRN00001') {
											BrnName = ' 대전점';
										} else if (selectBrn == 'BRN00002') {
											BrnName = ' 인천점';
										} else if (selectBrn == 'BRN00003') {
											BrnName = ' 부산점';
										} else {
											BrnName = '미지정';
										}
										spanBrn.innerHTML = BrnName;
										prodInfoId = arr[0]; //상품코드
										
										$.ajax({
											type : "POST",
											async : false,
											url : "/calculate/salesSuspensionChk",
											data : {
												"prodInfoId" : prodInfoId,
											},
											dataType : "text",
											success : function(data) {
												console.log("data잘 들어감? : " + data);
												if (data == "success") {
													console.log(data + "판매 가능한 상품입니다.");
												} else {
													console.log(data + "판매중지, 판매 불가능한 상품입니다.");
												}
											}
										});
										
										
										var prodInfoNm = arr[1]; // 상품명
										if (prodInfoNm != undefined) {

											var prodInfoNtslAmt = parseInt(arr[2]); // 상품가격
											Qty = 1;
											var count = 1;
											var total = 0;

											var $tr = $("tr[data=" + prodInfoNm
													+ "]", "#itemListTable");
											if ($tr.length > 0) {
												count = $("td.count", $tr)
														.text();
												Qty = $("td.qty", $tr).text();

												if (!Qty) {
													Qty = 1;
													count = Number(count) + 1;
												} else {
													Qty = Number(Qty) + 1;
												}
												total = Qty * prodInfoNtslAmt;
												$("td:eq(1)", $tr).text(count);
												$("td:eq(4)", $tr).text(Qty);
												$("td:eq(6)", $tr).text(total);

											} else {
												total = Qty * prodInfoNtslAmt;

												str += "<tr data='" + prodInfoNm + "'>"
														+ "<td class='checkbox'>"
														+"<input class='form-check-input item-checkbox' type='checkbox'>"
														+ "</td>"
														+ "<td class='count'>"
														+ count
														+ "</td>"
														+ "<td class='prodInfoId'>"
														+ prodInfoId
														+ "</td>"
														+ "<td class='prodInfoNm'>"
														+ prodInfoNm
														+ "</td>"
														+ "<td class='qty'>"
														+ Qty
														+ "</td>"
														+ "<td class = 'prodInfoNtslAmt'>"
														+ prodInfoNtslAmt
														+ "</td>"
														+ "<td class='total'>"
														+ total
														+ "</td>"
														+ "</tr>";
												$("#itemListTable").append(str)

											}
											var v_total = document.querySelectorAll(".total");
											var v_sum = 0;
											for (var i = 0; i < v_total.length; i++) {
												v_sum += parseInt(v_total[i].innerHTML);
											}

											if (document.querySelector("#alltotal")) {
												
												document.querySelector("#alltotal").innerHTML = v_sum;
											}
// 											swal.fire(code.data,"",'success');
										}

									}

									// return을 써서 함수를 빠져나가면 QR코드 프로그램이 종료된다.

									// return;

								}

								// QR코드 인식에 실패한 경우 

								else {

									outputMessage.hidden = false;

									outputData.parentElement.hidden = true;

								}

							}

							requestAnimationFrame(tick);

						}

					});
</script>

<script>


function deltable() {
	$('#itemListTable tr').remove();
	CustId.innerHTML = "";
	alltotal.innerHTML = "";
}
function delRow() {
	$.each($('.item-checkbox'), function(i, v){
		if($(this).is(':checked')){
			$(this).closest('total');
			alltotal.innerHTML = $('#alltotal').html()*1 - ($(this).closest('tr').find('.total').text())*1 ;
			$(this).closest('tr').remove();
		}
	});
}
function addQty() {
	$.each($('.item-checkbox'), function(i, v){
		if($(this).is(':checked')){
			$(this).closest('tr').find('.qty').text(($(this).closest('tr').find('.qty').text() * 1) + 1);
			$(this).closest('tr').find('.total').text(($(this).closest('tr').find('.total').text() * 1) + ($(this).closest('tr').find('.prodInfoNtslAmt').text() * 1));
			alltotal.innerHTML = $('#alltotal').html()*1 + $(this).closest('tr').find('.prodInfoNtslAmt').text()*1;  // 이부분 안됨
			
		}
	});
}
function minusQty() {
	$.each($('.item-checkbox'), function(i, v){
		if($(this).is(':checked')){
			
			if($(this).closest('tr').find('.qty').text()* 1 != 0){
				$(this).closest('tr').find('.qty').text(($(this).closest('tr').find('.qty').text() * 1) - 1);
				$(this).closest('tr').find('.total').text(($(this).closest('tr').find('.total').text() * 1) - ($(this).closest('tr').find('.prodInfoNtslAmt').text() * 1));
				alltotal.innerHTML = $('#alltotal').html()*1 - $(this).closest('tr').find('.prodInfoNtslAmt').text()*1; 
				if($(this).closest('tr').find('.qty').text()* 1 == 0){
					$(this).closest('tr').remove();
				}
				if($('#alltotal').html()*1==0){
					CustId.innerHTML = "";
					alltotal.innerHTML = "";
				}
				
			}
			 
		}

	});
}

	function PosCalPostBtn() {

		var selectBrn = $('#selectBrn option:selected').val();
		var custId = $("#CustId").html();
		var prodInfoId = $(".prodInfoId").html(); //arr[0]
		var prodInfoNtslAmt = $(".prodInfoNtslAmt").html(); //arr[0]
		var custNtslAmt = $(".total").html(); //arr[0] //소비자 단품 판매 누계액
		var custNtslQty = $(".qty").html(); //arr[0] // 상품수량
		
		
		$("#itemListTable tr").each(function(i, v) {

			var selectBrn = $('#selectBrn option:selected').val();
			var custId = $("#CustId").html();
			var prodInfoId = $(".prodInfoId", $(v)).html(); //arr[0]
			var prodInfoNtslAmt = $(".prodInfoNtslAmt", $(v)).html(); //arr[0]
			var custNtslAmt = $(".total", $(v)).html(); //arr[0] //소비자 단품 판매 누계액
			var custNtslQty = $(".qty", $(v)).html(); //arr[0] // 상품수량
			$.ajax({
				type : "POST",
				async : false,
				url : "/calculate/CustNtsInsert",
				data : {
					"selectBrn" : selectBrn,
					"custId" : custId,
					"prodInfoId" : prodInfoId,
					"custNtslQty" : custNtslQty,
					"custNtslAmt" : custNtslAmt,
					"prodInfoNtslAmt" : prodInfoNtslAmt
				},
				dataType : "text",
				success : function(data) {
					console.log("data잘 들어감? : " + data);
					if (data == "success") {
						swal.fire("pos 계산 성공","",'success');
					} else {
						swal.fire("계산실패","",'error');
					}
				}
			});
		});

		
		$('#itemListTable tr').remove();
		CustId.innerHTML = "";
		alltotal.innerHTML = "";
	}
</script>
