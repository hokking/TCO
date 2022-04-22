<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>거래처 목록</title>
<style type="text/css">
.btn-toolbar {
	display : none;
}
.deleteCnpt{
	cursor : pointer;
	border : none;
	background-color: white;
}


</style>
</head>
<script src="/resources/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">

function commentList(currentPage, keyWord) {
	console.log($(".tab-pane").attr('id'));
	var gb = $(".tab-pane").attr('id');
	var url = '';
	if(gb = 'cnpt') {
		url = '/cust/custlist';
	} else if(gb = 'cnptN') {
		url = '/cust/custlist1';
	}
	
// 	alert(currentPage, keyWord);
	$.ajax({
		url : url,
		type : 'POST',
		data : {
			'currentPage' : currentPage,
			'keyWord' : keyWord
		},
		dataType:"json",
		success : function(data) {
			console.log(data);
			aaa(data, keyWord);
		}
	});
}

function deleteCnpt(){
	var cnptId = $(".deleteCnpt").val();
	let answer = confirm("거래중단 하시겠습니까?");
	
	if(answer){
		//ajax 처리하기	
	}
}
$(function(){
	//거래처 삭제
	$(".deleteCnpt").on("click", function(){
		deleteCnpt();
	});
	

});

</script>

<body>
 <!-- start page title -->
 <div class="row">
     <div class="col-12">
         <div class="page-title-box d-sm-flex align-items-center justify-content-between">
             <h1 class="mb-sm-0 font-size-20">🏢거래처 조회</h1>

             <div class="page-title-right">
                 <ol class="breadcrumb m-0">
                     <li class="breadcrumb-item"><a href="javascript: void(0);">거래처/상품</a></li>
                     <li class="breadcrumb-item active">거래처조회</li>
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
                 <div class="row mb-2">
                     <div class="col-sm-4">
                         <div class="search-box me-2 mb-2 d-inline-block">
                             <div class="position-relative">
                                 <input type="text" class="form-control" placeholder="Search...">
                                 <i class="bx bx-search-alt search-icon"></i>
                             </div>
                         </div>
                     </div>
                     <div class="col-sm-8">
                         <div class="text-sm-end">
                             <a href="/cnpt/insert" class="btn btn-success btn-rounded waves-effect waves-light mb-2 me-2"><i class="mdi mdi-plus me-1"></i> 거래처 등록</a>
                         </div>
                     </div><!-- end col-->
                 </div>
               <!-- Nav tabs -->
               <!-- 거래중인 거래처 -->
               <ul class="nav nav-tabs nav-tabs-custom" role="tablist">
                   <li class="nav-item">
                       <a class="nav-link active" data-bs-toggle="tab" href="#cnpt" role="tab">
                           <span class="d-none d-sm-block">거래처</span> 
                       </a>
                   </li>
                   <!-- 거래중단 거래처 -->
                   <li class="nav-item">
                       <a class="nav-link" data-bs-toggle="tab" href="#cnptN" role="tab">
                           <span class="d-none d-sm-block">거래중단 거래처</span> 
                       </a>
                   </li>
               </ul>

               <!-- Tab panes -->
               <!-- 거래중인 거래처 -->
               <div class="tab-content p-3">
                   <div class="tab-pane active" id="cnpt" role="tabpanel">
					<div class="table">
                     <table class="table align-middle table-nowrap table-check cnpt">
                         <thead class="table-light">
                             <tr>
                                 <th style="width: 20px;" class="align-middle">
                                     <div class="form-check font-size-16">
                                         <input class="form-check-input" type="checkbox" id="checkAll">
                                         <label class="form-check-label" for="checkAll"></label>
                                     </div>
                                 </th>
                                 <th class="align-middle">거래처아이디</th>
                                 <th class="align-middle">거래처명</th>
                                 <th class="align-middle">거래처 주소</th>
                                 <th class="align-middle">담당자명</th>
                                 <th class="align-middle">담당자 이메일</th>
                                 <th class="align-middle">상세보기</th>
                                 <th class="align-middle">거래중단</th>
                             </tr>
                         </thead>
                         <tbody>
                         	<c:forEach var="cnptVO" items="${list.content}">
                             <tr>
                                 <td>
                                     <div class="form-check font-size-16">
                                         <input class="form-check-input" type="checkbox" id="orderidcheck01">
                                         <label class="form-check-label" for="orderidcheck01"></label>
                                     </div>
                                 </td>
                                 <!-- 순번 -->
                                 <td>${cnptVO.cnptId}</td>
                                 <td><a href="/cnpt/detail/${cnptVO.cnptId}" class="text-body fw-bold">${cnptVO.cnptNm}</a></td>
                                 <td>
                                     ${cnptVO.cnptAddr}&nbsp;${cnptVO.cnptDaddr}
                                 </td>
                                 <td>
                                     ${cnptVO.cnptCharger}
                                 </td>
                                 <td>
                                 	${cnptVO.cnptMail}
