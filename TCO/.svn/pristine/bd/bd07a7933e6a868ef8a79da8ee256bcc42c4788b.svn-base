<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<script src="/resources/js/jquery-3.6.0.min.js"></script>
<script src='/resources/js/fullcalendar/main.min.js'></script>
<script src='/resources/js/maincalendar.js'></script>
<script src='/resources/js/commoncalendar.js'></script>
<link href='/resources/js/fullcalendar/main.min.css' rel='stylesheet' />
<script type="text/javascript">
var newArray 	= [];
<c:forEach var="vo" items="${strg}">
	var jsonObj = new Object();
	jsonObj.cmncdNm1 = "${vo.cmncdNm1}";
	jsonObj.cmncdNm2 = "${vo.cmncdNm2}";
	jsonObj.prodInfoNm = "${vo.prodInfoNmDisplay}";
	jsonObj.strgStckOrdrYn = "${vo.strgStckOrdrYn}";
	jsonObj.lackQty = "${vo.strgStckQty - vo.strgStckSftyQty}";
	
	jsonObj = JSON.stringify(jsonObj);
	console.log("JSON jsonObj : " + jsonObj);
	//String 형태로 파싱한 객체를 다시 json으로 변환
	newArray.push(JSON.parse(jsonObj));
</c:forEach>
var jsonArray = newArray;
//테이블에 추가할 내용 만드는 함수
var str = "";
function chgFilter(){
	jsonArray = jsonArray.reduce((pre, cur) => {
		if( cur.strgStckOrdrYn == 'N' ) pre.push(cur);
		return pre;
	}, []);
	str = "";
	console.log("chgFilter 안 jsonArray.length : " + jsonArray.length);
	for(var i=0; i < jsonArray.length; i++){
		if(i < 5){
			str += '<tr class="arryTd"><td data-org-colspan="1" data-priority="1" data-columns="tech-companies-1-col-1">';
			str += jsonArray[i].cmncdNm1 + "/" + jsonArray[i].cmncdNm2 + "</td>";
			str += '<td data-org-colspan="1" data-priority="3" data-columns="tech-companies-1-col-2">';
			str += jsonArray[i].prodInfoNm + "</td>";
			str += '<td data-org-colspan="1" data-priority="1" data-columns="tech-companies-1-col-3" style="text-align:right;">';
			str += jsonArray[i].lackQty + "</td></tr>";
		}
	}
	$("#tbContent").append(str);
}
	$(function(){
		chgFilter();
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
				            label: '매장일일매출',
				            data: salelist,
				            backgroundColor: [
				                '#556EE6'
				            ],
				            borderColor: [
				            	'#556EE6'
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
		$.ajax({
			url: "/sttst/maindaily",
			async: true,
			//data: JSON.stringify(data),
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
				const ctx = document.getElementById('mainChart').getContext('2d');
				// 그래픽 엔진으로 유명한 것 (DirectX, OpenGL)
				const myChart = new Chart(ctx, {
				    type: 'bar', //bar,line,pie,doughnut,radar
				    //labels : x축의 값
				    //datasets : y축의 값 data의 값, 속성들 지정
				    data: {
				        labels: datelist,
				        datasets: [{
				            label: '통합 일일 매출 현황',
				            data: salelist,
				            backgroundColor: [
				            	'#556EE6'
				            ],
				            borderColor: [
				            	'#556EE6'
				            ],
				            borderWidth: 3
				        }]
				    },
				    options: {
				        scales: {
				            y: {
				                beginAtZero: true
				            },
				            yAxes: [{
				            	display:true,
				            	labelString: '통화단위(원)'
				            }]
				        }
				    }
				});
			}
			//success:function(data)끝
		});
		
		
		  // 출근 버튼 클릭시 
		$("#in").on("click", function(){
			
			    
			//수정 전송
			$.ajax({
			    type: "POST",
			    url : "/att/attin",
			    contentType : "application/x-www-form-urlencoded; charset=utf-8",
			    dataType : "json",
			    success : function(data){
			    	console.log("data뭐노?" + data);
			    	// 성공시 return값 String으로 받아오기 때문에 int로 바꿔주세요옹
			    	var res = parseInt(data);
			    	
			        if(res > 0){
			        // Sweet Alert
			          Swal.fire({
				          icon:'success',
				          title:'출근완료',
			       		}).then(function(){
			       			window.location.reload();
			       			$('#wcheck').val('wing').prop("selected",true);
			       		})
			        }else{
			        	// Sweet Alert
				          Swal.fire({
					          icon:'warning',
					          title:'이미 처리됨',
				       		}).then(function(){
				       			window.location.reload();
				       		})
			        }
					
			        
			    },
			    error : function(){
			        //Ajax 실패시
			    	Swal.fire({
				          icon:'error',
				          title:'주말미처리',
			       		}, function(){
			       			//새로고침
			       			window.location.reload();
			       			});
			    }
			});
		
			
		});
	  
		 // 퇴근 버튼 클릭시 
		$("#out").on("click", function(){
			
			//수정 전송
			$.ajax({
			    type: "POST",
			    url : "/att/attout",
			    contentType : "application/x-www-form-urlencoded; charset=utf-8",
			    dataType : "json",
			    success : function(data){
			    	console.log("data뭐노?" + data);
			    	// 성공시 return값 String으로 받아오기 때문에 int로 바꿔주세요옹
			    	var res = parseInt(data);
			    	
			        if(res == 1){
			        // Sweet Alert
			          Swal.fire({
				          icon:'success',
				          title:'퇴근완료',
			       		}).then(function(){
			       			window.location.reload();
			       			$('#wcheck').val('wend').prop("selected",true);
			       		})
			        }else if(res == 3){
			        	// Sweet Alert
				          Swal.fire({
					          icon:'warning',
					          title:'이미 처리됨',
				       		}).then(function(){
				       			window.location.reload();
				       		})
			        }else if(res == 2){
			        	// Sweet Alert
				          Swal.fire({
					          icon:'error',
					          title:'출근 미처리됨',
				       		}).then(function(){
				       			window.location.reload();
				       		})
			        }else{
			        	"에러";
			        }
					
			        
			    },
			    error : function(){
			        //Ajax 실패시
			    	Swal.fire({
				          icon:'error',
				          title:'주말미처리됨',
			       		}, function(){
			       			//새로고침
			       			window.location.reload();
			       			});
			    }
			});
		
			
		});
	})
	
	function times() {
	var onul = new Date();     /* 로컬컴퓨터에 설정된 표준시간대를 기준으로 한 현재 시간을 추출 */

    var dd=["Sun","Mon","Tues","Wednes","Thurs","Fri","Satur"];

    var y = onul.getFullYear(); //년
    
    var m2 = onul.getMonth() +1 ; //월
    
    var d2 = onul.getDate();  //일
    
    var d=onul.getDay();     /*현재 '요일'을 숫자로 추출 */

    var week = new Array('(일) ', '(월) ', '(화) ', '(수) ', '(목) ', '(금) ', '(토) ');
 
    var d3 = week[d];
    
    var h=onul.getHours();  /*현재 '시'를 숫자로 추출 */

    var m=onul.getMinutes();   /*현재 '분'을 숫자로 추출 */

    var s=onul.getSeconds();     /*현재 '초'를 숫자로 추출 */

    m = dasi(m);

    s = dasi(s);

    document.getElementById('times').innerHTML = y+"년 " + m2 +"월 "+ d2+"일 "+ d3 +h+":"+m+":"+s;
   
    var t = setTimeout(function(){times()},1000);    /* 1초마다 갱신(refresh)  */
	}
	
	
	function dasi(i) {
	    if (i<10) {i = "0" + i};
	    return i;
	}
