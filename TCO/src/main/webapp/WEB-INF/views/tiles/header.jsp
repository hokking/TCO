<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<% 	session = request.getSession();
	
String userID = null;
String sender = null;
String brncofcNm = null;
String dptopt = null;
String lelopt = null;
String userNM = null;
String brncofcId = null;

	if(session != null){
		userID = (String)session.getAttribute("userID");
		userNM = (String)session.getAttribute("userNM");
		brncofcId = (String)session.getAttribute("brncofcId");
		brncofcNm = (String)session.getAttribute("brncofcNm");
		dptopt = (String)session.getAttribute("dptopt");
		lelopt = (String)session.getAttribute("lelopt");
	}

	//pageContext.setAttribute("sender", sender);
%>

<input type="hidden" id="userID" value="<%=userID %>"> <!--  로그인한 사람 아이디 -->
<input type="hidden" id="userNM" value="<%=userNM %>"> <!-- 로그인 한 사람 아이디 -->
<input type="hidden" id="brncofcNm" value="<%=brncofcNm %>">
<input type="hidden" id="brncofcId" value="<%=brncofcId %>">
<input type="hidden" id="dptopt" value="<%=dptopt %>">
<input type="hidden" id="lelopt" value="<%=lelopt %>">

<script>
//로그인 아이디의 안읽은 메세지 조회 -> 알람테이블에 반영

 	var v_receiver =$("#userID").val();
	$.ajax({ 
		url : '/alam/alamTable', 
		type : 'POST',
		data :{  // 세션 데이터 에서 내 아이디 찾기. 
			"receiverId": v_receiver
		},
		dataType: 'json',
		success : function(data) { 
			if(data == '0'){ 
				alert("실패실패실패"+data); 
				console.log("실패실패실패"+data); 
			}else{ 
				tmpMsg = "";
				tbl = "<table>"
// 					alert("안읽은 알람 데이터"+ data);
					console.log(data);
				for( var i=0; i<data.length; i++){
					a_alamnum = data[i].alamnum
					a_title = data[i].title
					a_senderId = data[i].senderId
					a_senderName = data[i].senderName
					a_receiverId = data[i].receiverId
					a_receiverName = data[i].receiverName
					a_brncofcnm = data[i].brncofcnm
					a_shortstocknm = data[i].shortstocknm
					a_dptopt = data[i].dptopt
					a_lelopt = data[i].lelopt
					tbl += "<tr><td>"
					
//						//1.매장 재고가 안전재고 이하로 내려갔을때, !!매장 직원!! CMNCD_CD = B203  에게 재고부족 알림   //alert("실패실패실패"+data); 
					if(a_title =='stockAlam'){ 
						tmpMsg = a_receiverName + "님이 " + a_brncofcnm
								+"의 " + a_shortstocknm + " 재고가 안전재고 이하 입니다."
								+'<button type="button" class="btn btn-sm btn-success waves-effect waves-light" onclick=alamRead('+a_alamnum+')>읽음</button>'
					//2. 전자결제 상신 받은 상사(지정된 사람)에게 알림 
					}else if(a_title =='proposal') {
						tmpMsg = a_senderName + "님이 " + a_brncofcnm 
								+ "의 " +a_dptopt + " " +a_lelopt + " " + a_receiverName + "님에게 새로운 전자결재를 상신 했습니다. "
								+'<button type="button" class="btn btn-sm btn-success waves-effect waves-light" onclick=alamRead('+a_alamnum+')>읽음</button>'
					//3. 상신한 전자결제 결재 된 경우, 부하(지정된 사람)에게 알림 	
					}else if(a_title =='getApproval') {
						tmpMsg = a_senderName + "님이 " + a_brncofcnm
								+ "의" +a_dptopt + " " +a_lelopt + " " + a_receiverName + "님에게 새로운 전자결재를 상신 했습니다. "
								+'<button type="button" class="btn btn-sm btn-success waves-effect waves-light" onclick=alamRead('+a_alamnum+')>읽음</button>'
					//4. 매장에서 일일정산 했을때, 본사 사장 에게 알림
					}else if(a_title =='settlement') {
						tmpMsg = "<div class='d-flex align-items-center mb-3'>"+ 
								a_brncofcnm + "의" +a_dptopt + " " +a_lelopt + " "+a_senderName 
								+ "님이"+"<br>"+a_brncofcnm+"지점의 일일정산을 상신했습니다." 
								+'<button type="button" class="btn btn-sm btn-success waves-effect waves-light" onclick=alamRead('+a_alamnum+')>읽음</button>'
								+''
					}
					
					tbl	+= tmpMsg + "</td></tr>";
					console.log(i, tmpMsg)
				}
				tbl += "</table>"
					$('#alamCountTable').html(tbl)
// 				alert("안읽은 알람 테이블"+tbl);
// 				alert($('#dangerBell').html());
				$('#dangerBell').text(data.length)//알람카운트증가 
			}
		}, 
		error : function(err){ 
// 			alert('err'); 
		} 
   	}); 

  
