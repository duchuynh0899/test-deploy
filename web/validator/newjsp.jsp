<%-- 
    Document   : newjsp
    Created on : Aug 14, 2022, 4:43:51 PM
    Author     : dung
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            * {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

.dialog {
    position: fixed;
    top: 0;
    right: 0;
    bottom: 0;
    left: 0;
    z-index: 10;
    display: flex;
    align-items: center;
    justify-content: center;
    visibility: hidden;
    opacity: 0;
    transition: opacity linear 0.2s;
}

.overlay-close {
    position: absolute;
    width: 100%;
    height: 100%;
    cursor: default;
}

.dialog:target {
    visibility: visible;
    opacity: 1;
}


.overlay {
    background-color: rgba(0, 0, 0, 0.3);
}

.dialog-body {
    max-width: 400px;
    position: relative;
    padding: 16px;
    background-color: #fff;
}

.dialog-close-btn {
    position: absolute;
    top: 2px;
    right: 6px;
    text-decoration: none;
    color: #333;
}
        </style>
    </head>
    <body>
        <a class="dialog-btn" href="#my-dialog">Click me!</a>
        
        <div class="dialog overlay" id="my-dialog">
            <a href="#" class="overlay-close"></a>

            <div class="dialog-body">
                <a class="dialog-close-btn" href="#">&times;</a>
                <%@include file="/reportRestaurant.jsp" %>
            </div>
        </div>

    </body>
</html>
