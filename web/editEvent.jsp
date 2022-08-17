<%-- 
    Document   : editEvent
    Created on : Aug 14, 2022, 8:58:19 PM
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
        <c:choose>
            <c:when test="${stt.equals('2')}">
                <div class="position-fixed bottom-0 end-0 p-3" style="right: 10px; bottom: 10px; z-index: 11">
                    <div class="toast" data-autohide="true">
                        <div class="toast-header bg-success">
                            <strong class="mr-auto text-white"><h4>Chỉnh Sửa Sự Kiện Thành Công</h4></strong>
                            <button type="button" class="ml-2 mb-1 close" data-dismiss="toast">&times;</button>
                        </div>
                        <div class="toast-body">
                            Chỉnh sửa sự kiện thành công !
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
                <div id="topnavbar1" class="col-md-10">
                    <div class="container rounded mt-5 mb-5 p-4">
                        <form action="EditEvent" method="post" enctype="multipart/form-data">
                            <div class="row">
                                <div>
                                    <ul class="breadcrumb bg-white">
                                        <li><a href="home.jsp">Trang chủ</a></li>
                                        <li><a href="AllEventByClub">Danh sách sự kiện</a></li>     
                                        <li><a>Chỉnh sửa sự kiện</a></li>
                                    </ul>
                                </div>
                                <div class="col-md-4">
                                    <div class="d-flex flex-column align-items-center text-center p-3 py-5">
                                        <div class="mt-5">
                                            <img width="200px" height="200px" src="${eventImage}" id="output">
                                            <input style="padding-left: 80px" type="file" name="eventImage" accept="image/*" onchange="loadFile(event)" class="form-control-file mt-5" id="eventImg">
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-8">
                                    <div class="row mt-2">
                                        <div class="row mt-3">
                                            <div class="col-md-12">
                                                <strong class="text-right fs-4">Tên Sự Kiện</strong>
                                                <input type="text" name="eventName" class="form-control"value="${eventName}" readonly>
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
                                            <button class="btn btn-primary profile-button" type="submit">Lưu Hồ Sơ</button>
                                            <button class="btn btn-primary profile-button" type="reset">Reset</button>
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
          <script>
        $(document).ready(function () {
            $(".toast").toast({delay: 4000});
            $(".toast").toast("show");
        });
    </script>
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
