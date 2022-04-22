<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src="/resources/js/jquery-3.6.0.min.js"></script>
<script>
$(function(){
	
	$("#sendBtn").on('click',function(){
		$.ajax({
			url : "/strgstck/send.do",
			data : {"ordrId" : ${num}},
			type : 'post',
			dataType : 'JSON',
			success : function(res){
				console.log(res);
				if(res == 3){
					 Swal.fire({
				          icon:'success',
				          title:'수주에 성공했습니다.',
			       		}).then(function(){
			       			$("#sendBtn").remove();
			       			window.location.href="rcvordr";
			       		})
				}else if(res == 10){
					Swal.fire({
				          icon:'error',
				          title:'재고에 오류가 발생했습니다. 다시 시도해주세요.',
			       		})
				}else if(res == 20){
					Swal.fire({
				          icon:'error',
				          title:'출고에 오류가 발생했습니다. 다시 시도해주세요.',
			       		})
				}else if(res == 30){
					Swal.fire({
				          icon:'error',
				          title:'수주에 오류가 발생했습니다. 다시 시도해주세요.',
			       		})
				}else if(res == 100){
					Swal.fire({
				          icon:'error',
				          title:'본사의 재고가 부족합니다. 재고를 확인해주세요.',
			       		})
				}else{
					Swal.fire({
				          icon:'error',
				          title:'오류가 발생했습니다. 다시 시도해주세요.',
			       		})
				}
			}
		})
	})
})
</script>
<style>
 .addSize{
 	font-size: 1.2em;
 }
</style>
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
                        <c:if test="${name == '대전문화점'}">
	                        34906<br>
	                        대전 중구 오류로 41<br>
                        </c:if>
                        <c:if test="${name == '인천마계점'}">
	                        22324<br>
	                        인천 중구 인중로 134<br>
                        </c:if>
                        <c:if test="${name == '부산점'}">
	                        48212<br>
	                        부산 수영구 구락로 137<br>
                        </c:if>
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
                            </tr>
                        </c:forEach>
	                        <tr>
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
                        <c:if test="${yn != 1}">
                        <a href="javascript: void(0);" class="btn btn-primary w-md waves-effect waves-light" id="sendBtn">Send</a>
                        </c:if>
                        <a href="/strgstck/rcvordr" class="btn btn-secondary w-md waves-effect waves-light" >목록으로</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>