<%@page import="kr.or.tco.strgstck.vo.StrgstckVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src="/resources/js/jquery-3.6.0.min.js"></script>
<script src="/resources/js/section.js"></script>
<script>
/* 매장 입고 */
var newArray1 	= [];
<c:forEach var="vo" items="${list}">
	var jsonObj = new Object();
	jsonObj.brncofcId = "${vo.brncofcId}";
	jsonObj.prodInfoId = "${vo.prodInfoId}";
	jsonObj.strgShmtQty = "${vo.strgShmtQtyDisplay}";
	jsonObj.strgShmtId = "${vo.strgShmtId}";
	jsonObj.strgShmtDt = "${vo.strgShmtDtDisplay}";
	jsonObj.prodInfoPrchsAmt = "${vo.prodInfoPrchsAmtDisplay}";
	jsonObj.cmncdCd = "${vo.cmncdCd}";
	jsonObj.cmncdNm1 = "${vo.cmncdNm1}";
	jsonObj.cmncdNm2 = "${vo.cmncdNm2}";
	jsonObj.brncofcNm = "${vo.brncofcNm}";
	jsonObj.prodInfoNm = "${vo.prodInfoNm}";
	jsonObj.shipAmount = "${vo.shipAmount}";
	
	jsonObj = JSON.stringify(jsonObj);
	console.log("JSON jsonObj : " + jsonObj);
	//String 형태로 파싱한 객체를 다시 json으로 변환
	newArray1.push(JSON.parse(jsonObj));
</c:forEach>
	
console.log("매장 입고 원본 배열 : " + newArray1);


var jsonArray1 = newArray1;

//초기화버튼 클릭시 원본 배열 가져오는 함수
function resetBtn1(){
	jsonArray1 = newArray1;
}

//테이블에 추가할 내용 만드는 함수
var str = "";
function chgFilter1(){
	str = "";
	console.log("(매장입고)chgFilter 안 jsonArray.length : " + jsonArray1.length);
	for(var i=0; i < jsonArray1.length; i++){
		str += '<tr class="arryTd1"><td data-org-colspan="1" data-priority="1" data-columns="tech-companies-1-col-1">';
		str += jsonArray1[i].strgShmtId + "</td>";
		str += '<td data-org-colspan="1" data-priority="3" data-columns="tech-companies-1-col-2">';
		str += jsonArray1[i].cmncdNm1 + "/" + jsonArray1[i].cmncdNm2 + "</td>";
		str += '<td data-org-colspan="1" data-priority="1" data-columns="tech-companies-1-col-3">';
		str += jsonArray1[i].prodInfoNm + "</td>";
		str += '<td data-org-colspan="1" data-priority="3" data-columns="tech-companies-1-col-4">';
		str += jsonArray1[i].strgShmtQty + "</td>";
		str += '<td data-org-colspan="1" data-priority="3" data-columns="tech-companies-1-col-5">';
		str += jsonArray1[i].prodInfoPrchsAmt + "</td>";
		str += '<td data-org-colspan="1" data-priority="6" data-columns="tech-companies-1-col-6">';
		str += jsonArray1[i].shipAmount + "</td>";
		str += '<td data-org-colspan="1" data-priority="6" data-columns="tech-companies-1-col-7">';
		str += jsonArray1[i].strgShmtDt + "</td>";
	}
	$("#tbContent1").append(str);
}

//내용 지우기
function fn_remove1(){
	$(".arryTd1").remove();
}

//대분류가 전체가 아닐때
function bigSe1(){
	var opt = $("#cmncdNm11").val();
	jsonArray1 = jsonArray1.reduce((pre, cur) => {
	    if(cur.cmncdNm1 == opt ) pre.push(cur);
	    return pre;
	},[]);
}
//중분류가 전체가 아닐때
function midSe1(){
	var midOpt = $("#cmncdNm21").val();
	jsonArray1 = jsonArray1.reduce((pre, cur) => {
	    if(cur.cmncdNm2 == midOpt ) pre.push(cur);
	    return pre;
	},[]);
}
//날짜가 선택됐을때
function dtSelect1(){
	var dtOpt = $("#orderid-input1").val();
	jsonArray1 = jsonArray1.reduce((pre, cur) => {
	    if(cur.strgShmtDt == dtOpt ) pre.push(cur);
	    return pre;
	},[]);
}