</script>
<style>
/* 공통달력 스타일 */
.중요 {
	background-color: #F5A9BC;
	border-color: #F5A9BC;
}
.보통 {
	background-color: #F7D358;
	border-color: #F7D358;
}
.낮음 {
	background-color: #2E9AFE;
	border-color: #2E9AFE;
}

.cd{
    -webkit-box-flex: 1;
    -ms-flex: 1 1 auto;
    flex: 1 1 auto;
    padding: 1.25rem 1.25rem;
    height: 350px;
}

.cd2{
    -webkit-box-flex: 1;
    -ms-flex: 1 1 auto;
    flex: 1 1 auto;
    padding: 1.25rem 1.25rem;
    height: 700px;
}


/* 달력내부의 이벤트  */

.fc-event-time {
	display: none;
}
.fc-event{
	cursor:pointer;
}

/* 전사달력 스타일 */

.빨강 {
	background-color: #FE2E2E;
	color: white;
}
</style>
</head>
<body onload="times()">
<div class="row">
	<div class="col-12">
		<div
			class="page-title-box d-sm-flex align-items-center justify-content-between">

		</div>
	</div>
</div>
<!-- end page title -->

<div class="row">
	<div class="col-lg-12">
		<div class="card">
			<div class="card-body">
				<div class="row">
					<div class="col-lg-4">
                                <div class="d-flex">
                                    <div class="flex-shrink-0 me-3">
                                        <img src="${empVO.empImg}" alt="" class="avatar-md rounded-circle img-thumbnail">
                                    </div>
                                    <div class="flex-grow-1 align-self-center">
                                        <div class="text-muted">
                                            <p class="mb-2" id="times"></p>
                                            <h5 class="mb-1">${empVO.empNm}&nbsp;${empVO.lelopt}</h5>
                                            <p class="mb-0">${empVO.opt} / ${empVO.dptopt}</p>
                                        </div>
                                    </div>
                                </div>
					</div>

					<div class="col-lg-4 align-self-center">
						<div class="text-lg-center mt-4 mt-lg-0">
							<div class="row">
								<div class="col-3">
									<div>
										<button type="button" class="btn btn-lg btn-primary waves-effect" id="in" name="in"><i class="bx bx-log-in"></i> 출근</button>
									</div>
								</div>
								<div class="col-3">
									<div>
										  <button type="button" class="btn btn-lg btn-secondary waves-effect" id="out" name="out"><i class="bx bx-log-out"></i> 퇴근</button>
									</div>
								</div>
							</div>
						</div>
					</div>

					<div class="col-lg-4">
						<h5 class="font-size-15">${worksttsVO.sumtm}시간<span class="float-end">61%</span></h5>
                            <div class="progress animated-progess progress-md">
                                <div class="progress-bar" role="progressbar" style="width: 61%" aria-valuenow="61" aria-valuemin="0" aria-valuemax="100"></div>
                            </div>
                   		 출근시간: ${worksttsVO.worksttsBgngTm}<br>
                    	퇴근시간: ${worksttsVO.worksttsEndTm}
					</div>
				</div>
				<!-- end row -->
			</div>
		</div>
	</div>