// 유저가 실시간 알람을 받는 기능  
 <!-- sockJS -->
 //전역변수 선언-모든 홈페이지에서 사용 할 수 있게 index에 저장 
 var socket = null; 

 $(document).ready(function (){ 
 	   connectWs(); 
 }); 
 
function alamRead(a_alamnum){
// 	 alert("알람리드 시작")
	$.ajax({
		url : '/alam/alamRead', 
		type : 'POST',
		data :{  // 세션 데이터 에서 내 아이디 찾기. 
			"alamnum": a_alamnum
		},
		dataType: 'text',
		success : function(data) { 
			console.log(data)
			if(data == '0'){ 
// 				alert("실패실패실패"+data); 
				console.log("실패실패실패"+data); 
			}else{
// 				alert("읽음처리 성공"); 
				var v_receiver =$("#userID").val();
				$.ajax({ 
					url : '/alam/alamTable', 
					type : 'POST',
					data :{  // 세션 데이터 에서 내 아이디 찾기. 
						"receiverId": v_receiver
					},
					dataType: 'json',
					success : function(data) { 
						if(data == '0'){ 
							alert("실패실패실패"+data); 
							console.log("실패실패실패"+data); 
						}else{ 
							tmpMsg = "";
							tbl = "<table>"
//			 					alert("안읽은 알람 데이터"+ data);
								console.log(data);
							for( var i=0; i<data.length; i++){
								a_alamnum = data[i].alamnum
								a_title = data[i].title
								a_senderId = data[i].senderId
								a_senderName = data[i].senderName
								a_receiverId = data[i].receiverId
								a_receiverName = data[i].receiverName
								a_brncofcnm = data[i].brncofcnm
								a_shortstocknm = data[i].shortstocknm
								a_dptopt = data[i].dptopt
								a_lelopt = data[i].lelopt
								tbl += "<tr><td>"
								
//									//1.매장 재고가 안전재고 이하로 내려갔을때, !!매장 직원!! CMNCD_CD = B203  에게 재고부족 알림   //alert("실패실패실패"+data); 
								if(a_title =='stockAlam'){ 
									tmpMsg = a_receiverName + "님 " + a_brncofcnm + "의" + a_shortstocknm + " 재고가 안전재고 이하 입니다."
											+'<button type="button" class="btn btn-success waves-effect waves-light" onclick=alamRead('+a_alamnum+')>읽음</button>'
								//2. 전자결제 상신 받은 상사(지정된 사람)에게 알림 
								}else if(a_title =='proposal') {
									tmpMsg = a_senderName + "님이 " + a_brncofcnm 
											+ "의" +a_dptopt + " " +a_lelopt + " " + a_receiverName + "님에게 새로운 전자결재를 상신 했습니다. "
											+'<button type="button" class="btn btn-success waves-effect waves-light" onclick=alamRead('+a_alamnum+')>읽음</button>'
								//3. 상신한 전자결제 결재 된 경우, 부하(지정된 사람)에게 알림 	
								}else if(a_title =='getApproval') {
									tmpMsg = a_senderName + "님이 " + a_brncofcnm 
											+ "의" +a_dptopt + " " +a_lelopt + " " + a_receiverName + "님에게 새로운 전자결재를 상신 했습니다. "
											+'<button type="button" class="btn btn-success waves-effect waves-light" onclick=alamRead('+a_alamnum+')>읽음</button>'
								//4. 매장에서 일일정산 했을때, 본사 사장 에게 알림
								}else if(a_title =='settlement') {
									tmpMsg = a_brncofcnm + "의" +a_dptopt + " " +a_lelopt + " "+a_senderName 
											+ "님이 "+a_brncofcnm+"지점의 일일정산을 상신했습니다." 
											+'<button type="button" class="btn btn-success waves-effect waves-light" onclick=alamRead('+a_alamnum+')>읽음</button>'
								}
								
								tbl	+= tmpMsg + "</td></tr>";
								console.log(i, tmpMsg)
							}
							tbl += "</table>"
								$('#alamCountTable').html(tbl)
//			 				alert("안읽은 알람 테이블"+tbl);
//			 				alert($('#dangerBell').html());
							$('#dangerBell').text(data.length)//알람카운트증가 
						}
					}, 
					error : function(err){ 
						alert('err'); 
					} 
			   	}); 
			}
		}
	 })
}
 
 function connectWs(){ 
	sock = new SockJS( "<c:url value="/echo"/>" ); 
 	//sock = new SockJS('/replyEcho'); 
 	socket = sock; 

 	sock.onopen = function() { 
         console.log('info: connection opened.'); 
   }; 

   
   
  sock.onmessage = function(evt) {// 메세지는 받아짐.  
	  	var v_receiver =$("#userID").val();
 	 	var data = evt.data; 
 	   	console.log("ReceivMessage : " + data + "\n"); 
		
 		swal.fire(data,"",'success');
		

//  	   	alert("ReceivMessage : " + data + "\n");
 	   	
 	   	
	   	$.ajax({ 
			url : '/alam/alamTable', 
			type : 'POST',
			data :{  // 세션 데이터 에서 내 아이디 찾기. 
				"receiverId": v_receiver
			},
			dataType: 'json',
			success : function(data) { 
				if(data == '0'){ 
					alert("실패실패실패"+data); 
					console.log("실패실패실패"+data); 
				}else{ 
					tmpMsg = "";
					tbl = "<table>"
// 						alert("안읽은 알람 데이터"+ data);
						console.log(data);
					for( var i=0; i<data.length; i++){
						a_alamnum = data[i].alamnum
						a_title = data[i].title
						a_senderId = data[i].senderId
						a_senderName = data[i].senderName
						a_receiverId = data[i].receiverId
						a_receiverName = data[i].receiverName
						a_brncofcnm = data[i].brncofcnm
						a_shortstocknm = data[i].shortstocknm
						a_dptopt = data[i].dptopt
						a_lelopt = data[i].lelopt
						tbl += "<tr><td>"
						
// 						//1.매장 재고가 안전재고 이하로 내려갔을때, !!매장 직원!! CMNCD_CD = B203  에게 재고부족 알림   //alert("실패실패실패"+data); 
						if(a_title =='stockAlam'){ 
							tmpMsg = a_receiverName + "님 " + a_brncofcnm + "의" + a_shortstocknm + " 재고가 안전재고 이하 입니다."
									+'<button type="button" class="btn btn-success waves-effect waves-light" onclick=alamRead('+a_alamnum+')>읽음</button>'
						//2. 전자결제 상신 받은 상사(지정된 사람)에게 알림 
						}else if(a_title =='proposal') {
							tmpMsg = a_senderName + "님이 " + a_brncofcnm 
									+ "의" +a_dptopt + " " +a_lelopt + " " + a_receiverName + "님에게 새로운 전자결재를 상신 했습니다. "
									+'<button type="button" class="btn btn-success waves-effect waves-light" onclick=alamRead('+a_alamnum+')>읽음</button>'
						//3. 상신한 전자결제 결재 된 경우, 부하(지정된 사람)에게 알림 	
						}else if(a_title =='getApproval') {
							tmpMsg = a_senderName + "님이 " + a_brncofcnm 
									+ "의" +a_dptopt + " " +a_lelopt + " " + a_receiverName + "님에게 새로운 전자결재를 상신 했습니다. "
									+'<button type="button" class="btn btn-success waves-effect waves-light" onclick=alamRead('+a_alamnum+')>읽음</button>'
						//4. 매장에서 일일정산 했을때, 본사 사장 에게 알림
						}else if(a_title =='settlement') {
							tmpMsg = a_brncofcnm + "의" +a_dptopt + " " +a_lelopt + " "+a_senderName 
									+ "님이 "+a_brncofcnm+"지점의 일일정산을 상신했습니다." 
									+'<button type="button" class="btn btn-success waves-effect waves-light" onclick=alamRead('+a_alamnum+')>읽음</button>'
						}
						
						tbl	+= tmpMsg + "</td></tr>";
						console.log(i, tmpMsg)
					}
					tbl += "</table>"
						$('#alamCountTable').html(tbl)
// 					alert("안읽은 알람 테이블"+tbl);
// 					alert($('#dangerBell').html());
					$('#dangerBell').text(data.length)//알람카운트증가 
				}
			}, 
			error : function(err){ 
				alert('err'); 
			} 
	   	}); 

}; 

sock.onclose = function() { 
  	console.log('connect close'); 
  	/* setTimeout(function(){conntectWs();} , 1000); */ 
}; 

 sock.onerror = function (err) {console.log('Errors : ' , err);}; 

 
 
 
} 
</script> 
<style>
.alarmlist{
	min-width: 373px;
}
.bg{
	background-color: white;
	    padding: 0 1.5rem;
    text-align: center;
    width: 250px;
   
}
</style>    
    