//대분류 바뀌었을때
function fn_seChg1(e){
	var opt = $("#cmncdNm11").val();
	var dtOpt = $("#orderid-input1").val();
	var midOpt = $("#cmncdNm21").val();
	resetBtn1();
	fn_seChgJs1(e);
	fn_remove1();
	if(opt != '전체'){
		bigSe1();
	}
	
	//날짜 선택을 안했다면
	if(dtOpt == ''){
		chgFilter1();
	}else{ //날짜를 선택했다면
		dtSelect1();
		chgFilter1();
	}
}

//중분류 바뀌었을때
function fn_midChg1(e){
	var opt = $("#cmncdNm11").val();
	var dtOpt = $("#orderid-input1").val();
	var midOpt = $("#cmncdNm21").val();
	resetBtn1();
	fn_remove1();
	//전체로 바뀌었다면
	if(midOpt == '전체'){
		bigSe1();
	}else{
		midSe1();
	}
	
	//날짜 선택을 안했다면
	if(dtOpt == ''){
		chgFilter1();
	}else{ //날짜를 선택했다면
		dtSelect1();
		chgFilter1();
	}
}

//날짜 바뀌었을때
function fn_dateChg1(e){
	var opt = $("#cmncdNm11").val();
	var dtOpt = $("#orderid-input1").val();
	var midOpt = $("#cmncdNm21").val();
	resetBtn1();
	fn_remove1();
	dtSelect1();
	
	//대분류 선택을 안했다면
	if(opt == '전체'){
		chgFilter1();
	}else{ //대분류를 선택했다면
		bigSe1();
		//중분류를 선택하지 않았다면
		if(midOpt =='전체'){
			chgFilter1();
		}else{ //중분류를 선택했다면
			midSe1();
			chgFilter1();
		}
	}
}

//reset 이미지 누르면
function fn_reset1(){
	resetBtn1();
	fn_remove1();
	chgFilter1();
	
	$("#orderid-input1").val("");
	$("#cmncdNm11").val("전체");
	const cmncdNm2 = document.querySelector("#cmncdNm21");
	cmncdNm21.options.length = 0;
	let optt = document.createElement("option");
	optt.value = "";
	optt.innerHTML = "중분류 선택";
	cmncdNm21.append(optt);
	$("#cmncdNm21").val("");
}

/* 창고 입고 */
var newArray 	= [];
<c:forEach var="vo" items="${strgList}">
	var jsonObj = new Object();
	jsonObj.strgWrhsId = "${vo.strgWrhsId}";
	jsonObj.brncofcId = "${vo.brncofcId}";
	jsonObj.brncofcNm = "${vo.brncofcNm}";
	jsonObj.prodInfoId = "${vo.prodInfoId}";
	jsonObj.prodInfoNm = "${vo.prodInfoNm}";
	jsonObj.strgWrhsDt = "${vo.strgWrhsDtDisplay}";
	jsonObj.prodInfoPrchsAmt = "${vo.prodInfoPrchsAmtDisplay}";
	jsonObj.wrAmount = "${vo.wrAmount}";
	jsonObj.strgWrhsQty = "${vo.strgWrhsQtyDisplay}";
	jsonObj.cmncdCd = "${vo.cmncdCd}";
	jsonObj.cmncdNm1 = "${vo.cmncdNm1}";
	jsonObj.cmncdNm2 = "${vo.cmncdNm2}";
	
	jsonObj = JSON.stringify(jsonObj);
	console.log("JSON jsonObj : " + jsonObj);
	//String 형태로 파싱한 객체를 다시 json으로 변환
	newArray.push(JSON.parse(jsonObj));
</c:forEach>
	
console.log("창고 입고 원본 배열 : " + newArray);

var jsonArray = newArray;

//초기화버튼 클릭시 원본 배열 가져오는 함수
function resetBtn(){
	jsonArray = newArray;
}

//테이블에 추가할 내용 만드는 함수
function chgFilter(){
	str = "";
	console.log("(창고입고)chgFilter 안 jsonArray.length : " + jsonArray.length);
	for(var i=0; i < jsonArray.length; i++){
		str += '<tr class="arryTd"><td data-org-colspan="1" data-priority="1" data-columns="tech-companies-1-col-1">';
		str += jsonArray[i].strgWrhsId + "</td>";
		str += '<td data-org-colspan="1" data-priority="3" data-columns="tech-companies-1-col-2">';
		str += jsonArray[i].cmncdNm1 + "/" + jsonArray[i].cmncdNm2 + "</td>";
		str += '<td data-org-colspan="1" data-priority="1" data-columns="tech-companies-1-col-3">';
		str += jsonArray[i].prodInfoNm + "</td>";
		str += '<td data-org-colspan="1" data-priority="3" data-columns="tech-companies-1-col-4">';
		str += jsonArray[i].strgWrhsQty + "</td>";
		str += '<td data-org-colspan="1" data-priority="3" data-columns="tech-companies-1-col-5">';
		str += jsonArray[i].prodInfoPrchsAmt + "</td>";
		str += '<td data-org-colspan="1" data-priority="6" data-columns="tech-companies-1-col-6">';
		str += jsonArray[i].wrAmount + "</td>";
		str += '<td data-org-colspan="1" data-priority="6" data-columns="tech-companies-1-col-7">';
		str += jsonArray[i].strgWrhsDt + "</td>";
	}
	$("#tbContent").append(str);
}

