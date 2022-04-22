<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page import = "java.util.Calendar" %>

<%
	String Today = new java.text.SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date());
%>
<c:set value="<%=Today%>" var="Today" />

<script type="text/javascript">

function typeChange(e) {
	
    var c = ["인사(PM)", "기획(PL)", "영업(BU)", "물류(DT)", "재무(FM)"];
    var b = [ "관리(AD)", "창고(WM)", "매장(SM)", "총괄(GE)"];
   
    
    var cc = [ "부장", "과장", "대리", "사원"];
    var bb = [ "직급선택", "지점장", "팀장", "직원"];
    
    var target = document.getElementById("typeD");
    var targett = document.getElementById("typeDD");
    
    if(e.value == "BRN00000") var d = c; 
    else var d = b;

    if(e.value == "BRN00000") var dd = cc; 
    else var dd = bb; 
    
    
	/*  option이 중첩되지 않게 해준드아 */
    target.options.length = 0;
    targett.options.length = 0;
    

    for (x in d) {
        var opt = document.createElement("option");
        opt.value = d[x];
        opt.innerHTML = d[x];
        target.appendChild(opt);
    }   
    
    for (x in dd) {
    	//targett.empty();
        var opt = document.createElement("option");
        opt.value = dd[x];
        opt.innerHTML = dd[x];
        targett.appendChild(opt);
    }   
}

function fn_click(){
	
	location.href="/emp/emplist"
}

function clickShow(){
	$(".card-title").on("click", function(){
		$("#empNm").val("김티코");
		$("#empBrdt").val("1999-11-11");
		$("#BRN00003").prop("selected", true);
	 	var opt = document.createElement("option");
	 	opt.value = "매장(SM)";
	 	opt.innerHTML = "매장(SM)";
	 	
	    var target = document.getElementById("typeD");
	    target.appendChild(opt);
	    
	    var opt2 = document.createElement("option");
	    opt2.value = "직원";
	    opt2.innerHTML = "직원";
	    
	    var targett = document.getElementById("typeDD");
	    targett.appendChild(opt2);
	    
		$("#typeD").val("매장(SM)");
		$("#typeDD").val("직원");
		$("#empTel").val("010-1112-3334");
		$("#empPswd").val("1234");
		$("#empMail").val("tco99@tco.com");
		$("#empIp").val("121.122.521");
		$("#empActno").val("123125-12-151522");
		$("input:radio[name='empSe']:radio[value='정규직']").prop("checked", true);
		
	});
}

$(document).ready(function() {
	
	clickShow();
	 
	// 근무지점 숨기기
	/* $('.div1').hide(); */
	
	  /* $('#opt').change(function() {
	    var result = $('#opt option:selected').val();
	    // 지점 선택시 근무지점 보이기
	    if (result == '지점') {
	      $('.div1').show();
	    } else {
	      $('.div1').hide();
	    }
	  });  */
	  
		// 지점장 왜 안숨겨지
 	  $('#typeDD').find('[value=지점장]').hide();
	  
	  $('#typeD').change(function() {
	    var result = $('#typeD option:selected').val();
	    alert(result);
	    // 총괄 선택시 직급에서 팀장, 직원 숨기기 
	    if (result == '총괄(GE)') {
	    	 /* alert("이얍"); */

	    	 $('#typeDD').find('[value=지점장]').show();
	    	 $('#typeDD').find('[value=팀장]').hide();
	    	 $('#typeDD').find('[value=직원]').hide();
	    	
	    } else {
	    	/* alert("키킼"); */

	    	 $('#typeDD').find('[value=팀장]').show();
	    	 $('#typeDD').find('[value=직원]').show();
	    	 $('#typeDD').find('[value=지점장]').hide();
	    }
	  });  
	}); 

