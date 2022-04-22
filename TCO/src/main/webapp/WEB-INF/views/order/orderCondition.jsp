<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<style>
</style>
<script>
//상세정보 불러와서 모달에 데이터 출력
function orderDetail(orId){
	
	$.ajax({
		url : '/ordr/detail',
		data : {ordrId : orId},
		dataType : "json",
		success : function(data){
			console.log(data);
			//날짜 입력
			$("#ordrDt").val(data[0].ordrDtDisplay);
			//orderID 입력
			$("#orderId").val(data[0].ordrId);
			str = "";
			$.each(data, function(i,v){
            	str += '<div class="col-md-4">';
            	str += '<input type="text" class="form-control" id="prodNm" value="' + v.prodInfoNm +'"></div>';
            	str += '<div class="col-md-2" hidden=true>';	 
            	str += '<input type="text" class="form-control" id="prodInfoId" value="' + v.prodInfoId +'" name="prodInfoId"></div>';	 
            	str += '<div class="col-md-3">';	 
            	str += '<input type="text" class="form-control text-end" id="prchsGdsAmt" value="' + numberWithCommas(v.prodInfoPrchsAmt) +'"  name="prchsGdsAmt"></div>';	 
            	str += '<div class="col-md-2">';	 
            	str += '<input type="text" class="form-control text-end" id="prchsGdsQty" value="' + v.ordrQty +'" name="prchsGdsQty"></div>';	 
            	str += '<div class="col-md-3">';	 
            	str += '<input type="text" class="form-control text-end" id="prchsGdsSum" value="' + numberWithCommas(v.ordrQty * v.prodInfoPrchsAmt) +'" name="prchsGdsSum"></div>';	 
			});
			
			$("#ordrProd").html(str);
			$(".form-control").attr("readonly", true);
		},
		error : function(xhr){
			alert(xhr);
		}
	});
}

//orderId를 받아서 발주 삭제
function deleteOrder(ordrId){
	//삭제할까요? 물어보기
		Swal.fire({ 
		title: '발주를 삭제할까요?', 
		text : '삭제 후에는 복구할 수 없습니다.',		
		icon: 'warning', 
		showCancelButton: true, // cancel버튼 보이기. 기본은 원래 없음 
		confirmButtonColor: '#3085d6', // confrim 버튼 색깔 지정 
		cancelButtonColor: '#d33', // cancel 버튼 색깔 지정 
		confirmButtonText: '삭제', // confirm 버튼 텍스트 지정 
		cancelButtonText: '취소', // cancel 버튼 텍스트 지정 
		reverseButtons: true, // 버튼 순서 거꾸로 
	}).then(result => { // 만약 Promise리턴을 받으면, 
		if (result.isConfirmed) { // 만약 모달창에서 confirm 버튼을 눌렀다면
			
			//삭제로 보내는 ajax
			deleteAjax(ordrId);
		}
	});
}
//삭제해주는 AJAX
function deleteAjax(ordrId){
	$.ajax({
		url : '/ordr/delete',
		data : {ordrId : ordrId},
		dataType : "json",
		success : function(data){
			//sweet alert
	    	Swal.fire({
		          icon:'success',
		          title:'삭제되었습니다.',
	       		}).then(function(){
	       			//새로고침
	       			window.location.reload();
	       		});
		},
		
	});
}

//,넣어주기
function numberWithCommas(x) { 
	return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","); 
}

//modal 클릭 시 데이터
function modalOpen(){
	$('#modalOrderDetail').on('show.bs.modal', function (event) {
		  var button = $(event.relatedTarget);
		  //ordrId 가져오기
		  var ordrId = button.attr("data-ordrId");
		  //데이터 출력하기
		  orderDetail(ordrId);
		});
}

//삭제버튼 클릭 시 
function deleteButton(el){
	//아이디 가져오기
	let ordrId = $(el).parent().parent().find("#orderId").val();
	//삭제할까요? 물어보기
	Swal.fire({ 
		title: '발주를 삭제할까요?', 
		text : '삭제 후에는 복구할 수 없습니다.',		
		icon: 'warning', 
		showCancelButton: true, // cancel버튼 보이기. 기본은 원래 없음 
		confirmButtonColor: '#3085d6', // confrim 버튼 색깔 지정 
		cancelButtonColor: '#d33', // cancel 버튼 색깔 지정 
		confirmButtonText: '삭제', // confirm 버튼 텍스트 지정 
		cancelButtonText: '취소', // cancel 버튼 텍스트 지정 
		reverseButtons: true, // 버튼 순서 거꾸로 
	}).then(result => { // 만약 Promise리턴을 받으면, 
		if (result.isConfirmed) { // 만약 모달창에서 confirm 버튼을 눌렀다면
			
			//삭제로 보내는 ajax
			deleteAjax(ordrId);
		}
	});
}

//전송으로 update하는 함수
function sendOrder(el){
	let ordrId = $(el).parent().parent().find("#orderId").val();
	Swal.fire({ 
		title: '발주를 전송할까요?', 
		text : '전송 후에는 수정할 수 없습니다.',		
		icon: 'warning', 
		showCancelButton: true, // cancel버튼 보이기. 기본은 원래 없음 
		confirmButtonColor: '#3085d6', // confrim 버튼 색깔 지정 
		cancelButtonColor: '#d33', // cancel 버튼 색깔 지정 
		confirmButtonText: '전송', // confirm 버튼 텍스트 지정 
		cancelButtonText: '취소', // cancel 버튼 텍스트 지정 
		reverseButtons: true, // 버튼 순서 거꾸로 
	}).then(result => { // 만약 Promise리턴을 받으면, 
		if (result.isConfirmed) { // 만약 모달창에서 confirm 버튼을 눌렀다면
			
			//전송으로 보내는 ajax
			sendAjax(ordrId);
		}
	});
	console.log(ordrId);
}