<header id="page-topbar">
<div class="navbar-header">
    <div class="d-flex">
        <!-- LOGO -->
        
        <div class="bg">
            <a href="/main/mainlist" class="logo logo-dark">
                <span class="logo-sm">
                    <img src="/resources/images/TCO로고_글자X2.png" alt="" height="22">
<!--                     <img src="/resources/skote/Skote_v3.3.2/HTML/Admin/dist/assets/images/logo.svg" alt="" height="22"> -->
                </span>
                <span class="logo-lg">
                    <img src="/resources/images/TCO로고_가로2.png" alt="" height="20">
<!--                     <img src="/resources/skote/Skote_v3.3.2/HTML/Admin/dist/assets/images/logo-dark.png" alt="" height="17"> -->
                </span>
            </a>

            <a href="/main/mainlist" class="logo logo-light">
                <span class="logo-sm">
                    <img src="/resources/images/TCO로고_글자X2.png" alt="" height="22">
<!--                     <img src="/resources/skote/Skote_v3.3.2/HTML/Admin/dist/assets/images/logo-light.svg" alt="" height="22"> -->
                </span>
                <span class="logo-lg">
                    <img src="/resources/images/TCO로고_가로2.png" alt="" height="28">
<!--                     <img src="/resources/skote/Skote_v3.3.2/HTML/Admin/dist/assets/images/logo-light.png" alt="" height="19"> -->
                </span>
            </a>
        </div>

        <button type="button" class="btn btn-sm px-3 font-size-16 header-item waves-effect" id="vertical-menu-btn">
            <i class="fa fa-fw fa-bars"></i>
        </button>

        <!-- App Search-->
