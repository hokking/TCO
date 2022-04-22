<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src="/resources/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
/* 수주O목록부터 */
var newArray1 	= [];
<c:forEach var="vo" items="${Y}">
	var jsonObj = new Object();
	jsonObj.ordrId = "${vo.ordrId}";
	jsonObj.brncofcNm = "${vo.brncofcNm}";
	jsonObj.ordrDt = "${vo.ordrDtDisplay}";
	
	jsonObj = JSON.stringify(jsonObj);
	console.log("JSON jsonObj : " + jsonObj);
	//String 형태로 파싱한 객체를 다시 json으로 변환
	newArray1.push(JSON.parse(jsonObj));
</c:forEach>
	
console.log("창고 출고 원본 배열 : " + newArray1);

var jsonArray1 = newArray1;

//초기화버튼 클릭시 원본 배열 가져오는 함수
function resetBtn1(){
	jsonArray1 = newArray1;
	$(".arryTd1").remove();
}

//테이블에 추가할 내용 만드는 함수
var str = "";
function chgFilter1(){
	str = "";
	console.log("chgFilter 안 jsonArray.length : " + jsonArray1.length);
	for(var i=0; i < jsonArray1.length; i++){
		str += '<tr class="arryTd1"><td data-org-colspan="1" data-priority="1" data-columns="tech-companies-1-col-1">';
		str += i + 1 + "</td>";
		str += '<td data-org-colspan="1" data-priority="3" data-columns="tech-companies-1-col-2">';
		str += jsonArray1[i].ordrId + "</td>";
		str += '<td data-org-colspan="1" data-priority="1" data-columns="tech-companies-1-col-3">';
		str += jsonArray1[i].brncofcNm + "</td>";
		str += '<td data-org-colspan="1" data-priority="3" data-columns="tech-companies-1-col-4">';
		str += jsonArray1[i].ordrDt + "</td>";
		str += '<td><a href="/strgstck/ordrDetail?ordrId='+jsonArray1[i].ordrId +'" class="btn btn-primary btn-sm btn-rounded">상세보기</a></td></tr>';
	}
	$("#yCont").append(str);
}

/* 수주X목록 */
var newArray 	= [];
<c:forEach var="vo" items="${N}">
	var jsonObj = new Object();
	jsonObj.ordrId = "${vo.ordrId}";
	jsonObj.brncofcNm = "${vo.brncofcNm}";
	jsonObj.ordrDt = "${vo.ordrDtDisplay}";
	
	jsonObj = JSON.stringify(jsonObj);
	console.log("JSON jsonObj : " + jsonObj);
	//String 형태로 파싱한 객체를 다시 json으로 변환
	newArray.push(JSON.parse(jsonObj));
</c:forEach>
	
console.log("창고 출고 원본 배열 : " + newArray);

var jsonArray = newArray;

//초기화버튼 클릭시 원본 배열 가져오는 함수
function resetBtn(){
	jsonArray = newArray;
	$(".arryTd").remove();
}

//테이블에 추가할 내용 만드는 함수
var str = "";
function chgFilter(){
	str = "";
	console.log("chgFilter 안 jsonArray.length : " + jsonArray.length);
	for(var i=0; i < jsonArray.length; i++){
		str += '<tr class="arryTd"><td data-org-colspan="1" data-priority="1" data-columns="tech-companies-1-col-1">';
		str += i + 1 + "</td>";
		str += '<td data-org-colspan="1" data-priority="3" data-columns="tech-companies-1-col-2">';
		str += jsonArray[i].ordrId + "</td>";
		str += '<td data-org-colspan="1" data-priority="1" data-columns="tech-companies-1-col-3">';
		str += jsonArray[i].brncofcNm + "</td>";
		str += '<td data-org-colspan="1" data-priority="3" data-columns="tech-companies-1-col-4">';
		str += jsonArray[i].ordrDt + "</td>";
		str += '<td><a href="/strgstck/ordrDetail?ordrId='+jsonArray[i].ordrId +'" class="btn btn-primary btn-sm btn-rounded">상세보기</a></td></tr>';
	}
	$("#nCont").append(str);
}


