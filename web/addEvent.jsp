<%-- 
    Document   : listAllEventOfClub
    Created on : Aug 13, 2022, 4:08:32 PM
    Author     : win
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha1/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/viewListStyle.css">
        <link rel="stylesheet" href="css/pagingStyle.css">
        <link rel="stylesheet" href="css/profileStyle.css">
    </head>
    <body>
        <%@include file="/header.jsp" %>
        <div class="bg-white">
            <div class="d-flex nav-item main-home col-md-12">
                <ul id="navbar-items" class="col-md-2">
                    <%@include file="/sidebar.jsp" %>
                </ul>
                <div id="topnavbar1" class="col-md-10">
                    <div class="container rounded mt-5 mb-5 p-4">
                        <form action="AddNewEvent" enctype="multipart/form-data"  method="post" >
                            <div class="row">
                                <div>
                                    <ul class="breadcrumb bg-white">
                                        <li><a href="home.jsp">Trang chủ</a></li>
                                        <li><a href="AllEventByClub">Danh sách sự kiện</a></li>     
                                        <li><a>Tạo sự kiện mới</a></li>
                                    </ul>
                                </div>
                                <div class="col-md-4">
                                    <div class="d-flex flex-column align-items-center text-center p-3 py-5">
                                        <div>
                                            <div>
                                                <strong class="fs-4">Ảnh Sự Kiện</strong>
                                            </div> 
                                            <div class="mt-4">
                                                <img width="200px" height="200px" src="${eventImage}" id="output">
                                                <input style="padding-left: 80px" type="file" name="eventImage" accept="image/*" onchange="loadFile(event)" class="form-control-file mt-5" id="eventImg">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-8">
                                    <div class="row mt-2">
                                        <div class="row mt-3">
                                            <div class="col-md-12">
                                                <strong class="text-right fs-4">Tên Sự Kiện</strong>
                                                <input type="text" name="eventName" class="form-control" value="${eventName}">
                                            </div>
                                        </div>
                                        <div>${errorEventName}</div>
                                        <div class="row mt-3">
                                            <div class="col-md-12">
                                                <strong class="text-right fs-4">Thời Gian</strong>
                                                <input type="text" name="time" class="form-control" value="${time}">
                                            </div>
                                        </div> 
                                        <div class="row mt-3">
                                            <div class="col-md-12">
                                                <strong class="text-right fs-4">Mô Tả</strong>
                                                <textarea rows="10" style="width: 100%" name="des" class="form-control">
                                                    ${des}
                                                </textarea>
                                            </div>
                                        </div>
                                        <div class="text-center mt-5"> 
                                            <button class="btn btn-primary profile-button" type="submit">Tạo Sự Kiện</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <%@include file="/footer.jsp" %>
    </body>
    <script>
        var loadFile = function (event) {
            var output = document.getElementById('output');
            output.src = URL.createObjectURL(event.target.files[0]);
            output.onload = function () {
                URL.revokeObjectURL(output.src) // free memory
            }
        };
    </script>
</html>