<!--         <form class="app-search d-none d-lg-block"> -->
<!--             <div class="position-relative"> -->
<!--                 <input type="text" class="form-control" placeholder="Search..."> -->
<!--                 <span class="bx bx-search-alt"></span> -->
<!--             </div> -->
<!--         </form> -->

<!--         <div class="dropdown dropdown-mega d-none d-lg-block ms-2"> -->
<!--             <button type="button" class="btn header-item waves-effect" data-bs-toggle="dropdown" aria-haspopup="false" aria-expanded="false"> -->
<!--                 <span key="t-megamenu">Mega Menu</span> -->
<!--                 <i class="mdi mdi-chevron-down"></i>  -->
<!--             </button> -->
<!--             <div class="dropdown-menu dropdown-megamenu"> -->
<!--                 <div class="row"> -->
<!--                     <div class="col-sm-8"> -->

<!--                         <div class="row"> -->
<!--                             <div class="col-md-4"> -->
<!--                                 <h5 class="font-size-14" key="t-ui-components">UI Components</h5> -->
<!--                                 <ul class="list-unstyled megamenu-list"> -->
<!--                                     <li> -->
<!--                                         <a href="javascript:void(0);" key="t-lightbox">Lightbox</a> -->
<!--                                     </li> -->
<!--                                     <li> -->
<!--                                         <a href="javascript:void(0);" key="t-range-slider">Range Slider</a> -->
<!--                                     </li> -->
<!--                                     <li> -->
<!--                                         <a href="javascript:void(0);" key="t-sweet-alert">Sweet Alert</a> -->
<!--                                     </li> -->
<!--                                     <li> -->
<!--                                         <a href="javascript:void(0);" key="t-rating">Rating</a> -->
<!--                                     </li> -->
<!--                                     <li> -->
<!--                                         <a href="javascript:void(0);" key="t-forms">Forms</a> -->
<!--                                     </li> -->
<!--                                     <li> -->
<!--                                         <a href="javascript:void(0);" key="t-tables">Tables</a> -->
<!--                                     </li> -->
<!--                                     <li> -->
<!--                                         <a href="javascript:void(0);" key="t-charts">Charts</a> -->
<!--                                     </li> -->
<!--                                 </ul> -->
<!--                             </div> -->

