<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<script src="/resources/js/jquery-3.6.0.min.js"></script>
<script src="/resources/js/section.js"></script>

<script type="text/javascript">
function inputNumberFormat(obj) {
    obj.value = comma(uncomma(obj.value));
}

function comma(str) {
    str = String(str);
    return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
}

function uncomma(str) {
    str = String(str);
    return str.replace(/[^\d]+/g, '');
}
//분류 수정하기 onclick
function fn_seMod(){
	$("#seModBtn").prop("hidden", true);
	$(".seSelect").prop("hidden", false);
	$(".seSelect").prop("disabled", false);
	$(".secondSE").prop("disabled", true);
}

function fn_seChg(e){
	fn_seChgJs(e);
}

$(function(){
	//수정하기 버튼 클릭시
	$("#modBtn").on('click', function(){
		$("#modBtn").prop("hidden", true);
		$("#confirmBtn").prop("hidden", false);
		$("#cancelBtn").prop("hidden", false);
		$("#seModBtn").prop("hidden", false);
		$(".intag").prop("hidden", false);
		$(".pptag").hide();
		$(".notMod").hide();
	})
	
	//취소버튼 클릭시
	$("#cancelBtn").on("click", function(){
		location.reload();
	})
	
	//확인버튼 클릭시
	$("#confirmBtn").on('click', function(){
		var idVal = $("#prodInfoId").val();
		var nmVal = $("#prodInfoNm").val();
		var prchsVal = $("#prodInfoPrchsAmt").val();
		var ntslVal = $("#prodInfoNtslAmt").val();
		var ldtVal = $("#prodInfoLdt").val();
		var plorVal = $("#prodInfoPlor").val();
		var cmnVal = $("#cmncdNm2").val();
		
		$("#prodVO").submit();
	})
	
	//삭제하기 버튼 클릭시
	 $("#delBtn").click(function () {
		 var idVal = $(".idValkk").text();
		 
		 Swal.fire({ 
			 title: '정말로 삭제하시겠습니까?', 
			 text: '삭제한 데이터는 다시 복구할 수 없습니다.', 
			 icon: 'warning', 
			 showCancelButton: true, // cancel버튼 보이기. 기본은 원래 없음 
			 confirmButtonColor: '#3085d6', // confrim 버튼 색깔 지정 
			 cancelButtonColor: '#d33', // cancel 버튼 색깔 지정 
			 confirmButtonText: '확인', // confirm 버튼 텍스트 지정 
			 cancelButtonText: '취소', // cancel 버튼 텍스트 지정 
		 }).then(result => { // 만약 Promise리턴을 받으면, 
			if (result.isConfirmed) { // 만약 모달창에서 confirm 버튼을 눌렀다면 
				 $.ajax({
					 url : "/prod/delete.do",
					 data : {'prodInfoId' : idVal},
					 type : 'get',
					 success : function(res){
						 console.log(res);
						 
						 if(res > 0){
							 Swal.fire({
						          icon:'success',
						          title:'삭제되었습니다.',
					       		}).then(function(){
					       			window.location.href="list";
					       		})
						 }else{
							 alert("실패");
						 }
					 },
					 dataType : 'json'
				 })
			} 
		 });
	 })
})

</script>
<style>
	.ntitle{
		display: inline-block;
		font-size: 20px;
	}
	.btnFam{
		float: right;
	}
	.notMod{
		float: right;
	}
</style>
<div class="container-fluid">

<!-- start page title -->
<div class="row">
    <div class="col-12">
        <div class="page-title-box d-sm-flex align-items-center justify-content-between">
            <h1 class="mb-sm-0 font-size-20">📦상품 상세</h1>
        </div>
    </div>
</div>
<!-- end page title -->

<div class="row">
	<form:form modelAttribute="prodVO" class="prod" method="post" action="/prod/detail">
    <div class="col-12">
        <div class="card">
            <div class="card-body">
                <div class="d-flex gap-3">
                <h4 class="card-title ntitle">상품 상세</h4>
                 	<a href="javascript:void(0);" class="text-success btnFam" data-bs-toggle="modal" data-bs-target="#modalBasic" id="modBtn"><i class="mdi mdi-pencil font-size-18"></i></a>
                 	<a href="javascript:void(0);" class="text-danger btnFam notMod"><i class="mdi mdi-delete font-size-18" id="delBtn"></i></a>
                	<a href="/prod/list" class="btn btn-secondary btn-rounded waves-effect waves-light notMod" id="prlist">목록보기</a>
	                <a href="javascript: void(0);" class="btn btn-light btn-rounded waves-effect btnFam" id="confirmBtn" hidden>확인</a>
	                <a href="javascript: void(0);" class="btn btn-dark btn-rounded waves-effect waves-light btnFam" id="cancelBtn" hidden>취소</a>
				</div>
				<hr><br>
                <div class="mb-3 row">
                    <label for="example-text-input" class="col-md-2 col-form-label">상품분류</label>
                    <div class="col-md-10">
                        <a href="javascript: void(0);" class="form-control intag"" type="text" id="seModBtn" onclick="fn_seMod()" hidden>${prodVO.cmncdNm1}, ${prodVO.cmncdNm2}(수정시 클릭)</a>
                        <td>
                        <form:select path="cmncdNm1" class="form-select seSelect" onchange="fn_seChg(this)" disabled="true" hidden="true">
