/**
 * 
 */
//본사 전용!! 필터기능에서만 사용되는 reduce함수 메소드

//대분류가 전체가 아닐때
function bigSe(){
	var opt = $("#cmncdNm1").val();
	jsonArray = jsonArray.reduce((pre, cur) => {
	    if(cur.cmncdNm1 == opt ) pre.push(cur);
	    return pre;
	},[]);
}
//중분류가 전체가 아닐때
function midSe(){
	var midOpt = $("#cmncdNm2").val();
	jsonArray = jsonArray.reduce((pre, cur) => {
	    if(cur.cmncdNm2 == midOpt ) pre.push(cur);
	    return pre;
	},[]);
}
//지점이 전체가 아닐때
function brnSelect(){
	var radiopt = document.querySelector('input[name="toast-type-radio"]:checked').value;
	jsonArray = jsonArray.reduce((pre, cur) => {
	    if(cur.brncofcIdWr == radiopt ) pre.push(cur);
	    return pre;
	},[]);
}
//날짜가 선택됐을때
function dtSelect(){
	var dtOpt = $("#orderid-input").val();
	jsonArray = jsonArray.reduce((pre, cur) => {
	    if(cur.strgShmtDt == dtOpt ) pre.push(cur);
	    return pre;
	},[]);
}
//거래처가 선택됐을때
function cnptSelect(){
	var cnpt = $("#cnptNm").val();
	jsonArray = jsonArray.reduce((pre, cur) => {
	    if(cur.cnptNm == cnpt ) pre.push(cur);
	    return pre;
	},[]);
}
//초기화버튼 클릭시 원본 배열 가져오는 함수
function resetBtn(){
	jsonArray = newArray;
	$(".arryTd").remove();
}