//내용 지우기
function fn_remove(){
	$(".arryTd").remove();
}

//대분류가 전체가 아닐때
function bigSe(){
	var opt = $("#cmncdNm1").val();
	jsonArray = jsonArray.reduce((pre, cur) => {
	    if(cur.cmncdNm1 == opt ) pre.push(cur);
	    return pre;
	},[]);
}
//중분류가 전체가 아닐때
function midSe(){
	var midOpt = $("#cmncdNm2").val();
	jsonArray = jsonArray.reduce((pre, cur) => {
	    if(cur.cmncdNm2 == midOpt ) pre.push(cur);
	    return pre;
	},[]);
}
//날짜가 선택됐을때
function dtSelect(){
	var dtOpt = $("#orderid-input").val();
	jsonArray = jsonArray.reduce((pre, cur) => {
	    if(cur.strgWrhsDt == dtOpt ) pre.push(cur);
	    return pre;
	},[]);
}

//대분류 바뀌었을때
function fn_seChg(e){
	var opt = $("#cmncdNm1").val();
	var dtOpt = $("#orderid-input").val();
	var midOpt = $("#cmncdNm2").val();
	resetBtn();
	fn_seChgJs(e);
	fn_remove();
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
	resetBtn();
	fn_remove();
	//전체로 바뀌었다면
	if(midOpt == '전체'){
		bigSe();
	}else{
		midSe();
	}
	
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
	resetBtn();
	fn_remove();
	dtSelect();
	
	//대분류 선택을 안했다면
	if(opt == '전체'){
		chgFilter();
	}else{ //대분류를 선택했다면
		bigSe();
		//중분류를 선택하지 않았다면
		if(midOpt =='전체'){
			chgFilter();
		}else{ //중분류를 선택했다면
			midSe();
			chgFilter();
		}
	}
}

//reset 이미지 누르면
function fn_reset(){
	resetBtn();
	fn_remove();
	chgFilter();
	
	$("#orderid-input").val("");
	$("#cmncdNm1").val("전체");
	const cmncdNm2 = document.querySelector("#cmncdNm2");
	cmncdNm2.options.length = 0;
	let optt = document.createElement("option");
	optt.value = "";
	optt.innerHTML = "중분류 선택";
	cmncdNm2.append(optt);
	$("#cmncdNm2").val("");
}

$(function(){
	chgFilter();
	chgFilter1();
})

</script>
<style>
	th,td{
		text-align: center;
	}
	.nnii{
		float: right;
		width:83%;
	}
	.miio{
		width: 100%;
	}
	.filDiv{
	}
	#startDay{
		float: left;
	}
	.fillll{
		display: inline-block;
	}
	.filt{
		padding-left: 20px;
	}
	#irconre{
 		padding-right : 50px;
	}
	.btn-toolbar{
		padding: 0px 10px 0px 10px;
	}
</style>
<div class="container-fluid">

<!-- start page title -->
<div class="row">
    <div class="col-12">
        <div class="page-title-box d-sm-flex align-items-center justify-content-between">
            <h4 class="mb-sm-0 font-size-18">${name} 입고</h4>

            <div class="page-title-right">
                <ol class="breadcrumb m-0">
                    <li class="breadcrumb-item"><a href="javascript: void(0);">${name} 입고</a></li>
                    <li class="breadcrumb-item active">매장 및 창고</li>
                </ol>
            </div>

        </div>
    </div>
</div>
<!-- end page title -->

