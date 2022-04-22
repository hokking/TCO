<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<script type="text/javascript" src="/resources/js/jstree/jstree.min.js"></script>
<script type="text/javascript" src="/resources/js/jqgrid/grid.locale-kr.js"></script>
<script type="text/javascript" src="/resources/js/jqgrid/jquery.jqGrid.min.js"></script>
<script src="/resources/skote/Skote_v3.3.2/HTML/Admin/dist/assets/libs/bootstrap/js/bootstrap.min.js"></script>
<link href="/resources/js/jstree/style.min.css" rel="stylesheet" type="text/css" />
<link href="/resources/css/ui.jqgrid.css" rel="stylesheet" type="text/css" />
<link href="/resources/css/jquery-ui.min.css" rel="stylesheet" type="text/css"/>
<link href="/resources/skote/Skote_v3.3.2/HTML/Admin/dist/assets/css/bootstrap.min.css" id="bootstrap-style" rel="stylesheet" type="text/css" />
<script>

//현재 날짜구하기
var today = new Date();
var year = today.getFullYear();
var month = ('0' + (today.getMonth() + 1)).slice(-2);
var day = ('0' + today.getDate()).slice(-2);
var dateString = 	year+'-'+month+'-'+day;

let arr = new Array();



//트리만들기
function fn_click(){
	$('#groupmodal').modal('show');
}

function gettree(){
	$.ajax({
		type:'post',
		url:'/sttst/testformat',
		dataType:'json',
		success:function(data){
			console.log('data:',data);
			$.each(data,function(idx,item){
				arr[idx]={id:item.childId, parent:item.parentId ? item.parentId:'#', text:item.groupNm}
			});
			console.log('ajax로 가져온데이터:',arr);
			$('#jstree').jstree({
				"core":{
					'data': arr
				},
				"types":{
					'default':{
						'icon':'mdi mdi-account'
					}
				},
				"themes":{
					"theme":"classic","dots":true,"icons":true
				},
				'plugins':[
					'dnd','wholerow','types','themes'
				]
			})
			.bind('loaded.jstree',function(event,data){
				//트리를 모두 열어놓음
				$('#jstree').jstree('open_node',$('#base'));
			})
			.bind('select_node.jstree', function(event,data){
				//노드선택 이벤트
				console.log(data);
				var childId = data.instance.get_node(data.selected).id;
				console.log('id값:',childId);
				reloadGrid(childId,'');
			})
		},
		error:function(error){
			alert("에러");
		}
	});
};

//그리드 만들기

function getgrid(childId){
	$('#gridlist').jqGrid({
		url:"/sttst/emplist/"+childId,
        loadtext: '로딩중입니다',
        datatype:"json",
        loadonce: true,
        mtype : "POST",
        autowidth: true,
        height: 230,
        multiselect:true,
        colNames:["이름", "부서", "직급", "연락처"],
        colModel:[
                  {name:"personNm", index:"personNm", align:"center"},
                  {name:"deptNm", index:"deptNm", align:"center"},
                  {name:"rank", index:"rank", align:"left"},
                  {name:"personTel", index:"personTel", align:"left"}
                ],
        caption: "회사조직도",
        rownumbers : true,
        viewrecords:true,
        rowNum:10,
        rowList: [10, 20],
        onSelectRow:function(rowId,row,e){
        	//리스트에서 클릭시 이벤트 처리
        	console.log('grid값: ',row)
        	if(!confirm("결재 상신자를 선택하시겠습니까?")) return false;
        	getterGrid(rowId);
        	getEquipArray(rowId,row);
        	$('#jstree').jstree('close_all');
        },
        pager: '#pager'
	});
};

// //그리드 리로드(조회시 재로딩해야함)
// function reloadGrid2(id, name) {
// 	alert("ggg");
// 	$("#gridlist").jqGrid("GridUnload");
	
// }

function reloadGrid(id, name) {
	$("#gridlist").jqGrid('setGridParam',{
        url: "/sttst/emplist/"+id,
        datatype: "json",
        postData : {childId: id, personNm: name}
    }).trigger('reloadGrid');
}


//그리드의 단일값가져오기
function getterGrid(){
	var obj = $("#gridlist");
	var idx = obj .jqGrid('getGridParam', 'selrow');
	for(var i = 0; i < idx.length;i++)
	{
// 	var value = obj.jqGrid('getCell', idx[i], '가져올 컬럼값의 이름');
	var value = obj.jqGrid('getCell', idx[i], 'personNm');
	}
	if($('#valueFrm').is(':empty')){
		$('#valueFrm').append(value)		
	}else{
	  	$('#valueFrm').append(','+value)
	}
}



//트리 초기화
function f_reset() {
	$('#jstree').jstree("deselect_all");
	childId = "";
	reloadGrid(childId,"");
}


