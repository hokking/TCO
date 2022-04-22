<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<script src="/resources/js/jquery-3.6.0.min.js"></script>
<script src="/resources/js/section.js"></script>
<script type="text/javascript">
function selectCnpt(){
	const cnptNm = document.querySelector("#cnptNm");
	let opt = document.createElement("option");
	
	$.ajax({
		url:"/prod/cnpt.do",
		type:'get',
		dataType:'JSON',
		success:function(res){
			console.log(res);
			str = [];
			for(var i=0; i < res.length; i++){
				str.push(res[i].cnptNm);
			}
			console.log(str.length);
			for(var i=0; i < str.length; i++){
				opt = document.createElement("option");
				opt.value = str[i];
				console.log(opt);
				cnptNm.append(opt);
			}
		}
	})
}
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
function fn_seChg(e){
	fn_seChgJs(e);
}

function clickShow(){
	$(".ntitle").on("click", function(){
		$("#cmncdNm1").val("도서");
		
	 	var opt = document.createElement("option");
	 	opt.value = "인문";
	 	opt.innerHTML = "인문";
	 	
	    var cmncdNm2 = document.getElementById("cmncdNm2");
	    cmncdNm2.appendChild(opt);
	    
		$("#cmncdNm2").val("인문");
		
		$("#prodInfoNm").val("지적 대화를 위한 넓고 얕은 지식 1");
		$("#prodInfoPrchsAmtDisplay").val("10,000");
		$("#prodInfoNtslAmtDisplay").val("15,000");
		$("#cnptNm1").val("허블");
		$("#prodInfoLdt").val("2");
		$("#prodInfoPlor").val("MOKPO");
		$("#strgStckDfltQty").val("200");
		$("#strgStckSftyQty").val("20");
		
	});
	
}


$(function(){
	selectCnpt();
	clickShow();
	//등록버튼 클릭시
	$("#insBtn").on('click', function(){
		$("#prodVO").submit();
		 $.ajax({
			 url : "/prod/insert.do",
			 data :  $("#prodVO").serialize(), // form데이터에 있는 vo객체를 serialize
			 type : 'get',
			 success : function(res){
				 console.log(res);
				 
				 if(res > 0){
					 Swal.fire({
				          icon:'success',
				          title:'상품이 등록됐습니다.',
			       		}).then(function(){
			       			window.location.href="list";
			       		})
				 }else{
					 Swal.fire({
				          icon:'error',
				          title:'상품등록에 실패했습니다.',
			       		}).then(function(){
			       			window.location.href="list";
			       		})
				 }
			 },
			 dataType : 'json'
		 })
	})
})
</script>
<style>
#insBtn{
	float: right;
}
</style>
<!-- start page title -->
<div class="row">
    <div class="col-12">
        <div class="page-title-box d-sm-flex align-items-center justify-content-between">
           <h1 class="mb-sm-0 font-size-20">📦상품 등록</h1>


        </div>
    </div>
</div>
<!-- end page title -->

<div class="row">
	<form:form modelAttribute="prodVO" class="prod" method="get" action="javascript: void(0);">
    <div class="col-12">
        <div class="card">
            <div class="card-body">
                <h4 class="card-title ntitle">상품 등록</h4>
                <a href="javascript: void(0);" class="btn btn-info btn-rounded waves-effect waves-light btnFam" id="insBtn">등록</a>
				<br><br>
                <div class="mb-3 row">
                    <label for="example-text-input" class="col-md-2 col-form-label">상품분류</label>
                    <div class="col-md-10">
                        <td>
                        <form:select path="cmncdNm1" class="form-select seSelect" onchange="fn_seChg(this)">
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
                            <form:option value="도서" label="도서" id="book" />
                        </form:select>
                        <form:select path="cmncdNm2" class="form-select seSelect" >
                        	<form:option value="" label="중분류 선택"/>
                        </form:select>
                        </td>
                    </div>
                </div>
                <div class="mb-3 row">
                    <label for="example-text-input" class="col-md-2 col-form-label">상품명</label>
                    <div class="col-md-10">
                        <form:input path="prodInfoNm" class="form-control intag" type="text" id="prodInfoNm"/>
                    </div>
                </div>
                <div class="mb-3 row">
                    <label for="example-text-input" class="col-md-2 col-form-label">매입가격</label>
                    <div class="col-md-10">
                        <form:input path="prodInfoPrchsAmtDisplay" class="form-control intag" type="text" id="prodInfoPrchsAmtDisplay"  onkeyup="inputNumberFormat(this)"/>
                    </div>
                </div>
                <div class="mb-3 row">
                    <label for="example-text-input" class="col-md-2 col-form-label">판매가격</label>
                    <div class="col-md-10">
                        <form:input path="prodInfoNtslAmtDisplay" class="form-control intag" type="text" id="prodInfoNtslAmtDisplay" onkeyup="inputNumberFormat(this)"/>
                    </div>
                </div>
                <div class="mb-3 row">
                    <label for="example-text-input" class="col-md-2 col-form-label">거래처</label>
                    <div class="col-md-10">
                    	<input type="text" list="cnptNm" name="cnptNm" id="cnptNm1" class="form-select">
						<datalist id="cnptNm">
						</datalist>
                    </div>
                </div>
                <div class="mb-3 row">
                    <label for="example-text-input" class="col-md-2 col-form-label">리드타임(일 기준)</label>
                    <div class="col-md-10">
                        <form:input path="prodInfoLdt" class="form-control intag" type="text" id="prodInfoLdt"/>
                    </div>
                </div>
                <div class="mb-3 row">
                    <label for="example-text-input" class="col-md-2 col-form-label">원산지</label>
                    <div class="col-md-10">
                        <form:input path="prodInfoPlor" class="form-control intag" type="text" id="prodInfoPlor" />
                    </div>
                </div>
                <div class="mb-3 row">
                    <label for="example-text-input" class="col-md-2 col-form-label">기본보유수</label>
                    <div class="col-md-10">
                        <form:input path="strgStckDfltQty" class="form-control intag" type="text" id="strgStckDfltQty" />
                    </div>
                </div>
                <div class="mb-3 row">
                    <label for="example-text-input" class="col-md-2 col-form-label">안전재고수</label>
                    <div class="col-md-10">
                        <form:input path="strgStckSftyQty" class="form-control intag" type="text" id="strgStckSftyQty" />
                    </div>
                </div>
            </div>
        </div>
    </div> <!-- end col -->
    </form:form>
</div>

<!-- end row -->
</div>
