<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<style type="text/css">
	label{
	text-align: center;
	}
	.detail{
	readonly:true;
	}
</style>
<link href="/resources/css/ui.jqgrid.css" rel="stylesheet" type="text/css" />
<link href="/resources/css/jquery-ui.min.css" rel="stylesheet" type="text/css"/>
<link href="https://uicdn.toast.com/grid/latest/tui-grid.css" rel="stylesheet" type="text/css" />
<script src="/resources/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="/resources/js/jqgrid/grid.locale-kr.js"></script>
<script type="text/javascript" src="/resources/js/jqgrid/jquery.jqGrid.min.js"></script>
<script type="text/javascript" src="/resources/js/jquery-ui.min.js"></script>
<script src="https://uicdn.toast.com/grid/latest/tui-grid.js"></script>
<script>
	$('document').ready(function(){
			//로딩창끌어오기위해서 이곳에서 사용함
		window.onload = function myFunction() {
			//받아온 날짜를 넣어서 그리드에서 파라미터로 받아옴
			var dt = $('#slsDt').val();
			console.log(dt);
	// 			getgrid(dt);
				getlist(dt);
			}
		});	
	
	//매출로 찍힌 상품 리스트
	function getlist(dt){
		$.ajax({
			url:"/sls/slspagelist/"+dt,
			type:'post',
			dataType:'json',
			success:function(data){
				console.log(data)
// 				if(data == undefined){
// 					$('#list').append("<tr><td colspan='4'>"+자료가 없습니다.+"</td></tr>");	
// 				}
				for(i=0; i<data.length; i++){
					$('#list').append("<tr><td>"+data[i].custNtslId+"</td>"+"<td>"+data[i].prodInfoNm+"</td>"+"<td>"+data[i].custNtslAmt+'원'+"</td>"+"<td>"+data[i].custNtslQty+"</td></tr>");
				}
			}
		})
	}
		
// 	function getgrid(dt){
// 		$('#gridlist').jqGrid({
// 			url:"/sls/slspagelist/"+dt,
//             loadtext: '로딩중입니다',
//             datatype:"json",
//             loadonce: true,
//             mtype : "POST",
//             width: 800,
//             height: 500,
//             colNames:[ "판매코드", "이름", "가격", "수량"],
//             colModel:[
//                       {name:"custNtslId", index:"custNtslId", align:"center"},
//                       {name:"prodInfoNm", index:"prodInfoNm", align:"center"},
//                       {name:"custNtslAmt", index:"custNtslAmt", align:"left"},
//                       {name:"custNtslQty", index:"custNtslQty", align:"left"}
//                     ],
//             caption: "매출명세",
//             rownumbers : true,
//             viewrecords:true,
//             rowNum:20,
//             rowList: [20,40,60],
//             onSelectRow:function(id){
//             	//리스트에서 클릭시 이벤트 처리
//             	console.log(id);
//             },
//             pager: '#pager'	
// 		});
// 	};
	
	

	
</script>
</head>
<body>
<!-- 로딩창출력 -->

<div class="row">
    <div class="col-12">
        <div class="page-title-box d-sm-flex align-items-center justify-content-between">
            <h1 class="mb-sm-0 font-size-20">매출 명세서</h1>

            <div class="page-title-right">
                <ol class="breadcrumb m-0">
                    <li class="breadcrumb-item"><a href="javascript: void(0);">Sales</a></li>
                    <li class="breadcrumb-item active">Detail</li>
                </ol>
           
            </div>

        </div>
    </div>
</div>
<!-- end page title -->

