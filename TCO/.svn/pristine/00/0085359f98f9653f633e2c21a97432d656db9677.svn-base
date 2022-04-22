<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>고객 목록</title>
<style type="text/css">
.btn-toolbar {
	display : none;
}
.deleteCust{
	cursor : pointer;
	border : none;
	background-color: white;
}
</style>
</head>
<script type="text/javascript">
function commentList(currentPage, keyWord) {
	console.log($(".tab-pane").attr('id'));
	var gb = $(".tab-pane").attr('id');
	var url = '';
	if(gb = 'cust') {
		url = '/cust/custlist';
	} else if(gb = 'custH') {
		url = '/cust/custlist1';
	} else {
		url = '/cust/custlist2';
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


function aaa(data, keyWord) {
	var a = '';
	var b = '';
	var cp = data.currentPage;
	var sp = data.startPage;
	var ep = data.endPage;
	var content = data.content;

	a += '<table class="table align-middle table-nowrap table-check">';
	a += '<thead class="table-light">';
	a += '<tr>';
	a += '<th class="align-middle">#</th>';
	a += '<th class="align-middle">고객번호</th>';
	a += '<th class="align-middle">고객명</th>';
	a += '<th class="align-middle">전화번호</th>';
	a += '<th class="align-middle">이메일</th>';
	a += '<th class="align-middle">등급</th>';
	a += '<th class="align-middle">상세보기</th>';
	a += '<th class="align-middle">고객 QR 코드</th>';
	a += '<th class="align-middle">탈퇴</th>';
	a += '</tr>';
	a += '</thead>';
	a += '<tbody>';
	$.each(content, function(i, custVO) {
		console.log("data : " + content);
		console.log(cp + "," + sp + "," + ep);
		a += '<tr>';
		a += '<td>' + custVO.rnum + '</td>';
		a += '<td><a href="/cust/custdetail/' + custVO.custId + '" class="text-body fw-bold">' + custVO.custId + '</a></td>';
		a += '<td>' + custVO.custNm + '</td>';
		a += '<td>' + custVO.custTel + '</td>';
		a += '<td>' + custVO.custMail + '</td>';
		a += '<td>';
		if(custVO.cmncdNm1 == 'SILVER') {
			a += '<span class="badge badge-soft-dark font-size-12">' + custVO.cmncdNm1 + '</span>';
		} else if(custVO.cmncdNm1 == 'GOLD') {
		 	a += '<span class="badge bg-warning font-size-12">' + custVO.cmncdNm1 + '</span>';
		} else if(custVO.cmncdNm1 == 'VIP') {
		 	a += '<span class="badge bg-info font-size-12">' + custVO.cmncdNm1 + '</span>';
		}
		a += '</td>';
		a += '<td>';
		a += '<a href="/cust/custdetail/' + custVO.custId + '" class="btn btn-primary btn-sm btn-rounded">상세보기</a>';
		a += '</td>';
		a += '<td data-org-colspan="1" data-priority="6" data-columns="tech-companies-1-col-6"><a href="#" onclick="window.open' + "('https:\/\/chart.apis.google.com/chart?cht=qr&chl=" + custVO.custId + "&chld=L|2&chs=200','name','resizable=no width=400 height=400');" + 'return false">고객QR생성</a>';
		a += '</td>';
		a += '<td>';
		a += '<div>';
		a += '<button type="button" class="text-danger deleteCust" value="' + custVO.custId + '"><i class="mdi mdi-delete font-size-18"></i></button>';
		a += '</div>';
		a += '</td>';
		a += '</tr>';
	});
	a += '<tbody>';
	a += '<thead>';
	
	b += '<ul class="pagination pagination-rounded justify-content-end mb-2">';
	b += '<li class="page-item ';
	if(sp < 6) {
		b += 'disabled';
	}
	b += '">';
	b += '<button class="page-link" aria-controls="DataTables_Table_0" onclick="commentList(' + (sp-5) + ', ' + keyWord + ')" aria-label="Previous"><i class="mdi mdi-chevron-left"></i>';
	b += '</a>';
	b += '</li>';
	for (var num=sp; num<=ep; num++) {
		b += '<li class="page-item ';
		if(cp == num) {
			b += 'active';
		}
		b += '">';
		b += '<button class="page-link" aria-controls="DataTables_Table_0" onclick="commentList(' + num + ', ' + keyWord + ')">' + num + '</button>';
		b += '</li>';
	}
	b += '<li class="page-item ';
	if(ep >= data.totalPages) {
		b += 'disabled';
	}
	b += '">';
	b += '<button class="page-link" aria-controls="DataTables_Table_0" onclick="commentList(' + (sp+5) + ', ' + keyWord + ')" aria-label="Next"><i class="mdi mdi-chevron-right"></i>';
	b += '</a>';
	b += '</li>';
	b += '</ul>';
       
       
	$('#a').html(a);
	$('#b').html(b);
}

function delCust() {
	var custId = $(".deleteCust").val();
	Swal.fire({
		title : "탈퇴하시겠습니까?",
		type : "warning",
		showCancelButton : true,
		confirmButtonText : "탈퇴",
		cancelButtonText : "취소",
	}).then(result => {
		if (result.isConfirmed) {
			$.ajax({
			    type: "POST",
			    url : "/cust/custdelete?custId=" + custId,
			    contentType : "application/x-www-form-urlencoded; charset=utf-8",
			    dataType : "json",
			    success : function(data){
			    	console.log("data뭐노?" + data);
			    	var res = parseInt(data);
			    	
			        if(res > 0){
			        // Sweet Alert
			          Swal.fire({
				          icon:'success',
				          title:'탈퇴 성공',
			       		}).then(function(){
			       			window.location.reload();
			       		})
			        }else{
			        	//Ajax 실패시
				    	Swal.fire({
				          icon:'error',
				          title:'탈퇴 실패',
			       		}, function(){
			       			//새로고침
			       			window.location.reload();
			       		});
			        }
					
			        
			    },
			    error : function(){
			        //Ajax 실패시
			    	Swal.fire({
			          icon:'error',
			          title:'탈퇴 실패',
		       		}, function(){
		       			//새로고침
		       			window.location.reload();
		       		});
			    }
			});
		} else {
			location.href="/cust/custlist";
		}

	});
}

$(function(){
	//거래처 삭제
	$(".deleteCust").on("click", function(){
		delCust();
	});
	
});
</script>

<body>
 <!-- start page title -->
 <div class="row">
     <div class="col-12">
         <div class="page-title-box d-sm-flex align-items-center justify-content-between">
             <h1 class="mb-sm-0 font-size-20">👭고객 조회</h1>

             <div class="page-title-right">
                 <ol class="breadcrumb m-0">
                     <li class="breadcrumb-item"><a href="javascript: void(0);">고객</a></li>
                     <li class="breadcrumb-item active">고객조회</li>
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
                    <div class="col-sm-8" style="width: 70%;">
                	<form name="frm" id="frm" action="/cust/custlist" method="get">
                        <div class="search-box me-2 mb-2 d-inline-block">
                            <div class="position-relative">
                                <input name="keyWord" id="keyWord" type="text" value="${param.keyWord}" class="form-control" placeholder="Search..." style="float: left; width: 70%;">
                                <i class="bx bx-search-alt search-icon"></i>
                                <button type="submit" class="btn btn-secondary btn-rounded waves-effect waves-light" style="width: 30%;">검색</button>
                            </div>
                        </div>
                    </form>
                    </div>
                </div>
               <!-- Nav tabs -->
               <ul class="nav nav-tabs nav-tabs-custom" role="tablist">
	               <!-- 회원상태 - 일반 -->
                   <li class="nav-item">
                       <a class="nav-link active" data-bs-toggle="tab" href="#cust" role="tab">
                           <span class="d-none d-sm-block"> 일반</span> 
                       </a>
                   </li>
	               <!-- 회원상태 - 휴면 -->
                   <li class="nav-item">
                       <a class="nav-link" data-bs-toggle="tab" href="#custH" role="tab">
                           <span class="d-none d-sm-block"> 휴면</span> 
                       </a>
                   </li>
	               <!-- 회원상태 - 탈퇴 -->
                   <li class="nav-item">
                       <a class="nav-link" data-bs-toggle="tab" href="#custT" role="tab">
                           <span class="d-none d-sm-block"> 탈퇴</span> 
                       </a>
                   </li>
               </ul>

               <!-- Tab panes -->
               <!-- 일반 고객 -->
               <div class="tab-content p-3">
                   <div class="tab-pane active" id="cust" role="tabpanel">
					<div class="table-responsive" id="a">
                     <table class="table align-middle table-nowrap table-check">
                         <thead class="table-light">
                             <tr>
                                 <th class="align-middle">#</th>
                                 <th class="align-middle">고객번호</th>
                                 <th class="align-middle">고객명</th>
                                 <th class="align-middle">전화번호</th>
                                 <th class="align-middle">이메일</th>
                                 <th class="align-middle">등급</th>
                                 <th class="align-middle">상세보기</th>
                                 <th class="align-middle">고객 QR 코드</th>
                                 <th class="align-middle">탈퇴</th>
                             </tr>
                         </thead>
                         <tbody>
                         	<c:set var="i" value="${list.currentPage*7-6-1}" />
                         	<c:forEach var="custVO" items="${list.content}">
                             <tr>
                                 <!-- 순번 -->
                                 <td>${custVO.rnum}</td>
                                 <td><a href="/cust/custdetail/${custVO.custId}" class="text-body fw-bold">${custVO.custId}</a></td>
                                 <td>${custVO.custNm}</td>
                                 <td>${custVO.custTel}</td>
                                 <td>${custVO.custMail}</td>
                                 <td>
                                	<c:if test="${custVO.cmncdNm1 eq 'SILVER'}">
                                	<span class="badge badge-soft-dark font-size-12">${custVO.cmncdNm1}</span></c:if>
                                	<c:if test="${custVO.cmncdNm1 eq 'GOLD'}">
                                	<span class="badge bg-warning font-size-12">${custVO.cmncdNm1}</span></c:if>
                                	<c:if test="${custVO.cmncdNm1 eq 'VIP'}">
                                	<span class="badge bg-info font-size-12">${custVO.cmncdNm1}</span></c:if>
                                 </td>
                                 <td>
                                     <!-- Button trigger modal -->
                                     <a href="/cust/custdetail/${custVO.custId}" class="btn btn-primary btn-sm btn-rounded">상세보기</a>
                                 </td>
                               	 <td data-org-colspan="1" data-priority="6" data-columns="tech-companies-1-col-6"><a href="#" onclick="window.open('https://chart.apis.google.com/chart?cht=qr&chl=${custVO.custId}&chld=L|2&chs=200','name','resizable=no width=400 height=400');return false">고객QR생성</a>
                               	 </td>
                                 <td>
                                     <div>
                                         <button type="button" class="text-danger deleteCust" value="${custVO.custId}"><i class="mdi mdi-delete font-size-18"></i></button>
                                     </div>
                                 </td>
                             </tr>
                         	</c:forEach>
                         </tbody>
                     </table>
                 </div>
                 <!-- 페이징처리 시작 -->
                 <div id="b">
                <ul class="pagination pagination-rounded justify-content-end mb-2">
                    <li class="page-item <c:if test='${list.startPage<6}'>disabled</c:if>">
                        <a class="page-link" aria-controls="DataTables_Table_0" onclick="commentList(${list.startPage-5}, ${param.keyWord})" aria-label="Previous">
                            <i class="mdi mdi-chevron-left"></i>
                        </a>
                    </li>
                    <c:forEach var="pNo" begin="${list.startPage}" end="${list.endPage}" step="1">
	                    <li class="page-item <c:if test='${list.currentPage eq pNo}'>active</c:if> " >
	                        <button class="page-link" aria-controls="DataTables_Table_0" onclick="commentList(${pNo}, ${param.keyWord})">${pNo}</button>
	                    </li>       
                    </c:forEach> 
                    <li class="page-item <c:if test='${list.endPage>=list.totalPages}'>disabled</c:if>">
                        <a class="page-link" aria-controls="DataTables_Table_0" onclick="commentList(${list.startPage+5}, ${param.keyWord})" aria-label="Next">
                            <i class="mdi mdi-chevron-right"></i>
                        </a>
                    </li>
                </ul>
                </div>
                <!-- 페이징처리 끝 -->
                   </div>
                   <!-- 휴면 고객 -->
                   <div class="tab-pane" id="custH" role="tabpanel">
					<div class="table-responsive" id="a">
                     <table class="table align-middle table-nowrap table-check">
                         <thead class="table-light">
                             <tr>
                                 <th class="align-middle">#</th>
                                 <th class="align-middle">고객번호</th>
                                 <th class="align-middle">고객명</th>
                                 <th class="align-middle">전화번호</th>
                                 <th class="align-middle">이메일</th>
                                 <th class="align-middle">등급</th>
                                 <th class="align-middle">상세보기</th>
                                 <th class="align-middle">고객 QR 코드</th>
                                 <th class="align-middle">탈퇴</th>
                             </tr>
                         </thead>
                         <tbody>
                         	<c:set var="i" value="${list1.currentPage*7-6-1}" />
                         	<c:forEach var="custVO" items="${list1.content}">
                             <tr>
                                 <!-- 순번 -->
                                 <td>${custVO.rnum}</td>
                                 <td><a href="/cust/custdetail/${custVO.custId}" class="text-body fw-bold">${custVO.custId}</a></td>
                                 <td>${custVO.custNm}</td>
                                 <td>${custVO.custTel}</td>
                                 <td>${custVO.custMail}</td>
                                 <td>
                                	<c:if test="${custVO.cmncdNm1 eq 'SILVER'}">
                                	<span class="badge badge-soft-dark font-size-12">${custVO.cmncdNm1}</span></c:if>
                                	<c:if test="${custVO.cmncdNm1 eq 'GOLD'}">
                                	<span class="badge bg-warning font-size-12">${custVO.cmncdNm1}</span></c:if>
                                	<c:if test="${custVO.cmncdNm1 eq 'VIP'}">
                                	<span class="badge bg-info font-size-12">${custVO.cmncdNm1}</span></c:if>
                                 </td>
                                 <td>
                                     <!-- Button trigger modal -->
                                     <a href="/cust/custdetail/${custVO.custId}" class="btn btn-primary btn-sm btn-rounded">상세보기</a>
                                 </td>
                                 <td data-org-colspan="1" data-priority="6" data-columns="tech-companies-1-col-6"><a href="#" onclick="window.open('https://chart.apis.google.com/chart?cht=qr&chl=${custVO.custId}&chld=L|2&chs=200','name','resizable=no width=400 height=400');return false">고객QR생성</a>
                                 </td>
                                 <td>
                                     <div>
                                         <button type="button" class="text-danger deleteCust" value="${custVO.custId}"><i class="mdi mdi-delete font-size-18"></i></button>
                                     </div>
                                 </td>
                             </tr>
                         	</c:forEach>
                         </tbody>
                     </table>
                 </div>
                 <!-- 페이징처리 시작 -->
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
                   <!-- 탈퇴 고객 -->
                   <div class="tab-pane" id="custT" role="tabpanel">
					<div class="table-responsive" id="a">
                     <table class="table align-middle table-nowrap table-check">
                         <thead class="table-light">
                             <tr>
                                 <th class="align-middle">#</th>
                                 <th class="align-middle">고객번호</th>
                                 <th class="align-middle">고객명</th>
                                 <th class="align-middle">전화번호</th>
                                 <th class="align-middle">이메일</th>
                                 <th class="align-middle">등급</th>
                                 <th class="align-middle">상세보기</th>
                                 <th class="align-middle">고객 QR 코드</th>
                             </tr>
                         </thead>
                         <tbody>
                         	<c:set var="i" value="${list2.currentPage*7-6-1}" />
                         	<c:forEach var="custVO" items="${list2.content}">
                             <tr>
                                 <!-- 순번 -->
                                 <td>${custVO.rnum}</td>
                                 <td><a href="/cust/custdetail/${custVO.custId}" class="text-body fw-bold">${custVO.custId}</a></td>
                                 <td>${custVO.custNm}</td>
                                 <td>${custVO.custTel}</td>
                                 <td>${custVO.custMail}</td>
                                 <td>
                                	<c:if test="${custVO.cmncdNm1 eq 'SILVER'}">
                                	<span class="badge badge-soft-dark font-size-12">${custVO.cmncdNm1}</span></c:if>
                                	<c:if test="${custVO.cmncdNm1 eq 'GOLD'}">
                                	<span class="badge bg-warning font-size-12">${custVO.cmncdNm1}</span></c:if>
                                	<c:if test="${custVO.cmncdNm1 eq 'VIP'}">
                                	<span class="badge bg-info font-size-12">${custVO.cmncdNm1}</span></c:if>
                                 </td>
                                 <td>
                                     <!-- Button trigger modal -->
                                     <a href="/cust/custdetail/${custVO.custId}" class="btn btn-primary btn-sm btn-rounded">상세보기</a>
                                 </td>
                                 <td data-org-colspan="1" data-priority="6" data-columns="tech-companies-1-col-6"><a href="#" onclick="window.open('https://chart.apis.google.com/chart?cht=qr&chl=${custVO.custId}&chld=L|2&chs=200','name','resizable=no width=400 height=400');return false">고객QR생성</a>
                                 </td>
                             </tr>
                         	</c:forEach>
                         </tbody>
                     </table>
                 </div>
                 <!-- 페이징처리 시작 -->
                <div id="b">
                <ul class="pagination pagination-rounded justify-content-end mb-2">
                    <li class="page-item <c:if test='${list2.startPage<6}'>disabled</c:if>">
                        <a class="page-link" aria-controls="DataTables_Table_0" onclick="commentList(${list2.startPage-5}, ${param.keyWord})" aria-label="Previous">
                            <i class="mdi mdi-chevron-left"></i>
                        </a>
                    </li>
                    <c:forEach var="pNo" begin="${list2.startPage}" end="${list2.endPage}" step="1">
	                    <li class="page-item <c:if test='${list2.currentPage eq pNo}'>active</c:if> " >
	                        <button class="page-link" aria-controls="DataTables_Table_0" onclick="commentList(${pNo}, ${param.keyWord})">${pNo}</button>
	                    </li>       
                    </c:forEach> 
                    <li class="page-item <c:if test='${list2.endPage>=list2.totalPages}'>disabled</c:if>">
                        <a class="page-link" aria-controls="DataTables_Table_0" onclick="commentList(${list2.startPage+5}, ${param.keyWord})" aria-label="Next">
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
</html>