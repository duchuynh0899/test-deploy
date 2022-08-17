<%-- 
    Document   : forgotPass_InputEmail
    Created on : Jun 24, 2022, 10:33:18 PM
    Author     : longn
--%>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.bundle.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/enterEmailStyle.css">
    </head>
    <body style="background-color: rgb(238, 77, 45)">
        <div class="container padding-bottom-3x mb-2 mt-5">
            <div class="row justify-content-center">
                <div class="col-lg-8 col-md-10">
                    <div class="forgot">
                        <h2>Forgot your password?</h2>
                        <p>Change your password in three easy steps. This will help you to secure your password!</p>
                        <ol class="list-unstyled">
                            <li><span class="text-primary text-medium">1. </span>Enter your email address below.</li>
                            <li><span class="text-primary text-medium">2. </span>Our system will send you a OTP code in your email</li>
                            <li><span class="text-primary text-medium">3. </span>Use the code to reset your password</li>
                        </ol>
                    </div>	
                    <form class="card mt-4" name="inputEmailForm" action="ForgotPass_InputEmailServlet" method="post" onsubmit="return checkSend()">
                        <div class="card-body">
                            <div class="form-group">
                                <label for="email-for-pass">Enter your email address</label>
                                <input class="form-control" type="text" name="username" id="email-for-pass">
                                <small class="form-text text-muted">
                                    Enter the email address you used during the registration on BBBootstrap.com. Then we'll email a link to this address.
                                </small>
                                <h2 style="color: red"> ${errorInputEmail}</h2>
                            </div>
                        </div>
                        <div class="card-footer">
                            <input class="btn btn-success" type="submit" value="Send Code" onclick="checkValidatorForgotPassword_InputEmail()"/>
                            <button class="btn btn-danger" type="submit" onclick="window.location.href = 'login.jsp'">Back to Login</a></button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
</body>
<script src="validator/Validator.js"></script>
</html>
