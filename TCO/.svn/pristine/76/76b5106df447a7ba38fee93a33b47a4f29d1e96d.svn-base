<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
<script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<script src="/resources/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
//다음 우편번호 검색
function openHomeSearch(){
	new daum.Postcode({
		oncomplete:function(data){
			$('[name=custZip]').val(data.zonecode);
			$('[name=custAddr]').val(data.address);
			$('[name=custDaddr]').val(data.buildingName);
		}
	}).open();
}

$(function(){
	
	//상세조회 페이지 수정 못하게
	$(".detail").attr("readonly", true);

	$('input:radio[name="custMrgYn"]:input[value="${custVO.custMrgYn}"]').attr("checked", true);
	$('input:radio[name="custGndr"]:input[value="${custVO.custGndr}"]').attr("checked", true);
	if("${custVO.custMktRcptnAgreYn}" == "Y") {
		$('input:checkbox[name="custMktRcptnAgreYn"]:checkbox[value="${custVO.custMktRcptnAgreYn}"]').prop("checked", true);
	}
	
	//기본정보 수정버튼 클릭시 전송
	$("#updateBtn").on("click", function(){
		//$("#updateFrm").submit();
		//수정 전송
		$.ajax({
		    type: "POST",
		    url : "/cust/custupdate",
		    data : $("#updateFrm").serialize(),
		    contentType : "application/x-www-form-urlencoded; charset=utf-8",
		    dataType : "json",
		    success : function(data){
		    	console.log("data뭐노?" + data);
		    	var res = parseInt(data);
		    	
		        if(res > 0){
		        // Sweet Alert
		          Swal.fire({
			          icon:'success',
			          title:'수정이 완료되었습니다',
		       		}).then(function(){
		       			window.location.reload();
		       		})
		        }else{
		        	console.log("에러");
		        }
				
		        
		    },
		    error : function(){
		        //Ajax 실패시
		    	Swal.fire({
		          icon:'error',
		          title:'수정에 실패하였습니다',
	       		}, function(){
	       			//새로고침
	       			window.location.reload();
	       		});
		    }
		});
	});
	
	
	$(".deleteCust").on("click", function(){
		var custId = "${custVO.custId}";
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
					          title:'탈퇴 완료되었습니다',
				       		}).then(function(){
				       			window.location.href="/cust/custlist";
				       		})
				        }else{
				        	//Ajax 실패시
					    	Swal.fire({
					          icon:'error',
					          title:'탈퇴에 실패하였습니다',
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
		
	});
	
});
</script>
<title>고객 등록</title>
</head>
<body>
<!-- start page title -->
<div class="row">
    <div class="col-12">
        <div class="page-title-box d-sm-flex align-items-center justify-content-between">
            <h1 class="mb-sm-0 font-size-20"><i class="bx bx-building-house"></i>고객 상세</h1>

            <div class="page-title-right">
                <ol class="breadcrumb m-0">
                    <li class="breadcrumb-item"><a href="javascript: void(0);">고객</a></li>
                    <li class="breadcrumb-item active">고객 상세</li>
                </ol>
           
            </div>

        </div>
    </div>
</div>
<!-- end page title -->

