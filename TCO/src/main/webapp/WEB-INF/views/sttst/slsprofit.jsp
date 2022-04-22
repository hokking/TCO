<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
         <div class="container-fluid">
				    <div class="col-12">
				        <div class="page-title-box d-sm-flex align-items-center justify-content-between">
				            <h4 class="mb-sm-0 font-size-18">매출 이익 (금일순자산-전일순자산-입금+출금)</h4>
				
				            <div class="page-title-right">
				                <ol class="breadcrumb m-0">
				                    <li class="breadcrumb-item"><a href="javascript: void(0);">Static</a></li>
				                    <li class="breadcrumb-item active">Profit</li>
				                </ol>
				            </div>
				        </div>
				    </div>
                 	
             <div class="row">
                 <div class="col-12">
                     <div class="card">
                         <div class="card-body">
                             <div class="table-rep-plugin">
                                 <div class="table-responsive mb-0" data-pattern="priority-columns">
                                 
                                     <table id="tech-companies-1" class="table table-striped">
                                         <thead>
                                         <tr>
                                             <th data-priority="1">일자</th>
                                             <th data-priority="2">거래처</th>
                                             <th data-priority="3">품목</th>
                                             <th data-priority="4">수량</th>
                                             <th data-priority="5">단위</th>
                                             <th data-priority="6">매입단가</th>
                                             <th data-priority="7">매입합계(VAT포함)</th>
                                             <th data-priority="8">매출단가</th>
                                             <th data-priority="9">매출공급가</th>
                                             <th data-priority="10">매출부가세</th>
                                             <th data-priority="11">매출합계</th>
                                             <th data-priority="12">매출이익률</th>
                                         </tr>
                                         </thead>
                                         <tbody>
                                         <!-- foreach문  -->
                                         <tr>
                                             <td>일자</td>
                                             <td>거래처</td>
                                             <td>품목</td>
                                             <td>수량</td>
                                             <td>단위</td>
                                             <td>매입단가</td>
                                             <td>매입합계(VAT포함)</td>
                                             <td>매출단가</td>
                                             <td>매출공급가</td>
                                             <td>매출부가세</td>
                                             <td>매출합계</td>
                                             <td>매출이익률</td>
                                         </tr>
                                         </tbody>
                                     </table>
                                     
                                 </div>
                             </div>
                         </div>
                     </div>
                 </div> <!-- end col -->
             </div> <!-- end row -->

         </div> <!-- container-fluid -->
     </div>
     <!-- End Page-content -->