$(function(){
	chgFilter();
	chgFilter1();
	
	$("#brncofc").on('change',function(){
		var op = document.querySelector("#brncofc");
		var opt = op.value;
		resetBtn();
		resetBtn1();
		if(opt != '전체'){
	 		jsonArray1 = jsonArray1.reduce((pre, cur) => {
	 		    if(cur.brncofcNm == opt ) pre.push(cur);
	 		    return pre;
	 		},[]);
	 		console.log("jsonArray1 : " + jsonArray1);
	 		jsonArray = jsonArray.reduce((pre, cur) => {
	 		    if(cur.brncofcNm == opt ) pre.push(cur);
	 		    return pre;
	 		},[]);
	 		console.log("jsonArray : " + jsonArray);
	 	}
		chgFilter();
		chgFilter1();
	})
	
})
</script>
<style type="text/css">
.btn-toolbar {
	display : none;
}
td,th{
	text-align: center;
}
</style>
<script src="/resources/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
</script>

 <!-- start page title -->
 <div class="row">
     <div class="col-12">
         <div class="page-title-box d-sm-flex align-items-center justify-content-between">
             <h1 class="mb-sm-0 font-size-20">📜수주</h1>

             <div class="page-title-right">
                 <ol class="breadcrumb m-0">
                     <li class="breadcrumb-item"><a href="javascript: void(0);">재고</a></li>
                     <li class="breadcrumb-item active">지점의 발주 목록</li>
                 </ol>
             </div>
         </div>
     </div>
 </div>
 <!-- end page title -->

 <div class="row">
     <div class="col-12">
         <div class="card">
             <div class="card-body">
             <div class="row filt" data-select2-id="13">
	        <div class="col-xl col-sm-6 semmi">
	            <div class="mb-3" style="padding-left:10px;">
	                <h5 class="font-size-14 mb-3">지점</h5>
					    <select id="brncofc" name="brncofc" class="form-select seSelect" style="width:185px;">
					        <option value="전체" label="전체" />
					    	<c:forEach var="brn" items="${brnc}">
						        <option value="${brn.brncofcNm}" label="${brn.brncofcNm}"/>
							</c:forEach>
					    </select>
	            </div>
	        </div>
	
	    </div>
                 <div class="row mb-2">
                     <div class="col-sm-4">
                         <div class="search-box me-2 mb-2 d-inline-block">
                             <div class="position-relative">
                             </div>
                         </div>
                     </div>
                     <div class="col-sm-8">
                         <div class="text-sm-end">
                         </div>
                     </div><!-- end col-->
                 </div>
               <!-- Nav tabs -->
               <!-- 아직 수주하지 않은 발주 -->
               <ul class="nav nav-tabs nav-tabs-custom" role="tablist">
                   <li class="nav-item">
                       <a class="nav-link active" data-bs-toggle="tab" href="#brnOrdr" role="tab">
                           <span class="d-none d-sm-block">지점 발주</span> 
                       </a>
                   </li>
                   <!-- 수주한 발주 -->
                   <li class="nav-item">
                       <a class="nav-link" data-bs-toggle="tab" href="#brnOrdrN" role="tab">
                           <span class="d-none d-sm-block">수주처리</span> 
                       </a>
                   </li>
               </ul>

               <!-- Tab panes -->
               <!-- 아직 수주하지 않은 발주 -->
               <div class="tab-content p-3">
                   <div class="tab-pane active" id="brnOrdr" role="tabpanel">
					<div class="table">
					<table id="tech-companies-1" class="table">
						<thead class="table-light">
		                        <tr>
		                            <th class="align-middle">순번</th>
		                            <th class="align-middle">발주번호</th>
		                            <th class="align-middle">발주지점</th>
		                            <th class="align-middle">발주일</th>
		                            <th class="align-middle">상세보기</th>
		                        </tr>
	                    </thead>
	                    <tbody id="nCont">
	                    </tbody>
					</table>
                 </div>
                   </div>
                   <!-- 수주한 발주 -->
                   <div class="tab-pane" id="brnOrdrN" role="tabpanel">
					  <div class="table">
						<table id="tech-companies-1" class="table">
							<thead class="table-light">
	                             <tr>
	                                 <th class="align-middle">순번</th>
	                                 <th class="align-middle">발주번호</th>
	                                 <th class="align-middle">발주지점</th>
	                                 <th class="align-middle">발주일</th>
	                                 <th class="align-middle">상세보기</th>
	                             </tr>
	                         </thead>
	                         <tbody id="yCont">
	                         </tbody>
						</table>
                 </div>
               </div>
             </div>
         </div>
         <!-- end card -->
     </div>
 </div>
 </div>
 <!-- end row -->
 
<script src="assets/libs/datatables.net/js/jquery.dataTables.min.js"></script>
<script src="assets/libs/datatables.net-bs4/js/dataTables.bootstrap4.min.js"></script>
<script src="assets/js/pages/datatables.init.js"></script>
<script src="assets/js/app.js"></script>