<!--                                      <span class="badge badge-pill badge-soft-success font-size-12">Paid</span> -->
                                 </td>
                                 <td>
                                     <!-- Button trigger modal -->
                                     <a href="/cnpt/detail/${cnptVO.cnptId}" class="btn btn-primary btn-sm btn-rounded">상세보기</a>
                                 </td>
                                 <td>
                                     <div>
                                         <button type="button" class="text-danger deleteCnpt" value="${cnptVO.cnptId}"><i class="mdi mdi-delete font-size-18"></i></button>
                                     </div>
                                 </td>
                             </tr>
                         	</c:forEach>
                         </tbody>
                     </table>
                 </div>
                 <div id="b">
                 <ul class="pagination pagination-rounded justify-content-end mb-2">
                     <li class="page-item disabled <c:if test='${list.startPage<6}'>disabled</c:if>" > <!-- 페이지가 6이 넘으면 disabled 지워야댐 -->
                         <a class="page-link" href="/cnpt/list?currentPage=${list.startPage-5}" aria-label="Previous">
                             <i class="mdi mdi-chevron-left"></i>
                         </a>
                     </li>
                     
                     <c:forEach var="pNo" begin="${list.startPage}" end="${list.endPage}" step="1">
	                     <li class="page-item <c:if test='${list.currentPage eq pNo}'>active</c:if>">
	                     	<a class="page-link" href="/cnpt/list?currentPage=${pNo}">${pNo}</a>
	                   	</li>
                   	</c:forEach>
                     <li class="page-item <c:if test='${list.endPage>=list.totalPages}'>disabled</c:if> ">
                         <a class="page-link" href="/cnpt/list?currentPage=${list.startPage+5}" aria-label="Next">
                             <i class="mdi mdi-chevron-right"></i>
                         </a>
                     </li>
                 </ul>
                 </div>
                   </div>
                   <!-- 거래중단 거래처 -->
                   <div class="tab-pane" id="cnptN" role="tabpanel">
					<div class="table">
                     <table class="table align-middle table-nowrap table-check">
                         <thead class="table-light">
                             <tr>
                                 <th style="width: 20px;" class="align-middle">
                                     <div class="form-check font-size-16">
                                         <input class="form-check-input" type="checkbox" id="checkAll">
                                         <label class="form-check-label" for="checkAll"></label>
                                     </div>
                                 </th>
                                 <th class="align-middle">거래처아이디</th>
                                 <th class="align-middle">거래처명</th>
                                 <th class="align-middle">거래처 주소</th>
                                 <th class="align-middle">담당자명</th>
                                 <th class="align-middle">담당자 이메일</th>
                                 <th class="align-middle">상세보기</th>
                             </tr>
                         </thead>
                         <tbody>
                         	<c:forEach var="stpCnptVO" items="${list1.content}">
                             <tr>
                                 <td>
                                     <div class="form-check font-size-16">
                                         <input class="form-check-input" type="checkbox" id="orderidcheck01">
                                         <label class="form-check-label" for="orderidcheck01"></label>
                                     </div>
                                 </td>
                                 <td>${stpCnptVO.cnptId}</td>
                                 <td><a href="/cnpt/detail/${stpCnptVO.cnptId}" class="text-body fw-bold">${stpCnptVO.cnptNm}</a></td>
                                 <td>
                                     ${stpCnptVO.cnptAddr}&nbsp;${stpCnptVO.cnptDaddr}
                                 </td>
                                 <td>
                                     ${stpCnptVO.cnptCharger}
                                 </td>
                                 <td>
                                 	${stpCnptVO.cnptMail}
<!--                                      <span class="badge badge-pill badge-soft-success font-size-12">Paid</span> -->
                                 </td>
                                 <td>
                                     <!-- Button trigger modal -->
                                     <a href="/cnpt/detail/${stpCnptVO.cnptId}" class="btn btn-primary btn-sm btn-rounded">상세보기</a>
                                 </td>
                             </tr>
                         	</c:forEach>
                         </tbody>
                     </table>
                 </div>
                 <div id="b">
               <ul class="pagination pagination-rounded justify-content-end mb-2">
                    <li class="page-item <c:if test='${list1.startPage<6}'>disabled</c:if>">
                        <a class="page-link" aria-controls="DataTables_Table_0" onclick="commentList(${list1.startPage-5}, ${param.keyWord})" aria-label="Previous">
                            <i class="mdi mdi-chevron-left"></i>
                        </a>
                    </li>
                    <c:forEach var="pNo" begin="${list1.startPage}" end="${list1.endPage}" step="1">
	                    <li class="page-item <c:if test='${list1.currentPage eq pNo}'>active</c:if> " >
	                        <button class="page-link" aria-controls="DataTables_Table_0" onclick="commentList(${pNo}, ${param.keyWord})">${pNo}</button>
	                    </li>       
                    </c:forEach> 
                    <li class="page-item <c:if test='${list1.endPage>=list1.totalPages}'>disabled</c:if>">
                        <a class="page-link" aria-controls="DataTables_Table_0" onclick="commentList(${list1.startPage+5}, ${param.keyWord})" aria-label="Next">
                            <i class="mdi mdi-chevron-right"></i>
                        </a>
                    </li>
                </ul>
                </div>
                   </div>
               </div>
             </div>
         </div>
         <!-- end card -->
     </div>
 </div>
 <!-- end row -->

</body>
<script src="assets/libs/datatables.net/js/jquery.dataTables.min.js"></script>
<script src="assets/libs/datatables.net-bs4/js/dataTables.bootstrap4.min.js"></script>
<script src="assets/js/pages/datatables.init.js"></script>
<script src="assets/js/app.js"></script>
</html>