<!-- form태그 시작 -->
<div class="row">
    <div class="col-12">
        <div class="card">
            <div class="card-body">

                <div class="d-flex gap-3">
                	<h4 class="card-title">기본정보</h4>
				<div class="d-flex gap-3">
                 	<a href="javascript:void(0);" class="text-success" data-bs-toggle="modal" data-bs-target="#modalBasic"><i class="mdi mdi-pencil font-size-18"></i></a>
                 	<a href="javascript:void(0);" class="text-danger deleteCust"><i class="mdi mdi-delete font-size-18"></i></a>
				</div>
            	</div>
			<hr><br>
                <div class="mb-3 row">
                    <label for="example-text-input" class="col-md-2 col-form-label">고객명 </label>
                    <div class="col-md-4">
                        <input class="form-control detail" type="text" value="${custVO.custNm}" />
                    </div>
                </div>
                <div class="mb-3 row">
                    <label class="col-md-2 col-form-label">전화번호 </label>
                    <div class="col-md-6">
                        <input class="form-control detail" type="tel" value="${custVO.custTel}" />
                    </div>
                </div>                 
                <div class="mb-3 row">
                    <label for="example-email-input" class="col-md-2 col-form-label">이메일  </label>
                    <div class="col-md-6">
                        <input class="form-control detail" type="email" value="${custVO.custMail}" />
                    </div>
                </div>
                <div class="mb-3 row">
                    <label for="example-week-input" class="col-md-2 col-form-label">우편번호 </label>
                    <div class="col-md-6">
                        <input class="form-control detail" type="text" value="${custVO.custZip}" />
                    </div>     
                </div>
                <div class="mb-3 row">
                    <label for="example-month-input" class="col-md-2 col-form-label">주소 </label>
                    <div class="col-md-6">
                        <input class="form-control detail" type="text" value="${custVO.custAddr}" />
                    </div>
                </div>
                <div class="mb-3 row">
                    <label for="example-month-input" class="col-md-2 col-form-label">상세주소 </label>
                    <div class="col-md-6">
                        <input class="form-control detail" type="text" value="${custVO.custDaddr}" />
                    </div>
                </div>
                <div class="mb-3 row">
                    <label for="example-url-input" class="col-md-2 col-form-label">생년월일 </label>
                    <div class="col-md-6">
                        <input class="form-control detail" type="date" value="${custVO.custBrdt}"/>
                    </div>
                </div>
                <div class="mb-3 row">
                    <label for="example-tel-input" class="col-md-2 col-form-label">카드번호 </label>
                    <div class="col-md-6">
                        <input class="form-control detail" type="text" value="${custVO.custCrcdNo}" />
                    </div>
                </div>
                <div class="mb-3 row">
                    <label for="example-password-input" class="col-md-2 col-form-label">결혼여부</label>
                    <div class="col-md-6">
                    	 <c:if test="${custVO.custMrgYn eq 'Y'}">
					 	<input class="form-control detail" type="text" value="기혼" />
					 </c:if>
                    	 <c:if test="${custVO.custMrgYn eq 'N'}">
					 	<input class="form-control detail" type="text" value="미혼" />
					 </c:if>
                    </div>
                </div>
    <div class="mb-3 row">
                    <label for="example-password-input" class="col-md-2 col-form-label">성별 </label>
                    <div class="col-md-6">
                        <c:if test="${custVO.custGndr eq 'F'}">
					 	<input class="form-control detail" type="text" value="여성" />
					 </c:if>
                    	 <c:if test="${custVO.custGndr eq 'M'}">
					 	<input class="form-control detail" type="text" value="남성" />
					 </c:if>
                    </div>
                </div>
                <div class="mb-3 row">
                    <label for="example-week-input" class="col-md-2 col-form-label">마케팅수신여부</label>
                    <div class="col-md-6">
                        <c:if test="${custVO.custMktRcptnAgreYn eq 'Y'}">
					 	<input class="form-control detail" type="text" value="마케팅수신 동의" />
					 </c:if>
                    	 <c:if test="${custVO.custMktRcptnAgreYn eq 'N'}">
					 	<input class="form-control detail" type="text" value="마케팅수신 비동의" />
					 </c:if>
                    </div>    
                </div>
              
            </div>
        </div>
    </div> <!-- end col -->