<!--                         <select name="seBig" id="seBig" class="form-select seSelect" onchange="fn_seChg(this)" hidden> -->
                            <form:option value="패션" label="패션"/>
                            <form:option value="가구/인테리어" lebel="가구/인테리어" />
                            <form:option value="화장품/미용" lebel="화장품/미용" />
                            <form:option value="식품" lebel="식품" />
                            <form:option value="출산/유아동" lebel="출산/유아동" />
                            <form:option value="반려동물용품" lebel="반려동물용품" />
                            <form:option value="생활/주방용품" lebel="생활/주방용품" />
                            <form:option value="가전" lebel="가전" />
                            <form:option value="디지털" lebel="디지털" />
                            <form:option value="컴퓨터" lebel="컴퓨터" />
                            <form:option value="스포츠/레저" label="스포츠/레저" />
                            <form:option value="건강/의료용품" label="건강/의료용품" />
                            <form:option value="자동차/공구" label="자동차/공구" />
                            <form:option value="취미/문구/악기" label="취미/문구/악기" />
                            <form:option value="도서" label="도서" />
                        </form:select>
                        <form:select path="cmncdNm2" class="form-select seSelect" disabled="true" hidden="true">
                        	<form:option value="" label="중분류 선택"/>
                        </form:select>
                        </td>
                        <form:input path="cmncdNm1" class="form-control secondSE" type="text" value="${prodVO.cmncdNm1}" id="example-text-input" hidden="true"/>
                        <form:input path="cmncdNm2" class="form-control secondSE" type="text" value="${prodVO.cmncdNm2}" id="example-text-input" hidden="true"/>
                        <p class="form-control pptag" type="text" id="example-text-input">${prodVO.cmncdNm1}, ${prodVO.cmncdNm2}</p>
                    </div>
                </div>
                <div class="mb-3 row">
                    <label for="example-text-input" class="col-md-2 col-form-label">상품아이디</label>
                    <div class="col-md-10">
                        <form:input path="prodInfoId" class="form-control" type="text" value="${prodVO.prodInfoId}" id="example-text-input" hidden="true"/>
                        <p class="form-control idValkk" type="text" id="example-text-input" >${prodVO.prodInfoId}</p>
                    </div>
                </div>
                <div class="mb-3 row">
                    <label for="example-text-input" class="col-md-2 col-form-label">상품명</label>
                    <div class="col-md-10">
                        <form:input path="prodInfoNm" class="form-control intag" type="text" value="${prodVO.prodInfoNmDisplay}" id="example-text-input" hidden="true"/>
                        <p class="form-control pptag" type="text" id="example-text-input" >${prodVO.prodInfoNmDisplay}</p>
                    </div>
                </div>
                <div class="mb-3 row">
                    <label for="example-text-input" class="col-md-2 col-form-label">매입가격</label>
                    <div class="col-md-10">
                        <form:input path="prodInfoPrchsAmt" class="form-control intag" type="text" value="${prodVO.prodInfoPrchsAmtDisplay}" onkeyup="inputNumberFormat(this)" id="example-text-input" hidden="true"/>
                        <p class="form-control pptag" type="text" id="example-text-input" >${prodVO.prodInfoPrchsAmtDisplay}</p>
                    </div>
                </div>
                <div class="mb-3 row">
                    <label for="example-text-input" class="col-md-2 col-form-label">판매가격</label>
                    <div class="col-md-10">
                        <form:input path="prodInfoNtslAmt" class="form-control intag" type="text" value="${prodVO.prodInfoNtslAmtDisplay}" onkeyup="inputNumberFormat(this)" id="example-text-input" hidden="true"/>
                        <p class="form-control pptag" type="text" id="example-text-input" >${prodVO.prodInfoNtslAmtDisplay}</p>
                    </div>
                </div>
                <div class="mb-3 row">
                    <label for="example-text-input" class="col-md-2 col-form-label">리드타임(일 기준)</label>
                    <div class="col-md-10">
                        <form:input path="prodInfoLdt" class="form-control intag" type="text" value="${prodVO.prodInfoLdt}" id="example-text-input" hidden="true"/>
                        <p class="form-control pptag" type="text" id="example-text-input" >${prodVO.prodInfoLdt}</p>
                    </div>
                </div>
                <div class="mb-3 row">
                    <label for="example-text-input" class="col-md-2 col-form-label">원산지</label>
                    <div class="col-md-10">
                        <form:input path="prodInfoPlor" class="form-control intag" type="text" value="${prodVO.prodInfoPlor}" id="example-text-input" hidden="true"/>
                        <p class="form-control pptag" type="text" id="example-text-input" >${prodVO.prodInfoPlor}</p>
                    </div>
                </div>
            </div>
        </div>
    </div> <!-- end col -->
    </form:form>
</div>

<!-- end row -->
</div>
