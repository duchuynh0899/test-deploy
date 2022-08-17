<%-- 
    Document   : departmentdetail
    Created on : Jun 18, 2022, 3:37:44 PM
    Author     : nguye
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha1/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!DOCTYPE html> 
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/viewListStyle.css">
        <link rel="stylesheet" href="css/profileStyle.css">
        <link rel="stylesheet" href="css/pagingStyle.css">
    </head>
    <body>
        <%@include file="/header.jsp" %>
        <div class="bg-white">
            <div class="d-flex nav-item main-home col-md-12">
                <ul id="navbar-items" class="col-md-2">
                    <%@include file="/sidebar.jsp" %>
                </ul>
                <div id="topnavbar1" class="col-md-10">
                    <div class="container rounded bg-white mt-5 mb-5">
                        <div>
                            <ul class="breadcrumb bg-white">
                                <li><a href="home.jsp">Trang chủ</a></li>
                                <li><a href="department">Danh sách Phòng Ban</a></li>
                                <li><a>Chi tiết Phòng Ban</a></li>
                            </ul>
                        </div>
                        <div class="row">
                            <div class="col-md-4 mt-5">
                                <div class="d-flex flex-column align-items-center text-center">
                                    <div class="form-group mt-3">                       
                                        <img src="${departmentdetail.img1}" class="form-control" style="padding: 0px">
                                    </div>
                                    <div class="mt-5">
                                        <h4 class="font-weight-bold">${departmentdetail.depName} ${departmentdetail.depnameAbbreviation}</h4>
                                        <h5>${departmentdetail.email}</h5>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-8">
                                <div class="p-3 py-5">
                                    <div class="row mt-3">
                                        <div class="col-md-12">
                                            <h4>Số điện thoại</h4>
                                            <input type="text" class="form-control" value="0${departmentdetail.phone}" readonly="">
                                        </div>
                                        <div class="col-md-12 mt-3">
                                            <h4>Thời gian hoạt động</h4>
                                            <input type="text" class="form-control" value="${departmentdetail.openday}" readonly="">
                                        </div>
                                        <div class="col-md-12 mt-3">
                                            <h4>Mô tả</h4>
                                            <textarea class="form-control" readonly="" rows="15">${departmentdetail.description}</textarea>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-12">
                                <div class="p-3 py-5">
                                    <img src="${departmentdetail.img2}" class="form-control" style="padding: 0px">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
    <%@include file="/footer.jsp" %>
</html>