<div class="row">
    <div class="col-6">
        <div class="card">
            <div class="card-body" style="height: 590px;">
                <div class="d-flex gap-3" style="float: right;">
                	<a href="/sls/brnlist" class="btn btn-secondary btn-success" style="display: block;">
                		목록으로
                	</a>
				</div>
			<br><br><br><hr>
                <div class="mb-3 row">
                    <label for="example-text-input" class="col-md-2 col-form-label">매출번호</label>
                    <div class="col-md-4">
                        <input class="form-control detail" type="text" value="${slsVO.slsId}" readonly="readonly"/>
                    </div>
                </div>
                <div class="mb-3 row">
                    <label class="col-md-2 col-form-label">지점아이디</label>
                    <div class="col-md-6">
                        <input class="form-control detail" type="tel" value="${slsVO.brncofcId}"  readonly="readonly"/>
                    </div>
                </div>                 
                <div class="mb-3 row">
                    <label for="example-email-input" class="col-md-2 col-form-label">지점명</label>
                    <div class="col-md-6">
                        <input class="form-control detail" type="email" value="${slsVO.brncofcNm}" readonly="readonly"/>
                    </div>
                </div>
                <div class="mb-3 row">
                    <label for="example-month-input" class="col-md-2 col-form-label">등록일 </label>
                    <div class="col-md-6">
                        <input id="slsDt" name="slsDt" class="form-control detail" type="date" value="<fmt:formatDate value="${slsVO.slsDt}" pattern="yyyy-MM-dd"/>" readonly="readonly"/>
                    </div>
                </div>
                <div class="mb-3 row">
                    <label for="example-url-input" class="col-md-2 col-form-label">매입액</label>
                    <div class="col-md-6">
                    	<fmt:formatNumber value="${slsVO.prcAmt}" pattern="#,###.##원" var="prcAmt" />
                        <input class="form-control detail" type="text" value="${prcAmt}" readonly="readonly"/>
                    </div>
                </div>
                <div class="mb-3 row">
                    <label for="example-url-input" class="col-md-2 col-form-label">순이익</label>
                    <div class="col-md-6">
                    	<fmt:formatNumber value="${slsVO.netincome}" pattern="#,###.##원" var="netincome" />
                        <input class="form-control detail" type="text" value="${netincome}" readonly="readonly"/>
                    </div>
                </div>
                <div class="mb-3 row">
                    <label for="example-url-input" class="col-md-2 col-form-label">총매출액</label>
                    <div class="col-md-6">
                    	<fmt:formatNumber value="${slsVO.slsAmt}" pattern="#,###.##원" var="slsAmt" />
                        <input class="form-control detail" type="text" value="${slsAmt}" readonly="readonly"/>
	                    </div>
	                </div>
	            </div>
            </div>
        </div>
        
        <div class="col-6">
        	<div class="card" id="content">	
        		<div class="card-body">
              	<p>매출로 찍힌 상품 리스트</p>
                	<hr>
                  <table id="list" class="table text-center">
                  	<tr>
                  		<th scope='col'>판매코드</th>
                  		<th scope='col'>이름</th>
                  		<th scope='col'>가격</th>
                  		<th scope='col'>수량</th>
                  	</tr>
                  	<tr>
                  		<td>6874</td>
                  		<td>삼성티비</td>
                  		<td>1200000원</td>
                  		<td>20</td>
                  	</tr>
                  	<tr>
                  		<td>6875</td>
                  		<td>불스원샷 스탠다드 휘발유 500ML</td>
                  		<td>9000원</td>
                  		<td>100</td>
                  	</tr>
                  	<tr>
                  		<td>6876</td>
                  		<td>설화수 자음 2종 세트</td>
                  		<td>52700원</td>
                  		<td>100</td>
                  	</tr>
                  	<tr>
                  		<td>6877</td>
                  		<td>설화수 자음 2종 세트</td>
                  		<td>52700원</td>
                  		<td>100</td>
                  	</tr>
                  	<tr>
                  		<td>6878</td>
                  		<td>실크 랜드마크 스카프</td>
                  		<td>189000원</td>
                  		<td>100</td>
                  	</tr>
                  		<tr>
                  		<td>6880</td>
                  		<td>원숭이털 소파</td>
                  		<td>1100000원</td>
                  		<td>30</td>
                  	</tr>
                  	</tr>
                  		<tr>
                  		<td>6881</td>
                  		<td>LG DIOS 베이직 오브제 컬렉션</td>
                  		<td>1450000원</td>
                  		<td>10</td>
                  	</tr>
                  </table>
                 </div>
	        </div>
        </div>
    </div> <!-- end col -->
</body>
</html>