<!--                             <div class="col-md-4"> -->
<!--                                 <h5 class="font-size-14" key="t-applications">Applications</h5> -->
<!--                                 <ul class="list-unstyled megamenu-list"> -->
<!--                                     <li> -->
<!--                                         <a href="javascript:void(0);" key="t-ecommerce">Ecommerce</a> -->
<!--                                     </li> -->
<!--                                     <li> -->
<!--                                         <a href="javascript:void(0);" key="t-calendar">Calendar</a> -->
<!--                                     </li> -->
<!--                                     <li> -->
<!--                                         <a href="javascript:void(0);" key="t-email">Email</a> -->
<!--                                     </li> -->
<!--                                     <li> -->
<!--                                         <a href="javascript:void(0);" key="t-projects">Projects</a> -->
<!--                                     </li> -->
<!--                                     <li> -->
<!--                                         <a href="javascript:void(0);" key="t-tasks">Tasks</a> -->
<!--                                     </li> -->
<!--                                     <li> -->
<!--                                         <a href="javascript:void(0);" key="t-contacts">Contacts</a> -->
<!--                                     </li> -->
<!--                                 </ul> -->
<!--                             </div> -->

<!--                             <div class="col-md-4"> -->
<!--                                 <h5 class="font-size-14" key="t-extra-pages">Extra Pages</h5> -->
<!--                                 <ul class="list-unstyled megamenu-list"> -->
<!--                                     <li> -->
<!--                                         <a href="javascript:void(0);" key="t-light-sidebar">Light Sidebar</a> -->
<!--                                     </li> -->
<!--                                     <li> -->
<!--                                         <a href="javascript:void(0);" key="t-compact-sidebar">Compact Sidebar</a> -->
<!--                                     </li> -->
<!--                                     <li> -->
<!--                                         <a href="javascript:void(0);" key="t-horizontal">Horizontal layout</a> -->
<!--                                     </li> -->
<!--                                     <li> -->
<!--                                         <a href="javascript:void(0);" key="t-maintenance">Maintenance</a> -->
<!--                                     </li> -->
<!--                                     <li> -->
<!--                                         <a href="javascript:void(0);" key="t-coming-soon">Coming Soon</a> -->
<!--                                     </li> -->
<!--                                     <li> -->
<!--                                         <a href="javascript:void(0);" key="t-timeline">Timeline</a> -->
<!--                                     </li> -->
<!--                                     <li> -->
<!--                                         <a href="javascript:void(0);" key="t-faqs">FAQs</a> -->
<!--                                     </li> -->
            
