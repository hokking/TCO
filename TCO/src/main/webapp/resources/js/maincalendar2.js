


//aside-전사적캘린더(조회,수정,삭제,기입가능)

var calendar = null;
var initialLocaleCode = 'ko';

    $(document).ready(function(){
    		$('.update').attr('readonly',true);
            var calendarEl = document.getElementById('maincalendar');
            calendar = new FullCalendar.Calendar(calendarEl, {
                initialView: 'dayGridMonth',
                headerToolbar: {
                    left: 'prev,next today',
                    center: 'title',
//                  right: 'dayGridMonth,timeGridWeek,timeGridDay,listWeek'
                    right: 'dayGridMonth,listWeek'
                },
                locale:'ko',//한글언어
//              timeZone:'Asia/seoul',//한국시간
                navLinks: true,//날짜클릭시 day캘린더로
                editable: false,//드래그수정가능
                selectable: true,//선택가능
                droppable: false,//드래그가능
                aspectRatio: 1.35,//가로세로 비율
                allDaySlot: false,
                nowIndicator:true,//현재날짜마크
                select: function(info){
					var v_date = getFormatDate(new Date(info.end));
					console.log('info:',info);
                	//modal소환
                	$('#maineventmodal').modal('show');
//                 	var startiso = .start.toISOString();
                	var startday = info.startStr;
                	console.log('startday:',startday);
                	var endday = v_date;
                	
                	stday = document.getElementById("inmainStart");
                	stday.value = startday;
                	edday = document.getElementById("inmainEnd");
                	edday.value =endday;
                },
                //드래그시 이벤트
//                 eventDrop: function(info){
//                 	alert("드래그수정")
//                 },
				//일정클릭시 이벤트
				eventClick: function(info,jsEvent,view){
					//일정클릭시 이벤트
					var title = info.event.title;
					var id = info.event.id;
					var description = info.event.extendedProps.description;
					var start = getFormatDate2(new Date(info.event._instance.range.start));
					var end = getFormatDate2(new Date(info.event._instance.range.end));
					var eventcon = info.event.extendedProps.eventcon;
					
					//console.log('중요도:',eventcon);
					
					$('#mainupdatemodal').modal('show');
					$('#mainCalno').attr('value',id);
					$('#upmainCaltitle').attr('value',title);
					$('#upmainCalcon').attr('value',description);
					$('#upmainStart').attr('value',start);
					$('#upmainEnd').attr('value',end);
					$('#upmainCaluser').text(eventcon);
				},
              	//이벤트 조회
                events: function(info, successCallback, failureCallback){
                	$.ajax({
                		type:'POST',
                		url:'/calendar/maincalendar',
                		dataType:'json',
                		contentType:'application/x-www-form-urlencoded; charset=UTF-8',
                		success: function(param){
                			var events=[];
                			$.each(param,function(index,data){
                				events.push({
                					id:data.mainCalno,
                					title:data.mainCaltitle,
                					description:data.mainCalcon,
                					start:data.mainStart,
                					end:data.mainEnd,
                					className:data.mainColor,
                					eventcon:data.mainCaluser
                				});
                			});
                			successCallback(events);
                		},
                		error: function(request,status,error){
                			alert(request.status+' 에러가 발생하였습니다. 다시 시도해주세요.')
                		}
                	});
                }
            });
      		calendar.render();
	});
	
	  //등록할때의 dateformat형식(YYYY-MM-DD형식)
    function getFormatDate(date){
        var year = date.getFullYear();              //yyyy
        var month = (1 + date.getMonth());          //M
        month = month >= 10 ? month : '0' + month;  //month 두자리로 저장
        var day = date.getDate()-1;                   //fullcalendar에서 하루가 더 나오기에 -1
        day = day >= 10 ? day : '0' + day;          //day 두자리로 저장
        return  year + '-' + month + '-' + day;
    }
    
    //조회할때의 dateformat형식
    function getFormatDate2(date){
        var year = date.getFullYear();              //yyyy
        var month = (1 + date.getMonth());          //M
        month = month >= 10 ? month : '0' + month;  //month 두자리로 저장
        var day = date.getDate();                   //
        day = day >= 10 ? day : '0' + day;          //day 두자리로 저장
        return  year + '-' + month + '-' + day;
    }

    
  //등록 액션    
    function main_insert(){ 
	  
      Swal.fire({
    	  title: '일정등록을 하시겠습니까?',
    	  icon:'info',
    	  text:'※주의: 등록시 기록이 남습니다.',
    	  showCancelButton: true,
    	  confirmButtonText: '등록',
    	  cancelButtonText: '취소',
    	}).then((result) => {
    	  if (result.isConfirmed) {
    	    Swal.fire('등록완료', '', 'success')
    	    $('#mainInsertSch').submit();
    	  }else{
    		Swal.fire('취소하셨습니다', '', 'error')  
    	  }
    	})
    	
    }
    
  	//수정모달액션
  	function main_update(){
  		$('#btnmainupdate').css('display','none');
  		$('#btnmainupdatecom').css('display','inline-block');
  		$('#offuser').css('display','none');
  		$('#onuser').css('display','inline-block');
  		$('.update').attr('readonly',false);
  	}
	
  	
	//수정모달창 닫을시 초기화  	
  	function main_close(){
  		$('#mainupdatemodal').modal('hide');
  		$('#btnmainupdate').css('display','inline-block');
  		$('#btnmainupdatecom').css('display','none');
  		$('#offuser').css('display','inline-block');
  		$('#onuser').css('display','none');
  		$('.update').attr('readonly',true);
    }
  
  
    //수정완료액션
    function main_updatecom(){ 
    	 Swal.fire({
       	  title: '<strong>일정을 수정하시겠습니까?<strong>',
       	  icon:'info',
       	  text:'※주의: 수정시 기록이 남습니다',
       	  showCancelButton: true,
       	  confirmButtonText: '수정',
       	  cancelButtonText: '취소',
       	}).then((result) => {
       	  if (result.isConfirmed) {
       	    Swal.fire('수정완료', '', 'success')
       	 	$('#mainupdatefrm').submit();
       	  }else{
       		Swal.fire('취소하셨습니다', '','error')
       		return false;
       	  }
       	})
//       if(!confirm("※해당 일정을 정말로 수정 하시겠습니까?"))return false; 
     
    }
         
    //삭제액션
    function main_delete(){
    	
    	var id = $('#mainCalno').val();
    	
    	Swal.fire({
         	  title: '일정을 삭제하시겠습니까?',
         	  icon:'info',
         	  text:'※ 주의: 삭제시 기록이 남습니다',
         	  showCancelButton: true,
         	  confirmButtonText: '삭제',
         	  cancelButtonText: '취소',
         	}).then((result) => {
         	  if (result.isConfirmed) {
         	    Swal.fire('삭제완료','', 'success')
         	    location.href = "/calendar/mainDeleteSch?mainCalno="+id;
         	  }else{
         		Swal.fire('취소하셨습니다','','error')
         		return false;
         	  }
         	})
//       	if(!confirm("※해당 일정을 정말로 삭제 하시겠습니까?")) return false;
    }
    
	function fn_move(){
		var caluser = $('#upmainCaluser').text();
		location.href= '/emp/empdetail?empId='+caluser;
		
		console.log('caluser',caluser)
	}
	
    
    
    