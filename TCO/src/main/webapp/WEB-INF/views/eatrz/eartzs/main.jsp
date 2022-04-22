<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
            <div>
                <div class="row mb-3">
                    <div class="col-xl-3 col-sm-6">
                        <div class="mt-2">
                            <h5><b>결재 대기 문서</b></h5>
                        </div>
                    </div>
                    
                </div>
            </div>

            <div>
                <div class="row">
                
     <!--결재대기문서 (for문돌려서 select)-->
                    <div class="col-xl-4 col-sm-6">
                        <div class="card border a">
                            <div class="card-body p-3">
                                <div class="">
                                <div class="float-end ms-2">
                                        <div class="dropdown mb-2">
                                            <a class="font-size-16 text-muted" role="button" data-bs-toggle="dropdown" aria-haspopup="true">
                                                <i class="mdi mdi-dots-horizontal"></i>
                                            </a>
                                            
                                            <div class="dropdown-menu dropdown-menu-end">
                                                <a class="dropdown-item" href="#">Open</a>
                                                <a class="dropdown-item" href="#">Edit</a>
                                                <a class="dropdown-item" href="#">Rename</a>
                                                <div class="dropdown-divider"></div>
                                                <a class="dropdown-item" href="#">Remove</a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="avatar-xs me-3 mb-3">
                                        <div class="avatar-title bg-transparent rounded">
                                            <span class="badge bg-primary font-size-12">진행중</span>
                                        </div>
                                    </div>
                                    <div class="d-flex">
                                        <div class="overflow-hidden me-auto">
                                            <h5 class="font-size-18 text-truncate mb-3"><a href="javascript: void(0);" class="text-body"><b>업무기안</b></a></h5>
                                            <table>
                                            	<tr>
                                            		<th style="width: 100px;"><p class="text-muted text-truncate mb-1">기안자</p></th>
                                            		<td style="width: 140px;"><p class="text-muted text-truncate mb-1">박박박</p></td>
                                            		<td><p class="text-muted text-truncate mb-1">(2022-03-14)</p></td>
                                            	</tr>
                                            	<tr>
                                            		<th><p class="text-muted text-truncate mb-1">결재양식</p></th>
                                            		<td colspan="2"><p class="text-muted text-truncate mb-1">업무기안</p></td>
                                            	</tr>
                                            </table>
                                        </div>
                                    </div>
                                    <div class="row-vh d-flex flex-row justify-content-center mt-4 mb-2">
                                    	<button type="button" class="btn btn-outline-secondary waves-effect">결재하기</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
      <!-- each문 끝 -->

                    <!-- end col -->
<!-- 페이징처리 시작 -->
        <ul class="pagination pagination-rounded justify-content-center mb-2">
         <li class="page-item <c:if test='${list2.startPage<6}'>disabled</c:if>">
          <a class="page-link" aria-controls="DataTables_Table_2" href="/cust/custlist?currentPage=${list2.startPage-5}&keyWord=${param.keyWord}" aria-label="Previous">
     			<i class="dripicons-chevron-left"></i>
          </a>
         </li>
         <li class="page-item <c:if test='${list2.endPage>=list2.totalPages}'>disabled</c:if>">
          <a class="page-link" aria-controls="DataTables_Table_2" href="/cust/custlist?currentPage=${list2.startPage+5}&keyWord=${param.keyWord}" aria-label="Next">
          	<i class="dripicons-chevron-right"></i>
          </a>
         </li>
        </ul>
                </div>
                <!-- end row -->
            </div>

            <div class="mt-4">
                <div class="d-flex flex-wrap">
                    <h5 class="font-size-16 me-3"><b>내가 올린 결재</b></h5>

                    <form class="mt-4 mt-sm-0 float-sm-end d-flex align-items-center">
                     <div class="search-box mb-2 me-2">
                         <div class="position-relative">
                             <input type="text" class="form-control bg-light border-light rounded" placeholder="Search...">
                             <i class="bx bx-search-alt search-icon"></i>
                         </div>
                     </div>

                     <div class="dropdown mb-0">
                         <a class="btn btn-link text-muted mt-n2" role="button" data-bs-toggle="dropdown" aria-haspopup="true">
                             <i class="mdi mdi-dots-vertical font-size-20"></i>
                         </a>
                       
                         <div class="dropdown-menu dropdown-menu-end">
                             <a class="dropdown-item" href="#">Share Files</a>
                             <a class="dropdown-item" href="#">Share with me</a>
                             <a class="dropdown-item" href="#">Other Actions</a>
                         </div>
                     </div>
                 </form>
                    <div class="ms-auto">
                        <a href="javascript: void(0);" class="fw-medium text-reset">View All</a>
                    </div>
                </div>
                <hr class="mt-2">

                <div class="table">
                    <table class="table align-middle table-nowrap table-hover mb-0">
                        <thead>
                            <tr>
                              <th scope="col">기안일</th>
                              <th scope="col">결재양식</th>
                              <th scope="col">제목</th>
                              <th scope="col">첨부</th>
                              <th scope="col">기안자</th>
                              <th scope="col">결재상태</th>
                            </tr>
                          </thead>
                        <tbody>
                        	<!-- 접수대기문서 -->
                            <tr>
                                <td><a href="javascript: void(0);" class="text-dark fw-medium"><i class="mdi mdi-file-document font-size-16 align-middle text-primary me-2"></i> index.html</a></td>
                                <td>12-10-2020, 09:45</td>
                                <td colspan="2">09 KB</td>
                                <td></td>
                                <td></td>
                                <td></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="mt-5">
                <div class="d-flex flex-wrap">
                    <h5 class="font-size-16 me-3"><b>최근 결재</b></h5>

                    <form class="mt-4 mt-sm-0 float-sm-end d-flex align-items-center">
                     <div class="search-box mb-2 me-2">
                         <div class="position-relative">
                             <input type="text" class="form-control bg-light border-light rounded" placeholder="Search...">
                             <i class="bx bx-search-alt search-icon"></i>
                         </div>
                     </div>

                     <div class="dropdown mb-0">
                         <a class="btn btn-link text-muted mt-n2" role="button" data-bs-toggle="dropdown" aria-haspopup="true">
                             <i class="mdi mdi-dots-vertical font-size-20"></i>
                         </a>
                       
                         <div class="dropdown-menu dropdown-menu-end">
                             <a class="dropdown-item" href="#">Share Files</a>
                             <a class="dropdown-item" href="#">Share with me</a>
                             <a class="dropdown-item" href="#">Other Actions</a>
                         </div>
                     </div>
                 </form>
                    <div class="ms-auto">
                        <a href="javascript: void(0);" class="fw-medium text-reset">View All</a>
                    </div>
                </div>
                <hr class="mt-2">

                <div class="table">
                    <table class="table align-middle table-nowrap table-hover mb-0">
                        <thead>
                            <tr>
                              <th scope="col">기안일</th>
                              <th scope="col">결재양식</th>
                              <th scope="col">제목</th>
                              <th scope="col">첨부</th>
                              <th scope="col">기안자</th>
                              <th scope="col">결재상태</th>
                            </tr>
                          </thead>
                        <tbody>
                            <tr>
                                <td><a href="javascript: void(0);" class="text-dark fw-medium"><i class="mdi mdi-file-document font-size-16 align-middle text-primary me-2"></i> index.html</a></td>
                                <td>12-10-2020, 09:45</td>
                                <td colspan="2">09 KB</td>
                                <td></td>
                                <td></td>
                                <td></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
</body>
</html>