<!--                                 </ul> -->
<!--                             </div> -->
<!--                         </div> -->
<!--                     </div> -->
<!--                     <div class="col-sm-4"> -->
<!--                         <div class="row"> -->
<!--                             <div class="col-sm-6"> -->
<!--                                 <h5 class="font-size-14" key="t-ui-components">UI Components</h5> -->
<!--                                 <ul class="list-unstyled megamenu-list"> -->
<!--                                     <li> -->
<!--                                         <a href="javascript:void(0);" key="t-lightbox">Lightbox</a> -->
<!--                                     </li> -->
<!--                                     <li> -->
<!--                                         <a href="javascript:void(0);" key="t-range-slider">Range Slider</a> -->
<!--                                     </li> -->
<!--                                     <li> -->
<!--                                         <a href="javascript:void(0);" key="t-sweet-alert">Sweet Alert</a> -->
<!--                                     </li> -->
<!--                                     <li> -->
<!--                                         <a href="javascript:void(0);" key="t-rating">Rating</a> -->
<!--                                     </li> -->
<!--                                     <li> -->
<!--                                         <a href="javascript:void(0);" key="t-forms">Forms</a> -->
<!--                                     </li> -->
<!--                                     <li> -->
<!--                                         <a href="javascript:void(0);" key="t-tables">Tables</a> -->
<!--                                     </li> -->
<!--                                     <li> -->
<!--                                         <a href="javascript:void(0);" key="t-charts">Charts</a> -->
<!--                                     </li> -->
<!--                                 </ul> -->
<!--                             </div> -->

<!--                             <div class="col-sm-5"> -->
<!--                                 <div> -->
<!--                                     <img src="/resources/skote/Skote_v3.3.2/HTML/Admin/dist/assets/images/megamenu-img.png" alt="" class="img-fluid mx-auto d-block"> -->
<!--                                 </div> -->
<!--                             </div> -->
<!--                         </div> -->
<!--                     </div> -->
<!--                 </div> -->

<!--             </div> -->
<!--         </div> -->
    </div>

    <div class="d-flex">

        <div class="dropdown d-inline-block d-lg-none ms-2">
            <button type="button" class="btn header-item noti-icon waves-effect" id="page-header-search-dropdown"
            data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <i class="mdi mdi-magnify"></i>
            </button>
            <div class="dropdown-menu dropdown-menu-lg dropdown-menu-end p-0"
                aria-labelledby="page-header-search-dropdown">

                <form class="p-3">
                    <div class="form-group m-0">
                        <div class="input-group">
                            <input type="text" class="form-control" placeholder="Search ..." aria-label="Recipient's username">
                            <div class="input-group-append">
                                <button class="btn btn-primary" type="submit"><i class="mdi mdi-magnify"></i></button>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>

        
			
			<!--기타기능불러오는 박스 -->
<!--         <div class="dropdown d-none d-lg-inline-block ms-1"> -->
<!--             <button type="button" class="btn header-item noti-icon waves-effect" -->
<!--             data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> -->
<!--                 <i class="bx bx-customize"></i> -->
<!--             </button> -->
<!--             <div class="dropdown-menu dropdown-menu-lg dropdown-menu-end"> -->
<!--                 <div class="px-lg-2"> -->
<!--                     <div class="row g-0"> -->
<!--                         <div class="col"> -->
<!--                             <a class="dropdown-icon-item" href="#"> -->
<!--                                 <img src="/resources/skote/Skote_v3.3.2/HTML/Admin/dist/assets/images/brands/github.png" alt="Github"> -->
<!--                                 <span>GitHub</span> -->
<!--                             </a> -->
<!--                         </div> -->
<!--                         <div class="col"> -->
<!--                             <a class="dropdown-icon-item" href="#"> -->
<!--                                 <img src="/resources/skote/Skote_v3.3.2/HTML/Admin/dist/assets/images/brands/bitbucket.png" alt="bitbucket"> -->
<!--                                 <span>Bitbucket</span> -->
<!--                             </a> -->
<!--                         </div> -->
<!--                         <div class="col"> -->
<!--                             <a class="dropdown-icon-item" href="#"> -->
<!--                                 <img src="/resources/skote/Skote_v3.3.2/HTML/Admin/dist/assets/images/brands/dribbble.png" alt="dribbble"> -->
<!--                                 <span>Dribbble</span> -->
<!--                             </a> -->
<!--                         </div> -->
<!--                     </div> -->

