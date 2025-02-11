<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Login - 함께가는교회</title>
        
        <link rel="shortcut icon" href="#">
		<link rel="icon" href="data:;base64,iVBORw0KGgo=">
		<link rel="shortcut icon" href="data:image/x-icon;," type="image/x-icon">
        
        <link href="/css/styles.css" rel="stylesheet" />
        <script src="/js/all.js" crossorigin="anonymous"></script>
    	<script src="/js/jquery-3.7.1.min.js"></script>
    	<script src="/js/chrch.js"></script>
    	<script>
    	$(document).ready(function () {
			$("#btnLogin").click(function(){

				var userEmail=$("#userEmail").val();
				var passwd=$("#userPw").val(); 
				
				if(userEmail == "" || userEmail == undefined){
					alert("이메일을 입력하세요");
					$("#userEmail").focus(); //입력포커스 이동
					
					return; //함수 종료
				}
				
				if(passwd=="" || passwd == undefined){
					alert("비밀번호를 입력하세요"); 
					$("#userPw").focus();
					return;
				}
				//폼 내부의 데이터를 전송할 주소
				document.form1.action= "/loginProc";
				document.form1.submit(); //제출
			});
    	});
    	</script>
    </head>
    <body class="bg-primary">
        <div id="layoutAuthentication">
            <div id="layoutAuthentication_content">
                <main>
                    <div class="container">
                        <div class="row justify-content-center">
                            <div class="col-lg-5">
                            	<form name="form1" method="post">
                                <div class="card shadow-lg border-0 rounded-lg mt-5">
                                    <div class="card-header"><h3 class="text-center font-weight-light my-4">함께가는교회 Login</h3></div>
                                    <div class="card-body">
                                        <form>
                                            <div class="form-floating mb-3">
                                                <input class="form-control" id="userEmail" name="userEmail" type="email" placeholder="name@example.com" />
                                                <label for="userEmail">이메일</label>
                                            </div>
                                            <div class="form-floating mb-3">
                                                <input class="form-control" id="userPw" name="userPw" type="password" placeholder="Password" />
                                                <label for="userPw">비밀번호</label>
                                            </div>
<!--                                             <div class="form-check mb-3"> -->
<!--                                                 <input class="form-check-input" id="inputRememberPassword" type="checkbox" value="" /> -->
<!--                                                 <label class="form-check-label" for="inputRememberPassword">비밀버호 기억</label> -->
<!--                                             </div> -->
                                            <div class="d-flex align-items-center justify-content-between mt-4 mb-0">
                                                <sapn class="small" >비밀번호를 기억해주세요!</sapn>
                                                <button type="button" class="btn btn-primary" id="btnLogin" >로그인</button>
<!--                                                 <a class="btn btn-primary" id="btnLogin" href="javascript:alert()">Login</a> -->
                                            </div>
                                        </form>
                                    </div>

                                </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </main>
            </div>

        <script src="/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="/js/scripts.js"></script>
    </body>
</html>
