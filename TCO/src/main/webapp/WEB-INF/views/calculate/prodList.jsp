<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
	.inBtn{
		float: right;
	}
	.seicon{
		float: right;
	}
</style>

<script type="text/javascript">
< !--
function openWin(f,s)
{
adWindow=window.open(f,s,'width=500,height=500,status=no,scrollbars=auto');
}
//--">
</script>


    <div class="container-fluid">

        <!-- start page title -->
        <div class="row">
            <div class="col-12">
                <div class="page-title-box d-sm-flex align-items-center justify-content-between">
                    <h4 class="mb-sm-0 font-size-18">PRODUCT INFORMATION LIST</h4>
                </div>
            </div>
        </div>
        <!-- end page title -->

        <div class="row">
            <div class="col-6">
                <div class="card">
                    <div class="card-body">
                    <form name="searchFrm" id="searchFrm" action="/calculate/list">
                    <div class="row mb-2">
                     <div class="col-sm-3">
                         <div class="search-box me-2 mb-2 d-inline-block">
                             <div class="position-relative">
                                 <input type="text" name="keyWord" id="keyWord" class="form-control" placeholder="Search...">
                                 <i class="bx bx-search-alt search-icon"></i>
                             </div>
                         </div>
                         <div class="col-sm-1 seicon">
                     	     <button type="submit" class="btn btn-info btn-rounded waves-effect waves-light seicon" ><i class="bx bx-search-alt-2"></i></button>
                         </div>
                     </div>
                     <div class="col-sm-9">
                         <div class="text-sm-end">
                         </div>
                     </div><!-- end col-->
                    </div>
                    </form>
                        <h4 class="card-title">??????</h4>
                        <p class="card-title-desc">?????? ??????</p>
                       <div class="table-rep-plugin">
                            <div class="table-wrapper">
                              <div class="table-responsive mb-0 fixed-solution" data-pattern="priority-columns">
                                <div class="sticky-table-header" style="height: 46px; visibility: hidden; top: -1px; width: auto;"></div>
                                <table id="tech-companies-1" class="table table-striped">
                                    <thead>
                                    <tr>
                                        <th data-priority="1" id="tech-companies-1-col-1">???????????????</th>
                                        <th data-priority="3" id="tech-companies-1-col-2">?????????</th>
                                        <th data-priority="1" id="tech-companies-1-col-3">?????????</th>
                                        <th data-priority="3" id="tech-companies-1-col-4">?????????</th>
                                        <th data-priority="6" id="tech-companies-1-col-6">????????????</th>
                                        <th data-priority="6" id="tech-companies-1-col-6">QR ?????? ?????? </th>
                                    </tr>
                                    </thead>
                                    <tbody>
	                                    <c:forEach var="prodVO" items="${prodList}">
		                                    <tr>
		                                        <td data-org-colspan="1" data-priority="1" data-columns="tech-companies-1-col-1">${prodVO.prodInfoId}</td>
		                                        <td data-org-colspan="1" data-priority="3" data-columns="tech-companies-1-col-2">${prodVO.cmncdNm1}</td>
		                                        <td data-org-colspan="1" data-priority="1" data-columns="tech-companies-1-col-3">${prodVO.cmncdNm2}</td>
		                                        <td data-org-colspan="1" data-priority="3" data-columns="tech-companies-1-col-4"><a href="/calculate/detail?prodInfoId=${prodVO.prodInfoId}"> ${prodVO.prodInfoNm}</a></td>
		                                        <td data-org-colspan="1" data-priority="6" data-columns="tech-companies-1-col-6">${prodVO.prodInfoNtslAmt}</td>
		                                        <td data-org-colspan="1" data-priority="6" data-columns="tech-companies-1-col-6"><a href="#" onclick="window.open('https://chart.apis.google.com/chart?cht=qr&chl=${prodVO.prodInfoId},${prodVO.prodInfoNm},${prodVO.prodInfoNtslAmt}&chld=L|2&chs=300','name','resizable=no width=400 height=400');return false"> ????????????</a></td>
		                                    </tr>
	                                    </c:forEach>
                                    </tbody>
                                </table>
                            </div></div>
                        </div>
                    </div>
                </div>
            </div> <!-- end col -->
            <div class="col-6">
                <div class="card">
                    <div class="card-body">
                    <form name="searchFrm" id="searchFrm" action="/calculate/list">
                    <div class="row mb-2">
                     <div class="col-sm-3">
                         <div class="search-box me-2 mb-2 d-inline-block">
                             <div class="position-relative">
                                 <input type="text" name="keyWord" id="keyWord" class="form-control" placeholder="Search...">
                                 <i class="bx bx-search-alt search-icon"></i>
                             </div>
                         </div>
                         <div class="col-sm-1 seicon">
                     	     <button type="submit" class="btn btn-info btn-rounded waves-effect waves-light seicon" ><i class="bx bx-search-alt-2"></i></button>
                         </div>
                     </div>
                     <div class="col-sm-9">
                         <div class="text-sm-end">
                         </div>
                     </div><!-- end col-->
                    </div>
                    </form>
                        <h4 class="card-title">??????</h4>
                        <p class="card-title-desc">?????? ??????</p>
                       <div class="table-rep-plugin">
                            <div class="table-wrapper">
                              <div class="table-responsive mb-0 fixed-solution" data-pattern="priority-columns">
                                <div class="sticky-table-header" style="height: 46px; visibility: hidden; top: -1px; width: auto;"></div>
                                <table id="tech-companies-1" class="table table-striped">
                                    <thead>
                                    <tr>
                                        <th data-priority="1" id="tech-companies-1-col-1">????????????</th>
                                        <th data-priority="3" id="tech-companies-1-col-2">?????????</th>
                                        <th data-priority="1" id="tech-companies-1-col-3">?????????</th>
                                        <th data-priority="6" id="tech-companies-1-col-6">??????</th>
                                        <th data-priority="6" id="tech-companies-1-col-6">?????????????????????</th>
                                        <th data-priority="6" id="tech-companies-1-col-6">????????????</th>
                                        <th data-priority="6" id="tech-companies-1-col-6">QR ?????? ?????? </th>
                                    </tr>
                                    </thead>
                                    <tbody>
	                                    <c:forEach var="CustVO" items="${custlist}">
		                                    <tr>
		                                        <td data-org-colspan="1" data-priority="1" data-columns="tech-companies-1-col-1">${CustVO.custId}</td>
		                                        <td data-org-colspan="1" data-priority="3" data-columns="tech-companies-1-col-2">${CustVO.custNm}</td>
		                                        <td data-org-colspan="1" data-priority="1" data-columns="tech-companies-1-col-3">${CustVO.custTel}</td>
		                                        <td data-org-colspan="1" data-priority="1" data-columns="tech-companies-1-col-3">${CustVO.custGndr}</td>
		                                        <td data-org-colspan="1" data-priority="1" data-columns="tech-companies-1-col-3" style="text-align: center;">${CustVO.custMktRcptnAgreYn}</td>
		                                        <td data-org-colspan="1" data-priority="6" data-columns="tech-companies-1-col-6">
			                                        <c:if test="${CustVO.cmncdCd eq 'B101'}">
													    <c:out value="VIP" />
													</c:if>
			                                        <c:if test="${CustVO.cmncdCd eq 'B102'}">
													    <c:out value="GOLD" />
													</c:if>
			                                         <c:if test="${CustVO.cmncdCd eq 'B103'}">
													    <c:out value="SILVER" />
													</c:if>
		                                        </td>
		                                    	 <td data-org-colspan="1" data-priority="6" data-columns="tech-companies-1-col-6"><a href="#" onclick="window.open('https://chart.apis.google.com/chart?cht=qr&chl=${custVO.custId}&chld=L|2&chs=200','name','resizable=no width=400 height=400');return false">??????QR??????</a>
		                                    </tr>
	                                    </c:forEach>
                                    </tbody>
                                </table>
                            </div></div>
                        </div>
                    </div>
                </div>
            </div> <!-- end col -->
        </div> <!-- end row -->
    </div> <!-- container-fluid -->
