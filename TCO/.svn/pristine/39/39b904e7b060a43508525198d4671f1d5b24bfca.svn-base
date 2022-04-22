<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style>
.card-title{
	font-size: 20px;
}
.col-form-label{
	font-size: 15px;
}
.bu{
	margin-right: 50px;
	float: right;
}
</style>

<script type="text/javascript">

	
    $(function(){
  //연락처 수정버튼 클릭시 전송	
	$("#Telbt").on("click", function(){
		
		//수정 전송
		$.ajax({
		    type: "POST",
		    url : "/emp/empTelupdate",
		    data : $("#formTel").serialize(), //Form의 값을 Controller의 empVO로 전달 
		    contentType : "application/x-www-form-urlencoded; charset=utf-8",
		    dataType : "json",
		    success : function(data){
		    	console.log("data뭐노?" + data);
		    	// 성공시 return값 String으로 받아오기 때문에 int로 바꿔주세요옹
		    	var res = parseInt(data);
		    	
		        if(res > 0){
		        // Sweet Alert
		          Swal.fire({
			          icon:'success',
			          title:'수정성공',
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
  
  // 이메일 수정버튼
	$("#Mailbt").on("click", function(){
		
		//수정 전송
		$.ajax({
		    type: "POST",
		    url : "/emp/empMailupdate",
		    data : $("#formMail").serialize(), //Form의 값을 Controller의 empVO로 전달 
		    contentType : "application/x-www-form-urlencoded; charset=utf-8",
		    dataType : "json",
		    success : function(data){
		    	console.log("data뭐노?" + data);
		    	// 성공시 return값 String으로 받아오기 때문에 int로 바꿔주세요옹
		    	var res = parseInt(data);
		    	
		        if(res > 0){
		        // Sweet Alert
		          Swal.fire({
			          icon:'success',
			          title:'성공데스까',
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
  
	 // 비밀번호 수정버튼
	$("#Pswdbt").on("click", function(){
		
		//수정 전송
		$.ajax({
		    type: "POST",
		    url : "/emp/empPswdupdate",
		    data : $("#formPswd").serialize(), //Form의 값을 Controller의 empVO로 전달 
		    contentType : "application/x-www-form-urlencoded; charset=utf-8",
		    dataType : "json",
		    success : function(data){
		    	console.log("data뭐노?" + data);
		    	// 성공시 return값 String으로 받아오기 때문에 int로 바꿔주세요옹
		    	var res = parseInt(data);
		    	
		        if(res > 0){
		        // Sweet Alert
		          Swal.fire({
			          icon:'success',
			          title:'성공데스까',
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
	 
	 // 상태 수정버튼
	$("#Sebt").on("click", function(){
		
		//수정 전송
		$.ajax({
		    type: "POST",
		    url : "/emp/empSeupdate",
		    data : $("#formSe").serialize(), //Form의 값을 Controller의 empVO로 전달 
		    contentType : "application/x-www-form-urlencoded; charset=utf-8",
		    dataType : "json",
		    success : function(data){
		    	console.log("data뭐노?" + data);
		    	// 성공시 return값 String으로 받아오기 때문에 int로 바꿔주세요옹
		    	var res = parseInt(data);
		    	
		        if(res > 0){
		        // Sweet Alert
		          Swal.fire({
			          icon:'success',
			          title:'성공데스까',
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
  
  
  
    });

</script>

<style>

.bu{
margin-left:1150px;
margin-top: 30px;
}

.im{
	width: 180px;
	height: 130px;
	border-radius: 5px;
	margin-left: 30px;
	margin-top: 30px;
}
</style>


    <!-- start page title -->
  <div class="row">
     <div class="col-12">
         <div class="page-title-box d-sm-flex align-items-center justify-content-between">
             <h1 class="mb-sm-0 font-size-20">😀직원정보</h1>
             

             <div class="page-title-right">
                 <ol class="breadcrumb m-0">
                     <li class="breadcrumb-item"><a href="javascript: void(0);">직원관리</a></li>
                     <li class="breadcrumb-item active">직원정보</li>
                 </ol>
             </div>

         </div>
     </div>
 </div>
    <!-- end page title -->

  
                
 <div class="col-12">
         <div class="card">
             <div class="card-body">
             
                 <div class="tab-content" id="v-pills-tabContent">
                     <div class="tab-pane fade active show" id="v-pills-shipping" role="tabpanel" aria-labelledby="v-pills-shipping-tab">
                         <div>

           <div class="d-flex gap-3">
                 	<h4 class="card-title">직원상세정보</h4>
		   </div>
	<br>
            <p class="text-muted mb-4">
            <div class="card overflow-hidden">
                                    <div class="bg-info bg-gradient">
                                        <div class="row">
                                            <div class="col-7">
                                               
                                            </div>
                                            <div class="col-5 align-self-end">
                                                <img src="assets/images/profile-img.png" alt="" class="img-fluid">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="card-body pt-0">
                                        <div class="row">
                                            <div class="col-sm-4">
                                                <div class="avatar-md profile-user-wid mb-4">
                                                    <img src="${data.empImg}" alt="" class="im">
                                                </div>
                                                
                                            </div>

                                            <div class="col-sm-8">
                                                <div class="pt-4">

                                                    <div class="row">
                                                        <div class="col-6">
                                                            <h4 class="font-size-18">이름</h4>
                                                            <b><p class="text-muted mb-0">${data.empNm}(${data.empId})</p></b>
                                                        </div>
                                                        <div class="col-6">
                                                            <h3 class="font-size-18">소속</h3>
                                                            <b><p class="text-muted mb-0">${data.brncofcNm}/${data.dptopt}</p></b>
                                                        </div>
                                                    </div>
                                                    <div class="mt-4">
                                                       <br>
                                                       <br>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
           
            <div>
                <table class="table table-nowrap mb-0">
                    <tbody>
                    
                        <tr>
                            <th scope="row">이름 :</th>
                            <td>${data.empNm}(${data.empId})</td>
                        </tr>
                        <tr>
                            <th scope="row">생년월일 :</th>
                             <fmt:formatDate var="empBrdt" value="${data.empBrdt}" pattern="yyyy-MM-dd"/>
                            <td>${empBrdt}</td>
                        </tr>
                        <tr>
                            <th scope="row">연락처 :</th>
                            <td>${data.empTel}&nbsp;
						<a href="#" class="font-size-16 text-success" data-bs-toggle="modal" data-bs-target="#exampleModal" data-bs-whatever="@mdo"><i class="mdi mdi-pencil font-size-18"></i></a>
	                 	
					</td>
                        </tr>
                        <tr>
                            <th scope="row">이메일 :</th>
                            <td>${data.empMail}
                            <a href="#" class="font-size-16 text-success" data-bs-toggle="modal" data-bs-target="#exampleModal2" data-bs-whatever="@mdo"><i class="mdi mdi-pencil font-size-18"></i></a>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row">입사일 :</th>
                             <fmt:formatDate var="empJncmpYmd" value="${data.empJncmpYmd}" pattern="yyyy-MM-dd"/>
                            <td>${empJncmpYmd}</td>
                        </tr>
                        <tr>
                            <th scope="row">소속 :</th>
                            <td>${data.brncofcNm}</td>
                        </tr>
                        <tr>
                            <th scope="row">부서 :</th>
                            <td>${data.dptopt}</td>
                        </tr>
                        <tr>
                            <th scope="row">직급 :</th>
                            <td>${data.lelopt}</td>
                        </tr>
                        <tr>
                            <th scope="row">상태 :</th>
                            <td>${data.empSe}
                              <a href="#" class="font-size-16 text-success" data-bs-toggle="modal" data-bs-target="#exampleModal4" data-bs-whatever="@mdo"><i class="mdi mdi-pencil font-size-18"></i></a>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row">IP :</th>
                            <td>${data.empIp}</td>
                        </tr>
                        <tr>
                            <th scope="row">비밀번호 :</th>
                            <td>${data.empPswd}
                            <a href="#" class="font-size-16 text-success" data-bs-toggle="modal" data-bs-target="#exampleModal3" data-bs-whatever="@mdo"><i class="mdi mdi-pencil font-size-18"></i></a>
                            </td>
                        </tr>
                    </tbody>
                </table>
                
                <div class="bu">
                
                <button type="button" class="btn btn-primary waves-effect waves-light" onClick="location.href='/emp/emplist'">목록으로</button>
            	</div>
            </div>
        
    <!-- end card -->

    
    <!-- end card -->
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
        
        
   <!-- 연락처 Modal 시작 -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" >
    <div class="modal-dialog">
    
        <div class="modal-content">
            <div class="modal-header">
              
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
            <div>
               <div class="card-body">
        			
                    <h4 class="card-title">직원정보</h4>
                    <p class="card-title-desc">연락처수정</p>
                    <!-- ****************** FORM  시작 ****************  -->
                    <form:form modelAttribute="data" name="formTel" id="formTel">  
                        
                    <div class="form-group row mb-4">
                            <label for="billing-email-address" class="col-md-2 col-form-label">연락처</label>
                            <div class="col-md-10">
                                <form:input type="text" path ="empTel" class="form-control" placeholder="Enter your tel" value="${empVO.empTel}" />
                            	<form:input type="text" path ="empId" class="form-control" hidden="true" />
                            </div>
                    </div>
               
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
                <button type="button" class="btn btn-primary" id="Telbt" name="Telbt">수정하기</button>
                
            </div>
              </form:form>
            </div>
        </div>
        
    </div>
</div>
</div>
</div>
<!-- Modal 끝 --> 
          
<!-- 이메일 Modal 시작 -->
<div class="modal fade" id="exampleModal2" tabindex="-1" aria-labelledby="exampleModalLabel" >
    <div class="modal-dialog">
    
        <div class="modal-content">
            <div class="modal-header">
              
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
            <div>
               <div class="card-body">
        			
                    <h4 class="card-title">직원정보</h4>
                    <p class="card-title-desc">이메일 수정</p>
                    <!-- ****************** FORM  시작 ****************  -->
                    <form:form modelAttribute="data"  name="formMail" id="formMail">  
                        
                    <div class="form-group row mb-4">
                            <label for="billing-email-address" class="col-md-2 col-form-label">이메일</label>
                            <div class="col-md-10">
                                <form:input type="text" path ="empMail" class="form-control" placeholder="Enter your tel" />
                                <form:input type="text" path ="empId" class="form-control" hidden="true" />
                            </div>
                    </div>
               
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
                <button type="button" class="btn btn-primary"  id="Mailbt" name="Mailbt">수정하기</button>
            </div>
              </form:form>
            </div>
        </div>
        
    </div>
</div>
</div>
</div>
<!-- Modal 끝 -->           
     
<!-- 비밀번호 Modal 시작 -->
<div class="modal fade" id="exampleModal3" tabindex="-1" aria-labelledby="exampleModalLabel" >
    <div class="modal-dialog">
    
        <div class="modal-content">
            <div class="modal-header">
              
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
            <div>
               <div class="card-body">
        			
                    <h4 class="card-title">직원정보</h4>
                    <p class="card-title-desc">비밀번호 수정</p>
                    <!-- ****************** FORM  시작 ****************  -->
                    <form:form modelAttribute="data" id="formPswd" name="formPswd">  
                        
                    <div class="form-group row mb-4">
                            <label for="billing-email-address" class="col-md-2 col-form-label">비밀번호</label>
                            <div class="col-md-10">
                                <form:input type="text" path ="empPswd" class="form-control" placeholder="Enter your tel" />
                                <form:input type="text" path ="empId" class="form-control" hidden="true" />
                            </div>
                    </div>
               
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
                <button type="button" class="btn btn-primary"  id="Pswdbt" name="Pswdbt">수정하기</button>
            </div>
              </form:form>
            </div>
        </div>
        
    </div>
</div>
</div>
</div>
<!-- Modal 끝 --> 
          
<!-- 상태 Modal 시작 -->
<div class="modal fade" id="exampleModal4" tabindex="-1" aria-labelledby="exampleModalLabel" >
    <div class="modal-dialog">
    
        <div class="modal-content">
            <div class="modal-header">
              
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
            <div>
               <div class="card-body">
        			
                    <h4 class="card-title">직원정보</h4>
                    <p class="card-title-desc">상태 수정</p>
                    <!-- ****************** FORM  시작 ****************  -->
                    <form:form modelAttribute="data" id="formSe" name="formSe">  
                        <form:input type="text" path ="empId" class="form-control" hidden="true" />
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
               
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
                <button type="button" class="btn btn-primary" id="Sebt" name="Sebt">수정하기</button>
            </div>
              </form:form>
            </div>
        </div>
        
    </div>
</div>
</div>
</div>
<!-- Modal 끝 -->           
     