$('document').ready(function(){
	gettree();
	getgrid();
	$('#writeday').val(dateString);
	$('#startday').datepicker({
		dateFormat:'yy-mm-dd',
		language:'kr',
		autoclose:true
		});
	$('#endday').datepicker({
		dateFormat:'yy-mm-dd',
		language:'kr',
		autoclose:true});
});


////결재상신
function fn_send(){
	if(!confirm("선택을 마치겠습니까?")) return false;
	var valueFrm = $('#valueFrm').text();
	$('#receiver').val(valueFrm);
	$('#groupmodal').modal('hide');
}

function fn_submit(){
	Swal.fire({
		  title: '<strong>결재를 상신하시겠습니까?</strong>',
		  icon: 'info',
		  showCloseButton: true,
		  showCancelButton: true,
		  focusConfirm: false,
		  confirmButtonText:
		    '<i class="fa fa-thumbs-up"></i>상신!',
		  cancelButtonText:
		    '<i class="fa fa-thumbs-down"></i>취소',
		})
	}
	 


	
</script>

<!-- 휴가신청서 -->
<button type="button" class="btn btn-primary" onclick="fn_click()">결재자 선택</button>
<button type="button" class="btn btn-success" onclick="fn_submit()">결재상신하기</button>
<a class="btn btn-light" href="/eatrz/eatrzmain">목록으로</a>
<br><br>

          	<div class="container" style="float: none; margin:100 auto; border:solid 1px #CCCCCC;">