</script>


    <!-- start page title -->
    <div class="row">
        <div class="col-12">
	         <div class="page-title-box d-sm-flex align-items-center justify-content-between">
	             <h1 class="mb-sm-0 font-size-20"><i class="bx bx-building-house"></i>직원 등록</h1>

                <div class="page-title-right">
                    <ol class="breadcrumb m-0">
                        <li class="breadcrumb-item"><a href="javascript: void(0);">직원기능</a></li>
                        <li class="breadcrumb-item active">직원등록</li>
                    </ol>
                </div>

            </div>
        </div>
    </div>
    <!-- end page title -->

    <div class="checkout-tabs">
            <div class="row">
            
                <div class="col-12">
                    <div class="card">
                        <div class="card-body">
                            <div class="tab-content" id="v-pills-tabContent">
                                <div class="tab-pane fade active show" id="v-pills-shipping" role="tabpanel" aria-labelledby="v-pills-shipping-tab">
                                    <div>
                                        <h4 class="card-title">직원관리</h4>
                                        <p class="card-title-desc">직원등록</p>
                                        <!-- ****************** FORM  시작 ****************  -->
                                        <form:form modelAttribute="empVO" method="post" action="/emp/empinsert" enctype="multipart/form-data">  
                                            <div class="form-group row mb-4">
                                                <label for="billing-name" class="col-md-2 col-form-label">이름</label>
                                                <div class="col-md-10">
                                                    <form:input path="empNm" class="form-control"  placeholder="Enter your name" />
                                                </div>
                                            </div>
                                            
                                            
                                            <div class="mb-3 row">
                                            <label for="example-date-input" class="col-md-2 col-form-label" >생년월일</label>
                                            <div class="col-md-10">
                                                <form:input path="empBrdt" class="form-control" type="date" value="${Today}" id="example-date-input"  />
                                            </div>
                                        </div>
                                        
                                   <div class="mt-3">
                                                        <label for="formFile" class="form-label">프로필 사진</label>
                                                        <input class="form-control" type="file" id="empImg" name="uploadFile">
                                       </div>
                                                
                                           <div class="form-group row mb-4">
                                                <label class="col-md-2 col-form-label">직급</label>
                                                <div class="col-md-10">
                                                <label class="col-md-2 col-form-label" for="type">[근무지]</label>
                                                    <form:select path ="brncofcId" class="form-select" onchange="typeChange(this)">
                                                        <option value="0" data-select2-id="6">유형을 선택해주세요</option>
                                                        <option value="BRN00000">본사</option>
                                                        <option value="BRN00003" id="BRN00003">부산지점</option>
                                                        <option value="BRN00001">대전지점</option>
                                                        <option value="BRN00002">인천지점</option>
                                                       
                                                   </form:select>
                                                     
                                                     <%-- <div class="div1">
                                                     <label class="col-md-2 col-form-label" for="brnId">[근무지점]</label>
                                                      <form:select path="brncofcId" class="form-select" id="brnId" name="brnId">
                                                        <option value="0" data-select2-id="6">유형을 선택해주세요</option>
                                                        <option value="부산지점">부산지점</option>
                                                        <option value="대전지점">대전지점</option>
                                                        <option value="인천지점">인천지점</option>
                                                      </form:select>
                                     				</div> --%>
                                     				                 
                                                     <label class="col-md-2 col-form-label" for="typeD">[부서]</label>
                                                      <form:select path="dptopt" class="form-select" id="typeD" name="typeD">
                                                        <option value="0" data-select2-id="6">부서를 선택해주세요</option>
                                                      </form:select>
                                                      
                                                      
                                                     <label class="col-md-2 col-form-label" for="typeDD">[직급]</label>
													<form:select path="lelopt" class="form-select" name="typeDD" id="typeDD">
														<option value="0" data-select2-id="6">직급을 선택해주세요</option>
													</form:select>
                                                </div>
                                            </div>
                                            <div class="mb-3 row">
                                            <label for="example-date-input" class="col-md-2 col-form-label">입사일</label>
                                            <div class="col-md-10">
                                                <form:input path="empJncmpYmd" class="form-control" type="date" value="${Today}" />
                                            </div>
                                        </div>
                                        
                                        
                                        <div class="form-group row mb-4">
                                                <label for="billing-email-address" class="col-md-2 col-form-label">연락처</label>
                                                <div class="col-md-10">
                                                    <form:input path ="empTel"  class="form-control" placeholder="Enter your tel" />
                                                </div>
                                            </div>
                                            
                                            
                                            <div class="form-group row mb-4">
                                                <label for="billing-email-address" class="col-md-2 col-form-label">Email Address</label>
                                                <div class="col-md-10">
                                                    <form:input path ="empMail" type="email" class="form-control" placeholder="Enter your email" />
                                                </div>
                                            </div>
                                            
                                            <div class="mb-3 row">
                                            <label for="example-password-input" class="col-md-2 col-form-label">비밀번호</label>
                                            <div class="col-md-10">
                                                <form:input path="empPswd" class="form-control" type="password" value="hunter2" placeholder="Enter Password" />
                                            </div>
                                        </div>
                                        
                                            <div class="form-group row mb-4">
                                                <label for="billing-phone" class="col-md-2 col-form-label">IP주소</label>
                                                <div class="col-md-10">
                                                    <form:input path="empIp" type="text" class="form-control" placeholder="Enter your Phone no." />
                                                </div>
                                            </div>
                                            
                                            <div class="form-group row mb-4">
                                                <label for="billing-phone" class="col-md-2 col-form-label">계좌번호</label>
                                                <div class="col-md-10">
                                                    <form:input path ="empActno" type="text" class="form-control"  placeholder="Enter your Phone no." />
                                                </div>
                                            </div>
                                            
                                            <div class="col-xl-3 col-sm-6">
                                                <div class="mt-4">
                                                    <label for="billing-phone" class="col-md-2 col-form-label">직원유형</label>
                                                    <div>
                                                        <div class="form-check form-check-right mb-3">
                                                            <form:radiobutton path="empSe" class="form-check-input"  checked="" value="정규직" name="정규직"  />
                                                            <label class="form-check-label" for="formRadiosRight1" >정규직</label>
                                                            
                                                        </div>
                                                       
                                                        <div class="form-check form-check-right mb-3">
                                                            <form:radiobutton path="empSe" class="form-check-input"  checked=""  value="퇴사" name="퇴사" />
                                                            <label class="form-check-label" for="formRadiosRight1" >퇴사</label>
                                                            
                                                        </div>
                                                    </div>


                                                </div>
                                            </div>
                                         <div class="col-sm-6">
		                            <div class="text-end">
		                             <!--    <a href="ecommerce-checkout.html" class="btn btn-success">
		                                    <i class="mdi mdi-truck-fast me-1"></i> Proceed to Shipping </a> -->
		                                    <button type="submit" class="btn btn-primary waves-effect waves-light w-sm">
		                                       <i class="mdi mdi-download d-block font-size-10"></i> 저장
		                                   </button>
		                            </div>
		                        </div> <!-- end col -->
                                            
                                        </form:form>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
             
                </div>
            </div>
        </div>
        <!-- end row -->
        
        <script src="assets/libs/jquery/jquery.min.js"></script>
        <script src="assets/libs/bootstrap/js/bootstrap.bundle.min.js"></script>
        <script src="assets/libs/metismenu/metisMenu.min.js"></script>
        <script src="assets/libs/simplebar/simplebar.min.js"></script>
        <script src="assets/libs/node-waves/waves.min.js"></script>
        <script src="assets/js/app.js"></script>
        
     


