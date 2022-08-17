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
    <body class="bg-white">
        <div class="px-0">
            <%@include file="/header.jsp" %> 
            <div class="d-flex nav-item main-home">
                <ul id="navbar-items">
                    <%@include file="/sidebar.jsp" %>
                </ul>
                <div class="container rounded bg-white mt-5 mb-5">
                    <div class="row">
                        <div>
                            <ul class="breadcrumb bg-white">
                                <li><a href="home.jsp">Trang chủ</a></li>
                                <%if (Integer.parseInt(request.getSession().getAttribute("role").toString()) == 1) {%>
                                <li><a href="SellerListController?status=3&gender=3">Danh sách Chủ Kinh Doanh</a></li>
                                <%}%>
                                <li><a target="_blank">Hồ Sơ Chủ Kinh Doanh</a></li>
                            </ul>
                        </div>
                        <div class="col-md-4">
                            <div class="d-flex flex-column align-items-center text-center p-3 py-5">
                                <img class="rounded-circle mt-5" height="170rem" width="170rem" src="${seller.image}">
                                <a href="${seller.linkFb}" class="mt-3" style="text-decoration: none" title="" target="_blank">My Facebook</a>
                                <div class="mt-5">
                                    <%if (Integer.parseInt(request.getSession().getAttribute("role").toString()) == 1) {%>
                                    <form action="ChangeStatusSeller" method="post">
                                        <div class="col-md-12">
                                            <input type="text" class="form-control" name="email" value="${seller.email}" readonly="" hidden="">
                                            <c:if test="${seller.status eq 1}">
                                                <strong class="ml-3 mr-1">Kích Hoạt Tài Khoản</strong><input class="form-check-input" type="radio" name="status" checked="" id="inlineRadio1" value="1">
                                                <strong class="ml-3 mr-1">Khóa Tài Khoản</strong><input class="form-check-input" type="radio" name="status"   id="inlineRadio1" value="0" >
                                            </c:if>
                                            <c:if test="${seller.status eq 0}">
                                                <strong class="ml-3 mr-1">Kích Hoạt Tài Khoản</strong><input class="form-check-input" type="radio" name="status"  id="inlineRadio1" value="1">
                                                <strong class="ml-3 mr-1">Khóa Tài Khoản</strong><input class="form-check-input" type="radio" name="status" checked=""  id="inlineRadio1" value="0" >
                                            </c:if>
                                            <div class="mt-3">
                                                <input class="ml-3 p-1" type="submit" value="Confirm"/>
                                            </div>
                                        </div>
                                    </form>
                                    <%}%>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-8">
                            <div class="p-3 py-5">
                                <div class="d-flex justify-content-between align-items-center mb-5">
                                    <h3 class="text-right">HỒ SƠ CHỦ KINH DOANH</h3>
                                </div>
                                <div class="row mt-3">
                                    <input name="id" value="${seller.sellerID}" hidden="">
                                    <div class="col-md-6">
                                        <h4>Họ</h4>
                                        <input type="text" class="form-control" value="${seller.firstName}" readonly="">
                                    </div>
                                    <div class="col-md-6">
                                        <h4>Tên</h4>
                                        <input type="text" class="form-control" value="${seller.lastName}" readonly="">
                                    </div>
                                </div>
                                <div class="row mt-3">
                                    <div class="col-md-12">
                                        <h4>Tuổi</h4>
                                        <input type="number" class="form-control"value="${seller.age}" readonly="">
                                    </div>
                                </div>
                                <div class="row mt-3">
                                    <div class="col-md-12">
                                        <h4>Số Điện Thoại</h4>
                                        <input type="text" class="form-control" value="0${seller.phone}" readonly="">
                                    </div>
                                </div>
                                <div class="row mt-3">
                                    <div class="col-md-12">
                                        <h4>Email</h4>
                                        <input type="text" class="form-control" value="${seller.email}" readonly="">
                                    </div>
                                </div>
                                <div class="row mt-3">
                                    <div class="col-md-12">
                                        <h4>Giới Tính</h4>
                                        <c:if test="${seller.gender eq 1}">
                                            <span class="ml-3 mr-1">Nam</span><input class="form-check-input" type="radio" name="inlineRadioOptions" checked="" id="inlineRadio1" value="1">
                                            <!--                                            <span class="ml-3 mr-1">Nữ</span><input class="form-check-input" type="radio" name="inlineRadioOptions"   id="inlineRadio1" value="0" >-->
                                        </c:if>
                                        <c:if test="${seller.gender eq 0}">
                                            <!--                                            <span class="ml-3 mr-1">Nam</span><input class="form-check-input" type="radio" name="inlineRadioOptions"  id="inlineRadio1" value="1">-->
                                            <span class="ml-3 mr-1">Nữ</span><input class="form-check-input" type="radio" name="inlineRadioOptions" checked=""  id="inlineRadio1" value="0">
                                        </c:if>
                                    </div>
                                </div>
                                <div class="row mt-3">
                                    <div class="col-md-12">
                                        <h4>Đất nước</h4>
                                        <select class="form-select" aria-label="Default select example">
                                            <option selected value="${seller.countryID}">${seller.countryName}</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="row mt-3">
                                    <div class="col-md-12">
                                        <h4>Tỉnh, Thành Phố</h4>
                                        <select class="form-select" aria-label="Default select example">
                                            <option selected value="${seller.provinceID}">${seller.provinceName}</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="row mt-3">
                                    <div class="col-md-12">
                                        <h4>Quận, Huyện</h4>
                                        <select class="form-select" aria-label="Default select example">
                                            <option selected value="${seller.districtID}">${seller.districtName}</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="row mt-3">
                                    <div class="col-md-12">
                                        <h4>Địa Chỉ</h4>
                                        <input type="text" class="form-control"value="${seller.address}" readonly="">
                                    </div>
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