<!-- 휴가 등록 frm -->
<!--           		<form action="URL" method="post" id="restFrm" name="restFrm"> -->
              	<table class="__se_tbl" style="border-collapse: collapse !important; color: black; background: white; border: 0px solid black; font-size: 12px; font-family: malgun gothic,dotum,arial,tahoma;"><!-- Header --> 
					<tbody>
							<tr>
								<td style="width:300px; padding: 3px !important; border: 0px solid black; height: 90px !important; font-size: 22px; font-weight: bold; text-align: center; vertical-align: middle;" colspan="2" class="dext_table_border_t dext_table_border_r dext_table_border_b dext_table_border_l">
									휴&nbsp;&nbsp;가&nbsp;&nbsp;신&nbsp;&nbsp;청&nbsp;&nbsp;서
								</td>
							</tr>
							<tr>
								<td style="width:300px; border: 0; padding: 0 !important" class="dext_table_border_t dext_table_border_r dext_table_border_b dext_table_border_l">
									
					<table class="__se_tbl" style="background: white; margin: 0px; border: 1px solid black; border-image: none; color: black; font-family: malgun gothic,dotum,arial,tahoma; font-size: 12px; border-collapse: collapse !important;"><!-- User --> 
						<tbody>
							<tr>
								<td style="width: 100px; height: 22px; vertical-align: middle; border: 1px solid black; text-align: center; font-weight: bold; background: rgb(221, 221, 221); padding: 3px !important;">
									기안자
								</td>
								<td style="width: 200px; height: 22px; vertical-align: middle; border: 1px solid black; text-align: left; padding: 3px !important;">
									<span unselectable="on" contenteditable="false" class="comp_wrap" data-cid="0" data-dsl="{{label:draftUser}}" data-wrapper="" style="" data-value="" data-autotype="">
										<input class="sender" type="text" value="${sessionScope.userNM}" readonly="readonly" style="height: 100%; width: 100%;"> 
									<span contenteditable="false" class="comp_active" style="display:none;"> <span class="Active_dot1"></span><span class="Active_dot2"></span> <span class="Active_dot3"></span><span class="Active_dot4"></span> </span> <span contenteditable="false" class="comp_hover" data-content-protect-cover="true" data-origin="0"> <a contenteditable="false" class="ic_prototype ic_prototype_trash" data-content-protect-cover="true" data-component-delete-button="true"></a> </span> </span> 
								</td>
							</tr>
							<tr>
								<td style="width:100px;padding: 3px !important; height: 22px; vertical-align: middle; border: 1px solid black; text-align: center; font-weight: bold; background: #ddd;">
									기안부서
								</td>
								<td style="width:200px;padding: 3px !important; height: 22px; vertical-align: middle; border: 1px solid black; text-align: left;">
									<span unselectable="on" contenteditable="false" class="comp_wrap" data-cid="1" data-dsl="{{label:draftDept}}" data-wrapper="" style="" data-value="" data-autotype="">
										<input class="sender" type="text" value="${sessionScope.brncofcNm}" readonly="readonly" style="width: 100%; height: 100%;"> 
									<span contenteditable="false" class="comp_active" style="display:none;"> <span class="Active_dot1"></span><span class="Active_dot2"></span> <span class="Active_dot3"></span><span class="Active_dot4"></span> </span> <span contenteditable="false" class="comp_hover" data-content-protect-cover="true" data-origin="1"> <a contenteditable="false" class="ic_prototype ic_prototype_trash" data-content-protect-cover="true" data-component-delete-button="true"></a> </span> </span> 
								</td>
							</tr>
							<tr>
								<td style="width:100px;padding: 3px !important; height: 22px; vertical-align: middle; border: 1px solid black; text-align: center; font-weight: bold; background: #ddd;">
									기안일
								</td>
								<td style="width:200px;padding: 3px !important; height: 22px; vertical-align: middle; border: 1px solid black; text-align: left;">
									<span unselectable="on" contenteditable="false" class="comp_wrap" data-cid="2" data-dsl="{{label:draftDate}}" data-wrapper="" style="" data-value="" data-autotype="">
									<input class="sender" type="text" readonly="readonly" id="writeday" style="width: 100%; height: 100%;" class="form-">
									<span contenteditable="false" class="comp_active" style="display:none;"> <span class="Active_dot1"></span><span class="Active_dot2"></span> <span class="Active_dot3"></span><span class="Active_dot4"></span> </span> <span contenteditable="false" class="comp_hover" data-content-protect-cover="true" data-origin="2"> <a contenteditable="false" class="ic_prototype ic_prototype_trash" data-content-protect-cover="true" data-component-delete-button="true"></a> </span> </span> 
								</td>
							</tr>
							<tr>
								<td style="width:100px;padding: 3px !important; height: 22px; vertical-align: middle; border: 1px solid black; text-align: center; font-weight: bold; background: #ddd;">
									문서번호
								</td>
								<td style="width:200px;padding: 3px !important; height: 22px; vertical-align: middle; border: 1px solid black; text-align: left;">
									<span unselectable="on" contenteditable="false" class="comp_wrap" data-cid="3" data-dsl="{{label:docNo}}" data-wrapper="" style="" data-value="" data-autotype="">
									<input type="text" id="textid" placeholder="문서번호">
									<span contenteditable="false" class="comp_active" style="display:none;"> <span class="Active_dot1"></span><span class="Active_dot2"></span> <span class="Active_dot3"></span><span class="Active_dot4"></span> </span> <span contenteditable="false" class="comp_hover" data-content-protect-cover="true" data-origin="3"> <a contenteditable="false" class="ic_prototype ic_prototype_trash" data-content-protect-cover="true" data-component-delete-button="true"></a> </span> </span> 
								</td>
							</tr>
						</tbody>
					</table>
								</td>
								<td style="width: 500px; text-align: right; padding: 0px!important; border: 0!important; vertical-align: top !important" class="dext_table_border_t dext_table_border_r dext_table_border_b dext_table_border_l">
									<!-- 결재선 기본값으로 신청 1명, 승인 7명으로 설정--> 
									<label>결재자: <input type="text" id="receiver" name="receiver" readonly="readonly"></label>
								</td>
							</tr>
						</tbody>
					</table>
					 
					<br>

				<table class="__se_tbl" style="width: 800px; margin-top : 0px; border-collapse: collapse !important; color: black; background: white; border: 1px solid black; font-size: 12px; font-family: malgun gothic,dotum,arial,tahoma;">
					<tbody>
						<tr>
							<td style="background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; height: 25px; text-align: center; color: rgb(0, 0, 0); font-size: 14px; font-weight: bold; vertical-align: middle;">
								휴가&nbsp;종류
							</td>
							<td style="background: rgb(255, 255, 255); padding: 5px; border: 1px solid black; height: 25px; text-align: left; color: rgb(0, 0, 0); font-size: 14px; font-weight: normal; vertical-align: middle;">
								<span id="vacationTypeArea" name="select" style="font-family: malgun gothic, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;">
								<label><input type="checkbox" name="title" value="월차">월차</label>
								<label><input type="checkbox" name="title" value="연차">연차</label>
								<label><input type="checkbox" name="title" value="병가">병가</label>
								<label><input type="checkbox" name="title" value="기타사유">기타사유</label>
								</span> 
							</td>
						</tr>
						<tr>
							<td style="background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; height: 25px; text-align: center; color: rgb(0, 0, 0); font-size: 14px; font-weight: bold; vertical-align: middle;">
								기간&nbsp;및&nbsp;일시
							</td>
							<td style="padding: 3px; border: 1px solid black; width: 700px; height: 22px; text-align: left; color: rgb(0, 0, 0); font-size: 12px;  vertical-align: middle; background: rgb(255, 255, 255);">
								<span unselectable="on" contenteditable="false" class="comp_wrap" data-cid="4" data-dsl="{{calendar:startDate}}" data-wrapper="" style="" data-value="" data-autotype="">
								<input id="startday" class="ipt_editor ipt_editor_date" type="text">
								<span contenteditable="false" class="comp_active" style="display:none;"> <span class="Active_dot1"></span><span class="Active_dot2"></span> <span class="Active_dot3"></span><span class="Active_dot4"></span> </span> <span contenteditable="false" class="comp_hover" data-content-protect-cover="true" data-origin="4"> <a contenteditable="false" class="ic_prototype ic_prototype_trash" data-content-protect-cover="true" data-component-delete-button="true"></a> </span> </span>&nbsp;~&nbsp; 
								<span  class="comp_wrap">
								<input id="endday" class="ipt_editor ipt_editor_date" type="text">
								<span contenteditable="false" class="comp_active" style="display:none;"> <span class="Active_dot1"></span><span class="Active_dot2"></span> <span class="Active_dot3"></span><span class="Active_dot4"></span> </span> <span contenteditable="false" class="comp_hover" data-content-protect-cover="true" data-origin="5"> <a contenteditable="false" class="ic_prototype ic_prototype_trash" data-content-protect-cover="true" data-component-delete-button="true"></a> </span> </span> <span id="usingPointArea"></span> 
							</td>
						</tr>
						<tr>
							<td style="background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; height: 25px; text-align: center; color: rgb(0, 0, 0); font-size: 14px; font-weight: bold; vertical-align: middle;">
								연차&nbsp;일수
							</td>
							<td style="padding: 3px; border: 1px solid black; width: 700px; height: 22px; text-align: left; color: rgb(0, 0, 0); font-size: 12px;  vertical-align: middle; background: rgb(255, 255, 255);">
								<input type="number"><span><b>일</b> (연차일수는 15일까지입니다.)</span> 
							</td>
						</tr>
						<tr>
							<td style="background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; height: 80px;wi text-align: center; color: rgb(0, 0, 0); font-size: 14px; font-weight: bold; vertical-align: middle;">
								<b style="color: rgb(255, 0, 0);">*</b>&nbsp;휴가&nbsp;사유 
							</td>
							<td style="padding: 3px; border: 1px solid black; width: 700px; height: 500px; text-align: left; color: rgb(0, 0, 0); font-size: 12px;  vertical-align: top; background: rgb(255, 255, 255);">
								<textarea class="txta_editor" style="width: 100%; height:100%;"></textarea> 
							</td>
						</tr>
						<tr>
							<td colspan="2" style="width:800px; padding: 20px !important; height: 22px; vertical-align: middle; border: 1px solid black; text-align: left; background: #ddd;">
								 1. 연차의 사용은 근로기준법에 따라 전년도에 발생한 개인별 잔여 연차에 한하여 사용함을 원칙으로 한다. 단, 최초 입사시에는 근로 기준법에 따라 발생 예정된 연차를 차용하여 월 1회 사용 할 수 있다.<br> 2. 경조사 휴가는 행사일을 증명할 수 있는 가족 관계 증명서 또는 등본, 청첩장 등 제출<br> 3. 공가(예비군/민방위)는 사전에 통지서를, 사후에 참석증을 반드시 제출 
							</td>
						</tr>
					</tbody>
				</table>