<div class="row">
	
	<div class="col-xl-6">
		<div class="card">
		<h4 class="card-title" style="margin:20px 20px;">매장입고</h4>
		<div class="row filt" data-select2-id="13">
	        <div class="col-xl col-sm-6 semmi">
	            <div class="mb-3">
	            	<br>
	                <h5 class="font-size-14 mb-3">대분류</h5>
					    <select id="cmncdNm11" name="cmncdNm1" class="form-select seSelect" onchange="fn_seChg1(this)" style="width:185px;">
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
	            </div>
	        </div>
	
	        <div class="col-xl col-sm-6 semmi">
	            <div class="mb-3">
	            	<br>
	            	<h5 class="font-size-14 mb-3">중분류</h5>
				    <select id="cmncdNm21" name="cmncdNm2" class="form-select seSelect" onchange="fn_midChg1(this)" style="width:185px;">
				    	 <option value="중분류 선택" label="중분류 선택"/>
				    </select>	            
	            </div>
	        </div>
	
	        <div class="col-xl col-sm-6 semmi">
	            <div class="mb-3">
	            	<br>
	            	<h5 class="font-size-14 mb-3">날짜</h5>
					<input type="text" class="form-control" id="orderid-input1" placeholder="Select date" data-date-format="yyyy-mm-dd" data-date-orientation="bottom auto" data-provide="datepicker" data-date-autoclose="true" onchange="fn_dateChg1(this)" style="width:185px;">	            
	            </div>
	        </div>
	
	        <div class="col-xl col-sm-6" data-select2-id="12">
	            <div class="mb-3" data-select2-id="11">
	            	<br>
	            	<br>
	            	<a href="javascript: void(0);" onclick="fn_reset1()" id="rrload"><i id="irconre" class="mdi mdi-backup-restore mdi-36px"></i></a>
	            </div>
	        </div>
			<hr class="mt-2" style="width:765px;">
	    </div>
		
			<div class="col-lg-12">
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
										    <th data-priority="3" id="tech-companies-1-col-4">입고수량</th>
										    <th data-priority="3" id="tech-companies-1-col-5">개당가격</th>
										    <th data-priority="6" id="tech-companies-1-col-6">총액</th>
										    <th data-priority="6" id="tech-companies-1-col-7">입고일</th>
										</tr>
									</thead>
									<tbody id="tbContent1">
									</tbody>
								</table>
		</div></div></div></div>
		</div>
	</div>
	<div class="col-xl-6">
		<div class="card">
		<h4 class="card-title" style="margin:20px 20px;">창고입고</h4>
		<div class="row filt" data-select2-id="13">
	        <div class="col-xl col-sm-6 semmi">
	            <div class="mb-3">
	            	<br>
	                <h5 class="font-size-14 mb-3">대분류</h5>
					    <select id="cmncdNm1" name="cmncdNm1" class="form-select seSelect" onchange="fn_seChg(this)" style="width:185px;">
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
	            </div>
	        </div>
	
	        <div class="col-xl col-sm-6 semmi">
	            <div class="mb-3">
	            	<br>
	            	<h5 class="font-size-14 mb-3">중분류</h5>
				    <select id="cmncdNm2" name="cmncdNm2" class="form-select seSelect" onchange="fn_midChg(this)" style="width:185px;">
				    	 <option value="중분류 선택" label="중분류 선택"/>
				    </select>	            
	            </div>
	        </div>
	
	        <div class="col-xl col-sm-6 semmi">
	            <div class="mb-3">
	            	<br>
	            	<h5 class="font-size-14 mb-3">날짜</h5>
					<input type="text" class="form-control" id="orderid-input" placeholder="Select date" data-date-format="yyyy-mm-dd" data-date-orientation="bottom auto" data-provide="datepicker" data-date-autoclose="true" onchange="fn_dateChg(this)" style="width:185px;">	            
	            </div>
	        </div>
	
	        <div class="col-xl col-sm-6" data-select2-id="12">
	            <div class="mb-3" data-select2-id="11">
	            	<br>
	            	<br>
	            	<a href="javascript: void(0);" onclick="fn_reset()" id="rrload"><i id="irconre" class="mdi mdi-backup-restore mdi-36px"></i></a>
	            </div>
	        </div>
			<hr class="mt-2" style="width:765px;">
	    </div>
		
			<div class="col-lg-12">
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
										    <th data-priority="3" id="tech-companies-1-col-4">입고수량</th>
										    <th data-priority="3" id="tech-companies-1-col-5">개당가격</th>
										    <th data-priority="6" id="tech-companies-1-col-6">총액</th>
										    <th data-priority="6" id="tech-companies-1-col-7">입고일</th>
										</tr>
									</thead>
									<tbody id="tbContent">
									</tbody>
								</table>
		</div></div></div></div>
		</div>
	</div>
</div>
              <!-- end row -->
</div>