<%-- 
Document   : edithostel
Created on : Jul 17, 2022, 4:23:34 PM
Author     : nguye
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha1/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css">
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/viewListStyle.css">
        <link rel="stylesheet" href="css/addHostelStyle.css">
        <link rel="stylesheet" href="css/pagingStyle.css">
        <link rel="stylesheet" href="css/commentStyle.css" />

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
            .labels{
                font-weight: 800;
            }
            .error {
                color: red;
            }
            .message {
                color: green;
            }
            .stars-outer {
                position: relative;
                display: inline-block;
                font-size: 15px;
            }
            .stars-inner {
                position: absolute;
                top: 0;
                left: 0;
                white-space: nowrap;
                overflow: hidden;
                width: 0;
                font-size: 15px;
            }
            .stars-outer::before {
                content: "\f005 \f005 \f005 \f005 \f005";
                font-family: "Font Awesome 5 Free";
                font-weight: 900;
                color: #ccc;
            }
            .stars-inner::before {
                content: "\f005 \f005 \f005 \f005 \f005";
                font-family: "Font Awesome 5 Free";
                font-weight: 900;
                color: #f8ce0b;
            }
        </style>
    </head>
    <body class="bg-white">
        <c:choose>
            <c:when test="${stt.equals('1')}">
                <div class="position-fixed bottom-0 end-0 p-3" style="right: 10px; bottom: 10px; z-index: 11">
                    <div class="toast" data-autohide="true">
                        <div class="toast-header bg-success">
                            <strong class="mr-auto text-white"><h4>Báo Cáo Nhà Hàng Thành Công</h4></strong>
                            <button type="button" class="ml-2 mb-1 close" data-dismiss="toast">&times;</button>
                        </div>
                        <div class="toast-body">
                            Báo cáo nhà hàng thành công !
                        </div>
                    </div>
                </div>
            </c:when>
        </c:choose>
        <div class="px-0">
            <%@include file="/header.jsp" %> 
            <div class="d-flex nav-item main-home col-md-12">
                <ul id="navbar-items" class="col-md-2">
                    <%@include file="/sidebar.jsp" %>
                </ul>
                <div class="container rounded bg-white mt-5 mb-5 col-md-10">
                    <div class="col-xl-12 mb-5">
                        <div>
                            <ul class="breadcrumb bg-white">
                                <li><a href="home.jsp">Trang chủ</a></li>
                                    <%if (request.getAttribute("isListbySeller") == "true") {%>
                                <li><a href="ListRestaurantBySeller">Nhà hàng của tôi</a></li>
                                    <%} else if (request.getAttribute("isSeeFromReport") == "true") {%>
                                <li><a href="ListAllReportRestaurantController">Danh sách báo cáo nhà ăn</a></li>
                                    <%} else {%>
                                <li><a href="ListAllRestaurantController">Danh sách nhà ăn</a></li>
                                    <%}%>                              
                                <li><a>Chi tiết nhà ăn</a></li>
                            </ul>
                        </div>
                        <c:if test = "${isStudent == 1}">
                            <a href="#ReportRestaurantController?id=${restaurant.restaurantID}" data-href="ReportRestaurantController?id=${restaurant.restaurantID}" class="dialog-btn"><img style="float: right; height: 40px " src="images/flag.png" >
                            </c:if>
                            <div class="dialog overlay" id="ReportRestaurantController?id=${restaurant.restaurantID}">
                                <a href="#" class="overlay-close"></a>
                                <div class="dialog-body">
                                    <a class="dialog-close-btn" href="#">&times;</a>
                                    <%@include file="/reportRestaurant.jsp" %>
                                </div>
                            </div> 
                            <div class="card">
                                <form class="form" method="POST" id="updateForm" action="RestaurantListController" name="viewRestaurantForm" enctype="multipart/form-data">
                                    <div class="input_text" hidden>
                                        <input type="text" name="id" value="${restaurant.restaurantID}" hidden>
                                    </div>
                                    <div class="left-side">
                                        <div class="row">
                                            <strong class="fs-4">Menu nhà hàng </strong>
                                            <div class="mt-2">
                                                <c:forEach items="${listFood}" var="food" >
                                                    <div class="row bg-white border rounded p-3 mt-5">
                                                        <div class="col-md-4 mt-1 thumbnail2">
                                                            <img class="rounded"  
                                                                 <c:if test="${food.imageURL != null && food.imageURL !=''}">
                                                                     src="${food.imageURL}" </c:if>
                                                                 <c:if test="${food.imageURL == null}">
                                                                     src="images/food.png" </c:if> 
                                                                 <c:if test="${food.imageURL == ''}">
                                                                     src="images/food.png" </c:if> width="150rem" height="150rem">
                                                            </div>
                                                            <div class="col-md-5 mt-1">
                                                                <label class="labels">${food.foodName}</label>
                                                            <p class="text-justify text-truncate para mb-0">${food.descriptions}<br><br></p>
                                                        </div>
                                                        <div class="col-md-3 align-items-center align-content-center border-left mt-1">
                                                            <div class="d-flex flex-row align-items-center">
                                                                <h4 class="mr-1"><fmt:formatNumber type = "number" maxFractionDigits = "3" value = "${food.cost}" ></fmt:formatNumber> VND</h4> 
                                                                </div>
                                                            </div>
                                                        </div>
                                                </c:forEach>
                                            </div> 
                                        </div>
                                    </div>
                                    <div class="right-side">
                                        <div class="row">
                                            <strong class="fs-4">Mô tả nhà ăn </strong>
                                            <div class="mt-5 thumbnail p-5">
                                                <img  <c:if test="${restaurant.restaurantImage != null && restaurant.restaurantImage !=''}">
                                                        src="${restaurant.restaurantImage}" </c:if>
                                                    <c:if test="${restaurant.restaurantImage == null}">
                                                        src="images/restaurant.png" </c:if> 
                                                    <c:if test="${restaurant.restaurantImage == ''}">
                                                        src="images/restaurant.png" </c:if>  width="100%" class="form-control" alt="" >
                                                </div>
                                                <div class="col-md-12 text-center mt-3">
                                                    <div class="stars-outer mb-5" style=" font-size: 20px"> 
                                                        <div class="stars-inner" style="width: ${restaurant.starAVG}% ; font-size: 20px"> </div>
                                                </div>
                                            </div>  
                                            <div class="col-md-12 mt-3 text-center justify-content-center">
                                                <strong class="fs-4">Chủ nhà ăn : </strong>
                                                <a class="fs-4" href="ViewSellerController?id=${sellerId}" style="text-decoration: none" target="_blank">${restaurant.sellerName}</a>
                                            </div>
                                            <div class="col-md-12 mt-3">
                                                <strong class="fs-4">Tên nhà ăn</strong>
                                                <input type="text" class="form-control" value="${restaurant.restaurantName}" readonly="">
                                            </div>
                                            <div class="col-md-12 mt-3">
                                                <strong class="fs-4">Tỉnh, Thành phố</strong>
                                                <input type="text" class="form-control" value="${restaurant.provinceName}" readonly="">
                                            </div>
                                            <div class="col-md-12 mt-3">
                                                <strong class="fs-4">Quận, Huyện</strong>
                                                <input type="text" class="form-control" value="${restaurant.districtName}" readonly="">
                                            </div>
                                            <div class="col-md-12 mt-3">
                                                <strong class="fs-4">Địa chỉ</strong>
                                                <input type="text" class="form-control" value="${restaurant.address}" readonly="">
                                            </div>                                    
                                            <div class="col-md-12 mt-3">
                                                <strong class="fs-4">Giá chung</strong>
                                                <input type="text" class="form-control" value="${restaurant.cost} VND" readonly="">
                                            </div>
                                            <div class="col-md-12 mt-3">
                                                <strong class="fs-4">Khoảng cách</strong>
                                                <input type="text" class="form-control" value="${restaurant.distance}" readonly="">
                                            </div>
                                            <div class="col-md-12 mt-3">
                                                <strong class="fs-4">Mô tả</strong>
                                                <textarea class="form-control" readonly="" rows="5">${restaurant.description}</textarea>
                                            </div>
                                            <div class="text-center mt-5">
                                                <c:if test = "${isStudent == 1}">
                                                    <a href="commentRestaurant?restaurantID=${restaurant.restaurantID}" style="font-size: 20px"><i class='far fa-edit'></i> Viết đánh giá</a> 
                                                </c:if>
                                            </div>
                                        </div>
                                    </div>
                                </form>

                            </div>
                            <div class="row" style="background-color:#f2f2f2">
                                <label class="labels" style="font-size: 30px; font-weight: bold">Đánh giá nhà ăn:</label>
                                <c:if test="${totalcomment == 0}"> <h3>Chưa có đánh giá nào</h3> </c:if>
                                <c:if test="${listCmtHostelPaging  != null}">
                                    <c:forEach items="${listCmtHostelPaging}" var="d" >
                                        <div class="bg-white p-3" style="margin :5px">
                                            <div class="d-flex flex-row user-info"><img class="rounded-circle" src="${d.studentAvatar}" width="80" height="50" >
                                                <div class="d-flex flex-column justify-content-start ml-4">
                                                    <span class="d-block font-weight-bold name" style=" font-size: 15px;">${d.studentName}</span>
                                                    <span class="date text-black-50" style=" font-size: 12px;">${d.date}</span>
                                                    <div class="sold_stars m1-auto">
                                                        <c:forEach begin="1" end="${d.starvoting}" >
                                                            <i class="fa fa-star"  style=" font-size: 17px;"></i>      
                                                        </c:forEach>
                                                        <p class="comment-text" style=" font-size: 15px;">${d.message}</p>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </c:if>
                                <div class="clearfix">
                                    <ul class="pagination">
                                        <c:if test="${tag>1}">
                                            <li class="page-item disabled"><a href="RestaurantListController?id=${restaurant.restaurantID}&&index=${tag-1}">Previous</a></li>
                                            </c:if>
                                            <c:forEach begin="1" end="${endP}" var="i">
                                            <li class="page-item ${tag==i?"active":""}"><a href="RestaurantListController?id=${restaurant.restaurantID}&&index=${i}" class="page-link">${i}</a></li>
                                            </c:forEach>
                                            <c:if test="${tag<endP}">
                                            <li class="page-item"><a href="RestaurantListController?id=${restaurant.restaurantID}&&index=${tag+1}" class="page-link">Next</a></li>
                                            </c:if>
                                    </ul>
                                </div>  
                            </div>
                    </div>
                </div>
            </div>
        </div>

        <%@include file="/footer.jsp" %>

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script
            src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
            crossorigin="anonymous">
        </script>
        <script>
            $(document).ready(function () {
                $(".toast").toast({delay: 4000});
                $(".toast").toast("show");

            });
        </script>
    </body>
</html>