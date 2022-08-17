<%-- 
    Document   : listClubs
    Created on : Jun 22, 2022, 12:27:04 PM
    Author     : win
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha1/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/viewListStyle.css">
        <link rel="stylesheet" href="css/pagingStyle.css">
        <link rel="stylesheet" href="css/sellerStyle.css">
        <link rel="stylesheet" href="css/style1.css">
    </head>
    <body>
        <%@include file="/header.jsp" %>
        <div class="bg-white">
            <div class="d-flex nav-item main-home col-md-12">
                <ul id="navbar-items" class="col-md-2">
                    <%@include file="/sidebar.jsp" %>
                </ul>
                <div id="topnavbar1" class="col-md-10">
                    <div class="d-flex align-items-center mb-3 mt-5 px-md-3 px-2 justify-content-center"> 
                        <form class="row example d-flex align-items-center" action="ClubListController" method="post"> 
                            <div class="col-md-2"></div>
                            <div class="col-md-8">
                                <input type="text" placeholder="" name="key" value="${key}"> 
                                <button type="submit"><i class="fa fa-search"></i></button> 
                            </div>
                            <div class="d-flex mb-3 mt-5 px-md-3 px-2">
                                <div class="col-md-3"></div>
                                <div class="text-center">
                                    <p class="fs-4 mr-5">Danh Mục</p>
                                </div>
                                <div class="list-group text-center">
                                    <div class="d-flex">
                                        <div class="col-md-4">
                                            <a href="listClubCategories?type=1&key=${key}" class="list-group-item list-group-item-action">Học Thuật</a>
                                        </div>
                                        <div class="col-md-4">
                                            <a href="listClubCategories?type=2&key=${key}" class="list-group-item list-group-item-action">Kỹ Năng Sống</a>
                                        </div>
                                        <div class="col-md-4">
                                            <a href="listClubCategories?type=3&key=${key}" class="list-group-item list-group-item-action">Thể Thao</a>
                                        </div>
                                        <div class="col-md-4">
                                            <a href="listClubCategories?type=4&key=${key}" class="list-group-item list-group-item-action ">Nghệ Thuật</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-12 mt-5 mb-5">
                                <div>
                                    <ul class="breadcrumb bg-white">
                                        <li><a href="home.jsp">Trang chủ</a></li>
                                        <li><a>Danh sách Câu Lạc Bộ</a></li>
                                    </ul>
                                </div>
                                <p> ${listNull} </p>
                                <ul class="list-group shadow">
                                    <c:forEach items="${listClubs}" var="club">
                                        <li class="list-group-item">
                                            <div class="d-flex media align-items-lg-center flex-column flex-lg-row p-2">
                                                <div class="col-md-3 media-body order-2 order-lg-1 image">
                                                    <img src="${club.avatar}" alt="Generic placeholder image">
                                                </div>
                                                <div class="col-md-8 media-body order-2 order-lg-1 description ml-5" id="description">
                                                    <div>
                                                        <h4 class="font-weight-bold mb-3">
                                                            <a href="detailClub?id=${club.clubID}" style="text-decoration: none; font-weight: bold">${club.clubName}</a>
                                                        </h4>
                                                    </div>
                                                    <div>
                                                        <p style="font-size: 18px">${club.clubPresident}</p>
                                                        <p style="font-size: 18px">${club.facebook}</p>
                                                        <p style="font-size: 18px">${club.email}</p>
                                                        <p style="font-size: 18px">${club.des}</p>
                                                    </div>
                                                </div>
                                            </div> 
                                        </li> 
                                    </c:forEach>
                                </ul> 
                                <div class="clearfix">
                                    <ul class="pagination">
                                        <c:if test="${tag>1}">
                                            <li class="page-item disabled"><a href="ClubListController?index=${tag-1}&key=${key}&type=${type}">Previous</a></li>
                                            </c:if>
                                            <c:forEach begin="1" end="${endP}" var="i">
                                            <li class="page-item ${tag==i?"active":""}"><a href="ClubListController?index=${i}&key=${key}&type=${type}" class="page-link">${i}</a></li>
                                            </c:forEach>
                                            <c:if test="${tag<endP}">
                                            <li class="page-item"><a href="ClubListController?index=${tag+1}&key=${key}&type=${type}" class="page-link">Next</a></li>
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

        <script src="js/jquery-3.6.0.min.js"></script>
        <script src="js/popper.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/jquery.slimscroll.min.js"></script>
        <script src="js/datatables.min.js"></script>
        <script src="js/script.js"></script>
    </body>
</html>