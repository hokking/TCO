<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<style>
.card-title{
	font-size: 20px;
}
.col-form-label{
	font-size: 15px;
}

</style>
<title>거래처 상세</title>
<style type="text/css">
.card-title{
	font-size: 20px;
}
</style>
<script src="/resources/js/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<script type="text/javascript">
//다음 우편번호 검색
function openHomeSearch(){
	new daum.Postcode({
		oncomplete:function(data){
			$('[name=cnptZip]').val(data.zonecode);
			$('[name=cnptAddr]').val(data.address);
			$('[name=cnptDaddr]').val(data.buildingName);
		}
	}).open();
}

$(function(){
	
	//상세조회 페이지 수정 못하게
	$(".detail").attr("readonly", true);
	
	//기본정보수정 - 구분 출력
	var cnptSe = "${cnptVO.cnptSe}";
	$("#cnptSe").val(cnptSe);
	
	//기본정보수정 - 업종분류 출력
	var cmncdCd = "${cnptVO.cmncdCd}";
	$("#cmncdCd").val(cmncdCd);
	
	//은행정보수정 - 은행명 출력
	var bankNm = "${cnptVO.cnptBankNm}";
	$("#cnptBankNm").val(bankNm);
	
	
	//기본정보 수정버튼 클릭시 전송
	$("#updateBasicBtn").on("click", function(){
		//$("#updateBasicFrm").submit();
		//수정 전송
		$.ajax({
		    type: "POST",
		    url : "/cnpt/updateBasic",
		    data : $("#updateBasicFrm").serialize(),
		    contentType : "application/x-www-form-urlencoded; charset=utf-8",
		    dataType : "json",
		    success : function(data){
		    	console.log("data뭐노?" + data);
		    	var res = parseInt(data);
		    	
		        if(res > 0){
		        // Sweet Alert
		          Swal.fire({
			          icon:'success',
			          title:'수정완료',
		       		}).then(function(){
		       			window.location.reload();
		       		})
		        }else{
		        	alert("업뎃안됨 와이라노");
		        }
				
		        
		    },
		    error : function(){
		        //Ajax 실패시
		    	Swal.fire({
			          icon:'error',
			          title:'에러',
		       		}, function(){
		       			//새로고침
		       			window.location.reload();
		       			});
		    }
		});
	});
	
	//계좌정보 수정버튼 클릭시 전송	
	$("#updateActBtn").on("click", function(){
		
		//수정 전송
		$.ajax({
		    type: "POST",
		    url : "/cnpt/updateAct",
		    data : $("#updateActFrm").serialize(),
		    contentType : "application/x-www-form-urlencoded; charset=utf-8",
		    dataType : "json",
		    success : function(data){
		    	console.log("data뭐노?" + data);
		    	var res = parseInt(data);
		    	
		        if(res > 0){
		        // Sweet Alert
		          Swal.fire({
			          icon:'success',
			          title:'수정완료',
		       		}).then(function(){
		       			window.location.reload();
		       		})
		        }else{
		        	alert("업뎃안됨 와이라노");
		        }
				
		        
		    },
		    error : function(){
		        //Ajax 실패시
		    	Swal.fire({
			          icon:'error',
			          title:'에러데스까',
		       		}, function(){
		       			//새로고침
		       			window.location.reload();
		       			});
		    }
		});
	
		
	});

	
	//담당자정보 수정버튼 클릭시 전송
	$("#updateChargerBtn").on("click", function(){
// 		$("#updateChargerFrm").submit();
		//수정 전송
		$.ajax({
		    type: "POST",
		    url : "/cnpt/updateCharger",
		    data : $("#updateChargerFrm").serialize(), // form데이터에 있는 vo객체를 serialize
		    contentType : "application/x-www-form-urlencoded; charset=utf-8",
		    dataType : "json",
		    success : function(data){
		    	console.log("data뭐노?" + data); // 결과출력
		    	//result를 int타입으로 변경
		    	var res = parseInt(data);
		    	
		        if(res > 0){
		        // Sweet Alert
		          Swal.fire({
			          icon:'success',
			          title:'수정완료',
		       		}).then(function(){
		       			window.location.reload();
		       		})
		        }else{
		        	alert("업뎃안됨 와이라노");
		        }
				
		        
		    },
		    error : function(){
		        //Ajax 실패시
		    	Swal.fire({
			          icon:'error',
			          title:'오류발생',
		       		}, function(){
		       			//새로고침
		       			window.location.reload();
		       			});
		    }
		});
	});
	
});
</script>
</head>
<body>
<!-- start page title -->
 <div class="row">
     <div class="col-12">
         <div class="page-title-box d-sm-flex align-items-center justify-content-between">
             <h1 class="mb-sm-0 font-size-20">🏢거래처 상세조회</h1>

             <div class="page-title-right">
                 <ol class="breadcrumb m-0">
                     <li class="breadcrumb-item"><a href="javascript: void(0);">거래처 상세조회</a></li>
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
             	<div class="d-flex gap-3">
                 	<h4 class="card-title">기본정보</h4>
					<div class="d-flex gap-3">
	                 	<a href="javascript:void(0);" class="text-success" data-bs-toggle="modal" data-bs-target="#modalBasic"><i class="mdi mdi-pencil font-size-18"></i></a>
	                 	<a href="javascript:void(0);" class="text-danger"><i class="mdi mdi-delete font-size-18"></i></a>
					</div>
             	</div>
				
				<hr><br>
                 <div class="mb-3 row">
                     <label for="example-text-input" class="col-md-2 col-form-label">거래처명</label>
                     <div class="col-md-4">
                         <input class="form-control detail" type="text" value="${cnptVO.cnptNm}">
                     </div>
                 </div>
                 <div class="mb-3 row">
                     <label class="col-md-2 col-form-label">구분</label>
                     <div class="col-md-2">
						<input class="form-control detail" type="text" value="${cnptVO.cnptSe}">
                     </div>
                 </div>                 
                 <div class="mb-3 row">
                     <label for="example-email-input" class="col-md-2 col-form-label">사업자등록번호</label>
                     <div class="col-md-4">
                         <input class="form-control detail" type="text" value="${cnptVO.cnptBrno}">
                     </div>
