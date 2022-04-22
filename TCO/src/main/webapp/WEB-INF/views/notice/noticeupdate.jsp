<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript" src="/resources/ckeditor/ckeditor.js"></script>
<style>
.inp{
	width: 100%;
	height: 40px;
	font-size: 20px;
	border:none;
}
</style>

 <div class="row">
     <div class="col-12">
         <div class="page-title-box d-sm-flex align-items-center justify-content-between">
             <h1 class="mb-sm-0 font-size-20">📋공지사항 수정</h1>

             <div class="page-title-right">
                 <ol class="breadcrumb m-0">
                     <li class="breadcrumb-item"><a href="javascript: void(0);">공지사항</a></li>
                     <li class="breadcrumb-item active">공지사항 수정</li>
                 </ol>
             </div>

         </div>
     </div>
 </div>
 
    <div class="form-group row mb-4 m-2">
 	<form method="post" action="/notice/noticeupdate" enctype="multipart/form-data"> 
 	  	<input id="brdId" name="brdId" value="${list.brdId}" hidden="true" />
            <input id="brdTtl" name= "brdTtl" value="${list.brdTtl}" type="text"  class="inp"/>
                	<textarea class="form-control" id="brdCn" name="brdCn" >${list.brdCn}</textarea>
                	<script type="text/javascript">
		        	CKEDITOR.replace('brdCn',{
		    			filebrowserUploadUrl: '/notice/noticefile',
		    			height: 500, 
		    			width: 1550,
		    			resize_enaleb : false,
		  		      		enterMode : CKEDITOR.ENTER_BR,
		  		      		shiftEnterMode : CKEDITOR.ENTER_P
		    			});
        	
			        	/*  var value = CKEDITOR.instances.brdCn.getData();
			        	 alert("value"+value); */
       				 </script>
        
	          	 <div class="text-end">
		          <button type="submit" class="btn btn-primary waves-effect waves-light w-sm" id="ckbtn" name="ckbtn">
		             <i class="mdi mdi-download d-block font-size-10" ></i> 수정완료
		         </button>
				 </div>
		</form>
          
      </div>
                  