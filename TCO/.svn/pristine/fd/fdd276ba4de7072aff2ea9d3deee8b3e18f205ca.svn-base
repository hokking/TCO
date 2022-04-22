<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
//tr 클릭시 이동 이벤트
function toDetail(){
	
	//td중 첫번째 요소를 제외함
	let tdExcept = $(".toDetail td").not(".exceptClick");
	
	//올려놨을 때 
	tdExcept.hover(function(){
		$(this).css('cursor','pointer');
	});
	
	//클릭 시 id가져오기 
	tdExcept.on("click", async function(){
		let prchsId = $(this).parent().find("td:eq(2)").text();
		
		//매입상품정보가져오기
		let prchsVO = await getPrchsGdsInfo(prchsId);
		
		//모달 열기
		modalConditionOpen(prchsVO);
		
	});
}

//매입아이디로 상품정보 가져오기
async function getPrchsGdsInfo(id){

	return new Promise((resolve,reject)=>{
		$.ajax({
			url :"/prchs/getPrchsDetail",
			type : "get",
			data : {paramId : id},
		    dataType : "json",
		    success : function(data){
				resolve(data);
	        },
	        error : function(xhr){
	        	reject(xhr.status);
	        }
		});	
	})

}

//modal open시
function modalConditionOpen(el){
	
	let prchsVO = el[0];
// 	console.log(prchsVO.prchsDt);
	//모달 비우기 
	$("#addPrchs").empty();
	
	//데이터 넣기
	$("#prchsDt").val(prchsVO.prchsDt);
	$("#prchsId").val(prchsVO.prchsId);
	$("#cnptNm").val(prchsVO.cnptNm);
	$("#cnptId").val(prchsVO.cnptId);
	$("#cnptCharger").val(prchsVO.cnptCharger);
	$("#cnptMail").val(prchsVO.cnptMail);
	
	//매입상품 데이터 넣기
	let prchsGdsVO = prchsVO.prchsGdsVO;
	
	let str = "";

	//PrchsGdsVO 넣기
	$.each(prchsGdsVO, function(i,v){
			str += "<div class='mb-2 row' id='addPrchs'"+ i +">"
			str += "<div class='col-md-2'><input type='text' class='form-control' value='" + v.prodInfoNmDisplay + "' id='prodNm'></div>";
			str += "<div class='col-md-2'><input type='text' class='form-control  text-end' value='" + v.prchsGdsAmtDisplay + "' id='prchsGdsAmt' ></div>";
			str += "<div class='col-md-1'><input type='text' class='form-control  text-end' value='" + v.prchsGdsQty + "' id='prchsGdsQty'></div>";
			str += "<div class='col-md-2'><input type='text' class='form-control  text-end' value='" + v.prchsGdsSuAmtDisplay + "' id='prchsGdsSuAmt'></div>";
			str += "<div class='col-md-2'><input type='text' class='form-control  text-end' value='" + v.prchsGdsVatDisplay + "' id='prchsGdsVat'></div>";
			str += "<div class='col-md-2'><input type='text' class='form-control  text-end' value='" + v.prchsGdsSumDisplay + "' id='prchsGdsSum'></div>";
			str += "<div class='col-md-2' hidden='true'><input type='text' class='form-control' value='" + v.prchsId + "' id='prchsGdsSum'></div>";
			str += "<div class='col-md-2' hidden='true'><input type='text' class='form-control' value='" + v.prodInfoId + "' id='prchsGdsSum'></div>";
		
		if(v.prchsGdsYn == 'N'){ // 입고 전일때 
			str += "<div class='col-md-1'><input type='button' onclick='warehousing(this)' data-pId='"+v.prchsId+"' data-prodId='"+ v.prodInfoId +"' data-qty='" + v.prchsGdsQty + "' class='btn btn-info' value='입고'></div></div>";	
		}else{
			str += "<div class='col-md-1'><button class='btn btn-info' disabled>입고됨</button></div></div>";
		}
		
	});
	
	//
	$("#addPrchs").html(str);
	
	//readonly 속성으로 
	$("#sendModalBody").find(".form-control").attr("readonly", true);
	
	//열기
	$("#modalPrchsConditionDetail").modal("show");
	
}

//입고버튼 누르면 입고처리
function warehousing(el){ // 이것은 해당 버튼
	//sweet alert해서 confirm 받기
	
	//값 가져오깅
	let v_prchsId = $(el).attr("data-pId");
	let v_prodId = $(el).attr("data-prodId");
	let v_prchsQty = $(el).attr("data-qty");
	
	//값 보내깅
	$.ajax({
		url : "/prchs/warehousingUpdate",
		method : "POST",
		data : {
			prchsId : v_prchsId,
			prodInfoId : v_prodId,
			prchsQty : v_prchsQty
		},
		dataType : "json",
		success : function(data){
			// sweetalert
	          Swal.fire({
		          icon:'success',
		          title:'입고되었습니다.',
	       		}).then(function(){
	       			window.location.reload();
	       		})
		},
		error : function(xhr){
			alert(xhr.status);
		}
	});
}

