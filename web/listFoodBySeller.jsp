<%-- 
    Document   : listFoodBySeller
    Created on : Aug 4, 2022, 11:04:26 PM
    Author     : dung
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/listFoodBySellerStyle.css">
    </head>
    <body>
        <div class="container mt-5 mb-5">
            <div class="d-flex justify-content-center row">
                <div class="col-md-10">
                    <c:forEach items="${listFood}" var="food" >
                    <div class="row p-2 bg-white border rounded mt-2">
                        <div class="col-md-3 mt-1"><img class="img-fluid img-responsive rounded product-image" src="https://i.imgur.com/QpjAiHq.jpg"></div>
                        <div class="col-md-6 mt-1">
                            <h5>${food.foodName}</h5>                          
                            <p class="text-justify text-truncate para mb-0">${food.descriptions}<br><br></p>
                        </div>
                        <div class="align-items-center align-content-center col-md-3 border-left mt-1">
                            <div class="d-flex flex-row align-items-center">
                                <h4 class="mr-1">${food.cost} VND</h4>
                            </div>
                            <div class="d-flex flex-column mt-4"><button class="btn btn-primary btn-sm" type="button">Save Information</button><button class="btn btn-outline-primary btn-sm mt-2" type="button">Delete Food</button></div>
                        </div>
                    </div>
                    </c:forEach>           
                </div>
            </div>
        </div>
    </body>
</html>
