<%-- 
    Document   : listdepartment
    Created on : Jun 18, 2022, 2:08:32 PM
    Author     : nguye
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha1/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!DOCTYPE html> 
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/viewListStyle.css">
        <link rel="stylesheet" href="css/pagingStyle.css">
        <link rel="stylesheet" href="css/sellerStyle.css">
        <style>
            .stars-outer {
                position: relative;
                display: inline-block;
            }

            .stars-inner {
                position: absolute;
                top: 0;
                left: 0;
                white-space: nowrap;
                overflow: hidden;
                width: 0;
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
    <body>
       
        <%@include file="/header.jsp" %>
        <div class="bg-white">
            <div class="d-flex nav-item main-home col-md-12">
                <ul id="navbar-items" class="col-md-2">
                    <%@include file="/sidebar.jsp" %>
                </ul>
                <div id="topnavbar" class="col-md-10">
                    <div class="d-flex align-items-center mb-3 mt-5 px-md-3 px-2 justify-content-center"> 
                        <form class="row example d-flex align-items-center" action="FilterRestaurantController" method="post"> 
                            <div class="col-md-2"></div>
                            <div class="col-md-8">
                                <input type="text" name="keyword" value="${keyword}" >
                                <button type="submit"><i class="fa fa-search"></i></button> 
                            </div>
                            <div class="d-flex mb-3 mt-5 px-md-3 px-2">
                                <div class="text-center">
                                    <p class="fs-4 ml-5">Bộ lọc tìm kiếm</p>
                                </div>
                                <div class="d-flex">
                                    <div class="col-md-2"></div>
                                    <div class="col-md-5 mr-5">
                                        <span class="fs-4">Khoảng cách: </span>
                                        <select name="distance" class="p-2">
                                            <option value="10" <c:if test = "${distance == 10 }">
                                                    selected="selected"
                                                </c:if>> Tất cả</option>
                                            <option value="1" <c:if test = "${distance == 1 }">
                                                    selected="selected"
                                                </c:if> > <= 1km</option>
                                            <option value="2"<c:if test = "${distance == 2 }">
                                                    selected="selected"
                                                </c:if>> <= 2km</option>
                                            <option value="3" <c:if test = "${distance == 3 }">
                                                    selected="selected"
                                                </c:if>> <= 3km</option>
                                            <option value="5" <c:if test = "${distance == 5 }">
                                                    selected="selected"
                                                </c:if>> <= 5km</option>
                                        </select>
                                    </div>
                                    <div class="col-md-5 mr-5">
                                        <span class="fs-4">Xếp hạng: </span>    
                                        <select name="star" class="p-2">
                                            <option value="5" <c:if test = "${star == 5 }">
                                                    selected="selected"
                                                </c:if>> Tất cả</option>
                                            <option value="1" <c:if test = "${star == 1 }">
                                                    selected="selected"
                                                </c:if>> 1</option>
                                            <option value="2" <c:if test = "${star == 2 }">
                                                    selected="selected"
                                                </c:if>> 2</option>
                                            <option value="3" <c:if test = "${star == 3 }">
                                                    selected="selected"
                                                </c:if>> 3</option>
                                            <option value="4" <c:if test = "${star == 4 }">
                                                    selected="selected"
                                                </c:if>> 4</option>
                                            <option value="0" <c:if test = "${star == 0 }">
                                                    selected="selected"
                                                </c:if>> Chưa có đánh giá</option>
                                        </select>
                                    </div>
                                    <div class="col-md-4">
                                        <input class="fs-4 mr-5" type="submit" value="Lọc"> 
                                        <a class="fs-4" href="ResetSearchRes?keyword=${keyword}" style="text-decoration: none">Xóa bộ lọc</a>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                    <div class="container" style="margin-top: 50px">
                        <div class="row">
                            <div class="col-lg-12 mb-5">
                                <div>
                                    <ul class="breadcrumb">
                                        <li><a href="home.jsp">Trang chủ</a></li>
                                        <li><a>Danh sách tất cả nhà hàng</a></li>
                                    </ul>
                                </div>
                                ${listSize}
                                <ul class="list-group shadow">
                                    <c:forEach items="${restaurants}" var="restaurant" >
                                        <li class="list-group-item">
                                            <div class="d-flex media align-items-lg-center flex-column flex-lg-row p-1">
                                                <div class="col-md-3 media-body order-2 order-lg-1 image">
                                                    <img  <c:if test="${restaurant.restaurantImage != null}">
                                                            src="${restaurant.restaurantImage}" </c:if>
                                                        <c:if test="${restaurant.restaurantImage == null}">
                                                            src="images/nhà trọ.jpg" </c:if> style="width: 150px; height: 150px" >
                                                    </div>
                                                    <div class="col-md-5 media-body order-2 order-lg-1 description" id="description">
                                                        <h3 class="mt-0 font-weight-bold mb-4">
                                                            <a href="RestaurantListController?id=${restaurant.restaurantID}" style="text-decoration: none; color:blue; font-weight: bold">${restaurant.restaurantName}</a>
                                                    </h3>
                                                    <p style="font-size: 20px">${restaurant.description}</p>
                                                    <p style="font-size: 20px">${restaurant.address}</p>
                                                </div>

                                                <div class="col-md-4 mt-5  media-body order-2 order-lg-1 button_edit">
                                                    <div class="stars-outer">
                                                    <div class="stars-inner" style="width: ${restaurant.starAVG}%">  </div>
                                                    </div>
                                                </div>
                                        </li> 
                                    </c:forEach>
                                </ul> 
                                <div class="clearfix">
                                    <ul class="pagination">
                                        <c:if test="${tag>1}">
                                            <li class="page-item disabled"><a href="FilterRestaurantController?index=${tag-1}&costUnder=${under}&costUpper=${upper}&distance=${distance}&keyword=${keyword}&star=${star}">Previous</a></li>
                                            </c:if>
                                            <c:forEach begin="1" end="${endP}" var="i">
                                            <li class="page-item ${tag==i?"active":""}"><a href="FilterRestaurantController?index=${i}&costUnder=${under}&costUpper=${upper}&distance=${distance}&keyword=${keyword}&star=${star}" class="page-link">${i}</a></li>
                                            </c:forEach>
                                            <c:if test="${tag<endP}">
                                            <li class="page-item"><a href="FilterRestaurantController?index=${tag+1}&costUnder=${under}&costUpper=${upper}&distance=${distance}&keyword=${keyword}&star=${star}" class="page-link">Next</a></li>
                                            </c:if>
                                    </ul>
                                </div> 
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>