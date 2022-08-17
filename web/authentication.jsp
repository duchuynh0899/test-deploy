<%-- 
    Document   : checkregister
    Created on : Jun 5, 2022, 1:05:53 AM
    Author     : longn
--%>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue@2.6.12/dist/vue.js"></script>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/verifyOPTStyle.css">
    </head>
    <body style="background-color: rgb(238, 77, 45)">
        <div id="app"> 
            <div class="container height-100 d-flex justify-content-center align-items-center"> 
                <div class="position-relative"> 
                    <div class="card p-2 text-center"> 
                        <form name="" action="AuthenticateServlet" method="post" onsubmit="return checkSend()>
                            <h6 style="color: #21214e">Please enter the OTP<br> </h6> 
                            <div> <span> sent to your email</span>  </div> 
                            <div id="otp" class="inputs d-flex flex-row justify-content-center mt-2"> 
                                <input class="m-2 text-center form-control rounded" style="width: 100px" type="number" id="inputCode" name="inputCode" required=""/> 
                            </div> 
                            <div class="mt-4"> 
                                <input class="btn btn-danger px-4 validate" style="background-color: rgb(238, 77, 45)" type="submit" value="Confirm">
                            </div> 
                            <div id="divCheckCode"></div>
                            <div class="mt-3 content d-flex justify-content-center align-items-center"> 
                            </div>
                        </form>
                        <div>${errorAuthentication}</div>
                    </div> 
                </div>
            </div> 
        </div>
    </body>

    <script src="validator/Validator.js"></script>

</html>
