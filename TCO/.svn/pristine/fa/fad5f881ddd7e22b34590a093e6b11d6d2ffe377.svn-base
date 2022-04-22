<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>거래처 목록</title>
<style type="text/css">
.btn-toolbar {
	display : none;
}
.deleteCnpt{
	cursor : pointer;
	border : none;
	background-color: white;
}
</style>
</head>
<script src="/resources/js/jquery-3.6.0.min.js"></script>


<body>
 <!-- start page title -->
 <div class="row">
     <div class="col-12">
         <div class="page-title-box d-sm-flex align-items-center justify-content-between">
             <h1 class="mb-sm-0 font-size-20"><i class="bx bx-buildings"></i>직원관리/h1>

             <div class="page-title-right">
                 <ol class="breadcrumb m-0">
                     <li class="breadcrumb-item"><a href="javascript: void(0);">직원관리</a></li>
                     <li class="breadcrumb-item active">직원조회</li>
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
                 <div class="row mb-2">
                     <div class="col-sm-4">
                         <div class="search-box me-2 mb-2 d-inline-block">
                             <div class="position-relative">
                                 <input type="text" class="form-control" placeholder="Search...">
                                 <i class="bx bx-search-alt search-icon"></i>
                             </div>
                         </div>
                     </div>
                     <div class="col-sm-8">
                         <div class="text-sm-end">
                             <a href="/cnpt/insert" class="btn btn-success btn-rounded waves-effect waves-light mb-2 me-2"><i class="mdi mdi-plus me-1"></i> 거래처 등록</a>
                         </div>
                     </div><!-- end col-->
                 </div>
               <!-- Nav tabs -->
               <!-- 거래중인 거래처 -->
               <ul class="nav nav-tabs nav-tabs-custom" role="tablist">
                   <li class="nav-item">
                       <a class="nav-link active" data-bs-toggle="tab" href="#cnpt" role="tab">
                           <span class="d-none d-sm-block">거래처</span> 
                       </a>
                   </li>
                   <!-- 거래중단 거래처 -->
                   <li class="nav-item">
                       <a class="nav-link" data-bs-toggle="tab" href="#cnptN" role="tab">
                           <span class="d-none d-sm-block">거래중단 거래처</span> 
                       </a>
                   </li>
               </ul>

               <!-- Tab panes -->
               <!-- 직원조회 -->
               <div class="tab-content p-3">
                                            <div class="tab-pane" id="all-order" role="tabpanel">
                                              <div class="row">
                                              	<div class="search-box me-2 mb-2 d-inline-block">
                                                    <div class="position-relative">
                                                        <input type="text" class="form-control" placeholder="이름/사번 검색">
                                                        <i class="bx bx-search-alt search-icon"></i>
                                                    </div>
                                                </div>
                                              </div>
                                              

                                                <div class="table mt-2">
                                                    <div id="DataTables_Table_0_wrapper" class="dataTables_wrapper dt-bootstrap4 no-footer">
                                                    <div class="row"><div class="col-sm-12">
                                                    <table class="table table-hover datatable dt-responsive nowrap dataTable no-footer dtr-inline" style="border-collapse: collapse; border-spacing: 0px; width: 100%;" id="DataTables_Table_0" role="grid" aria-describedby="DataTables_Table_0_info">
                                                        <thead>
                                                            <tr role="row">
                                                            	<th scope="col" class="sorting_asc" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" style="width: 105px;" aria-sort="ascending" aria-label="Date: activate to sort column descending">이름</th>
                                                            	<th scope="col" class="sorting" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" style="width: 61px;" aria-label="Type: activate to sort column ascending">사번</th>
                                                            	<th scope="col" class="sorting" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" style="width: 79px;" aria-label="Coin: activate to sort column ascending">근무시간</th>
                                                            	<th scope="col" class="sorting" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" style="width: 97px;" aria-label="Value: activate to sort column ascending">수당/지급금액</th>
                                                            	<th scope="col" class="sorting" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" style="width: 131px;" aria-label="Value in USD: activate to sort column ascending">4대보험료/공제금액</th>
                                                            	<th scope="col" class="sorting" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" style="width: 82px;" aria-label="Status: activate to sort column ascending">실 지급액</th></tr>
                                                            
                                                        </thead>

                                                        <tbody>
                                                         
                                                        <tr class="odd">
                                                                <td class="sorting_1 dtr-control">03 Mar, 2020</td>
                                                                <td>Buy</td>
                                                                <td>Bitcoin</td>
                                                                <td>1.00952 BTC</td>
                                                                <td>$ 9067.62</td>
                                                                <td>
                                                                    <span class="badge bg-success font-size-10">Completed</span>
                                                                </td>
                                                            </tr><tr class="even">
                                                                <td class="sorting_1 dtr-control">04 Mar, 2020</td>
                                                                <td>Sell</td>
                                                                <td>Ethereum</td>
                                                                <td>0.00413 ETH</td>
                                                                <td>$ 2123.01</td>
                                                                <td>
                                                                    <span class="badge bg-success font-size-10">Completed</span>
                                                                </td>
                                                            </tr><tr class="odd">
                                                                <td class="sorting_1 dtr-control">04 Mar, 2020</td>
                                                                <td>Buy</td>
                                                                <td>Bitcoin</td>
                                                                <td>0.00321 BTC</td>
                                                                <td>$ 1802.62</td>
                                                                <td>
                                                                    <span class="badge bg-warning font-size-10">Pending</span>
                                                                </td>
                                                            </tr><tr class="even">
                                                                <td class="sorting_1 dtr-control">05 Mar, 2020</td>
                                                                <td>Buy</td>
                                                                <td>Litecoin</td>
                                                                <td>0.00224 LTC</td>
                                                                <td>$ 1773.01</td>
                                                                <td>
                                                                    <span class="badge bg-success font-size-10">Completed</span>
                                                                </td>
                                                            </tr><tr class="odd">
                                                                <td class="sorting_1 dtr-control">06 Mar, 2020</td>
                                                                <td>Buy</td>
                                                                <td>Ethereum</td>
                                                                <td>1.04321 ETH</td>
                                                                <td>$ 9423.73</td>
                                                                <td>
                                                                    <span class="badge bg-danger font-size-10">Failed</span>
                                                                </td>
                                                            </tr><tr class="even">
                                                                <td class="sorting_1 dtr-control">07 Mar, 2020</td>
                                                                <td>Sell</td>
                                                                <td>Bitcoin</td>
                                                                <td>0.00413 ETH</td>
                                                                <td>$ 2123.01</td>
                                                                <td>
                                                                    <span class="badge bg-success font-size-10">Completed</span>
                                                                </td>
                                                            </tr><tr class="odd">
                                                                <td class="sorting_1 dtr-control">07 Mar, 2020</td>
                                                                <td>Buy</td>
                                                                <td>Bitcoin</td>
                                                                <td>1.00952 BTC</td>
                                                                <td>$ 9067.62</td>
                                                                <td>
                                                                    <span class="badge bg-warning font-size-10">Pending</span>
                                                                </td>
                                                            </tr><tr class="even">
                                                                <td class="sorting_1 dtr-control">08 Mar, 2020</td>
                                                                <td>Sell</td>
                                                                <td>Ethereum</td>
                                                                <td>0.00413 ETH</td>
                                                                <td>$ 2123.01</td>
                                                                <td>
                                                                    <span class="badge bg-success font-size-10">Completed</span>
                                                                </td>
                                                            </tr><tr class="odd">
                                                                <td class="sorting_1 dtr-control">09 Mar, 2020</td>
                                                                <td>Sell</td>
                                                                <td>Litecoin</td>
                                                                <td>1.00952 LTC</td>
                                                                <td>$ 9067.62</td>
                                                                <td>
                                                                    <span class="badge bg-success font-size-10">Completed</span>
                                                                </td>
                                                            </tr><tr class="even">
                                                                <td class="sorting_1 dtr-control">10 Mar, 2020</td>
                                                                <td>Buy</td>
                                                                <td>Ethereum</td>
                                                                <td>0.00413 ETH</td>
                                                                <td>$ 2123.01</td>
                                                                <td>
                                                                    <span class="badge bg-warning font-size-10">Pending</span>
                                                                </td>
                                                            </tr></tbody>
                                                    </table></div></div><div class="row"><div class="col-sm-12 col-md-5"><div class="dataTables_info" id="DataTables_Table_0_info" role="status" aria-live="polite">Showing 1 to 10 of 12 entries</div></div><div class="col-sm-12 col-md-7"><div class="dataTables_paginate paging_simple_numbers" id="DataTables_Table_0_paginate"><ul class="pagination"><li class="paginate_button page-item previous disabled" id="DataTables_Table_0_previous"><a href="#" aria-controls="DataTables_Table_0" data-dt-idx="0" tabindex="0" class="page-link">Previous</a></li><li class="paginate_button page-item active"><a href="#" aria-controls="DataTables_Table_0" data-dt-idx="1" tabindex="0" class="page-link">1</a></li><li class="paginate_button page-item "><a href="#" aria-controls="DataTables_Table_0" data-dt-idx="2" tabindex="0" class="page-link">2</a></li><li class="paginate_button page-item next" id="DataTables_Table_0_next"><a href="#" aria-controls="DataTables_Table_0" data-dt-idx="3" tabindex="0" class="page-link">Next</a></li></ul></div></div></div></div>
                                                </div>
                                            </div>
                                            <div class="tab-pane active" id="processing" role="tabpanel">
                                                <div>
                                                    <div class="table mt-4">
                                                        <div id="DataTables_Table_1_wrapper" class="dataTables_wrapper dt-bootstrap4 no-footer">
                                                        <div class="row">
                                                        
                                                        
                                                        </div>
                                                        
                                                        <div class="row"><div class="col-sm-12">
                                                        <table class="table table-hover datatable dt-responsive nowrap dataTable no-footer dtr-inline" style="border-collapse: collapse; border-spacing: 0px; width: 100%;" id="DataTables_Table_1" role="grid" aria-describedby="DataTables_Table_1_info">
                                                            <thead>
                                                                <tr role="row">
                                                                <th scope="col" class="sorting_asc" tabindex="0" aria-controls="DataTables_Table_1" rowspan="1" colspan="1" style="width: 0px;" aria-sort="ascending" aria-label="Date: activate to sort column descending">이름</th>
                                                                <th scope="col" class="sorting" tabindex="0" aria-controls="DataTables_Table_1" rowspan="1" colspan="1" style="width: 0px;" aria-label="Type: activate to sort column ascending">기본근무</th>
                                                                <th scope="col" class="sorting" tabindex="0" aria-controls="DataTables_Table_1" rowspan="1" colspan="1" style="width: 0px;" aria-label="Coin: activate to sort column ascending">지급처리</th>
                                                                <th scope="col" class="sorting" tabindex="0" aria-controls="DataTables_Table_1" rowspan="1" colspan="1" style="width: 0px;" aria-label="Value: activate to sort column ascending">초과근무</th>
                                                                <th scope="col" class="sorting" tabindex="0" aria-controls="DataTables_Table_1" rowspan="1" colspan="1" style="width: 0px;" aria-label="Value in USD: activate to sort column ascending">초과근무보상</th>
                                                                <th scope="col" class="sorting" tabindex="0" aria-controls="DataTables_Table_1" rowspan="1" colspan="1" style="width: 0px;" aria-label="Status: activate to sort column ascending">상태</th>
                                                                </tr>
                                                                
                                                            </thead>
    
                                                            <tbody>
                                                                

                                                                
                                                            <tr class="odd">
                                                                    <td class="sorting_1 dtr-control">두번쨰?</td>
                                                                    <td>Buy</td>
                                                                    <td>Bitcoin</td>
                                                                    <td>1.00952 BTC</td>
                                                                    <td>$ 9067.62</td>
                                                                    <td>
                                                                        <span class="badge bg-success font-size-10">Completed</span>
                                                                    </td>
                                                                </tr><tr class="even">
                                                                    <td class="sorting_1 dtr-control">04 Mar, 2020</td>
                                                                    <td>Sell</td>
                                                                    <td>Ethereum</td>
                                                                    <td>0.00413 ETH</td>
                                                                    <td>$ 2123.01</td>
                                                                    <td>
                                                                        <span class="badge bg-success font-size-10">Completed</span>
                                                                    </td>
                                                                </tr><tr class="odd">
                                                                    <td class="sorting_1 dtr-control">04 Mar, 2020</td>
                                                                    <td>Buy</td>
                                                                    <td>Bitcoin</td>
                                                                    <td>0.00321 BTC</td>
                                                                    <td>$ 1802.62</td>
                                                                    <td>
                                                                        <span class="badge bg-warning font-size-10">Pending</span>
                                                                    </td>
                                                                </tr><tr class="even">
                                                                    <td class="sorting_1 dtr-control">05 Mar, 2020</td>
                                                                    <td>Buy</td>
                                                                    <td>Litecoin</td>
                                                                    <td>0.00224 LTC</td>
                                                                    <td>$ 1773.01</td>
                                                                    <td>
                                                                        <span class="badge bg-success font-size-10">Completed</span>
                                                                    </td>
                                                                </tr><tr class="odd">
                                                                    <td class="sorting_1 dtr-control">06 Mar, 2020</td>
                                                                    <td>Buy</td>
                                                                    <td>Ethereum</td>
                                                                    <td>1.04321 ETH</td>
                                                                    <td>$ 9423.73</td>
                                                                    <td>
                                                                        <span class="badge bg-danger font-size-10">Failed</span>
                                                                    </td>
                                                                </tr><tr class="even">
                                                                    <td class="sorting_1 dtr-control">07 Mar, 2020</td>
                                                                    <td>Sell</td>
                                                                    <td>Bitcoin</td>
                                                                    <td>0.00413 ETH</td>
                                                                    <td>$ 2123.01</td>
                                                                    <td>
                                                                        <span class="badge bg-success font-size-10">Completed</span>
                                                                    </td>
                                                                </tr><tr class="odd">
                                                                    <td class="sorting_1 dtr-control">07 Mar, 2020</td>
                                                                    <td>Buy</td>
                                                                    <td>Bitcoin</td>
                                                                    <td>1.00952 BTC</td>
                                                                    <td>$ 9067.62</td>
                                                                    <td>
                                                                        <span class="badge bg-warning font-size-10">Pending</span>
                                                                    </td>
                                                                </tr><tr class="even">
                                                                    <td class="sorting_1 dtr-control">08 Mar, 2020</td>
                                                                    <td>Sell</td>
                                                                    <td>Ethereum</td>
                                                                    <td>0.00413 ETH</td>
                                                                    <td>$ 2123.01</td>
                                                                    <td>
                                                                        <span class="badge bg-success font-size-10">Completed</span>
                                                                    </td>
                                                                </tr><tr class="odd">
                                                                    <td class="sorting_1 dtr-control">09 Mar, 2020</td>
                                                                    <td>Sell</td>
                                                                    <td>Litecoin</td>
                                                                    <td>1.00952 LTC</td>
                                                                    <td>$ 9067.62</td>
                                                                    <td>
                                                                        <span class="badge bg-success font-size-10">Completed</span>
                                                                    </td>
                                                                </tr><tr class="even">
                                                                    <td class="sorting_1 dtr-control">10 Mar, 2020</td>
                                                                    <td>Buy</td>
                                                                    <td>Ethereum</td>
                                                                    <td>0.00413 ETH</td>
                                                                    <td>$ 2123.01</td>
                                                                    <td>
                                                                        <span class="badge bg-warning font-size-10">Pending</span>
                                                                    </td>
                                                                </tr></tbody>
                                                        </table></div></div><div class="row"><div class="col-sm-12 col-md-5"><div class="dataTables_info" id="DataTables_Table_1_info" role="status" aria-live="polite">Showing 1 to 10 of 12 entries</div></div><div class="col-sm-12 col-md-7"><div class="dataTables_paginate paging_simple_numbers" id="DataTables_Table_1_paginate"><ul class="pagination"><li class="paginate_button page-item previous disabled" id="DataTables_Table_1_previous"><a href="#" aria-controls="DataTables_Table_1" data-dt-idx="0" tabindex="0" class="page-link">Previous</a></li><li class="paginate_button page-item active"><a href="#" aria-controls="DataTables_Table_1" data-dt-idx="1" tabindex="0" class="page-link">1</a></li><li class="paginate_button page-item "><a href="#" aria-controls="DataTables_Table_1" data-dt-idx="2" tabindex="0" class="page-link">2</a></li><li class="paginate_button page-item next" id="DataTables_Table_1_next"><a href="#" aria-controls="DataTables_Table_1" data-dt-idx="3" tabindex="0" class="page-link">Next</a></li></ul></div></div></div></div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        
                                             <!-- 페이징 처리 시작  -->
                   <div class="row">
                       <div class="col-lg-12">
                           <ul class="pagination pagination-rounded justify-content-center mt-4">
                               <li class="page-item disabled <c:if test='${list.startPage<6}'>disabled</c:if>" >
                                   <a href="/emp/emplist?currentPage=${list.startPage-5}" class="page-link"><i class="mdi mdi-chevron-left"></i></a>
                               </li>
                               
                               <c:forEach var="pNo" begin="${list.startPage}" end="${list.endPage}" step="1">
                               <li class="page-item <c:if test='${list.currentPage eq pNo}'>active</c:if> " >
                                   <a href="/emp/emplist?currentPage=${pNo}" class="page-link">${pNo}</a>
                               </li>       
                               </c:forEach> 
                                                   
                               <li class="page-item <c:if test='${list.endPage>=list.totalPages}'>disabled</c:if> "  > 
                                   <a href="/emp/emplist?currentPage=${list.startPage+5}" class="page-link"><i class="mdi mdi-chevron-right"></i></a>
                               </li>
                           </ul>
                       </div>
                   </div>
                   <!-- 페이징 처리 끝  -->
             </div>
         </div>
         <!-- end card -->
     </div>
 </div>
 <!-- end row -->


</body>
</html>