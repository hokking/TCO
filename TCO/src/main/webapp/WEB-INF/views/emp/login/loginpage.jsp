<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <title>T-CO 모든 물류가 우리를 거쳐갈 때까지 </title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta content="Premium Multipurpose Admin & Dashboard Template" name="description" />
        <meta content="Themesbrand" name="author" />
        <!-- App favicon -->
        <link rel="shortcut icon" href="/resources/skote/Skote_v3.3.2/HTML/Admin/dist/assets/images/favicon.ico">

        <!-- owl.carousel css -->
        <link rel="stylesheet" href="/resources/skote/Skote_v3.3.2/HTML/Admin/dist/assets/libs/owl.carousel/assets/owl.carousel.min.css">

        <link rel="stylesheet" href="/resources/skote/Skote_v3.3.2/HTML/Admin/dist/assets/libs/owl.carousel/assets/owl.theme.default.min.css">

        <!-- Bootstrap Css -->
        <link href="/resources/skote/Skote_v3.3.2/HTML/Admin/dist/assets/css/bootstrap.min.css" id="bootstrap-style" rel="stylesheet" type="text/css" />
        <!-- Icons Css -->
        <link href="/resources/skote/Skote_v3.3.2/HTML/Admin/dist/assets/css/icons.min.css" rel="stylesheet" type="text/css" />
        <!-- App Css-->
        <link href="/resources/skote/Skote_v3.3.2/HTML/Admin/dist/assets/css/app.min.css" id="app-style" rel="stylesheet" type="text/css" />
		<style type="text/css">
		   .jb-box { width: 100%; height: 100%; overflow: hidden;margin: 0px auto; position: relative; }
		</style>

		
		<script type="text/javascript"> 
		function fn_findId() { 
			//창 크기 지정
			var width = 500; var height = 850;
			//pc화면기준 가운데 정렬 
			var left = (window.screen.width / 2) - (width/2); var top = (window.screen.height / 4); 
			//윈도우 속성 지정
			var windowStatus = 'width='+width+', height='+height+', left='+left+', top='+top+', scrollbars=yes, status=yes, resizable=yes, titlebar=yes'; 
			//연결하고싶은url
			const url = "/emp/findId"; 
			//등록된 url 및 window 속성 기준으로 팝업창을 연다.
			window.resizeTo(500,810);
			window.open(url, "hello popup", windowStatus); }
		
		
		function fn_findPass() { 
			//창 크기 지정
			var width = 500; var height = 900;
			//pc화면기준 가운데 정렬 
			var left = (window.screen.width / 2) - (width/2); var top = (window.screen.height / 4); 
			//윈도우 속성 지정
			var windowStatus = 'width='+width+', height='+height+', left='+left+', top='+top+', scrollbars=yes, status=yes, resizable=yes, titlebar=yes'; 
			//연결하고싶은url
			const url = "/emp/findPass"; 
			//등록된 url 및 window 속성 기준으로 팝업창을 연다.
			window.resizeTo(500,810);
			window.open(url, "hello popup", windowStatus); }
		
		
		$(function(){
			var errorMsg = "${errorMsg}";
				if(errorMsg != ""){
				alert(errorMsg); 
				}
		});
		 
		function frmCheck() {
			if ($("#code").val() == "") {
				alert("코드를 입력해주세요.");
				$("#code").focus();
				return false;
			}
		}
		
		
		
		</script>
		
		
		
    </head>

    <body class="auth-body-bg">
        
        <div>
            <div class="container-fluid p-0">
                <div class="row g-0">
                    
                    <div class="col-xl-9" id="leftDisplay">
                    <!-- 동영상 jb-box -->
                    	<div class="jb-box">
                    		<video muted autoplay loop>
                    			<source src="/resources/videos/Blue.mp4" type="video/mp4">
                    		</video>
                    </div>
                  </div>  
                    <!-- end col -->

                    <div class="col-xl-3">
                        <div class="auth-full-page-content p-md-5 p-4">
                            <div class="w-100">

                                <div class="d-flex flex-column h-100">
                                    <div class="mb-4 mb-md-5">
                                        <a href="/emp/loginpage" class="d-block auth-logo">
                                            <h1>T-CO</h1>
                                            <h3>Trader-Coperation Service</h3>
                                            <img src="/resources/images/TCO로고_가로1.png" alt="" height="18" class="auth-logo-light">
                                        </a>
                                    </div>
                                    <div class="my-auto">
                                        
                                        <div>
                                            <h5 class="text-primary">T-CO</h5>
                                        </div>
            
                                        <div class="mt-4">
                                            <form class="user" method="POST" action="/emp/login"> 
                
                
                                                <div class="mb-3">
                                                 	<div class="float-end">
                                                        <button class="btn btn-link btn-rounded waves-effect" type="button" onclick="fn_findId()">사번을 잊으셨나요?</button>
