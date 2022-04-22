<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<!DOCTYPE html>
<script>
//입고버튼 클릭 시
function warehousing(ordrId, prodId, ordrQty){
	let brncofcId = "<c:out value='${sessionScope.brncofcId}' />";
	
	console.log(ordrId, prodId, ordrQty);
	Swal.fire({ 
		title: '입고처리할까요?', 
		icon: 'warning', 
		showCancelButton: true, // cancel버튼 보이기. 기본은 원래 없음 
		confirmButtonColor: '#3085d6', // confrim 버튼 색깔 지정 
		cancelButtonColor: '#d33', // cancel 버튼 색깔 지정 
		confirmButtonText: '입고', // confirm 버튼 텍스트 지정 
		cancelButtonText: '취소', // cancel 버튼 텍스트 지정 
		reverseButtons: true, // 버튼 순서 거꾸로 
	}).then(result => { // 만약 Promise리턴을 받으면, 
		if (result.isConfirmed) { // 만약 모달창에서 confirm 버튼을 눌렀다면 
			$.ajax({
				url :"/ordr/updateWrhs",
				type : "get",
				data : {
					ordrId : ordrId,
					prodId : prodId,
					brncofcId : brncofcId,
					ordrQty : ordrQty
					},
			    dataType : "json",
			    success : function(data){
					console.log(data);
			    	Swal.fire({
				          icon:'success',
				          title:'입고처리되었습니다.',
			       		}).then(function(){
			       			//새로고침
			       			location.href='/ordr/ordrDetail?ordrId=' + ordrId;
			       		});
			    },
			    error : function(xhr){
			    	alert(xhr.status);
			    }
			});
		} 
	});// sweetAlert 끝
	
}
</script>
<div class="row">
<div class="col-lg-12">
    <div class="card">
        <div class="card-body">
            <div class="invoice-title">
                <h4 class="float-end font-size-16">Order # ${num}</h4>
                <div class="mb-4">
                    <img src="/resources/images/TCO로고_가로1.png" alt="logo" height="20">
                </div>
            </div>
            <hr>
            <div class="row">
                <div class="col-sm-6">
                    <address class="addSize">
                        <strong>담당자 :</strong><br>
                        물류(DT)<br>
                        박채린<br>
                        hyeon156@tco.kr<br>
                        
                    </address>
                </div>
                <div class="col-sm-6 text-sm-end">
                    <address class="mt-2 mt-sm-0 addSize">
                        <strong>발주 지점 :</strong><br>
                        ${name}<br>
                        34906<br>
                        대전 중구 오류로 41<br>
                    </address>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-6 mt-3">
                    <address>
                        <strong></strong><br>
                        <br>
                    </address>
                </div>
                <div class="col-sm-6 mt-3 text-sm-end">
                    <address class="addSize">
                        <strong>발주일 :</strong><br>
                        <fmt:formatDate pattern="yyyy-MM-dd" value="${date}"/><br><br>
                    </address>
                </div>
            </div>
            <div class="py-2 mt-3">
                <h3 class="font-size-15 fw-bold">Order summary</h3>
            </div>
            <div class="">
                <table class="table table-nowrap">
                    <thead>
                        <tr>
                            <th style="width: 70px;">No.</th>
                                <th>Item</th>
                                <th style="text-align:right;">Quantity</th>
                                <th style="text-align:right;">Each Price</th>
                                <th class="text-end">Price</th>
                                <th class="text-end">Stock</th>
                            </tr>
                        </thead>
                        <tbody>
                        <c:set var="i" value="0" />
                        <c:forEach var="ordr" items="${ordrVO}">
	                    <c:set var="cnt" value="${i=i+1}"/>
                            <tr>
                                <td>${cnt}</td>
                                <td style="width:200px;">${ordr.prodInfoNmDisplay}</td>
                                <td style="width:200px;text-align:right;">${ordr.ordrQtyDisplay}</td>
                                <td style="width:200px;text-align:right;">${ordr.prodInfoPrchsAmtDisplay}</td>
                                <td class="text-end">${ordr.orderAmount}</td>
                                <td class="text-end">
                                <div>
                                	<c:if test="${ordr.ordrYn eq 'Y'}">
                                		<c:if test="${ordr.ordrWhyn eq 'Y'}">
	                                		<button class='btn btn-info btn-sm disabled'>입고완료</button>
                                		</c:if>
                                		<c:if test="${ordr.ordrWhyn eq 'N'}">
                                			<button class='btn btn-info btn-sm' onclick="warehousing('${ordr.ordrId}','${ordr.prodInfoId}','${ordr.ordrQty}')">입고</button>
                                		</c:if>
                               		</c:if>
                                	<c:if test="${ordr.ordrYn eq 'N'}"><button class='btn btn-secondary btn-sm' disabled>수주 전</button></c:if>
                                </div>
                                </td>
                            </tr>
                        </c:forEach>
	                        <tr>
	                        	<td></td>
	                        	<td></td>
	                        	<td></td>
	                            <td colspan="2" class="border-0 text-end">
	                                <strong>합계</strong></td>
	                            <td class="border-0 text-end"><h4 class="m-0"><fmt:formatNumber type="number" maxFractionDigits="3" value="${sum}" />원</h4></td>
	                        </tr>
                        </tbody>
                    </table>
                </div>
                <div class="d-print-none">
                    <div class="float-end">
                        <a href="javascript:window.print()" class="btn btn-success waves-effect waves-light me-1"><i class="fa fa-print"></i></a>
                        <a href="/ordr/orderList?brncofcId=${sessionScope.brncofcId}" class="btn btn-secondary w-md waves-effect waves-light" >목록으로</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>