//전송
function fn_submit(){
    var frm = $("#Frm");
    console.log(frm);
    console.log("frm.keyWord : " + frm[0].keyWord.value);
	$("#Frm").submit();
}

// 페이지 로드되면
$(function(){
	// tr 클릭 시  - 첫번째 자식들만 빼고 클릭되게
	toDetail();
	
});
</script>
 <!-- start page title -->
 <div class="row">
     <div class="col-12">
         <div class="page-title-box d-sm-flex align-items-center justify-content-between">
             <h1 class="mb-sm-0 font-size-20"><i class="bx bx-buildings"></i>매입현황</h1>

             <div class="page-title-right">
                 <ol class="breadcrumb m-0">
                     <li class="breadcrumb-item"><a href="javascript: void(0);">매입</a></li>
                     <li class="breadcrumb-item active">매입현황</li>
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
             
             	<!-- 날짜 검색 버튼 -->
		<form action="/prchs/prchsOrder" method="get" name="Frm" id="Frm">	
		<div class="row">
			<div class="col-sm-2">
				<div class="mb-3">
				<label>시작일</label>
					<input type="date" name="startDay" 
					id="startDay" autocomplete="off" class="form-control">
				</div>
			</div>
			<div class="col-sm-2">
				<div class="mb-3">
				<label>종료일</label>
					<input type="date" name="endDay" 
					id="endDay" autocomplete="off" class="form-control">
				</div>
			</div>
            <div class="col-sm-2">
                <div class="search-box me-2 mb-3 d-inline-block">
                <label>검색어</label>
                    <div class="position-relative">
                        <input id="KeyWord" name="keyWord" type="text" class="form-control" placeholder="검색어 입력" style="width:100%;">
                        <i class="bx bx-search-alt search-icon"></i>
                    </div>
                </div>
            </div>
			<div class="col-sm-2">
				<div class="mb-3">
				<label>검색</label>
					<button type="button" class="btn btn-secondary btn-secondary" style="display: block;" 
					onclick="fn_submit()"><i class="bx bx-search-alt"></i></button>
				</div>
			</div>

		</div>
		</form>
	<!--날짜검색버튼끝-->

               <!-- Tab panes -->
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
                                 <th class="align-middle text-center">일자</th>
                                 <th class="align-middle text-center">전표번호</th>
                                 <th class="align-middle text-center">거래처명</th>
                                 <th class="align-middle text-center">거래처 연락처</th>
                                 <th class="align-middle text-center">공급가액</th>
                                 <th class="align-middle text-center">부가세액</th>
                                 <th class="align-middle text-center">합계</th>
                                 <th class="align-middle text-center">상태</th>
                             </tr>
                         </thead>
                         <tbody>
                         	<c:forEach var="prchsVO" items="${speceList}">
                             <tr class="toDetail">
                                 <td class="exceptClick">
                                     <div class="form-check font-size-16">
                                         <input class="form-check-input" type="checkbox" id="orderidcheck01">
                                         <label class="form-check-label" for="orderidcheck01"></label>
                                     </div>
                                 </td>
                                 <!-- 순번 -->
                                 <td class="text-center">${prchsVO.prchsDt}</td>
                                 <td class="text-center"><a href="#" class="text-body fw-bold">${prchsVO.prchsId}</a></td>
                                 <td>
                                     ${prchsVO.cnptNm}
                                 </td>
                                 <td class="text-center">
                                 	${prchsVO.cnptTel}
                                 </td>
                                 <td class="text-end">
                                     ${prchsVO.prchsSuAmtDisplay}원
                                 </td>
                                 <td class="text-end">
                                 	${prchsVO.prchsVatDisplay}원
<!--                                      <span class="badge badge-pill badge-soft-success font-size-12">Paid</span> -->
                                 </td>
                                 <td class="text-end">
                                 	${prchsVO.prchsAmtDisplay}원