</div>
<!-- end row -->


<div class="col-xl-18">
	<div class="row">
		<div class="col-sm-4">
			<div class="card">
				<div class="cd">
					<div class="col">
						<div class="row-6">
							<div class="d-flex align-items-center mb-3">
								<div class="flex-grow-1 d-flex align-items-center mb-3">
									<div class="avatar-xs me-3">
										<span
											class="avatar-title rounded-circle bg-primary bg-soft text-primary font-size-18">
											<i class="bx bx-dollar"></i>
										</span>
									</div>
									<c:if test="${sessionScope.brncofcId == 'BRN00000'}">
									<h5 class="font-size-16 mb-0"><b>통합</b> 매출</h5>
									</c:if>
									<c:if test="${sessionScope.brncofcId != 'BRN00000'}">
									<h5 class="font-size-16 mb-0"><b>${sessionScope.brncofcNm}</b> 매출</h5>
									</c:if>
								</div>
								<div class="flex-shrink-0 align-self-center mb-3">
									<c:if test="${sessionScope.brncofcId != 'BRN00000'}">
									<a class="btn btn-primary btn-sm waves-effect waves-light float-right"
										href="/sls/brnlist">
									</c:if>
									<c:if test="${sessionScope.brncofcId == 'BRN00000'}">
									<a class="btn btn-primary btn-sm waves-effect waves-light float-right"
										href="/sls/list">
									</c:if>
										<i class="bx bx-plus-medical"></i></a>
								</div>
							</div>
						</div>
						<c:if test="${sessionScope.brncofcId != 'BRN00000'}">
						<div class="row-6">
							<div class="linechart" style="height: 80%; width: 100%;">
								<canvas id="myChart"></canvas>
							</div>
						</div>
						</c:if>
						
						<c:if test="${sessionScope.brncofcId == 'BRN00000'}">
						<div class="row-6">
							<div class="linechart" style="height: 80%; width: 100%;">
								<canvas id="mainChart"></canvas>
							</div>
						</div>
						</c:if>
					</div>
					
					<br>

				</div>
			</div>
		</div>

		<div class="col-sm-4">
			<div class="card">
				<div class="cd">
					<div class="d-flex align-items-center mb-3">
						<div class="flex-grow-1 d-flex align-items-center mb-3">
							<div class="avatar-xs me-3">
								<span
									class="avatar-title rounded-circle bg-primary bg-soft text-primary font-size-18">
									<i class="bx bx-briefcase-alt"></i>
								</span>
							</div>
							<h5 class="font-size-16 mb-0">부족재고</h5>
						</div>
						<c:if test="${sessionScope.brncofcId == 'BRN00000' }">
							<div class="flex-shrink-0 align-self-center mb-3">
								<a  class="btn btn-primary btn-sm waves-effect waves-light float-right"
									href="/strgstck/headLack">
									<i class="bx bx-plus-medical"></i></a>
							</div>
						</c:if>
						<c:if test="${sessionScope.brncofcId != 'BRN00000' }">
							<div class="flex-shrink-0 align-self-center mb-3">
								<a	class="btn btn-primary btn-sm waves-effect waves-light float-right"
									href="/store/lackStock?brncofcId=${sessionScope.brncofcId}">
									<i class="bx bx-plus-medical"></i></a>
							</div>
						</c:if>

					</div>
					<table class="table align-middle table-nowrap table-check">
						<thead class="table-light">
							<tr>
								<th class="align-middle">분류</th>
								<th class="align-middle">상품명</th>
								<th class="align-middle">부족재고 수</th>
							</tr>
						</thead>
						<tbody id="tbContent">
						</tbody>
					</table>
					<br>

				</div>
			</div>
		</div>
		<div class="col-sm-4">
			<div class="card">
				<div class="cd" >
					<div class="d-flex align-items-center mb-3">
						<div class="flex-grow-1 d-flex align-items-center mb-3">
							<div class="avatar-xs me-3">
								<span
									class="avatar-title rounded-circle bg-primary bg-soft text-primary font-size-18">
									<i class="bx bx-briefcase-alt"></i>
								</span>
							</div>
							<h5 class="font-size-16 mb-0">수주</h5>
						</div>
						<div class="flex-shrink-0 align-self-center mb-3">
							<a class="btn btn-primary btn-sm waves-effect waves-light float-right"
								href="/strgstck/rcvordr">
								<i class="bx bx-plus-medical"></i></a>
						</div>
					</div>

					<table class="table align-middle table-nowrap table-check">
						<thead class="table-light">
							<tr>
								<th class="align-middle">발주번호</th>
								<th class="align-middle">발주지점</th>
								<th class="align-middle">발주일</th>
								<th class="align-middle">상세보기</th>
							</tr>
						</thead>
						<tbody>
							<c:set var="i" value="0" />
							<c:forEach var="y" items="${ordr}">
								<c:set var="cnt" value="${i=i+1}" />
								<c:if test="${cnt <= 4 }">
									<tr>
										<td>${y.ordrId}</td>
										<td>${y.brncofcNm}</td>
										<td><fmt:formatDate pattern="yyyy-MM-dd"
												value="${y.ordrDt}" /></td>
										<td>
											<!-- Button trigger modal --> <a
											href="/strgstck/ordrDetail?ordrId=${y.ordrId}"
											class="btn btn-primary btn-sm btn-rounded">상세보기</a>
										</td>
									</tr>
								</c:if>
							</c:forEach>
						</tbody>
					</table>
					<br>
				</div>
			</div>
		</div>


	</div>
	<!-- end row -->
