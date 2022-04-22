<%@page import="kr.or.tco.strgstck.vo.StrgstckVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src="/resources/js/jquery-3.6.0.min.js"></script>
<script src="/resources/js/section.js"></script>
<script src="/resources/js/reduce.js"></script>
<script>
var newArray 	= [];
let optt = document.createElement("option");
const cmncdNm2 = document.querySelector("#cmncdNm2");
const cnptNm = document.querySelector("#cnptNm");
<c:forEach var="vo" items="${list}">
	var jsonObj = new Object();
	jsonObj.brncofcId = "${vo.brncofcId}";
	jsonObj.prodInfoId = "${vo.prodInfoId}";
	jsonObj.strgWrhsId = "${vo.strgWrhsId}";
	jsonObj.strgWrhsQty = "${vo.strgWrhsQtyDisplay}";
	jsonObj.strgWrhsDt = "${vo.strgWrhsDtDisplay}";
	jsonObj.prodInfoPrchsAmt = "${vo.prodInfoPrchsAmtDisplay}";
	jsonObj.cmncdCd = "${vo.cmncdCd}";
	jsonObj.cmncdNm1 = "${vo.cmncdNm1}";
	jsonObj.cmncdNm2 = "${vo.cmncdNm2}";
	jsonObj.brncofcNm = "${vo.brncofcNm}";
	jsonObj.prodInfoNm = "${vo.prodInfoNmDisplay}";
	jsonObj.wrAmount = "${vo.wrAmount}";
	jsonObj.cnptId = "${vo.cnptId}";
	jsonObj.cnptNm = "${vo.cnptNm}";
	
	jsonObj = JSON.stringify(jsonObj);
	console.log("JSON jsonObj : " + jsonObj);
	//String 형태로 파싱한 객체를 다시 json으로 변환
	newArray.push(JSON.parse(jsonObj));
</c:forEach>
	
console.log("원본 배열 : " + newArray);

var jsonArray = newArray;

//테이블에 추가할 내용 만드는 함수
var str = "";
function chgFilter(){
	str = "";
	console.log("chgFilter 안 jsonArray.length : " + jsonArray.length);
	for(var i=0; i < jsonArray.length; i++){
		str += '<tr class="arryTd"><td data-org-colspan="1" data-priority="1" data-columns="tech-companies-1-col-1">';
		str += jsonArray[i].strgWrhsId + "</td>";
		str += '<td data-org-colspan="1" data-priority="3" data-columns="tech-companies-1-col-2">';
		str += jsonArray[i].cmncdNm1 + "/" + jsonArray[i].cmncdNm2 + "</td>";
		str += '<td data-org-colspan="1" data-priority="1" data-columns="tech-companies-1-col-3">';
		str += jsonArray[i].prodInfoNm + "</td>";
		str += '<td data-org-colspan="1" data-priority="3" data-columns="tech-companies-1-col-4">';
		str += jsonArray[i].cnptNm + "</td>";
		str += '<td data-org-colspan="1" data-priority="3" data-columns="tech-companies-1-col-5" style="text-align:right;">';
		str += jsonArray[i].strgWrhsQty + "</td>";
		str += '<td data-org-colspan="1" data-priority="6" data-columns="tech-companies-1-col-6" style="text-align:right;">';
		str += jsonArray[i].prodInfoPrchsAmt + "</td>";
		str += '<td data-org-colspan="1" data-priority="6" data-columns="tech-companies-1-col-7" style="text-align:right;">';
		str += jsonArray[i].wrAmount + "</td>";
		str += '<td data-org-colspan="1" data-priority="6" data-columns="tech-companies-1-col-8">';
		str += jsonArray[i].strgWrhsDt + '</td></tr>';
	}
	$("#tbContent").append(str);
}


