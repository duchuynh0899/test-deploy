<%-- 
    Document   : register
    Created on : Jun 3, 2022, 9:05:18 PM
    Author     : longn
--%>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/registerStyle.css">
    </head>
    <body>
        <div class="container mt-5 mb-5 g-0">
            <div class="d-flex flex row">
                <div class="col-md-6 mx-auto">
                    <div class="card card1 p-3">
                        <div class="d-flex flex-column">  
                            <span class="resgiter mt-3">Đăng ký</span> 
                        </div>
                        <div class="input-field d-flex flex-column mt-4"> 
                            <form name="registerForm" action="RegisterServlet" method="post" onsubmit="return checkSend()">
                                Nhâp email<input class="form-control" placeholder="Email" type="text" name="username"/><br/>
                                <div id="divCheckEmail"></div>
                                Nhập mật khẩu<input class="form-control" placeholder="Password" type="password" name="pass"/><br/>     
                                <div id="divCheckPass"></div>
                                Nhập lại mật khẩu<input class="form-control" placeholder="Re-password" type="password" name="repass"/><br/>     
                                <div id="divCheckRePass"></div>
                                Vai trò:
                                <input class="role" name="role" type="radio" value="2" checked/>Học sinh
                                <input class="role" name="role" type="radio" value="3" />Người bán hàng
                                <input class="mt-4 btn btn-dark " type="submit" value="Đăng ký ngay" onclick="checkValidatorForRegister()"/>
                                <div class="text1 mt-4"> 
                                    <span>Bạn đã có tài khoản?
                                        <a class="register" style="text-decoration: none; color: rgb(238, 77, 45)" href="login.jsp">  Đăng nhập</a>
                                    </span> 
                                </div>
                            </form>
                            <div class="mt-4 ml-3">
                                <h3 style="color: red; text-align: center"> ${errorRegister}</h3>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
    <script src="validator/Validator.js"></script>
</html>