<!--                      <div class="col-md-2"> -->
<!--                          <button type="button" class="btn btn-info waves-effect waves-light">조회</button> -->
<!--                      </div> -->
                 </div>
                 <div class="mb-3 row">
                     <label for="example-url-input" class="col-md-2 col-form-label">업종분류</label>
                     <div class="col-md-4">
                         <input class="form-control detail" type="text" value="${cnptVO.cmncdNm1}">
                     </div>
                 </div>
                 <div class="mb-3 row">
                     <label for="example-tel-input" class="col-md-2 col-form-label">대표자 이름</label>
                     <div class="col-md-4">
                         <input class="form-control detail" type="text" value="${cnptVO.cnptRprsvNm}">
                     </div>
                 </div>
                 <div class="mb-3 row">
                     <label for="example-password-input" class="col-md-2 col-form-label">연락처</label>
                     <div class="col-md-4">
                         <input class="form-control detail" type="tel" value="${cnptVO.cnptTel}">
                     </div>
                 </div>
                 <div class="mb-3 row">
                     <label for="example-week-input" class="col-md-2 col-form-label">우편번호</label>
                     <div class="col-md-4">
                         <input class="form-control detail" type="text" value="${cnptVO.cnptZip}">
                     </div>
<!--                      <div class="col-md-2"> -->
<!--                          <button type="button" class="btn btn-info waves-effect waves-light">우편번호 검색</button> -->
<!--                      </div>      -->
                 </div>
                 <div class="mb-3 row">
                     <label for="example-month-input" class="col-md-2 col-form-label">주소</label>
                     <div class="col-md-6">
                         <input class="form-control detail" type="text" value="${cnptVO.cnptAddr}">
                     </div>
                 </div>
                 <div class="mb-3 row">
                     <label for="example-month-input" class="col-md-2 col-form-label">상세주소</label>
                     <div class="col-md-6">
                         <input class="form-control detail" type="text" value="${cnptVO.cnptDaddr}">
                     </div>
                 </div>
                 <div class="mb-3 row" hidden="true">
                     <label class="col-md-2 col-form-label">거래여부</label>
                     <div class="col-md-2">
                         <select class="form-select">
                             <option>Y</option>
                             <option>N</option>
                         </select>
                     </div>
                 </div>