</div>
<!-- end row -->
<!-- 기본정보 수정 Modal 시작 -->
<div>
    <div class="modal fade" id="modalBasic" tabindex="-1" aria-labelledby="modalBasicLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="modalBasicLabel">기본정보 수정</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
               <form action="/cust/custupdate" method="post" id="updateFrm">
                <div class="modal-body">
                        <div class="mb-2 row" hidden="true">
                            <label for="custId" class="col-form-label">고객번호</label>
                            <input type="text" class="form-control" id="custId" name="custId" value="${custVO.custId}">
                        </div>
                        <div class="mb-2 row">
                            <label for="custId" class="col-form-label">고객명</label>
                            <input class="form-control" type="text" id="custNm" name="custNm" value="${custVO.custNm}" />
                        </div>
                        <div class="mb-2 row">
                            <label for="custId" class="col-form-label">전화번호</label>
	                    <input class="form-control" type="tel" id="custTel" name="custTel" value="${custVO.custTel}" />
                        </div>
                        <div class="mb-2 row">
                            <label for="custId" class="col-form-label">이메일</label>
	                    <input class="form-control" type="email" id="custMail" name="custMail" value="${custVO.custMail}" />
                        </div>
                        <div class="mb-2 row">
                            <label for="custId" class="col-form-label">우편번호</label>
				    		<div class="col-md-8">
		                    	<input class="form-control" type="text" id="custZip" name="custZip" value="${custVO.custZip}" />
				    		</div>
				    		<div class="col-md-4">
		                    	<button type="button" class="btn btn-info waves-effect waves-light" onclick="openHomeSearch()">우편번호 검색</button>
				    		</div>
                        </div>
                        <div class="mb-2 row">
                            <label for="cnptId" class="col-form-label">주소</label>
                            <input type="text" class="form-control" name="custAddr" id="custAddr" value="${custVO.custAddr}">
                        </div>                      
                        <div class="mb-2 row">
                            <label for="cnptId" class="col-form-label">상세주소</label>
                            <input type="text" class="form-control" name="custDaddr" id="custDaddr" value="${custVO.custDaddr}">
                        </div> 
                        <div class="mb-2 row">
                            <label for="custId" class="col-form-label">생년월일</label>
                            <input class="form-control" type="date" id="custBrdt" name="custBrdt" value="${custVO.custBrdt}"/>
                        </div>
                        <div class="mb-2 row">
                            <label for="custId" class="col-form-label">카드번호</label>
                            <input class="form-control" type="text" id="custCrcdNo" name="custCrcdNo" value="${custVO.custCrcdNo}" />
                        </div>                     
                        <div class="mb-2 row">
                            <label for="custId" class="col-form-label">결혼여부</label>
                            <div class="form-check form-radio-info mt-2">
	                        <input type="radio" class="form-check-input" id="mrgy" name="custMrgYn" value="Y" />
	                        <label class="form-check-label" for="mrgy">
	                        	기혼
	                        </label>
	                    </div>
                            <div class="form-check form-radio-info mt-2">
                                <input type="radio" class="form-check-input" value="N" id="mrgn" name="custMrgYn" />
                                <label class="form-check-label" for="mrgn">
                            	    미혼
                                </label>
                            </div>
                        </div>
                        <div class="mb-2 row">
                            <label for="custId" class="col-form-label">성별</label>
                            <div class="form-check form-radio-info mt-2">
	                        <input type="radio" class="form-check-input" value="F" id="fml" name="custGndr" />
	                        <label class="form-check-label" for="formRadios3">
	                        	여성
	                        </label>
	                    </div>
                        <div class="form-check form-radio-info mt-2">
                            <input type="radio" class="form-check-input" value="M" id="ml" name="custGndr" />
                            <label class="form-check-label" for="ml">
                            	남성
                            </label>
                        </div>
                        </div>                                              
                        <div class="mb-2 row">
                            <label for="cnptId" class="col-form-label">마케팅수신여부</label>
                            <div class="form-check form-check-info mt-2">
                            <input type="checkbox" class="form-check-input" value="Y" id="mkty" name="custMktRcptnAgreYn" />
                            <label class="form-check-label" for="mkty">
                                	마케팅 수신여부 동의
                            </label>
                        </div>  
                        </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
                    <button type="button" class="btn btn-primary" id="updateBtn">수정</button>
                </div>
              </form>
            </div>
        </div>
    </div>
</div> 
<!-- 기본정보 수정 Modal 끝 -->
 
 <!-- form태그 끝 -->
 <!-- end row -->
 
 <div class="row">
     <div class="col-lg-12">
         <div class="card">
             <div class="card-body">
                 <div class="col-md-12">
		     <button type="button" onclick="location.href='/cust/custlist'" class="btn btn-secondary waves-effect waves-light" id="bt">목록</button>	
                 </div>                 
             </div>
         </div>
     </div>
 </div>
<!-- container-fluid -->
 
</body>
</html>