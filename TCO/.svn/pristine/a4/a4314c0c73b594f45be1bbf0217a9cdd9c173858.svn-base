<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
  <script src="assets/libs/jquery/jquery.min.js"></script>
<script>

function del(){
	
	 if(!confirm('삭제하시면 복구할수 없습니다. \n 정말로 삭제하시겠습니까??')){
		
	        return false;
	    }else{
	    	
	    	 alert("삭제되었스믄다.");
	    	location.href="/notice/noticedelete?brdId=${list.brdId}"

	    }
}
</script>

<style>
	.bt{
		float: right;
		margin-right: 50px;
	}
</style>

 <div class="row">
     <div class="col-12">
         <div class="page-title-box d-sm-flex align-items-center justify-content-between">
             <h1 class="mb-sm-0 font-size-20">📋공지사항</h1>

             <div class="page-title-right">
                 <ol class="breadcrumb m-0">
                     <li class="breadcrumb-item"><a href="javascript: void(0);">공지사항</a></li>
                     <li class="breadcrumb-item active">공지사항목록</li>
                 </ol>
             </div>

         </div>
     </div>
 </div>

		
		
<div class="row">
     <div class="col-12">
         <div class="card">
             <div class="card-body">
             	<div>
                 	<h1>${list.brdTtl}</h1><br>
					
			<fmt:formatDate var="brdDt" value="${list.brdDt}" pattern="yyyy-MM-dd"/>
			<b><span>작성일</span></b> ${brdDt} &nbsp;
			<b><span>작성자</span></b> ${list.empNm}  &nbsp;
			<b><span>조회수</span></b> ${list.brdVi}  &nbsp; &nbsp;
			<c:if test="${userId eq list.empId}">
			<a href="/notice/noticeupdate?brdId=${list.brdId}" class="edit" >[수정]</a>
			<a style="cursor:pointer" class="delete" id="dbtn" onclick="del()" >[삭제]</a>
			</c:if>
				

             	</div>
				<br>
				<hr><br>
				${list.brdCn}
				<br>
				<hr><br>
				<button type="button" class="btn btn-primary waves-effect waves-light bt" onClick="location.href='/notice/noticelist'">목록으로</button>
</div></div></div></div>