<%-- 
    Document   : addRestaurantFixed
    Created on : Aug 9, 2022, 9:33:14 PM
    Author     : dung
--%>

<%@page import="model.Food"%>
<%@page import="java.util.ArrayList"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!--<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">-->
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/viewListStyle.css">
        <link rel="stylesheet" href="css/addHostelStyle.css">
        <link rel="stylesheet" href="css/pagingStyle.css">
        <style>
            .error {
                color: red;
            }
        </style>
    </head>
    <body class="bg-white">
        <c:choose>
            <c:when test="${stt.equals('1')}">
                <div class="position-fixed bottom-0 end-0 p-3" style="right: 10px; bottom: 10px; z-index: 11">
                    <div class="toast" data-autohide="true">
                        <div class="toast-header bg-success">
                            <strong class="mr-auto text-white"><h4>Thêm Món Ăn Thành Công</h4></strong>
                            <button type="button" class="ml-2 mb-1 close" data-dismiss="toast">&times;</button>
                        </div>
                        <div class="toast-body">
                            Thêm món ăn thành công !
                        </div>
                    </div>
                </div>
            </c:when>
            <c:when test="${stt.equals('2')}">
                <div class="position-fixed bottom-0 end-0 p-3" style="right: 10px; bottom: 10px; z-index: 11">
                    <div class="toast" data-autohide="true">
                        <div class="toast-header bg-success">
                            <strong class="mr-auto text-white"><h4>Chỉnh Sửa Món Ăn Thành Công</h4></strong>
                            <button type="button" class="ml-2 mb-1 close" data-dismiss="toast">&times;</button>
                        </div>
                        <div class="toast-body">
                            Chỉnh sửa món ăn thành công !
                        </div>
                    </div>
                </div>
            </c:when>
            <c:when test="${stt.equals('3')}">
                <div class="position-fixed bottom-0 end-0 p-3" style="right: 10px; bottom: 10px; z-index: 11">
                    <div class="toast" data-autohide="true">
                        <div class="toast-header bg-success">
                            <strong class="mr-auto text-white"><h4>Xóa Món Ăn Thành Công</h4></strong>
                            <button type="button" class="ml-2 mb-1 close" data-dismiss="toast">&times;</button>
                        </div>
                        <div class="toast-body">
                            Xóa món ăn thành công !
                        </div>
                    </div>
                </div>
            </c:when>
        </c:choose>
        <div>
            <%@include file="/header.jsp" %> 
            <div class="d-flex nav-item main-home">
                <ul id="navbar-items">
                    <%@include file="/sidebar.jsp" %>
                </ul>
                <div class="container rounded bg-white mt-5 mb-5">
                    <div class="col-xl-12 mb-5">
                        <div>
                            <ul class="breadcrumb bg-white">
                                <li><a href="home.jsp">Trang chủ</a></li>
                                <li><a href="ListRestaurantBySeller">Nhà hàng của tôi</a></li>
                                <li><a>Menu của tôi</a></li>
                            </ul>
                        </div>
                        <div class="card">
                            <form class="form" method="POST" action="AddFoodController" name="addFoodForm" onsubmit="return validateFood()"  enctype="multipart/form-data">
                                <div class="left-side">
                                    <h3>Menu nhà hàng</h3>    
                                    <%
                                        ArrayList<Food> f=(ArrayList<Food>)request.getAttribute("listFood");
                                        if(f.size()==0){%>
                                            <p style="font-size: 20px">Hiện tại bạn chưa có món ăn nào</p>
                                      <%  }%>
                                    <c:forEach items="${listFood}" var="food" >
                                        <div class="row p-2 bg-white border rounded" style="margin-top: 40px; margin-bottom: 40px;">
                                            <div class="col-md-3 mt-1">

                                                <img class="img-fluid img-responsive rounded product-image" 
                                                     <c:if test="${food.imageURL != null && food.imageURL !=''}">
                                                         src="${food.imageURL}" </c:if>
                                                     <c:if test="${food.imageURL == null}">
                                                         src="images/food.png" </c:if> 
                                                     <c:if test="${food.imageURL == ''}">
                                                         src="images/food.png" </c:if>     
                                                         style="width: 150px; height: 150px">
                                                </div>



                                                <div class="col-md-6 mt-1">
                                                    <label class="labels">${food.foodName}</label>

                                                <p class="text-justify text-truncate para mb-0">${food.descriptions}<br><br></p>
                                            </div>
                                            <div class="align-items-center align-content-center col-md-3 border-left mt-1">
                                                <div class="d-flex flex-row align-items-center">

                                                    <h4 class="mr-1"><fmt:formatNumber type = "number" maxFractionDigits = "3" value = "${food.cost}" ></fmt:formatNumber> VND</h4>

                                                </div>
                                                <a class="btn btn-primary" href="EditFoodController?foodId=${food.foodID}" style="width: 110px">Chỉnh sửa</a> 
                                                <a class="btn btn-danger" id="btnDelete" href="#" data-href="DeleteFoodController?fid=${food.foodID}" data-toggle="modal" data-target="#confirm-delete">Xoá món ăn</a>

                                                <div class="modal fade" id="confirm-delete" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                                    <div class="modal-dialog">
                                                        <div class="modal-content">
                                                            <div class="modal-header">
                                                                Xoá món ăn
                                                            </div>
                                                            <div class="modal-body">
                                                                Bạn có chắc chắn muốn xoá món ăn này không?
                                                            </div>
                                                            <div class="modal-footer">
                                                                <button type="button" class="btn btn-default" data-dismiss="modal">Huỷ</button>
                                                                <a class="btn btn-danger btn-ok">Xoá</a>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </c:forEach>

                                </div>

                                <div class="right-side">

                                    <div class="input_text" hidden>
                                        <input type="text" name="id" value="${restaurant.restaurantID}" hidden>
                                    </div>

                                    <form action="AddFoodController" name="addFoodForm" onsubmit="return validateFood()" method="post" enctype="multipart/form-data">
                                        <h3>Thêm món ăn</h3>
                                        <div class="mt-5">




                                            <input type="file" accept="image/*" onchange="loadFile(event)" name ="foodImage" id="file1">
                                            <label for="file1" style="position: absolute; margin-left: 70px; margin-top: 60px; opacity: 30%">+</label>
                                            <img id="output1" width="170px" height="170px"/>



                                            <script>
                                                var loadFile = function (event) {
                                                    var output = document.getElementById('output1');
                                                    output.src = URL.createObjectURL(event.target.files[0]);
                                                    output.onload = function () {
                                                        URL.revokeObjectURL(output1.src) // free memory
                                                    }
                                                };</script>
                                            <div class="input_text"> <input type="text" name="foodName" placeholder="Nhập tên món ăn"> <span>Tên món ăn</span> </div>
                                            <div class="error" id="errorName"></div>
                                            <div class="input_text"> <input type="text" name="costFood" placeholder="Nhập giá dao động"> <span>Giá món ăn</span>
                                                <div class="error" id="errorCost"></div></div>
                                            <div class="input_text"> <span>Mô tả</span> </div>
                                            <textarea placeholder="Nhập mô tả" rows="5" style="width: 100%; margin-top: 10px"  class="input_text" name="desFood" style="width:250px;height:150px;"></textarea>
                                            <div class="pay"> 
                                                <button type="submit" >Thêm món ăn</button>                  
                                            </div>
                                        </div> 
                                    </form>
                                </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script
            src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
            crossorigin="anonymous">
        </script>

        <script>
            function validateFood() {
                let isValid = true;
                const foodName = document.addFoodForm.foodName.value;
                const costFood = document.addFoodForm.costFood.value;
                const regex = /[+-]?([0-9]*[.])?[0-9]+/;
                const regex2 = /^[0-9]*$/;
                document.getElementById('errorName').innerText = ' ';
                document.getElementById('errorCost').innerText = ' ';
                if (!foodName) {
                    document.getElementById('errorName').innerText = 'Bạn phải nhập tên món ăn!';
                    isValid = false;
                }
                if (!costFood) {
                    document.getElementById('errorCost').innerText = 'Bạn phải nhập giá của món ăn!';
                    isValid = false;
                } else if (!regex.test(distance)) {
                    document.getElementById('errorCost').innerText = 'Giá trị nhập không đúng. Giá tiền phải là số!';
                    isValid = false;
                } else if (distance <= 0) {
                    document.getElementById('errorCost').innerText = 'Giá tiền phải > 0 ';
                    isValid = false;
                }

                return isValid;
            }
        </script>
        <script>
            $(document).on('click', '#btnDelete', function () {
                var link = $(this).attr('data-href');
                $('.btn-ok').attr('href', link);
            });
        </script>
        <script>
            $(document).ready(function () {
                $(".toast").toast({delay: 4000});
                $(".toast").toast("show");
            });
        </script>

    </body>
    <%@include file="/footer.jsp" %>    
</html>
