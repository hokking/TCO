<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src="/resources/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
var beArray = [];
<c:forEach var="vo" items="${list}">
	var jsonObj = new Object();
	jsonObj.brncofcId = "${vo.brncofcId}";
	jsonObj.prodInfoId = "${vo.prodInfoId}";
	jsonObj.prodInfoNm = "${vo.prodInfoNmDisplay}";
	jsonObj.streStckSftyQty = "${vo.streStckSftyQty}";
	jsonObj.streStckQty = "${vo.streStckQty}";
	jsonObj.cmncdCd = "${vo.cmncdCd}";
	jsonObj.cmncdNm1 = "${vo.cmncdNm1}";
	jsonObj.cmncdNm2 = "${vo.cmncdNm2}";
	jsonObj.brncofcNm = "${vo.brncofcNm}";
	jsonObj.streSe = "${vo.streSe}";
	jsonObj.streGdsCg = "${vo.streGdsCg}";
	if(${vo.streStckSftyQty - vo.streStckQty < 0}){
		jsonObj.status = "안전";
	}else{
		jsonObj.status = "재고부족";
	}
	
	jsonObj = JSON.stringify(jsonObj);
	console.log("JSON jsonObj : " + jsonObj);
	//String 형태로 파싱한 객체를 다시 json으로 변환
	beArray.push(JSON.parse(jsonObj));
</c:forEach>
console.log(array);
var array = beArray;
//테이블에 추가할 내용 만드는 함수
var str = "";
function chgTable(){
	str="";
	for(var i=0; i < array.length; i++){
		str += '<tr class="tdMap">';
		str += '<td>' + array[i].cmncdNm1 + '/' + array[i].cmncdNm2 + '</td>';
		str += '<td>' + array[i].prodInfoNm + '</td>';
		str += '<td>' + array[i].streStckQty + '</td>';
		str += '<td>' + array[i].streStckSftyQty + '</td>';
		if(array[i].status == "재고부족"){
			str += '<td><span class="badge bg-danger">' + array[i].status + '</span></td></tr>';
		}else{
			str += '<td><span class="badge bg-info">' + array[i].status + '</span></td></tr>';
		}
	}
	$("#stst").append(str);
}

//매장 위치를 클릭했을때 실행하는 함수
function fn_stock(e, num){
	if(e.id == 'BRN00001'){
		$("#map1").css("width", "56%");
		$("#map1").css("float", "right");
	}else if(e.id == 'BRN00002'){
		$("#map2").css("width", "56%");
		$("#map2").css("float", "right");
	}else{
		$("#map3").css("width", "56%");
		$("#map3").css("float", "right");
	}
	$("#stock").css("display", "inline-block");
	$("#section").css("display", "inline-block");
	$("#secNum").append(num);
	
	array = beArray;
	//매장 위치별 상품 뽑아내기
	array = array.reduce((pre, cur) => {
		if( cur.streSe == num ) pre.push(cur);
		return pre;
	}, []);
	console.log(array);
	//테이블 추가
	chgTable();
}

$(function(){
	$("#rrload").on("click", function(){
		if(${id == 'BRN00001'}){
			$("#map1").css("width", "1544px");
			$("#map1").css("float", "left");
		}else if(${id == 'BRN00002'}){
			$("#map2").css("width", "1544px");
			$("#map2").css("float", "left");
		}else{
			$("#map3").css("width", "1544px");
			$("#map3").css("float", "left");
		}
		$("#stock").css("display", "none");
		$("#section").css("display", "none");
		$("#secNum").empty();
		$(".tdMap").remove();
	})
})

</script>
<style>
	.inBtn{
		float: right;
	}
	.seicon{
 		float: right;
	}
	th,td{
		text-align: center;
	}
	#map1, #map2, #map3{
   		width: 100%;   
  		width:1544px;  
	}
	#stock{
		display:none;
		margin-top: 20px;
		width: 40%
	}
	#rrload{
		float: right;
/* 		display:none; */
	}
	#section{
		width: 660px;
		display:none;
	}
	#secNum{
		display: inline-block;
		width : 50px;
		height : 50px;
		margin-top: 10px;
	}
</style>

