<%-- 
    Document   : Login
    Created on : May 25, 2020, 10:48:23 PM
    Author     : HOANG LONG
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/loginStyle.css">
    </head>
    <body style="background-image: url(images/logo.jpg); background-size: 100% 100%">
        <div class="container mt-5 mb-5">
            <div class="d-flex flex row g-0">
                <div class="col-md-7"></div>
                <div class="col-md-5 mt-5">
                    <div class="card card1 p-3">
                        <div class="d-flex flex-column">  
                            <span class="login mt-3">Đăng nhập</span> 
                        </div>
                        <div class="input-field d-flex flex-column mt-3"> 
                            <form name="loginForm" action="LoginServlet" method="post" onsubmit="return checkSend()">
                                Nhập email<input class="form-control" placeholder="Nhập email của bạn" type="text" name="username"/><br/>
                                <div id="divCheckEmail"></div>
                                Nhập mật khẩu<input class="form-control" placeholder="Nhập mật khẩu của bạn" type="password" name="pass"/><br/>            
                                <input class="mt-4 btn btn-dark d-flex justify-content-center align-items-center" type="submit" value="Đăng nhập" onclick="checkValidatorForLogin()"/>
                            </form>
                            <div class="text1 mt-4"> <a style="text-decoration: none; color: rgb(238, 77, 45); margin-left: 10px" href="forgotPass_InputEmail.jsp">Quên mật khẩu</a> </div>
                            <div class="text2 mt-4"> <span>Bạn chưa có tài khoản?<a class="register" style="text-decoration: none; color: rgb(238, 77, 45)" href="register.jsp">  Đăng ký</a></span> </div>
                            <h4 class="mt-3" style="text-align: center; color: #842029"> ${errorLogin}</h4>
                            <h4 class="mt-3" style="text-align: center; color: #842029"> ${InputNewPassMess}</h4>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
    <script src="validator/Validator.js"></script>
</html>