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
        <link rel="stylesheet" href="css/pagingStyle.css">
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
                    <div class="container rounded bg-white mt-5 mb-5">
                        <div>
                            <ul class="breadcrumb bg-white">
                                <li><a href="home.jsp">Trang chủ</a></li>
                                <li><a href="BusPagingServlet">Danh sách xe Bus</a></li>
                                <li><a>Chi tiết xe Bus</a></li>
                            </ul>
                        </div>
                        <div class="row">
                            <div class="col-md-4">
                                <div class="justify-content-between align-items-center experience">
                                    <div class="p-3 py-5">
                                        <img src="${busImage}" class="form-control" style="padding: 0px">
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-7">
                                <div>
                                    <label class="fs12">Tên</label>
                                    <input class="form-control" type="text" value="Lộ trình xe bus ${busnumber}" readonly="">
                                </div>
                                <div>
                                    <label class="fs12">Mô tả</label>
                                    <textarea class="form-control" readonly="" style="width: 100%" rows="20">
                                        <%String string = (String) request.getAttribute("StopPoint");
                                            String[] parts = string.split("&&");%>
                                        <% for (String bs : parts) {%>
                                        <%=bs%>
                                        <%}%>
                                    </textarea>
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