<!--                     <div class="row g-0"> -->
<!--                         <div class="col"> -->
<!--                             <a class="dropdown-icon-item" href="#"> -->
<!--                                 <img src="/resources/skote/Skote_v3.3.2/HTML/Admin/dist/assets/images/brands/dropbox.png" alt="dropbox"> -->
<!--                                 <span>Dropbox</span> -->
<!--                             </a> -->
<!--                         </div> -->
<!--                         <div class="col"> -->
<!--                             <a class="dropdown-icon-item" href="#"> -->
<!--                                 <img src="/resources/skote/Skote_v3.3.2/HTML/Admin/dist/assets/images/brands/mail_chimp.png" alt="mail_chimp"> -->
<!--                                 <span>Mail Chimp</span> -->
<!--                             </a> -->
<!--                         </div> -->
<!--                         <div class="col"> -->
<!--                             <a class="dropdown-icon-item" href="#"> -->
<!--                                 <img src="/resources/skote/Skote_v3.3.2/HTML/Admin/dist/assets/images/brands/slack.png" alt="slack"> -->
<!--                                 <span>Slack</span> -->
<!--                             </a> -->
<!--                         </div> -->
<!--                     </div> -->
<!--                 </div> -->
<!--             </div> -->
<!--         </div> -->

        <div class="dropdown d-none d-lg-inline-block ms-1">
            <button type="button" class="btn header-item noti-icon waves-effect" data-bs-toggle="fullscreen">
                <i class="bx bx-fullscreen"></i>
            </button>
        </div>

        <div class="dropdown d-inline-block">
            <button type="button" class="btn header-item noti-icon waves-effect" id="page-header-notifications-dropdown"
            data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <i class="bx bx-bell bx-tada"></i>
                <span class="badge bg-danger rounded-pill" id="dangerBell">0</span>
            </button>
            <div class="dropdown-menu dropdown-menu-lg dropdown-menu-end p-0 alarmlist"
                aria-labelledby="page-header-notifications-dropdown">
                <div class="p-3">
                    <div class="row align-items-center">
                        <div class="col">
                            <h6 class="m-0" key="t-notifications"> 알림메시지 </h6>
                        </div>
<!--                         <div class="col-auto"> -->
<!--                             <a href="#!" class="small" key="t-view-all">모두보기</a> -->
<!--                         </div> -->
                    </div>
                </div>
                <div data-simplebar style="max-height: 230px;">
                    <a href="javascript: void(0);" class="text-reset notification-item">
                        <div class="d-flex">
            				<div id= "alamCountTable"></div>
                        </div>
                    </a>
                </div>
                <div class="p-2 border-top d-grid">
                    <a class="btn btn-sm btn-link font-size-14 text-center" href="javascript:void(0)">
                        <i class="mdi mdi-arrow-right-circle me-1"></i> <span key="t-view-more">더 보기..</span> 
                    </a>
                </div>
            </div>
        </div>

        <div class="dropdown d-inline-block">
            <button type="button" class="btn header-item waves-effect" id="page-header-user-dropdown"
            data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <img class="rounded-circle header-profile-user" src="${img}"
                    alt="${userID}">
                <span class="d-none d-xl-inline-block ms-1" key="t-henry">${userNM}</span>
                <i class="mdi mdi-chevron-down d-none d-xl-inline-block"></i>
            </button>
            <div class="dropdown-menu dropdown-menu-end">
                <!-- item-->
                    <a class="dropdown-item" href="/emp/mypage"><i class="bx bx-user font-size-16 align-middle me-1"></i> <span key="t-profile">Profile</span></a>
<!--                     <a class="dropdown-item" href="#"><i class="bx bx-wallet font-size-16 align-middle me-1"></i> <span key="t-my-wallet">My Wallet</span></a> -->
<!--                     <a class="dropdown-item d-block" href="#"><span class="badge bg-success float-end">11</span><i class="bx bx-wrench font-size-16 align-middle me-1"></i> <span key="t-settings">Settings</span></a> -->
<!--                     <a class="dropdown-item" href="#"><i class="bx bx-lock-open font-size-16 align-middle me-1"></i> <span key="t-lock-screen">Lock screen</span></a> -->
                    <div class="dropdown-divider"></div>
                    <a class="dropdown-item text-danger" href="/emp/logout"><i class="bx bx-power-off font-size-16 align-middle me-1 text-danger"></i> <span key="t-logout">Logout</span></a>
                	<sec:csrfInput/>
                </div>
            </div>

            <div class="dropdown d-inline-block">
                <button type="button" class="btn header-item noti-icon right-bar-toggle waves-effect">
                    <i class="bx bx-cog bx-spin"></i>
                </button>
            </div>

        </div>
    </div>
    
     <div id="msgStack"></div>
    
</header>
       
       