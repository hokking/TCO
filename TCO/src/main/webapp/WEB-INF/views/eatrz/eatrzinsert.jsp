<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<script src="/resources/js/지출결의서.js"></script>
<link href="/resources/js/jstree/style.min.css" rel="stylesheet" type="text/css" />
<link href="/resources/css/ui.jqgrid.css" rel="stylesheet" type="text/css" />
<link href="/resources/css/jquery-ui.min.css" rel="stylesheet" type="text/css"/>
<link href="/resources/skote/Skote_v3.3.2/HTML/Admin/dist/assets/css/bootstrap.min.css" id="bootstrap-style" rel="stylesheet" type="text/css" />
<script src="/resources/skote/Skote_v3.3.2/HTML/Admin/dist/assets/libs/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/resources/js/jstree/jstree.min.js"></script>
<script type="text/javascript" src="/resources/js/jqgrid/grid.locale-kr.js"></script>
<script type="text/javascript" src="/resources/js/jqgrid/jquery.jqGrid.min.js"></script>
<script>

let arr = new Array();

//트리만들기
function fn_click(){
	$('#groupmodal').modal('show')
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
        colNames:[ "이름", "부서", "직급", "연락처"],
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
        	console.log(rowId);
        	if(!confirm("결재 상신자를 선택하시겠습니까?")) return false;
        	f_reset();
        	$('#jstree').jstree('close_all');
        	reloadGrid("인천점", "");
        	$('#groupmodal').modal('hide');
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
	console.log("gbi");
	$("#gridlist").jqGrid('setGridParam',{
        url: "/sttst/emplist/"+id,
        datatype: "json",
        postData : {childId: id, personNm: name}
    }).trigger('reloadGrid'); //loadonce=false
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
});


</script>
<style type="text/css">
	#dept{
		border:solid 1px #CCCCCC;
		height: 302.984px;
	}
</style>


<!-- start page title -->
<div class="row">
    <div class="col-12">
        <div class="page-title-box d-sm-flex align-items-center justify-content-between">
            <h4 class="mb-sm-0 font-size-18"></h4>

            <div class="page-title-right">
                <ol class="breadcrumb m-0">
                    <li class="breadcrumb-item"><a href="javascript: void(0);">Tasks</a></li>
                    <li class="breadcrumb-item active">Create Task</li>
                </ol>
            </div>

        </div>
    </div>
</div>
<!-- end page title -->

<div class="row">
    <div class="col-lg-12">
        <div class="card">
            <div class="card-body">
                <h4 class="card-title mb-4">결재작성</h4>
                <form class="outer-repeater"  method="post">
                    <div data-repeater-list="outer-group" class="outer">
                        <div data-repeater-item class="outer">
                            <div class="form-group row mb-4">
                                <label for="taskname" class="col-form-label col-lg-2">제목</label>
                                <div class="col-lg-10">
                                    <input id="taskname" name="taskname" type="text" class="form-control" >
                                </div>
                            </div>
                            <div class="form-group row mb-4">
                                <label class="col-form-label col-lg-2">결재 내용</label>
                                <div class="col-lg-10">
                                    <textarea id="taskdesc-editor" name="area"></textarea>
                                </div>
                            </div>

                            <div class="form-group row mb-4">
                                <label class="col-form-label col-lg-2">결재마감일</label>
                                <div class="col-lg-10">
                                    <div class="input-daterange input-group" data-provide="datepicker">
                                        <input type="text" class="form-control" placeholder="Start Date" name="start" />
                                        <input type="text" class="form-control" placeholder="End Date" name="end" />
                                    </div>
                                </div>
                            </div>
                            
                            <div class="inner-repeater mb-4">
                                <div data-repeater-list="inner-group" class="inner form-group mb-0 row">
                                    <label class="col-form-label col-lg-2">결재 승인자</label>
                                    <div  data-repeater-item class="inner col-lg-10 ms-md-auto">
                                        <div class="mb-3 row align-items-center">
                                            <div class="col-md-6">
                                                <input type="text" class="inner form-control" placeholder="Enter Name..."/>
                                            </div>
                                           	
                                           	<div class="col-md-2">
                                           		<div class="mt-2 mt-md-0 d-grid">
                                           			<button class="btn btn-warning inner" type="button" onclick="fn_click()">승인자 선택</button>
                                           		</div>
                                           	</div>
                                            <div class="col-md-2">
                                                <div class="mt-2 mt-md-0 d-grid">
                                                    <input data-repeater-delete type="button" class="btn btn-primary inner" value="삭제하기"/>
                                                </div>
                                            </div>
                                            
                                        </div>
                                    </div>
                                </div>
                                <div class="row justify-content-end">
                                    <div class="col-lg-10">
                                        <input data-repeater-create type="button" class="btn btn-success inner" value="상신자 추가"/>
                                    </div>
                                </div>
                            </div>
                            
                            <div class="form-group row mb-4">
                                <label for="taskbudget" class="col-form-label col-lg-2">첨부파일</label>
                                <div class="col-lg-10">
                                    <input class="form-control" type="file">
                                </div>
                            </div>
                            
                            <div class="form-group row mb-4">
                                <label for="taskbudget" class="col-form-label col-lg-2">기타사항</label>
                                <div class="col-lg-10">
                                    <input id="taskbudget" name="taskbudget" type="text" placeholder="Enter Task Budget..." class="form-control">
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
                <div class="row justify-content-end">
                    <div class="col-lg-10">
                        <button type="submit" class="btn btn-primary">결재작성</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- end row -->


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
                     </form>
                 </div>
             </div> <!-- end modal-content-->
         </div> <!-- end modal dialog-->
     </div>
	
<!-- modal끝 -->