<!--                  <div class="row"> -->
<!--                      <label for="exampleDataList" class="col-md-2 col-form-label">Datalists</label> -->
<!--                      <div class="col-md-10"> -->
<!--                          <input class="form-control" list="datalistOptions" id="exampleDataList" placeholder="Type to search..."> -->
<!--                          <datalist id="datalistOptions"> -->
<!--                              <option value="San Francisco"> -->
<!--                              <option value="New York"> -->
<!--                              <option value="Seattle"> -->
<!--                              <option value="Los Angeles"> -->
<!--                              <option value="Chicago"> -->
<!--                          </datalist> -->
<!--                      </div> -->
<!--                  </div> -->

             </div>
         </div>
     </div> <!-- end col -->
 </div>
 <!-- end row -->

 <div class="row">
     <div class="col-lg-12">
         <div class="card">
             <div class="card-body">
             	<div class="d-flex gap-3">
                 <h4 class="card-title">계좌 정보</h4>
                 	<a href="javascript:void(0);" class="text-success" data-bs-toggle="modal" data-bs-target="#modalAct"><i class="mdi mdi-pencil font-size-18"></i></a>
                </div> 	                 
                 <hr><br>
                 <div>
                     <div class="row">
                         <div class="col-lg-3">
                             <div>
                                 <label class="form-label">은행명</label>
                                 <input class="form-control detail" type="text" value="${cnptVO.cnptBankNm}">
                             </div>
                         </div>
                         <div class="col-lg-4">
                             <div>
                                 <label class="form-label">계좌번호</label>
                                 <input class="form-control detail" type="text" value="${cnptVO.cnptActno}">
                             </div>
                         </div>
                         <div class="col-lg-3">
                             <div>
                                 <label class="form-label">예금주명</label>
                                 <input class="form-control detail" type="text" value="${cnptVO.cnptActnm}">
                             </div>
                         </div>
                     </div>

                 </div>
             </div>
         </div>
     </div>
 </div>


 <!-- end row -->
 
  <div class="row">
     <div class="col-lg-12">
         <div class="card">
             <div class="card-body">
             	<div class="d-flex gap-3">
                 <h4 class="card-title">담당자 정보</h4>
                 	<a href="javascript:void(0);" class="text-success" data-bs-toggle="modal" data-bs-target="#modalCharger"><i class="mdi mdi-pencil font-size-18"></i></a>
                 </div>
                 <hr><br>
                 
                 <div>
	                 <div class="mb-3 row">
	                     <label for="example-text-input" class="col-md-2 col-form-label">담당자명</label>
	                     <div class="col-md-4">
	                         <input class="form-control detail" type="text" id="example-text-input" value="${cnptVO.cnptCharger}">
	                     </div>
	                 </div>
	                 <div class="mb-3 row">
	                     <label for="example-text-input" class="col-md-2 col-form-label">담당자이메일</label>
	                     <div class="col-md-4">
	                         <input class="form-control detail" type="text" id="example-text-input" value="${cnptVO.cnptMail}">
	                     </div>
	                 </div>
                 </div>
             </div>
         </div>
     </div>
 </div>

 <!-- end row -->
  <div class="row">
     <div class="col-lg-12">
         <div class="card">
             <div class="card-body">
                 <div class="col-md-12">
                     <a href="/cnpt/list" class="btn btn-primary ">목록으로</a>
                 </div>                 
             </div>
         </div>
     </div>
 </div>

               
