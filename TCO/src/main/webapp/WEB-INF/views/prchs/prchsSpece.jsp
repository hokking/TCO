<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<head>
<title>매입명세서다</title>
</head>
<style>
        #report { border-collapse:collapse; width: 100%;}
        #report h4 { margin:0px; padding:0px;}
        #report th { background:#eff2f7 url(header_bkg.png) repeat-x scroll center left; color:#000; padding:7px 15px; text-align:left; height: 50px; }
        #report td { background:#fff none repeat-x scroll center left; color:#000; padding:7px 15px; border: none;}
        #report tr.odd td { background:#fff url(row_bkg.png) repeat-x scroll center left; cursor:pointer; height: 50px;}
        #report div.arrow { background:transparent url(arrows.png) no-repeat scroll 0px -16px; width:0px; height:0px; display:block;}
        #report div.up { background-position:0px 0px;}
        #report tr { border-color: #eff2f7; }
</style>
<body>
 <!-- start page title -->
 <div class="row">
     <div class="col-12">
         <div class="page-title-box d-sm-flex align-items-center justify-content-between">
             <h1 class="mb-sm-0 font-size-20"><i class="bx bx-buildings"></i>매입명세서</h1>

             <div class="page-title-right">
                 <ol class="breadcrumb m-0">
                     <li class="breadcrumb-item"><a href="javascript: void(0);">매입</a></li>
                     <li class="breadcrumb-item active">매입명세서</li>
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
             
             	<!-- 날짜 검색 버튼 -->
		<form action="/prchs/prchsOrder" method="get" name="Frm" id="Frm">	
		<div class="row">
			<div class="col-sm-2">
				<div class="mb-3">
				<label>시작일</label>
					<input type="date" name="startDay" 
					id="startDay" autocomplete="off" class="form-control">
				</div>
			</div>
			<div class="col-sm-2">
				<div class="mb-3">
				<label>종료일</label>
					<input type="date" name="endDay" 
					id="endDay" autocomplete="off" class="form-control">
				</div>
			</div>
			<div class="col-sm-2">
				<div class="mb-3">
				<label>검색</label>
					<button type="button" class="btn btn-secondary btn-secondary" style="display: block;" 
					onclick="fn_submit()"><i class="bx bx-search-alt"></i></button>
				</div>
			</div>

		</div>
		</form>
	<!--날짜검색버튼끝-->


				<div class="table">
					   <table id="report">
					    <thead>
					        <tr>
                                 <th class="align-middle">일자</th>
                                 <th class="align-middle">전표번호</th>
                                 <th class="align-middle">거래처명</th>
                                 <th class="align-middle">거래처 연락처</th>
                                 <th class="align-middle">공급가액</th>
                                 <th class="align-middle">부가세액</th>
                                 <th class="align-middle">합계</th>
                                 <th class="align-middle">상태</th>
					        </tr>
					    </thead>
                         <tbody>
                         	<c:forEach var="prchsVO" items="${speceList}">
                             <tr>
                                 <td><div class="arrow"></div>${prchsVO.prchsDt}</td>
                                 <td id="prchsIdSelector"><a href="#" class="text-body fw-bold">${prchsVO.prchsId}</a></td>
                                 <td>
                                     ${prchsVO.cnptNm}
                                 </td>
                                 <td>
                                 	${prchsVO.cnptTel}
                                 </td>
                                 <td>
                                     ${prchsVO.prchsSuAmtDisplay}
                                 </td>
                                 <td>
                                 	${prchsVO.prchsVatDisplay} 
                                 </td>
                                 <td>
                                 	${prchsVO.prchsAmtDisplay}원
                                 </td>
                                 <td>
                                     ${prchsVO.prchsSe}
                                 </td>
                             </tr>
					        <tr id="printPrchsDetail">
					        	<td colspan='7' id="printPrchsDetailTd">
					        	헤이
					        	</td>
					        </tr>
                         	</c:forEach>
                         </tbody>
					      
					    </table>
                 </div>
                 <ul class="pagination pagination-rounded justify-content-end mb-2">
                     <li class="page-item disabled">
                         <a class="page-link" href="javascript: void(0);" aria-label="Previous">
                             <i class="mdi mdi-chevron-left"></i>
                         </a>
                     </li>
                     <li class="page-item active"><a class="page-link" href="javascript: void(0);">1</a></li>
                     <li class="page-item"><a class="page-link" href="javascript: void(0);">2</a></li>
                     <li class="page-item"><a class="page-link" href="javascript: void(0);">3</a></li>
                     <li class="page-item"><a class="page-link" href="javascript: void(0);">4</a></li>
                     <li class="page-item"><a class="page-link" href="javascript: void(0);">5</a></li>
                     <li class="page-item">
                         <a class="page-link" href="javascript: void(0);" aria-label="Next">
                             <i class="mdi mdi-chevron-right"></i>
                         </a>
                     </li>
                 </ul>
             </div>
         </div>
         <!-- end card -->
     </div>
 </div>
 <!-- 2end row -->
<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
<script>
    $(document).ready(function(){

        $("#report tr:odd").addClass("odd");
        $("#report tr:not(.odd)").hide(); 
        $("#report tr:first-child").show(); //열머리글 보여주기

        $("#report tr.odd").click(function(){
            $(this).next("tr").toggle("slow");
            $(this).find(".arrow").toggleClass("up");
			let prchsId = $(this).children("#prchsIdSelector").text();
			
			//여기서 ajax로 id를 주고 정보를 가져오기
// 			console.log(prchsId);
			let prchsTr = $(this);
// 			console.log($(this).next().children("#printPrchsDetailTd").text("예이"));
        	// 거래처 아이디를 얻었을 때 - 상품 가져오기 
			$.ajax({
				url :"/prchs/getPrchsDetail",
				type : "get",
				data : {paramId : prchsId},
			    dataType : "json",
			    success : function(data){
			    	let prchsGdsVO = data[0].prchsGdsVO;
// 			    	console.log(prchsGdsVO);
			    	let str = "<div class='row'><div class='col-md-2 tdiv'><strong>번호</strong></div>";
			    		str += "<div class='col-md-3 tdiv'><strong>상품명</strong></div>";
			    		str += "<div class='col-md-2 tdiv'><strong>단가</strong></div>";
			    		str += "<div class='col-md-2 tdiv'><strong>수량</strong></div>";
			    		str += "<div class='col-md-3 tdiv'><strong>합계</strong></div></div>";
			    	$.each(prchsGdsVO, function(i,v){
			    		str += "<div class='row'><div class='col-md-2'>"+ (i+1) +"</div>";
			    		str += "<div class='col-md-3'>"+ v.prodInfoNm +"</div>";
			    		str += "<div class='col-md-2'>"+ v.prchsGdsAmtDisplay +"</div>";
			    		str += "<div class='col-md-2'>"+ v.prchsGdsQty +"</div>";
			    		str += "<div class='col-md-3'>"+ v.prchsGdsSumDisplay +"</div></div>";
			    		
			    	});
		                   
	            	//선택한 tr의 자식에 넣기
	            	prchsTr.next().children("#printPrchsDetailTd").html(str);
                },
                error : function(xhr){
                	alert(xhr.status);
                }
        	});
        });
       

    });

</script>
 
</body>
</html>