</div>


<div class="row">
	<!-- 캘린더 -->
	<div class="col-lg-6">
		<div class="card">
			<div class="cd2">
				<div>
					<ul class="nav nav-tabs nav-tabs-custom justify-content-center pt-2">
					    <li class="nav-item"><a class="nav-link active" href="#main" data-bs-toggle="tab" role="tab">전사캘린더</a></li>
					    <li class="nav-item"><a class="nav-link" href="#common" data-bs-toggle="tab" role="tab">MY캘린더</a></li>
					</ul> 
				</div>
				<div class="tab-content p-4">
				
				<!-- tab -->
				<div class="tab-pane active" id="main" role="tabpanel">
					<div class="col">
						<div class="row-6">
							<div class="d-flex">
			                   <div class="flex-grow-1">
			                           <b>MY캘린더</b>
			                       </div>
			                       <c:if test="${sessionScope.brncofcId == 'BRN00000'}">
				                       <div class="flex-shrink-0 align-self-center mb-3">
				                               <span class="avatar-title">
				                               	<a class="btn btn-primary btn-sm waves-effect waves-light"
												href="/calendar/main"><i class="bx bx-plus-medical"></i></a>
				                               </span>
				                       </div>
			                       </c:if>
			                 </div>
						</div>
						<div class="row-6">
							<div id="maincalendar"></div>
						</div>
					</div>
				</div>
				
				<div class="tab-pane" id="common" role="tabpanel">
					<div class="col">
						<div class="row-6">
							<div class="d-flex">
			                   <div class="flex-grow-1">
			                           <b>MY캘린더</b>
			                       </div>
				                       <div class="flex-shrink-0 align-self-center mb-3">
				                               <span class="avatar-title">
				                               	<a class="btn btn-primary btn-sm waves-effect waves-light"
												href="/calendar/main"><i class="bx bx-plus-medical"></i></a>
				                               </span>
				                       </div>
			                   </div>
						</div>
						<div class="row-6">
							<div id="calendar"></div>
						</div>
					</div>
				</div>
				<!-- end tab -->
				</div>
			</div>
		</div>
	</div>
	<!-- 캘린더 끝-->
	<!--  공지사항 -->
	<c:if test="${sessionScope.brncofcId == 'BRN00000'}">
	<div class="col-lg-6">
		<div class="card">
			<div class="cd2" > 
				<div class="d-flex align-items-center mb-3">
						<div class="flex-grow-1 d-flex align-items-center mb-3">
							<div class="avatar-xs me-3">
								<span
									class="avatar-title rounded-circle bg-primary bg-soft text-primary font-size-18">
									<i class="bx bx-briefcase-alt"></i>
								</span>
							</div>
							<h5 class="font-size-16 mb-0">공지사항</h5>
						</div>
						<div class="flex-shrink-0 align-self-center mb-3">
							<a class="btn btn-primary btn-sm waves-effect waves-light float-right"
								href="/notice/noticelist">
								<i class="bx bx-plus-medical"></i></a>
						</div>
					</div>

					<table class="table align-middle table-nowrap table-check">
						<thead class="table-light">
							<tr>
								<th class="align-middle">번호</th>
								<th class="align-middle">제목</th>
								<th class="align-middle">작성날짜</th>
							</tr>
						</thead>
						<tbody>
							<c:set var="num" value="0" />
							<c:if test="${empty noticeVO}">
								<tr>
								<td colspan="4" style="text-align: center;">공지가 없습니다.</td>
								</tr>
							</c:if>
							<c:forEach var="noticeVO" items="${noticeVO}">
								<c:set var="cnt" value="${num=num+1}" />
								<c:if test="${cnt <= 12 }">
									<tr>
										<td>${noticeVO.rnum}</td>
										<td><a href="/notice/noticedetail?brdId=${noticeVO.brdId}">${noticeVO.brdTtl}</a></td>
										<td><fmt:formatDate type="both"
												value="${noticeVO.brdDt}" /></td>
									</tr>
								</c:if>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
		</c:if>
		
		<c:if test="${sessionScope.brncofcId != 'BRN00000'}">
		<div class="col-lg-6">
			<div class="card">
				<div class="cd2" > 
					<div class="d-flex align-items-center mb-3">
							<div class="flex-grow-1 d-flex align-items-center mb-3">
								<div class="avatar-xs me-3">
									<span
										class="avatar-title rounded-circle bg-primary bg-soft text-primary font-size-18">
										<i class="bx bx-briefcase-alt"></i>
									</span>
								</div>
								<h5 class="font-size-16 mb-0">지점 공지사항</h5>
							</div>
							<div class="flex-shrink-0 align-self-center mb-3">
								<a class="btn btn-primary btn-sm waves-effect waves-light float-right"
									href="/sig/siglist">
									<i class="bx bx-plus-medical"></i></a>
							</div>
						</div>
	
						<table class="table align-middle table-nowrap table-check">
							<thead class="table-light">
								<tr>
									<th class="align-middle">번호</th>
									<th class="align-middle">제목</th>
									<th class="align-middle">작성날짜</th>
								</tr>
							</thead>
							<tbody>
								<c:set var="number" value="0" />
								<c:if test="${empty signoticeVO}">
									<tr>
									<td colspan="4" style="text-align: center;">공지가 없습니다.</td>
									</tr>
								</c:if>
								<c:forEach var="signoticeVO" items="${signoticeVO}">
									<c:set var="count" value="${number=number+1}" />
									<c:if test="${count <= 12 }">
										<tr>
											<td>${signoticeVO.rnum}</td>
											<td><a href="/sig/sigdetail?brdId=${signoticeVO.brdId}">${signoticeVO.brdTtl}</a></td>
											<td><fmt:formatDate type="both"
													value="${signoticeVO.brdDt}" /></td>
										</tr>
									</c:if>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</c:if>
		
		
		
		