<!-- Modal 시작 -->
<!--                    <div class="d-flex flex-wrap gap-3"> -->
<!--                        <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal" -->
<!--                            data-bs-whatever="@mdo">Open modal for @mdo</button> -->
<!--                        <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal" -->
<!--                            data-bs-whatever="@fat">Open modal for @fat</button> -->
<!--                        <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal" -->
<!--                            data-bs-whatever="@getbootstrap">Open modal for @getbootstrap</button> -->
<!--                    </div> -->
<!-- 기본정보 수정 Modal 시작 -->
<div>
    <div class="modal fade" id="modalBasic" tabindex="-1" aria-labelledby="modalBasicLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="modalBasicLabel">기본정보 수정</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
               <form action="/cnpt/updateBasic" method="post" id="updateBasicFrm">
                <div class="modal-body">
                        <div class="mb-2 row" hidden="true">
                            <label for="cnptId" class="col-form-label">거래처아이디</label>
                            <input type="text" class="form-control" id="cnptId" name="cnptId" value="${cnptVO.cnptId}">
                        </div>
                        <div class="mb-2 row">
                            <label for="cnptId" class="col-form-label">거래처명</label>
                            <input type="text" class="form-control" id="cnptNm" name="cnptNm" value="${cnptVO.cnptNm}">
                        </div>
                       <div class="mb-2 row">
                            <label for="cnptId" class="col-form-label">구분</label>
                            <div class="col-md-3">
	                         <select class="form-select" name="cnptSe" id="cnptSe">
	                             <option value="법인">법인</option>
	                             <option value="개인">개인</option>
	                         </select>
	                         </div>
                        </div>     
                        <div class="mb-2 row">
                           	<label for="cnptBrno" class="col-form-label">사업자등록번호</label>
                            <div class="col-md-8">
	                            <input type="text" class="form-control" placeholder="사업자번호 입력" name="cnptBrno" id="cnptBrno" value="${cnptVO.cnptBrno}">
                            </div>
		                     <div class="col-md-2">
		                         <button type="button" class="btn btn-info waves-effect waves-light">조회</button>
		                     </div>
                        </div>
                        <div class="mb-2 row">
                            <label for="cmncdCd" class="col-form-label">업종분류</label>
	                         <select class="form-select" name="cmncdCd" id="cmncdCd">
	                         	<c:forEach var="cmncdVO" items="${cmncdList}">
		                         	<option value="${cmncdVO.cmncdCd}">${cmncdVO.cmncdNm1}</option>
	                         	</c:forEach>
	                         </select>
<%--                             <input type="text" class="form-control" placeholder="업종분류 입력" name="cmncdCd" id="cmncdCd" value="${cnptVO.cmncdCd}"> --%>
                        </div>                     
                        <div class="mb-2 row">
                            <label for="cnptRprsvNm" class="col-form-label">대표자 이름</label>
                            <input type="text" class="form-control" placeholder="대표자 이름 입력" name="cnptRprsvNm" id="cnptRprsvNm" value="${cnptVO.cnptRprsvNm}">
                        </div>                     
                        <div class="mb-2 row">
                            <label for="cnptTel" class="col-form-label">연락처</label>
                            <input type="text" class="form-control" placeholder="연락처 입력" name="cnptTel" id="cnptTel" value="${cnptVO.cnptTel}">
                        </div>                     
                        <div class="mb-2 row">
                            <label for="cnptZip" class="col-form-label">우편번호</label>
                            <div class="col-md-8">
                            	<input type="text" class="form-control"  name="cnptZip" id="cnptZip" value="${cnptVO.cnptZip}">
                            </div>
		                     <div class="col-md-4">
		                         <button type="button" class="btn btn-info waves-effect waves-light" onclick="openHomeSearch()">우편번호 검색</button>
		                     </div>    
                        </div>
                        <div class="mb-2 row">
                            <label for="cnptAddr" class="col-form-label">주소</label>
                            <input type="text" class="form-control" name="cnptAddr" id="cnptAddr" value="${cnptVO.cnptAddr}">
                        </div>                      
                        <div class="mb-2 row">
                            <label for="cnptDaddr" class="col-form-label">상세주소</label>
                            <input type="text" class="form-control" name="cnptDaddr" id="cnptDaddr" value="${cnptVO.cnptDaddr}">
                        </div>                      
		                 <div class="mb-2 row">
		                     <label for="cnptYn" class="col-form-label">거래여부</label>
		                     <div class="col-md-2">
		                         <select class="form-select" name="cnptYn" id="cnptYn">
		                             <option>Y</option>
		                             <option>N</option>
		                         </select>
		                     </div>
		                 </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
                    <button type="button" class="btn btn-primary" id="updateBasicBtn">수정</button>
                </div>
              </form>
            </div>
        </div>
    </div>
