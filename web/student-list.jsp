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
        <link rel="stylesheet" href="css/datatables.min.css">
        <link rel="stylesheet" href="css/style1.css">
    </head>
    <body>
        <c:choose>
            <c:when test="${stt.equals('1')}">
                <div class="position-fixed bottom-0 end-0 p-3" style="right: 10px; bottom: 10px; z-index: 11">
                    <div class="toast" data-autohide="true">
                        <div class="toast-header bg-success">
                            <strong class="mr-auto text-white"><h4>Cập Nhật Trạng Thái Tài Khoản Thành Công</h4></strong>
                            <button type="button" class="ml-2 mb-1 close" data-dismiss="toast">&times;</button>
                        </div>
                        <div class="toast-body">
                            Cập Nhật Trạng Thái Tài Khoản Thành Công !
                        </div>
                    </div>
                </div>
            </c:when>
        </c:choose>
        <%@include file="/header.jsp" %>
        <div class="bg-white">
            <div class="d-flex nav-item main-home col-md-12">
                <ul id="navbar-items" class="col-md-2">
                    <%@include file="/sidebar.jsp" %>
                </ul>
                <div id="topnavbar" class="col-md-10">
                    <div class="d-flex  mb-3 mt-5 px-md-3 px-2 align-items-center justify-content-center"> 
                        <form class="example align-items-center" action="StudentListController" method="post">
                            <div class="row">
                                <div>
                                    <input type="text" placeholder="" name="key" value="${key}"> 
                                    <button type="submit"><i class="fa fa-search"></i></button> 
                                </div>
                                <div class="d-flex mb-3 mt-5 mr-5">
                                    <div class="col-md-4 mt-3 mr-4">
                                        <label class="fs-4 labels mb-3" for="cars">Tỉnh, thành phố</label>
                                        <select name="province" id="province" class="province form-select" onchange>
                                            <option value="">Chọn tỉnh, thành phố</option>
                                            <c:forEach items ="${listProvince}" var="o">
                                                <option value="${o.provinceID}" 
                                                        <c:if test = "${province == o.provinceID }">
                                                            selected="selected"
                                                        </c:if>    >${o.provinceName}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                    <div class="col-md-1 mt-3 ml-2">
                                        <span class="fs-4">Khóa</span>
                                        <input class="mt-3" type="text" placeholder="Khóa" name="unit" value="${unit}" >
                                    </div>
                                    <div class="col-md-2 mt-3 ml-4">
                                        <div class="d-flex">
                                            <div class="row justify-content-center">
                                                <span class="fs-4">Giới tính</span>
                                                <c:if test="${gender eq 3}">
                                                    <div class="d-flex mt-3 text-center">
                                                        <input class="form-check-input" type="radio" name="gender" checked=""  id="inlineRadio2" value="3">
                                                        <strong class="ml-2">Tất Cả</strong>
                                                    </div>
                                                    <div class="d-flex mt-3 text-center">
                                                        <input class="form-check-input" type="radio" name="gender"  id="inlineRadio1" value="1"> 
                                                        <strong class="ml-2">Nam</strong>
                                                    </div>
                                                    <div class="d-flex mt-3 text-center">
                                                        <input class="form-check-input" type="radio" name="gender"  id="inlineRadio2" value="0">                
                                                        <strong class="ml-2">Nữ</strong>
                                                    </div>
                                                </c:if>
                                                <c:if test="${gender eq 1}">
                                                    <div class="d-flex mt-3 text-center">
                                                        <input class="form-check-input" type="radio" name="gender"  id="inlineRadio2" value="3"> 
                                                        <strong class="ml-2">Tất Cả</strong>
                                                    </div>
                                                    <div class="d-flex mt-3 text-center">
                                                        <input class="form-check-input" type="radio" name="gender" checked=""  id="inlineRadio1" value="1"> 
                                                        <strong class="ml-2">Nam</strong>
                                                    </div>
                                                    <div class="d-flex mt-3 text-center">
                                                        <input class="form-check-input" type="radio" name="gender"  id="inlineRadio2" value="0">  
                                                        <strong class="ml-2">Nữ</strong>
                                                    </div>
                                                </c:if>
                                                <c:if test="${gender eq 0}">
                                                    <div class="d-flex mt-3 text-center">
                                                        <input class="form-check-input" type="radio" name="gender"  id="inlineRadio2" value="3">
                                                        <strong class="ml-2">Tất Cả</strong>
                                                    </div>
                                                    <div class="d-flex mt-3 text-center">
                                                        <input class="form-check-input" type="radio" name="gender"  id="inlineRadio1" value="1"> 
                                                        <strong class="ml-2">Nam</strong>
                                                    </div>
                                                    <div class="d-flex mt-3 text-center">
                                                        <input class="form-check-input" type="radio" name="gender" checked=""  id="inlineRadio2" value="0">    
                                                        <strong class="ml-2">Nữ</strong>
                                                    </div>
                                                </c:if>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-3 mt-3">
                                        <div class="d-flex">
                                            <div class="row justify-content-center">
                                                <span class="fs-4">Trạng Thái</span>
                                                <c:if test="${status eq 1}">
                                                    <div class="d-flex mt-3 text-center">
                                                        <input class="form-check-input" type="radio" name="status" id="inlineRadio1" value="3" >
                                                        <strong class="ml-3 mr-1">Tất Cả</strong>
                                                    </div>
                                                    <div class="d-flex mt-3 text-center">
                                                        <input class="form-check-input" type="radio" name="status" checked="" id="inlineRadio1" value="1">
                                                        <strong class="ml-3 mr-1">Hoạt Động</strong>
                                                    </div>
                                                    <div class="d-flex mt-3 text-center">
                                                        <input class="form-check-input" type="radio" name="status"   id="inlineRadio1" value="0" >
                                                        <strong class="ml-3 mr-1">Không Hoạt Động</strong>
                                                    </div>
                                                </c:if>
                                                <c:if test="${status eq 0}">
                                                    <div class="d-flex mt-3 text-center">
                                                        <input class="form-check-input" type="radio" name="status" id="inlineRadio1" value="3" >
                                                        <strong class="ml-3 mr-1">Tất Cả</strong>
                                                    </div>
                                                    <div class="d-flex mt-3 text-center">
                                                        <input class="form-check-input" type="radio" name="status"  id="inlineRadio1" value="1">
                                                        <strong class="ml-3 mr-1">Hoạt Động</strong>
                                                    </div>
                                                    <div class="d-flex mt-3 text-center">
                                                        <input class="form-check-input" type="radio" name="status" checked=""  id="inlineRadio1" value="0" >
                                                        <strong class="ml-3 mr-1">Không Hoạt Động</strong>
                                                    </div>
                                                </c:if>
                                                <c:if test="${status eq 3}">
                                                    <div class="d-flex mt-3 text-center">
                                                        <input class="form-check-input" type="radio" name="status" checked=""  id="inlineRadio1" value="3" >
                                                        <strong class="ml-3 mr-1">Tất Cả</strong>
                                                    </div>
                                                    <div class="d-flex mt-3 text-center">
                                                        <input class="form-check-input" type="radio" name="status"  id="inlineRadio1" value="1">
                                                        <strong class="ml-3 mr-1">Hoạt Động</strong>
                                                    </div>
                                                    <div class="d-flex mt-3 text-center">
                                                        <input class="form-check-input" type="radio" name="status"  id="inlineRadio1" value="0" >
                                                        <strong class="ml-3 mr-1">Không Hoạt Động</strong>
                                                    </div>
                                                </c:if>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-10 mt-5 p-3">
                                        <button type="submit">Lọc</button> 
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                    <div class="main-wrapper">
                        <div class="page-wrapper">
                            <div class="content container-fluid">
                                <div class="row">
                                    <div class="col-lg-12 mb-5">
                                        <div>
                                            <ul class="breadcrumb">
                                                <li><a href="home.jsp">Trang Chủ</a></li>
                                                <li><a>Danh sách Học Sinh</a></li>
                                            </ul>
                                        </div>
                                        ${listSize}
                                        <div class="card card-table">
                                            <div class="card-body">
                                                <div class="table-responsive">
                                                    <table class="table table-hover table-center datatable" id="seller">
                                                        <thead>
                                                            <tr>
                                                                <th>ID Học Sinh</th>
                                                                <th>Tên Học Sinh</th>
                                                                <th>Tuổi</th>
                                                                <th>Giới Tính</th>
                                                                <th>Số Điện Thoại</th>
                                                                <th>Email</th>
                                                                <th class="text-center">Trạng Thái</th>
                                                                <th>Xem Hồ Sơ</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            <c:forEach items="${listStudent}" var="student">
                                                                <tr>
                                                                    <td>${student.studentID}</td>
                                                                    <td>${student.firstName}${student.lastName}</td>
                                                                    <td>${student.age}</td>
                                                                    <td>
                                                                        <c:if test="${student.gender==1}">Nam</c:if>
                                                                        <c:if test="${student.gender==0}">Nữ</c:if>
                                                                        </td>
                                                                        <td>0${student.phone}</td>
                                                                    <td>${student.email}</td>
                                                                    <td class="text-center">
                                                                        <c:if test="${student.status==1}">
                                                                            <div class="actions">
                                                                                <a href="ChangeStatusCriteria?id=${student.studentNo}" class="btn btn-sm bg-purple-light mr-2">
                                                                                    <i class="fas fa-check-square"></i>
                                                                                </a>
                                                                            </div>
                                                                        </c:if>
                                                                        <c:if test="${student.status==0}">
                                                                            <div class="actions">
                                                                                <a href="ChangeStatusCriteria?id=${student.studentNo}" class="btn btn-sm bg-default-light mr-2">
                                                                                    <i class="fas fa-square"></i>
                                                                                </a>
                                                                            </div>
                                                                        </c:if>
                                                                    </td>
                                                                    <td>
                                                                        <a href="ViewStudentController?id=${student.studentID}" style="text-decoration: none">Chi Tiết</a>
                                                                    </td>
                                                                </tr>
                                                            </c:forEach>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
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
        <script>
            $(document).ready(function () {
                $(".toast").toast({delay: 4000});
                $(".toast").toast("show");
            });
        </script>
    </body>
</html>