</div>


<!-- 캘린더 상세정보 보는 modal -->
<div class="modal fade" id="updatemodal" tabindex="-1">
	<div class="modal-dialog modal-dialog-centered">
		<div class="modal-content">
			<div class="modal-header py-3 px-4 border-bottom-0">
				<h5 class="modal-title" id="modal-title"><b>일정상세정보</b></h5>

				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-hidden="true" onclick="fn_close()"></button>
			</div>
			<div class="modal-body p-4">
					<div class="row">
						<!-- 캘린더번호(고유키) -->
						<input type="text" id="calendarNo" name="calendarNo"
							style="display: none;">
						<!-- 끝 -->
						<div class="col-12">
							<div class="mb-3">
								<label class="form-label">시작일</label> <input
									class="form-control update" type="date" name="startday"
									id="upstartday" />
							</div>
							<div class="mb-3">
								<label class="form-label">종료일</label> <input
									class="form-control update" type="date" name="endday"
									id="upendday" />
							</div>
						</div>
						<div class="col-12">
							<div class="mb-3">
								<label class="form-label">일정명</label> <input
									class="form-control update" placeholder="일정명을 남겨주세요"
									type="text" name="title" id="uptitle" />
								<div class="invalid-feedback">Please provide a valid event
									name</div>
							</div>
						</div>
						<div class="col-12">
							<div class="mb-3">
								<label class="form-label">상세내용</label> <input
									class="form-control update" type="text" name="content"
									id="upcontent" />
								<div class="invalid-feedback">Please provide a valid event
									name</div>
							</div>
						</div>
						<div class="col-12">
							<div class="mb-3">
								<label class="form-label">중요도</label> <select
									class="form-control form-select update" name="category"
									id="upcategory">
									<option value="중요">중요</option>
									<option value="보통">보통</option>
									<option value="낮음">낮음</option>
								</select>
								<div class="invalid-feedback">Please select a valid event
									category</div>
							</div>
						</div>
					</div>
			</div>
		</div>
		<!-- end modal-content-->
	</div>
	<!-- end modal dialog-->
</div>
<!-- 캘린더 상세정보 보는 modal 끝 -->
</body>
</html>