<!--                                                         <a href="/emp/findId">사번을 잊으셨나요?</a> -->
                                                    </div>
                                                    <label for="username" class="form-label">사번</label>
                                                    <input type="text" class="form-control" id="username" name="username" placeholder="">
                                                </div>
                        
                                                <div class="mb-3">
                                                    <div class="float-end">
                                                        <button class="btn btn-link btn-rounded waves-effect" type="button" onclick="fn_findPass()">비밀번호를 잊으셨나요?</button>
                                                    </div>
                                                    <label class="form-label">비밀번호</label>
                                                    <div class="input-group auth-pass-inputgroup">
                                                        <input type="password" id="password" name="password" class="form-control" placeholder="" aria-label="Password" aria-describedby="password-addon">
                                                    </div>
                                                </div>
                        			
                                                <div class="form-check">
                                                    <input class="form-check-input" type="checkbox" id="remember-check">
                                                    <label class="form-check-label" for="remember-check">아이디 기억하기
                                                    </label>
                                                </div>
                                                
                                                <div class="mt-3 d-grid">
                                                    <button class="btn btn-primary waves-effect waves-light" type="submit">로그인</button>
                                                </div>
                                                <!-- 꼭!!!!!!!!!!!!!! 적어주기!!!!!!!!!! -->
                    							<sec:csrfInput/>
                                            </form>
                                        </div>
                                    </div>

                                    <div class="mt-4 mt-md-5 text-center">
                                        <p class="mb-0">© <script>document.write(new Date().getFullYear())</script>Logo by JHY Crafted with <i class="mdi mdi-heart text-danger"></i> by T-COWORKER</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- end col -->
                </div>
                <!-- end row -->
            </div>
            <!-- end container-fluid -->
        </div>

        <!-- JAVASCRIPT -->
        <script src="/resources/skote/Skote_v3.3.2/HTML/Admin/dist/assets/libs/jquery/jquery.min.js"></script>
        <script src="/resources/skote/Skote_v3.3.2/HTML/Admin/dist/assets/libs/bootstrap/js/bootstrap.bundle.min.js"></script>
        <script src="/resources/skote/Skote_v3.3.2/HTML/Admin/dist/assets/libs/metismenu/metisMenu.min.js"></script>
        <script src="/resources/skote/Skote_v3.3.2/HTML/Admin/dist/assets/libs/simplebar/simplebar.min.js"></script>
        <script src="/resources/skote/Skote_v3.3.2/HTML/Admin/dist/assets/libs/node-waves/waves.min.js"></script>

        <!-- owl.carousel js -->
        <script src="/resources/skote/Skote_v3.3.2/HTML/Admin/dist/assets/libs/owl.carousel/owl.carousel.min.js"></script>

        <!-- auth-2-carousel init -->
        <script src="/resources/skote/Skote_v3.3.2/HTML/Admin/dist/assets/js/pages/auth-2-carousel.init.js"></script>
        
        <!-- App js -->
        <script src="/resources/skote/Skote_v3.3.2/HTML/Admin/dist/assets/js/app.js"></script>

    </body>
</html>