<!--                                      Button trigger modal -->
                                 </td>
                                 <td class="text-center">
                                     <c:if test="${prchsVO.condition eq '입고완료'}"><span class="badge bg-primary">${prchsVO.condition}</span></c:if>
                                     <c:if test="${prchsVO.condition eq '미입고'}"><span class="badge badge-soft-dark">${prchsVO.condition}</span></c:if>
                                 </td>
                             </tr>
                         	</c:forEach>
                         </tbody>
                     </table>
                 </div>
                 <ul class="pagination pagination-rounded justify-content-end mb-2">
                     <li class="page-item disabled <c:if test='${list.startPage<6}'>disabled</c:if>" > <!-- 페이지가 6이 넘으면 disabled 지워야댐 -->
                         <a class="page-link" href="/prchs/prchsCondition?currentPage=${list.startPage-5}" aria-label="Previous">
                             <i class="mdi mdi-chevron-left"></i>
                         </a>
                     </li>
                     
                     <c:forEach var="pNo" begin="${list.startPage}" end="${list.endPage}" step="1">
	                     <li class="page-item <c:if test='${list.currentPage eq pNo}'>active</c:if>">
	                     	<a class="page-link" href="/prchs/prchsCondition?currentPage=${pNo}">${pNo}</a>
	                   	</li>
                   	</c:forEach>
                     <li class="page-item <c:if test='${list.endPage>=list.totalPages}'>disabled</c:if> ">
                         <a class="page-link" href="/prchs/prchsCondition?currentPage=${list.startPage+5}" aria-label="Next">
                             <i class="mdi mdi-chevron-right"></i>
                         </a>
                     </li>
                 </ul>
             </div>
         </div>
         <!-- end card -->
     </div>
 </div>
 <!-- end row -->
 
 <div>
    <div class="modal fade" id="modalPrchsConditionDetail" tabindex="-1" aria-labelledby="modalActLabel" aria-hidden="true">
        <div class="modal-dialog modal-xl">
            <div class="modal-content">
              <form action="" method="post" id="sendPrchsFrm">
                <div class="modal-header">
                    <h5 class="modal-title" id="modalActLabel">매입현황</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body" id="sendModalBody">
                        <div class="mb-2 row">
                        	<div class="col-md-2 text-center">
	                            <label for="prchsDt" class="col-form-label">거래일자</label>
                        	</div>
                        	<div class="col-md-4">
                        		<input class="form-control" type="date" name="prchsDt" id="prchsDt">
                        	</div>
                        	<div class="col-md-2 text-center">
	                            <label for="prchsId" class="col-form-label">전표번호</label>
                        	</div>
                        	<div class="col-md-4">
                        		<input class="form-control" type="text" name="prchsId" id="prchsId">
                        	</div>
                        </div>
                        
                        <div class="mb-2 row">
                        	<div class="col-md-2 text-center">
	                            <label for="cnptNm" class="col-form-label">거래처명</label>
                        	</div>
                        	<div class="col-md-4">
                        		<input class="form-control" type="text" name="cnptNm" id="cnptNm">
                        	</div>
                        	<div class="col-md-2 text-center">
	                            <label for="cnptId" class="col-form-label">거래처코드</label>
                        	</div>
                        	<div class="col-md-4">
                        		<input class="form-control" type="text" name="cnptId" id="cnptId">
                        	</div>
                        </div>
                        <div class="mb-2 row">
                        	<div class="col-md-2 text-center">
	                            <label for="cnptCharger" class="col-form-label">담당자</label>
                        	</div>
                        	<div class="col-md-4">
                        		<input class="form-control" type="text" name="cnptCharger" id="cnptCharger">
                        	</div>
                        	<div class="col-md-2 text-center">
	                            <label for="cnptMail" class="col-form-label">담당자 이메일</label>
                        	</div>
                        	<div class="col-md-4">
                        		<input class="form-control" type="text" name="cnptMail" id="cnptMail">
                        	</div>
                        </div>
                        <hr>
                        <div class="mb-2 row">
                        	<div class="col-md-2 text-center">
                        		<label class="form-label">품목명</label>
                        	</div>	
                        	<div class="col-md-2 text-center">
                        		<label class="form-label">단가</label>
                        	</div>	
                        	<div class="col-md-1 text-center">
                        		<label class="form-label">수량</label>
                        	</div>
	                        		
                        	<div class="col-md-2 text-center">
                        		<label class="form-label">공급액</label>
                        	</div>
                        	<div class="col-md-2 text-center">
                        		<label class="form-label">세액</label>
                        	</div>
                        	<div class="col-md-2 text-center">
                        		<label class="form-label">금액</label>
                        	</div>
                        </div>     
                        <div class="mb-2 row" id="addPrchs">
                        	<div class="col-md-2 text-center">
                        		<input type="text" class="form-control" id="prodNm" name="prodNm">
                        	</div>	 
                        	<div class="col-md-2 text-center">
                        		<input type="text" class="form-control" id="prchsGdsAmt" name="prchsGdsAmt">
                        	</div>	
                        	<div class="col-md-1 text-center">
                        		<input type="text" class="form-control" id="prchsGdsQty" name="prchsGdsQty">
                        	</div>	
                        	<div class="col-md-2 text-center">
                        		<input type="text" class="form-control" id="prchsGdsSuAmt" name="prchsGdsSuAmt"> 
                        	</div>	
                        	<div class="col-md-2 text-center">
                        		<input type="text" class="form-control text-end" id="prchsGdsVat" name="prchsGdsVat">
                        	</div>	
                        	<div class="col-md-2 text-center">
                        		<input type="text" class="form-control" id="prchsGdsSum" name="prchsGdsSum">
                        	</div>	
                        	<div class="col-md-1">
                        	</div>	
                        </div>     
                        <div class="mb-2 row" id="addSendLine">
                        </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
                </div>
               </form>
            </div>
        </div>
    </div>
</div> 
