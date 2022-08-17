    <%-- 
    Document   : listdepartment
    Created on : Jun 18, 2022, 2:08:32 PM
    Author     : nguye
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

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
                        <form class="row example align-items-center" action="FilterHostelController" method="post"> 
                            <div class="col-md-2"></div>
                            <div class="col-md-8">
                                <input type="text" name="keyword" value="${keyword}" >
                                <button type="submit"><i class="fa fa-search"></i></button> 
                            </div>
                            <div class="d-flex mb-3 mt-5 px-md-3 px-2">
                                <div class="text-center">
                                    <p class="fs-4 mr-5">Bộ lọc tìm kiếm</p>
                                </div>
                                <div class="d-flex">
                                    <div class="col-md-4 mr-5">
                                        <div class="d-flex">
                                            <span class="fs-4 mr-3">Giá: </span>
                                            <span class="fs-4 mr-1">Từ: </span>
                                            <input class="mr-1" type="text" name="under" value="${under}"> - 
                                            <span class="fs-4 ml-1">Đến: </span>
                                            <input type="text" name="upper" value="${upper}">
                                        </div>
                                    </div>
                                    <div class="col-md-3">
                                        <span class="fs-4">Khoảng cách: </span>
                                        <select name="distance" class="p-2 px-4">
                                            <option value="10" <c:if test = "${distance == 10 }">
                                                    selected="selected"
                                                </c:if>> Tất cả</option>
                                            <option value="1" <c:if test = "${distance == 1 }">
                                                    selected="selected"
                                                </c:if> > < 1km</option>
                                            <option value="2"<c:if test = "${distance == 2 }">
                                                    selected="selected"
                                                </c:if>> < 2km</option>
                                            <option value="3" <c:if test = "${distance == 3 }">
                                                    selected="selected"
                                                </c:if>> < 3km</option>
                                            <option value="5" <c:if test = "${distance == 5 }">
                                                    selected="selected"
                                                </c:if>> < 5km</option>
                                        </select>
                                    </div>
                                    <div class="col-md-2 mr-3">
                                        <span class="fs-4">Xếp hạng: </span>
                                        <select name="star" class="p-2">
                                            <option value="5" <c:if test = "${star == 5 }">
                                                    selected="selected"
                                                </c:if>> Tất cả</option>
                                            <option value="1" <c:if test = "${star == 1 }">
                                                    selected="selected"
                                                </c:if>> 1 sao trở lên</option>
                                            <option value="2" <c:if test = "${star == 2 }">
                                                    selected="selected"
                                                </c:if>> 2 sao trở lên</option>
                                            <option value="3" <c:if test = "${star == 3 }">
                                                    selected="selected"
                                                </c:if>> 3 sao trở lên</option>
                                            <option value="4" <c:if test = "${star == 4 }">
                                                    selected="selected"
                                                </c:if>> 4 sao trở lên </option>
                                            <option value="0" <c:if test = "${star == 0 }">
                                                    selected="selected"
                                                </c:if>> Chưa có đánh giá</option>
                                        </select>
                                    </div>
                                    <div class="col-md-3">
                                        <input class="fs-4" type="submit" value="Lọc"> 
                                        <a class="fs-4" href="ResetSearchController?keyword=${keyword}" style="text-decoration: none">Xóa bộ lọc</a>
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
                                        <li><a>Danh sách tất cả nhà trọ</a></li>
                                    </ul>
                                </div>
                                ${listSize}
                                <ul class="list-group shadow">
                                    <c:forEach items="${hostels}" var="d">
                                        <li class="list-group-item">

                                            <div class="d-flex media align-items-lg-center flex-column flex-lg-row p-4">
                                                <div class="col-md-3 media-body order-2 order-lg-1 image">
                                                    <img  <c:if test="${d.img1 != null}">
                                                            src="${d.img1}" </c:if>
                                                        <c:if test="${d.img1 == null}">
                                                            src="images/nhà trọ.jpg" 
                                                        </c:if> style="width: 170px; height: 170px" >
                                                </div>
                                                <div class="col-md-5 media-body order-2 order-lg-1 description">
                                                    <h3 class="mt-0 font-weight-bold mb-4">
                                                        <a href="detailhostel?id=${d.hostelID}" style="text-decoration: none; color:blue; font-weight: bold">Nhà trọ ${d.hostelName}</a>
                                                    </h3>
                                                    <p style="font-size: 20px">Vị trí cách đại học FPT: ${d.distance} km</p>
                                                    <p style="font-size: 20px">Tình trạng: <c:if test="${d.status == true}" > Còn phòng</c:if>
                                                        <c:if test="${d.status == false}" >Hết phòng</c:if>
                                                        </p>
                                                        <p style="font-size: 20px">Giá thuê:  
                                                        <fmt:formatNumber type = "number" maxFractionDigits = "3" value = "${d.cost}" ></fmt:formatNumber> VNĐ</p>

                                                    </div>

                                                    <div class="col-md-4 mt-5  media-body order-2 order-lg-1 button_edit">
                                                        <div class="stars-outer">
                                                            <div class="stars-inner" style="width: ${d.starAVG}%">  </div>
                                                        </div>  
                                                </div>

                                            </div>
                                        </li> 
                                    </c:forEach>
                                </ul> 

                                <div class="clearfix">
                                    <ul class="pagination">
                                        <c:if test="${tag>1}">
                                            <li class="page-item disabled"><a href="FilterHostelController?index=${tag-1}&costUnder=${under}&costUpper=${upper}&distance=${distance}&keyword=${keyword}&star=${star}">Previous</a></li>
                                            </c:if>
                                            <c:forEach begin="1" end="${endP}" var="i">
                                            <li class="page-item ${tag==i?"active":""}"><a href="FilterHostelController?index=${i}&costUnder=${under}&costUpper=${upper}&distance=${distance}&keyword=${keyword}&star=${star}" class="page-link">${i}</a></li>
                                            </c:forEach>
                                            <c:if test="${tag<endP}">
                                            <li class="page-item"><a href="FilterHostelController?index=${tag+1}&costUnder=${under}&costUpper=${upper}&distance=${distance}&keyword=${keyword}&star=${star}" class="page-link">Next</a></li>
                                            </c:if>
                                    </ul>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%@include file="/footer.jsp" %>

       
    </body>

</html>