//전송해주는 AJAX
function sendAjax(ordrId){
	$.ajax({
		url : '/ordr/send',
		data : {ordrId : ordrId},
		dataType : "json",
		success : function(data){
			//sweet alert
	    	Swal.fire({
		          icon:'success',
		          title:'전송되었습니다.',
	       		}).then(function(){
	       			//새로고침
	       			window.location.reload();
	       		});
		},
		
	});
}

//로드될 때
$(function(){
	//상세보기 버튼 클릭 시
	modalOpen();
	
});
</script>
<body>
 <!-- start page title -->
 <div class="row">
     <div class="col-12">
         <div class="page-title-box d-sm-flex align-items-center justify-content-between">
             <h1 class="mb-sm-0 font-size-20"><i class="bx bx-buildings"></i>발주 현황</h1>

             <div class="page-title-right">
                 <ol class="breadcrumb m-0">
                     <li class="breadcrumb-item"><a href="javascript: void(0);">발주</a></li>
                     <li class="breadcrumb-item active">발주현황</li>
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
		                <h5 class="font-size-14 mb-3">${branch}</h5>
		            </div>
		        </div>
	
	    	</div>

               <!-- Tab panes -->
					<div class="table">
                     <table class="table align-middle table-nowrap table-check cnpt">
                         <thead class="table-light">
                              <tr>
                                 <th class="align-middle text-center">순번</th>
                                 <th class="align-middle text-center">발주번호</th>
                                 <th class="align-middle text-center">발주지점</th>
                                 <th class="align-middle text-center">발주일</th>
                                 <th class="align-middle text-center">상세보기</th>
                                 <th class="align-middle text-center">삭제</th>
                             </tr>
                         </thead>
                         <tbody>
                         	 <c:set var="i" value="0" />
	                         <c:forEach var="ordrVO" items="${orderList}">
	                         <c:set var="cnt" value="${i=i+1}"/>
                             <tr>
                                 <!-- 순번 -->
                                 <td class="text-center">${cnt}</td>
                                 <td class="text-center">${ordrVO.ordrId}</td>
                                 <td class="text-center">${ordrVO.brncofcNm}</td>
                                 <td class="text-center"><fmt:formatDate pattern="yyyy-MM-dd" value="${ordrVO.ordrDt}"/></td>
                                 <td class="text-center">
                                     <!-- Button trigger modal -->
                                     <a href="#" class="btn btn-primary btn-sm btn-rounded" data-bs-toggle="modal" data-bs-target="#modalOrderDetail" data-ordrId="${ordrVO.ordrId}">상세보기</a>
                                 </td>
                                 <td class="text-center">
                                 	<a href="javascript:deleteOrder('${ordrVO.ordrId}');" class="text-danger"><i class="mdi mdi-delete font-size-18"></i></a>
                                 </td>
                             </tr>
                         	</c:forEach>
                         </tbody>
                     </table>
                 </div>
             </div>
         </div>
         <!-- end card -->
     </div>
 </div>
 <!-- end row -->
  <!-- 상세 Modal 시작 -->
 <div>
    <div class="modal fade" id="modalOrderDetail" tabindex="-1" aria-labelledby="modalActLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
              <form action="" method="post" id="sendOrderFrm">
                <div class="modal-header">
                    <h5 class="modal-title" id="modalActLabel">발주 전송</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body" id="sendModalBody">
                        <div class="mb-2 row">
                        	<div class="col-md-2">
	                            <label for="prchsDt" class="col-form-label">발주일자</label>
                        	</div>
                        	<div class="col-md-3">
                        		<input class="form-control text-center" type="date" name="ordrDt" id="ordrDt">
                        	</div>
  
                        </div>
                        
                        <div class="mb-2 row">
                      		<div class="col-md-2">
	                            <label for="prchsId" class="col-form-label">발주번호</label>
                        	</div>
                        	<div class="col-md-3">
                        		<input class="form-control text-end" type="text" name="orderId" id="orderId">
                        	</div>
                        </div>
                        
                        <hr>
                        <div class="mb-2 row">
                        	<div class="col-md-4 text-center">
                        		<label class="form-label ">품목명</label>
                        	</div>	
                        	<div class="col-md-3 text-center">
                        		<label class="form-label">단가</label>
                        	</div>	
                        	<div class="col-md-2 text-center">
                        		<label class="form-label">수량</label>
                        	</div>
                        	<div class="col-md-3 text-center" >
                        		<label class="form-label">금액</label>
                        	</div>
                        </div>     
                        <div class="mb-2 row" id="ordrProd">
                        
                        </div>     
                        <div class="mb-2 row" id="addSendLine">
                        	<input type="text" name="prchsAmt" id="sendPrchsAmt" hidden=true> 
                        </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
                    <button type="button" class="btn btn-danger" onclick="deleteButton(this)">삭제</button>
                    <button type="button" class="btn btn-primary" onclick="sendOrder(this)">전송</button>
                </div>
               </form>
            </div>
        </div>
    </div>
</div> 
 </body>