</div> 
<!-- 기본정보 수정 Modal 끝 -->

<!-- 계좌정보 수정 Modal 시작 -->
<div>
    <div class="modal fade" id="modalAct" tabindex="-1" aria-labelledby="modalActLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
              <form action="/cnpt/updateAct" method="post" id="updateActFrm">
                <div class="modal-header">
                    <h5 class="modal-title" id="modalActLabel">계좌정보 수정</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                        <div class="mb-2 row" hidden="true">
                            <label for="cnptId" class="col-form-label">거래처아이디</label>
                            <input type="text" class="form-control" id="cnptId" name="cnptId" value="${cnptVO.cnptId}">
                        </div>
                        <div class="mb-2 row">
                            <label class="form-label">은행명</label>
                            <select class="form-select" title="은행명을 선택해주세요" name="cnptBankNm" id="cnptBankNm" >
	                          <option>기업은행</option>
	                          <option>국민은행</option>                                	
	                          <option>외환은행</option>                                	
	                          <option>수협</option>                                	
	                          <option>농협</option>                                	
	                          <option>우리은행</option>                                	
	                          <option>제일은행</option>                                	
	                          <option>씨티은행</option>                                	
	                          <option>대구은행</option>                                	
	                          <option>부산은행</option>                                	
	                          <option>광주은행</option>                                	
	                          <option>제주은행</option>                                	
	                          <option>전북은행</option>                                	
	                          <option>경남은행</option>                                	
	                          <option>새마을금고</option>                                	
	                          <option>신협</option>                                	
	                          <option>우체국</option>                                	
	                          <option>하나은행</option>                                	
	                          <option>신한은행</option>                                	
	                          <option>카카오뱅크</option>                                	
                            </select>
                        </div>                     
                        <div class="mb-2 row">
                            <label class="form-label">계좌번호</label>
                            <input class="form-control" type="text" placeholder="계좌번호 입력" name="cnptActno" id="cnptActno" value="${cnptVO.cnptActno}">
                        </div>                     
                        <div class="mb-2 row">
                            <label class="form-label">예금주명</label>
                            <input class="form-control" type="text" placeholder="예금주명 입력" name=cnptActnm id="cnptActnm" value="${cnptVO.cnptActnm}">
                        </div>     
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
                    <button type="button" class="btn btn-primary" id="updateActBtn">수정</button>
                </div>
               </form>
            </div>
        </div>
    </div>
</div> 
<!-- 계좌정보 수정 Modal 끝 -->
<!-- 담당자 정보 수정 Modal 시작 -->
<div>
    <div class="modal fade" id="modalCharger" tabindex="-1" aria-labelledby="modalChargerLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="modalChargerLabel">담당자 정보 수정</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
              <form action="/cnpt/updateCharger" method="post" id="updateChargerFrm">
                <div class="modal-body">
                        <div class="mb-2 row" hidden="true">
                            <label for="cnptId" class="col-form-label">거래처아이디</label>
                            <input type="text" class="form-control" id="cnptId" name="cnptId" value="${cnptVO.cnptId}">
                        </div>
                        <div class="mb-2 row">
                            <label class="form-label">담당자명</label>
                            <input class="form-control" type="text" placeholder="담당자명 입력" name="cnptCharger" id="cnptCharger" value="${cnptVO.cnptCharger}">
                        </div>                     
                        <div class="mb-2 row">
                            <label class="form-label">담당자이메일</label>
                            <input class="form-control" type="text" placeholder="담당자이메일 입력" name="cnptMail" id="cnptMail" value="${cnptVO.cnptMail}">
                        </div>     
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
                    <button type="button" class="btn btn-primary" id="updateChargerBtn">수정</button>
                </div>
              </form>
            </div>
        </div>
    </div>
</div> 
<!-- 담당자 정보 수정 Modal 끝 -->
<!-- Modal 끝 -->

<!-- end row -->
<!-- container-fluid -->

</body>
</html>