//대분류 바뀌었을때
function fn_seChg(e){
	var opt = $("#cmncdNm1").val();
	var dtOpt = $("#orderid-input").val();
	var midOpt = $("#cmncdNm2").val();
	resetBtn();
	fn_seChgJs(e);

	const cnptNm = document.querySelector("#cnptNm");
	let option = document.createElement("option");
	//거래처 바꿔주는 작업(ajax로 거래처 가져와서 reduce함.)
	$.ajax({
		url:"/prod/cnpt.do",
		type:'get',
		dataType:'JSON',
		success:function(res){
			console.log("거래처 가져오기 성공 : " + res);
			cnptNm.options.length = 0;
			resArray = [];
			//res를 JSON배열로 만들기
			for(var i =0; i < res.length; i++){
				var jsonObj = new Object();
				jsonObj.cmncdNm1 = res[i].cmncdNm1;
				jsonObj.cmncdNm2 = res[i].cmncdNm2;
				jsonObj.cnptNm = res[i].cnptNm;
				
				jsonObj = JSON.stringify(jsonObj);
				console.log("JSON jsonObj : " + jsonObj);
				//String 형태로 파싱한 객체를 다시 json으로 변환
				resArray.push(JSON.parse(jsonObj));
			}
			str = [];
			for(var i=0; i < resArray.length; i++){
				if(resArray[i].cmncdNm1 == opt){
					str.push(resArray[i].cnptNm);
				}
			}
			console.log("str.length : " + str.length);
			option.value = "전체";
			option.innerHTML = "전체";
			cnptNm.append(option);
			for(var i=0; i < str.length; i++){
				option = document.createElement("option");
				option.value = str[i];
				option.innerHTML = str[i];
				cnptNm.append(option);
			}
		}
	})
	
	if(opt != '전체'){
		bigSe();
	}
	//날짜 선택을 안했다면
	if(dtOpt == ''){
		chgFilter();
	}else{ //날짜를 선택했다면
		dtSelect();
		chgFilter();
	}
}

//중분류 바뀌었을때
function fn_midChg(e){
	var opt = $("#cmncdNm1").val();
	var dtOpt = $("#orderid-input").val();
	var midOpt = $("#cmncdNm2").val();
	var cnpt = $("#cnptNm").val();
	resetBtn();
	midSe();
	
	const cnptNm = document.querySelector("#cnptNm");
	cnptNm.options.length = 0;
	optt = document.createElement("option");
	optt.value = "전체";
	optt.innerHTML = "전체";
	cnptNm.append(optt);
	
	//날짜 선택을 안했다면
	if(dtOpt == ''){
		chgFilter();
	}else{ //날짜를 선택했다면
		dtSelect();
		chgFilter();
	}
}

//날짜 바뀌었을때
function fn_dateChg(e){
	var opt = $("#cmncdNm1").val();
	var dtOpt = $("#orderid-input").val();
	var midOpt = $("#cmncdNm2").val();
	var cnpt = $("#cnptNm").val();
	resetBtn();
	dtSelect();
	
	//대분류 선택을 안했다면
	if(opt == '전체'){
		chgFilter();
	}else{ //대분류를 선택했다면
		bigSe();
		//중분류를 선택하지 않았다면
		if(midOpt =='전체'){
			//거래처를 선택했다면
			if(cnpt != '전체'){
				cnptSelect();
			}
			chgFilter();
		}else{ //중분류를 선택했다면
			midSe();
			chgFilter();
		}
	}
}

//거래처가 바뀌었을때
function fn_cnptSe(e){
	var opt = $("#cmncdNm1").val();
	var dtOpt = $("#orderid-input").val();
	var midOpt = $("#cmncdNm2").val();
	var cnpt = $("#cnptNm").val();
	
	resetBtn();
	if(cnpt != '전체'){
		cnptSelect();
	}
	
	//날짜 선택을 안했다면
	if(dtOpt == ''){
		chgFilter();
	}else{ //날짜를 선택했다면
		dtSelect();
		chgFilter();
	}
}

//reset 이미지 누르면
function fn_reset(){
	resetBtn();
	chgFilter();
	const cmncdNm2 = document.querySelector("#cmncdNm2");
	const cnptNm = document.querySelector("#cnptNm");
	$("#orderid-input").val("");
	$("#cmncdNm1").val("전체");
	$("#cnptNm").val("전체");
	cmncdNm2.options.length = 0;
	optt = document.createElement("option");
	optt.value = "";
	optt.innerHTML = "중분류 선택";
	cmncdNm2.append(optt);
	$("#cmncdNm2").val("");
	cnptNm.options.length = 0;
	optt = document.createElement("option");
	optt.value = "전체";
	optt.innerHTML = "전체";
	cnptNm.append(optt);
}

$(function(){
	chgFilter();
})

</script>
<style>
	.nnii{
		float: right;
		width:83%;
	}
	.miio{
		width: 100%;
	}
	#startDay{
		float: left;
	}
	.btn-toolbar{
		padding: 10px 10px 0px 10px;
	}
	.filter{
		width : 200px;
	}