<div class="container-fluid">
	<!-- start page title -->
	<div class="row">
		<div class="col-12">
			<div class="page-title-box d-sm-flex align-items-center justify-content-between">
				<h4 class="mb-sm-0 font-size-18">📜${name} 매장 상세</h4>
			
			</div>
		</div>
	</div>
	<!-- end page title -->
	
	<div class="row">
		<div class="col-12">
			<div class="card">
				<div class="card-body">
					<h4 class="card-title" style="display:inline-block;width:610px;">매장</h4><br>
					<div id="section"><button type="button" id="secNum" class="btn btn-danger rounded-pill" readonly="true"></button>
					<a href="javascript: void(0);" id="rrload"><i id="irconre" class="mdi mdi-redo-variant mdi-36px"></i></a></div>
					<div>
						<div id="stock">
							<div class="table-rep-plugin">
	                            <div class="table-wrapper">
	                              <div class="table-responsive mb-0 fixed-solution" data-pattern="priority-columns">
	                                <table id="tech-companies-1" class="table table-striped">
	                                    <thead>
	                                    <tr>
	                                        <th data-priority="1" id="tech-companies-1-col-1">분류</th>
	                                        <th data-priority="3" id="tech-companies-1-col-2">상품명</th>
	                                        <th data-priority="1" id="tech-companies-1-col-3">현재고 수</th>
	                                        <th data-priority="3" id="tech-companies-1-col-4">안전재고 수</th>
	                                        <th data-priority="3" id="tech-companies-1-col-4">상태</th>
	                                    </tr>
	                                    </thead>
	                                    <tbody id="stst">
	                                    </tbody>
	                                </table>
	                            </div></div>
	                        </div>
						</div>
						<c:if test="${id == 'BRN00001'}">
							<img src="/resources/images/지점1.png" id="map1" usemap="#brn1-image-map">
								<map name="brn1-image-map">
								    <area onclick="fn_stock(this,1)" id="${id}" alt="1-1" title="1-1" href="javascript: void(0);" coords="319,643,319,676,263,678,263,849,543,849,541,646" shape="poly">
							        <area onclick="fn_stock(this,2)" id="${id}" alt="1-2" title="1-2" href="javascript: void(0);" coords="545,747,770,851" shape="rect">
								    <area onclick="fn_stock(this,3)" id="${id}" alt="1-3" title="1-3" href="javascript: void(0);" coords="773,747,1031,849" shape="rect">
								    <area onclick="fn_stock(this,4)" id="${id}" alt="1-4" title="1-4" href="javascript: void(0);" coords="1035,747,1256,851" shape="rect">
								    <area onclick="fn_stock(this,5)" id="${id}" alt="1-5" title="1-5" href="javascript: void(0);" coords="1258,706,1425,849" shape="rect">
								    <area onclick="fn_stock(this,6)" id="${id}" alt="1-6" title="1-6" href="javascript: void(0);" coords="645,641,770,715" shape="rect">
								    <area onclick="fn_stock(this,7)" id="${id}" alt="1-7" title="1-7" href="javascript: void(0);" coords="812,641,1033,717" shape="rect">
								    <area onclick="fn_stock(this,8)" id="${id}" alt="1-8" title="1-8" href="javascript: void(0);" coords="1076,639,1219,715" shape="rect">
								    <area onclick="fn_stock(this,9)" id="${id}" alt="1-9" title="1-9" href="javascript: void(0);" coords="1258,513,1391,676" shape="rect">
								    <area onclick="fn_stock(this,10)" id="${id}" alt="1-10" title="1-10" href="javascript: void(0);" coords="263,383,265,481,319,483,319,600,545,602,543,383" shape="poly">
								    <area onclick="fn_stock(this,11)" id="${id}" alt="1-11" title="1-11" href="javascript: void(0);" coords="586,513,686,574" shape="rect">
								    <area onclick="fn_stock(this,12)" id="${id}" alt="1-12" title="1-12" href="javascript: void(0);" coords="812,511,812,624,892,624,894,574,1031,572,1031,513" shape="poly">
								    <area onclick="fn_stock(this,13)" id="${id}" alt="1-13" title="1-13" href="javascript: void(0);" coords="1076,513,1217,574" shape="rect">
								    <area onclick="fn_stock(this,14)" id="${id}" alt="1-14" title="1-14" href="javascript: void(0);" coords="584,409,770,479" shape="rect">
								    <area onclick="fn_stock(this,15)" id="${id}" alt="1-15" title="1-15" href="javascript: void(0);" coords="922,409,1031,483" shape="rect">
								    <area onclick="fn_stock(this,16)" id="${id}" alt="1-16" title="1-16" href="javascript: void(0);" coords="1075,409,1217,481" shape="rect">
								    <area onclick="fn_stock(this,17)" id="${id}" alt="1-17" title="1-17" href="javascript: void(0);" coords="1260,364,1263,481,1532,483,1529,308,1315,305,1315,362" shape="poly">
								    <area onclick="fn_stock(this,18)" id="${id}" alt="1-18" title="1-18" href="javascript: void(0);" coords="545,275,673,381" shape="rect">
								    <area onclick="fn_stock(this,19)" id="${id}" alt="1-19" title="1-19" href="javascript: void(0);" coords="673,162,770,381" shape="rect">
								    <area onclick="fn_stock(this,20)" id="${id}" alt="1-20" title="1-20" href="javascript: void(0);" coords="864,286,1031,381" shape="rect">
								    <area onclick="fn_stock(this,21)" id="${id}" alt="1-21" title="1-21" href="javascript: void(0);" coords="865,195,1031,258" shape="rect">
								    <area onclick="fn_stock(this,22)" id="${id}" alt="1-22" title="1-22" href="javascript: void(0);" coords="1075,175,1159,383" shape="rect">
								    <area onclick="fn_stock(this,23)" id="${id}" alt="1-23" title="1-23" href="javascript: void(0);" coords="675,45,942,160" shape="rect">
								    <area onclick="fn_stock(this,24)" id="${id}" alt="1-24" title="1-24" href="javascript: void(0);" coords="970,45,1126,158" shape="rect">
								    <area onclick="fn_stock(this,25)" id="${id}" alt="1-25" title="1-25" href="javascript: void(0);" coords="1208,158,1208,217,1263,221,1260,43,1128,45,1128,158" shape="poly">
								</map>
						</c:if>
						<c:if test="${id == 'BRN00002'}">
							<img src="/resources/images/지점2.png" id="map2" usemap="#brn2-image-map">
								<map name="brn2-image-map">
									<area onclick="fn_stock(this,1)" id="${id}" alt="2-1" title="2-1" href="javascript: void(0);" coords="393,466,393,515,343,518,343,780,976,780,976,569,731,572,731,466" shape="poly">
								    <area onclick="fn_stock(this,2)" id="${id}" alt="2-2" title="2-2" href="javascript: void(0);" coords="979,682,1408,780" shape="rect">
								    <area onclick="fn_stock(this,3)" id="${id}" alt="2-3" title="2-3" href="javascript: void(0);" coords="1273,593,1410,682" shape="rect">
								    <area onclick="fn_stock(this,4)" id="${id}" alt="2-4" title="2-4" href="javascript: void(0);" coords="1273,351,1360,591" shape="rect">
								    <area onclick="fn_stock(this,5)" id="${id}" alt="2-5" title="2-5" href="javascript: void(0);" coords="1408,61,1523,591" shape="rect">
								    <area onclick="fn_stock(this,6)" id="${id}" alt="2-6" title="2-6" href="javascript: void(0);" coords="1032,557,1224,647" shape="rect">
								    <area onclick="fn_stock(this,7)" id="${id}" alt="2-7" title="2-7" href="javascript: void(0);" coords="1033,463,1224,552" shape="rect">
								    <area onclick="fn_stock(this,8)" id="${id}" alt="2-8" title="2-8" href="javascript: void(0);" coords="1032,300,1224,394" shape="rect">
								    <area onclick="fn_stock(this,9)" id="${id}" alt="2-9" title="2-9" href="javascript: void(0);" coords="1031,207,1226,297" shape="rect">
								    <area onclick="fn_stock(this,10)" id="${id}" alt="2-10" title="2-10" href="javascript: void(0);" coords="1163,61,1362,156" shape="rect">
								    <area onclick="fn_stock(this,11)" id="${id}" alt="2-11" title="2-11" href="javascript: void(0);" coords="785,463,979,539" shape="rect">
								    <area onclick="fn_stock(this,12)" id="${id}" alt="2-12" title="2-12" href="javascript: void(0);" coords="787,327,979,394" shape="rect">
								    <area onclick="fn_stock(this,13)" id="${id}" alt="2-13" title="2-13" href="javascript: void(0);" coords="788,208,976,275" shape="rect">
								    <area onclick="fn_stock(this,14)" id="${id}" alt="2-14" title="2-14" href="javascript: void(0);" coords="980,58,1161,158" shape="rect">
								    <area onclick="fn_stock(this,15)" id="${id}" alt="2-15" title="2-15" href="javascript: void(0);" coords="817,59,979,158" shape="rect">
								    <area onclick="fn_stock(this,16)" id="${id}" alt="2-16" title="2-16" href="javascript: void(0);" coords="539,303,731,392" shape="rect">
								    <area onclick="fn_stock(this,17)" id="${id}" alt="2-17" title="2-17" href="javascript: void(0);" coords="541,206,731,298" shape="rect">
								    <area onclick="fn_stock(this,18)" id="${id}" alt="2-18" title="2-18" href="javascript: void(0);" coords="655,61,818,159" shape="rect">
								    <area onclick="fn_stock(this,19)" id="${id}" alt="2-19" title="2-19" href="javascript: void(0);" coords="393,58,395,253,488,253,488,158,651,158,651,60" shape="poly">
								    <area onclick="fn_stock(this,20)" id="${id}" alt="2-20" title="2-20" href="javascript: void(0);" coords="396,255,488,413" shape="rect">
								</map>
						</c:if>
						<c:if test="${id == 'BRN00003'}">
							<img src="/resources/images/지점3.png" id="map3" usemap="#brn3-image-map">
								<map name="brn3-image-map">
								    <area onclick="fn_stock(this,1)" id="${id}" alt="3-1" title="3-1" href="javascript: void(0);" coords="449,127,625,339" shape="rect">
								    <area onclick="fn_stock(this,2)" id="${id}" alt="3-2" title="3-2" href="javascript: void(0);" coords="449,342,625,661" shape="rect">
								    <area onclick="fn_stock(this,3)" id="${id}" alt="3-3" title="3-3" href="javascript: void(0);" coords="449,661,625,871" shape="rect">
								    <area onclick="fn_stock(this,4)" id="${id}" alt="3-4" title="3-4" href="javascript: void(0);" coords="649,927,647,1086,979,1086,979,1010,1252,1008,1254,925" shape="poly">
								    <area onclick="fn_stock(this,5)" id="${id}" alt="3-5" title="3-5" href="javascript: void(0);" coords="1328,689,1486,949" shape="rect">
								    <area onclick="fn_stock(this,6)" id="${id}" alt="3-6" title="3-6" href="javascript: void(0);" coords="1329,434,1484,687" shape="rect">
								    <area onclick="fn_stock(this,7)" id="${id}" alt="3-7" title="3-7" href="javascript: void(0);" coords="1329,174,1486,431" shape="rect">
								    <area onclick="fn_stock(this,8)" id="${id}" alt="3-8" title="3-8" href="javascript: void(0);" coords="1094,27,1310,212" shape="rect">
								    <area onclick="fn_stock(this,9)" id="${id}" alt="3-9" title="3-9" href="javascript: void(0);" coords="872,25,1089,212" shape="rect">
								    <area onclick="fn_stock(this,10)" id="${id}" alt="3-10" title="3-10" href="javascript: void(0);" coords="659,105,870,212" shape="rect">
								    <area onclick="fn_stock(this,11)" id="${id}" alt="3-11" title="3-11" href="javascript: void(0);" coords="649,233,764,511" shape="rect">
								    <area onclick="fn_stock(this,12)" id="${id}" alt="3-12" title="3-12" href="javascript: void(0);" coords="811,232,1148,361" shape="rect">
								    <area onclick="fn_stock(this,13)" id="${id}" alt="3-13" title="3-13" href="javascript: void(0);" coords="809,406,1150,511" shape="rect">
								    <area onclick="fn_stock(this,14)" id="${id}" alt="3-14" title="3-14" href="javascript: void(0);" coords="1196,235,1310,513" shape="rect">
								    <area onclick="fn_stock(this,15)" id="${id}" alt="3-15" title="3-15" href="javascript: void(0);" coords="649,594,766,871" shape="rect">
								    <area onclick="fn_stock(this,16)" id="${id}" alt="3-16" title="3-16" href="javascript: void(0);" coords="814,628,1146,871" shape="rect">
								    <area onclick="fn_stock(this,17)" id="${id}" alt="3-17" title="3-17" href="javascript: void(0);" coords="1195,593,1310,871" shape="rect">
								</map>
						</c:if>
					</div>
				</div>
			</div>
		</div> <!-- end col -->
	</div> <!-- end row -->
</div> <!-- container-fluid -->

