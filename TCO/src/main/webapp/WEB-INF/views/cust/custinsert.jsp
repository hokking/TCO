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
// Classes
.pull-left {
  float: left !important;
}
.pull-right {
  float: right !important;
}
// Class
.center-block {
  display: block;
  margin-left: auto;
  margin-right: auto;
}

</style>
<script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>
<script src="/resources/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">

	$(function() {
// 		$("#custZip").on("click", openHomeSearch());
// 		$("#custAddr").on("click", openHomeSearch());
	})

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
</script>
<title>고객 등록</title>
</head>
<body>
<!-- start page title -->
 <div class="row">
     <div class="col-12">
         <div class="page-title-box d-sm-flex align-items-center justify-content-between">
             <h1 class="mb-sm-0 font-size-20">👭고객 등록</h1>

             <div class="page-title-right">
                 <ol class="breadcrumb m-0">
                     <li class="breadcrumb-item"><a href="javascript: void(0);">고객</a></li>
                     <li class="breadcrumb-item active">고객 등록</li>
                 </ol>
            
             </div>

         </div>
     </div>
 </div>
 <!-- end page title -->
 
 <!-- form태그 시작 -->
 <form:form modelAttribute="custVO" method="post" action="/cust/custinsert">
 <div class="row">
     <div class="col-12">
         <div class="card">
             <div class="card-body">

                 <h4 class="card-title">기본정보</h4>
				<hr><br>
                 <div class="mb-3 row">
                     <label for="example-text-input" class="col-md-2 col-form-label">고객명 <font color="red">*</font></label>
                     <div class="col-md-4">
                         <form:input path="custNm" class="form-control" type="text" />
                     </div>
                 </div>
                 <div class="mb-3 row">
                     <label class="col-md-2 col-form-label">전화번호 <font color="red">*</font></label>
                     <div class="col-md-6">
                         <form:input path="custTel" class="form-control" type="tel" placeholder="000-0000-0000" />
                     </div>
                 </div>                 
                 <div class="mb-3 row">
                     <label for="example-email-input" class="col-md-2 col-form-label">이메일  <font color="red">*</font></label>
                     <div class="col-md-6">
                         <form:input path="custMail" class="form-control" type="email" placeholder="tco123@tco.com" />
                     </div>
                 </div>
                 <div class="mb-3 row">
                     <label for="example-week-input" class="col-md-2 col-form-label">우편번호<font color="red">*</font></label>
                     <div class="col-md-4">
                         <form:input path="custZip" class="form-control" type="text" value="우편번호" onclick="openHomeSearch()" />
                     </div>
                     <div class="col-md-2">
                         <button type="button" class="btn btn-info waves-effect waves-light" onclick="openHomeSearch()">우편번호 검색</button>
                     </div>     
                 </div>
                 <div class="mb-3 row">
                     <label for="example-month-input" class="col-md-2 col-form-label">주소<font color="red">*</font></label>
                     <div class="col-md-6">
                         <form:input path="custAddr" class="form-control" type="text" onclick="openHomeSearch()" />
                     </div>
                 </div>
                 <div class="mb-3 row">
                     <label for="example-month-input" class="col-md-2 col-form-label">상세주소<font color="red">*</font></label>
                     <div class="col-md-6">
                         <form:input path="custDaddr" class="form-control" type="text" />
                     </div>
                 </div>
                 <div class="mb-3 row">
                     <label for="example-url-input" class="col-md-2 col-form-label">생년월일<font color="red">*</font></label>
                     <div class="col-md-6">
                         <form:input class="form-control" type="date" path="custBrdt"/>
                     </div>
                 </div>
                 <div class="mb-3 row">
                     <label for="example-tel-input" class="col-md-2 col-form-label">카드번호 <font color="red">*</font></label>
                     <div class="col-md-6">
                         <form:input path="custCrcdNo" class="form-control" type="text" />
                     </div>
                 </div>
                 <div class="mb-3 row">
                     <label for="example-password-input" class="col-md-2 col-form-label">결혼여부<font color="red">*</font></label>
                     <div class="col-md-4">
                         <div class="form-check form-radio-info mt-2">
	                        <form:radiobutton path="custMrgYn" class="form-check-input" value="Y" id="mrgy" checked="true" />
	                        <label class="form-check-label" for="mrgy">
	                        	기혼
	                        </label>
	                    </div>
                        <div class="form-check form-radio-info mt-2">
                            <form:radiobutton path="custMrgYn" class="form-check-input" value="N" id="mrgn" />
                            <label class="form-check-label" for="mrgn">
                            	미혼
                            </label>
                        </div>
                     </div>
                 </div>
     <div class="mb-3 row">
                     <label for="example-password-input" class="col-md-2 col-form-label">성별<font color="red">*</font></label>
                     <div class="col-md-4">
                         <div class="form-check form-radio-info mt-2">
	                        <form:radiobutton path="custGndr" class="form-check-input" value="F" id="fml" checked="true" />
	                        <label class="form-check-label" for="formRadios3">
	                        	여성
	                        </label>
	                    </div>
                        <div class="form-check form-radio-info mt-2">
                            <form:radiobutton path="custGndr" class="form-check-input" value="M" id="ml" />
                            <label class="form-check-label" for="ml">
                            	남성
                            </label>
                        </div>
                     </div>
                 </div>
                 <div class="mb-3 row">
                     <label for="example-week-input" class="col-md-2 col-form-label">마케팅수신여부</label>
                     <div class="col-md-4">
                         <div class="form-check form-check-info mt-2">
                            <form:checkbox path="custMktRcptnAgreYn" class="form-check-input" value="Y" id="mkty" />
                            <label class="form-check-label" for="mkty">
                                	마케팅 수신여부 동의
                            </label>
                        </div>
                     </div>    
                 </div>
               
             </div>
         </div>
     </div> <!-- end col -->
 </div>
 <!-- end row -->

 
 <!-- form태그 끝 -->
 <!-- end row -->
 
 <div class="row">
     <div class="col-lg-12">
         <div class="card">
             <div class="card-body">
                 <div class="col-md-12">
		     <button type="submit" class="btn btn-info waves-effect waves-light" id="bt">등록</button>
		     <button type="button" onclick="location.href='/cust/custlist'" class="btn btn-secondary waves-effect waves-light" id="bt">목록</button>	
                 </div>                 
             </div>
         </div>
     </div>
 </div>
</form:form>
<!-- container-fluid -->
 
</body>
</html>