</style>
<div class="container-fluid">
<!-- start page title -->
<div class="row">
	<div class="col-12">
		<div class="page-title-box d-sm-flex align-items-center justify-content-between">
			<h1 class="mb-sm-0 font-size-20">📜입고</h1>
			
			<div class="page-title-right">
			    <ol class="breadcrumb m-0">
			        <li class="breadcrumb-item"><a href="javascript: void(0);">본사</a></li>
			        <li class="breadcrumb-item active">입고 목록</li>
			    </ol></div></div></div></div>
<!-- end page title -->

<div class="row ">
	<div class="col-lg-2">
		<div class="card">
			<div class="card-body filDiv">
				<h4 class="card-title mb-4">Filter</h4>
				<div class="control-group" id="toastTypeGroup">
					<h5 class="font-size-14 mb-3">상품분류</h5>
	                <div class="controls mb-4">
		                <select id="cmncdNm1" name="cmncdNm1" class="form-select seSelect filter" onchange="fn_seChg(this)">
					        <option value="전체" label="전체"/>
					        <option value="패션" label="패션"/>
					        <option value="가구/인테리어" label="가구/인테리어" />
					        <option value="화장품/미용" label="화장품/미용" />
					        <option value="식품" label="식품" />
					        <option value="출산/유아동" label="출산/유아동" />
					        <option value="반려동물용품" label="반려동물용품" />
					        <option value="생활/주방용품" label="생활/주방용품" />
					        <option value="가전" label="가전" />
					        <option value="디지털" label="디지털" />
					        <option value="컴퓨터" label="컴퓨터" />
					        <option value="스포츠/레저" label="스포츠/레저" />
					        <option value="건강/의료용품" label="건강/의료용품" />
					        <option value="자동차/공구" label="자동차/공구" />
					        <option value="취미/문구/악기" label="취미/문구/악기" />
					        <option value="도서" label="도서" />
					    </select>
					    <select id="cmncdNm2" name="cmncdNm2" class="form-select seSelect filter" onchange="fn_midChg(this)">
					    	 <option value="중분류 선택" label="중분류 선택"/>
					    </select>
	                   </div></div>
	                   
	                   
				<div class="mt-4 pt-3">
	               	<h5 class="font-size-14 mb-3">거래처</h5>
	               	<select id="cnptNm" name="cnptNm" class="form-select filter" onchange="fn_cnptSe(this)">
				        <option value="전체" label="전체"/>
				    </select>
                </div>
                
				<div class="mt-4 pt-3">
	               	<h5 class="font-size-14 mb-3">날짜</h5>
	                <input type="text" class="form-control filter" id="orderid-input" placeholder="Select date" data-date-format="yyyy-mm-dd" data-date-orientation="bottom auto" data-provide="datepicker" data-date-autoclose="true" onchange="fn_dateChg(this)">
                </div>
                <a href="javascript: void(0);" onclick="fn_reset()"><i style="float:right;" class="mdi mdi-backup-restore mdi-36px"></i></a>
			</div>
		</div>
	</div>
	        
	   
	<!-- 출고리스트 -->
	<div class="card nnii">
		<div class="col-lg-9 miio">
		<div class="table-rep-plugin">
			<div class="table-wrapper">
				<div class="table-responsive mb-0 fixed-solution" data-pattern="priority-columns">
				<div class="sticky-table-header" style="height: 46px; visibility: hidden; top: -1px; width: auto;"></div>
				<table id="tech-companies-1" class="table table-striped">
					<thead>
						<tr>
						    <th data-priority="1" id="tech-companies-1-col-1">입고번호</th>
						    <th data-priority="3" id="tech-companies-1-col-2">분류</th>
						    <th data-priority="1" id="tech-companies-1-col-3">상품명</th>
						    <th data-priority="3" id="tech-companies-1-col-4">거래처</th>
						    <th data-priority="3" id="tech-companies-1-col-5" style="text-align:right;">입고수량</th>
						    <th data-priority="6" id="tech-companies-1-col-6" style="text-align:right;">개당가격</th>
						    <th data-priority="6" id="tech-companies-1-col-7" style="text-align:right;">총액</th>
						    <th data-priority="6" id="tech-companies-1-col-8">입고일</th>
						</tr>
					</thead>
					<tbody id="tbContent">
					</tbody>
				</table>
				</div></div></div></div></div></div></div>
<!-- end row -->