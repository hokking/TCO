<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 <div class="row">
     <div class="col-12">
         <div class="page-title-box d-sm-flex align-items-center justify-content-between">
             <h1 class="mb-sm-0 font-size-20"><i class="bx bx-buildings"></i>매장특이사항</h1>

             <div class="page-title-right">
                 <ol class="breadcrumb m-0">
                     <li class="breadcrumb-item"><a href="javascript: void(0);">특이사항</a></li>
                     <li class="breadcrumb-item active">특이사항목록</li>
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
			<span>작성일</span> ${brdDt} &nbsp;
			<span>작성자</span> ${list.empNm}  &nbsp;
			<span>조회수</span> ${list.brdVi}  &nbsp; &nbsp;
			<c:if test="${userId eq list.empId}">
			<a href="#" class="edit" target="_blank">수정</a>
			<a href="#" class="delete" target="_blank">삭제</a>
			</c:if>

             	</div>
				
				<hr><br>
				${list.brdCn}
</div></div></div></div>