<%-- 
 Document   : listAllReportHostel
 Created on : Aug 8, 2022, 3:12:32 AM
 Author     : DELL
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/viewListStyle.css">
        <link rel="stylesheet" href="css/pagingStyle.css">
        <link rel="stylesheet" href="css/sellerStyle.css">
        <link rel="stylesheet" href="css/datatables.min.css">
        <link rel="stylesheet" href="css/style1.css">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    </head>
    <body>
        <c:choose>
            <c:when test="${stt.equals('1')}">
                <div class="position-fixed bottom-0 end-0 p-3" style="right: 10px; bottom: 10px; z-index: 11">
                    <div class="toast" data-autohide="true">
                        <div class="toast-header bg-success">
                            <strong class="mr-auto text-white"><h4>Xóa Bài Viết Thành Công</h4></strong>
                            <button type="button" class="ml-2 mb-1 close" data-dismiss="toast">&times;</button>
                        </div>
                        <div class="toast-body">
                            Xóa Bài Viết Thành Công !
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
                    <div class="d-flex align-items-center mb-3 mt-5 px-md-3 px-2 justify-content-center"> 
                        <form class="example d-flex align-items-center"> 
                            <input type="text" placeholder="" name="search"> 
                            <button type="submit"><i class="fa fa-search"></i></button> 
                        </form>
                    </div>
                    <div class="main-wrapper">
                        <div class="page-wrapper">
                            <div class="content container-fluid">
                                <div class="row">
                                    <div class="col-lg-12 mb-5">
                                        <div>
                                            <ul class="breadcrumb">
                                                <li><a href="home.jsp">Trang chủ</a></li>
                                                <li><a>Danh sách Báo Cáo Nhà Trọ</a></li>
                                            </ul>
                                        </div>
                                        <div class="card card-table">
                                            <div class="card-body">
                                                <div class="table-responsive">
                                                    <table class="table table-hover table-center datatable" id="seller">
                                                        <thead>
                                                            <tr>
                                                                <th>Tên Trọ</th>
                                                                <th>Spam</th>
                                                                <th>Hình Ảnh Không Phù Hợp</th>
                                                                <th>Ngôn Từ Đả Kích</th>
                                                                <th>Thông Tin Sai Sự Thật</th>
                                                                <th class="text-center">Xem Bài Viết/ Xóa Bài Đăng</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            <c:forEach items="${listReportHostel}" var="report">
                                                                <tr>
                                                                    <td>${report.hostelName}</td>
                                                                    <td>${report.spam}</td>
                                                                    <td>${report.violent}</td>
                                                                    <td>${report.offensive}</td>
                                                                    <td>${report.truthless}</td>
                                                                    <td class="text-center">
                                                                        <div class="actions">
                                                                            <a href="detailhostel?id=${report.hostelID}&isSeeFromReport=true" class="btn btn-sm bg-success-light mr-2">
                                                                                <i class="fas fa-eye"></i>
                                                                            </a>
                                                                            <a href="#" data-href="deletehostel?id=${report.hostelID}" id="btnDelete" class="btn btn-sm bg-danger-light" data-toggle="modal" data-target="#confirm-delete" >
                                                                                <i class="fas fa-trash"></i>
                                                                            </a>
                                                                            <div class="modal fade" id="confirm-delete" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                                                                <div class="modal-dialog">
                                                                                    <div class="modal-content">
                                                                                        <div class="modal-header">
                                                                                            Xoá bài đăng
                                                                                        </div>
                                                                                        <div class="modal-body">
                                                                                            Bạn có chắc chắn muốn xoá bài đăng này không?
                                                                                        </div>
                                                                                        <div class="modal-footer">
                                                                                            <button type="button" class="btn btn-default" data-dismiss="modal">Huỷ</button>
                                                                                            <a class="btn btn-danger btn-ok" >Xoá</a>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
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
        <script>
            //        $('#confirm-delete').on('show.bs.modal', function (e) {
            //            $(this).find('.btn-ok').attr('href', $(e.relatedTarget).data('href'));
            //        });
            $(document).on('click', '#btnDelete', function () {
                var link = $(this).attr('data-href');
                $('.btn-ok').attr('href', link);
            });
        </script>

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
