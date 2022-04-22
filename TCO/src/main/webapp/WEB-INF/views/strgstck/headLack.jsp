<%@page import="kr.or.tco.strgstck.vo.StrgstckVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src="/resources/js/jquery-3.6.0.min.js"></script>
<script src="/resources/js/section.js"></script>
<script type="text/javascript">

//테이블 내용 지우기
function resetTd(){
	$(".tdList").remove();
}

var str = "";

//안전재고수 밑으로 떨어진 상품만 뽑아서 테이블 만들기
function headLack(e){
	e = e.reduce((pre, cur) => {
		if( (cur.strgStckQty - cur.strgStckSftyQty) < 0 ) pre.push(cur);
		return pre;
	}, []);
	
	e = e.reduce((pre, cur) => {
		if( cur.strgStckOrdrYn == 'N' ) pre.push(cur);
		return pre;
	}, []);
	
	str = "";
	for(var i=0; i < e.length; i++){ 
		str += '<tr class="tdList"><td>';
		str += '<div class="form-check font-size-16 form-check-info chk">';
		str += '<input class="form-check-input" name="lackChk" type="checkbox" id="'+ e[i].prodInfoId +'" value="'+ e[i].prodInfoId +'">';
		str += '<label class="form-check-label" for="orderidcheck02"></label></div></td>';
		str += '<td>' + e[i].cmncdNm1 + '/' + e[i].cmncdNm2 + '</td>';
		str += '<td>' + e[i].prodInfoNmDisplay + '</td>';
		str += '<td>' + e[i].cnptNm + '</td>';
		str += '<td style="text-align:right;">' + e[i].strgStckQty + '</td>';
		str += '<td style="text-align:right;">' + e[i].strgStckSftyQtyDisplay + '</td>';
		str += '<td style="text-align:right;">' + e[i].lackQty + '</td></tr>';
	}
	$("#lackCont").append(str);
}

//주기적으로 새테이블 뽑기  + 주기적으로 1:N 알림 보내기 
function lackTable(){
	$.ajax({
		url : "/strgstck/newHeadLack.do",
		type : 'post',
		dataType : 'JSON',
		success : function(res){
			if($('#lackChk').is(':checked')){
				$('#lackChk').prop('checked', false);
			}
			resetTd();
			headLack(res);
			
		}
	})
	console.log("본사 부족재고 함수 실행");
	var v_timer = setTimeout(lackTable, 300000);
}

/////////////////////////////////////////이하, 일꾼에게 일하도록 알림 보내기 
//TextMessage tmpMsg = new TextMessage(receiverName + "님 " + brncofcnm 
								//+ "의" + shortstocknm + " 재고가 안전재고 이하 입니다.")

$(function(){
	lackTable(); // 부족재고 조사해서, 테이블로 뽑기
	
	//부족재고 테이블 중, 체크박스 체크된 갯수 구하기. 
	$('#lackChk').on('click', function() {
		if ($('#lackChk').is(':checked')) {
			$('input[name=lackChk]:checkbox').prop('checked', true);
		} else {
			$('input[name=lackChk]:checkbox').prop('checked', false);
		}
	})
	
	//체크박스에 체크가 몇개 되어있는지 확인하는 변수
	var count = 0;
	//체크된 상품아이디 담는 배열
	let idArray = [];
	
	
	//부족재고 수동 채우기 버튼 
	$("#refill").on("click", function(){
		idArray = [];
		var chkBox = document.getElementsByName("lackChk");
		count = 0;
		for(var i=0; i < chkBox.length; i++){
			if(chkBox[i].checked == true){
				count += 1;
				idArray.push(chkBox[i].value);
			}
		}
		console.log(idArray);
		//체크된 게 없다면
		if(count == 0){
			Swal.fire({
		          icon:'error',
		          title:'발주할 상품을 선택해주세요.',
	       		})
		}else{// 체크 된게 있다면, 해당 항목을 주문 
			$.ajax({
				url : "/strgstck/order.do",
				data : {
					"prodId" : JSON.stringify(idArray)
				},
				type : 'get',
				dataType : 'JSON',
				success : function(res){
					if(res == 1){
						Swal.fire({
					          icon:'success',
					          title:'발주에 성공했습니다.',
				       		}).then(function(){
				       			window.location.reload();
				       		})
					}else{
						Swal.fire({
					          icon:'error',
					          title:'발주에 실패했습니다.',
				       		}).then(function(){
				       			window.location.reload();
				       		})
					}
				}
			})
		}
	})
})
</script>
<style>
	.inBtn{
		float: right;
	}
	.seicon{
 		float: right;
	}
	#refill{
		width : 78px;
		float: right;
		margin-right: 38px;
	}
	#storeh4{
		margin:20px 0px 0px 25px;
	}
</style>
    <div class="container-fluid">

        <!-- start page title -->
        <div class="row">
            <div class="col-12">
                <div class="page-title-box d-sm-flex align-items-center justify-content-between">
                     <h1 class="mb-sm-0 font-size-20">🧾부족 재고 현황</h1>

                </div>
            </div>
        </div>
        <!-- end page title -->

        <div class="row">
            <div class="col-12">
                <div class="card">
                  <h4 class="card-title" id="storeh4" >부족재고현황
		  		  <a href="javascript: void(0);" class="btn btn-primary btn-rounded waves-effect waves-light notMod" id="refill">발주</a></h4>
                    <div class="card-body">
                       <div class="table-rep-plugin">
                            <div class="table-wrapper">
                              <div class="table-responsive mb-0 fixed-solution" data-pattern="priority-columns">
                                <div class="sticky-table-header" style="height: 46px; visibility: hidden; top: -1px; width: auto;"></div>
                                <table id="tech-companies-1" class="table table-striped">
                                    <thead>
                                    <tr>
                                        <th style="width: 20px;" class="align-middle">
										<div class="form-check font-size-16 form-check-info">
										<input class="form-check-input" type="checkbox" id="lackChk" value="lackChk">
										<label class="form-check-label" for="lackChk"></label>
										</div>
										</th>
										<th class="align-middle">분류</th>
										<th class="align-middle">상품명</th>
										<th class="align-middle">거래처</th>
										<th class="align-middle" style="text-align:right;">현재고 수</th>
										<th class="align-middle" style="text-align:right;">안전재고 수</th>
										<th class="align-middle" style="text-align:right;">부족재고 수</th>
                                    </tr>
                                    </thead>
                                    <tbody id="lackCont">
                                    </tbody>
                                </table>
                            </div></div>
                        </div>
                    </div>
                </div>
            </div> <!-- end col -->
        </div> <!-- end row -->

    </div> <!-- container-fluid -->
