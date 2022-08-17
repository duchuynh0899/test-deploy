<%-- 
    Document   : forgotPass_InputNewPass
    Created on : Jun 24, 2022, 11:07:43 PM
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
        <link rel="stylesheet" href="css/loginStyle.css">
    </head>
    <body>
        <div class="container mt-5 mb-5">
            <div class="d-flex justify-content-center row">
                <div class="col-sm-5">
                    <div class="card card1 p-3">
                        <div class="d-flex flex-column">  
                            <span class="login mt-3">New Password</span> 
                        </div>
                        <form name="inputNewPassForm" action="ForgotPass_InputNewPassServlet" method="post" onsubmit="return checkSend()">
                            <div class="input-field d-flex flex-column mt-3"> 
                                <span class="mt-3">New Password</span> 
                                <input class="form-control" type="password" id="pass" name="pass" placeholder="Enter Your New Password"/>
                                <div id="divCheckPass"></div>
                                <span class="mt-3">Re-Password</span> 
                                <input class="form-control" type="password" id="repass" name="repass" placeholder="Enter Your Re-Password"/>
                                <div id="divCheckRePass"></div>
                                <input class="mt-4 btn btn-dark d-flex justify-content-center align-items-center" type="submit" value="Confirm" onclick="checkValidatorForInputNewPass()"/>
                            </div>
                        </form>
                        <h2 style="color: red"> ${errorInputNewPass}</h2>
                    </div>
                </div>
            </div>
        </div>
    </body>
    <script src="validator/Validator.js"></script>
</html>