<!-- 				</form> -->
           	</div>
              <!---- 문서서식 끝----->
              
<!-- modal -->
	<div class="modal fade" id="groupmodal" tabindex="-1">
         <div class="modal-dialog modal-dialog-centered modal-xl">
             <div class="modal-content">
                 <div class="modal-header py-3 px-4 border-bottom-0">
                     <h5 class="modal-title" id="modal-title">사원정보</h5>

                     <button type="button" class="btn-close" data-bs-dismiss="modal" aria-hidden="true"></button>

                 </div>
                 <div class="modal-body p-4">
                     <form class="needs-validation" name="" id="" action="" method="">
                         <div class="row">
							<div class="col-4">
								<div id="dept" style="overflow: scroll;height: 300px;">
									<div id="jstree"></div>
								</div>
							</div>
							<div class="col-8">
								<div id="grid">
									<table id="gridlist"></table>
									<div id="pager"></div>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-12 w-100">
								<button type="button" class="btn btn-success" onclick="fn_send()">완료</button>
								<table style="border:1px solid #CCCCCC;">
								<tr>
									<td style="background-color: #E9E9E9">
										<p><b>결재승인자 목록</b></p>
									</td>
								</tr>
								<tr>
									<td>
										<div id="valueFrm" style="width: 1020px; height: 100px; border: 1px solid #CCCCCC;"></div>
									</td>
								</tr>
								</table>
							</div> 
						</div>
                     </form>
                 </div>
             </div> <!-- end modal-content-->
         </div> <!-- end modal dialog-->
     </div>
	
<!-- modal끝 -->
                  