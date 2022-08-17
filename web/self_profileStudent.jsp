<%@page import="model.Student"%>
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
        <c:choose>
            <c:when test="${stt.equals('1')}">
                <div class="position-fixed bottom-0 end-0 p-3" style="right: 10px; bottom: 10px; z-index: 11">
                    <div class="toast" data-autohide="true">
                        <div class="toast-header bg-success">
                            <strong class="mr-auto text-white"><h4>Chỉnh Sửa Hồ Sơ Thành Công</h4></strong>
                            <button type="button" class="ml-2 mb-1 close" data-dismiss="toast">&times;</button>
                        </div>
                        <div class="toast-body">
                            Chỉnh sửa hồ sơ thành công !
                        </div>
                    </div>
                </div>
            </c:when>
        </c:choose>
        <%@include file="/header.jsp" %>  
        <div class="bg-white">
            <div class="d-flex nav-item main-home col-md-12">
                <ul id="navbar-items" class="col-md-2 d-flex">
                    <%@include file="/sidebar.jsp" %>
                </ul>
                <div id="topnavbar1" class="col-md-10">
                    <div class="container rounded mt-5 mb-5 p-4">
                        <form action="UpdateStudentProfile" enctype="multipart/form-data"  method="post" name="updateStudentForm" onsubmit="return checkSend()">
                            <div class="row">
                                <div>
                                    <ul class="breadcrumb bg-white">
                                        <li><a href="home.jsp">Trang chủ</a></li>
                                        <li><a href="UpdateStudentProfile">Hồ sơ của tôi</a></li>                                    
                                    </ul>
                                </div>
                                <div class="col-md-4">
                                    <div class="d-flex flex-column align-items-center text-center p-3 py-5">
                                        <div class="mt-5">
                                            <img class="rounded-circle mt-5" height="200px" width="200px" src="${UserAvatar}" id="output">
                                            <input style="padding-left: 80px" type="file" name="avatarImage" accept="image/*" onchange="loadFile(event)" class="form-control-file" id="avatarImg">
                                        </div>
                                        <div id="divCheckImg"></div>
                                        <div class="mt-5">
                                            <strong class="text-right fs12">${student.email}</strong>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-8">
                                    <div class="d-flex justify-content-between align-items-center mb-5">
                                        <strong class="text-right fs13">HỒ SƠ CỦA TÔI</strong>
                                    </div>
                                    <div class="row mt-2">
                                        <input name="id" value="${student.studentNo}" hidden="">
                                        <div class="col-md-6">
                                            <strong class="text-right fs-4">Họ</strong>
                                            <input type="text" name="firstName" class="form-control" value="${student.firstName}" >
                                        </div>
                                        <div class="col-md-6">
                                            <strong class="text-right fs-4">Tên</strong>
                                            <input type="text" name="lastName" class="form-control" value="${student.lastName}" >
                                        </div>
                                        <div class="col-md-6">
                                            <strong class="text-right fs-4">StudentID</strong>
                                            <input type="text" name="studentId" class="form-control" value="${student.studentID}" >
                                        </div>
                                        <div class="col-md-6">
                                            <strong class="text-right fs-4">Unit</strong>
                                            <input type="text" name="unit" class="form-control" value="${student.unit}" >
                                            <div id="divCheckUnit"></div>
                                        </div>
                                    </div>
                                    <div class="row mt-3">
                                        <div class="col-md-12">
                                            <strong class="text-right fs-4">Tuổi</strong>
                                            <input type="number" name="age" class="form-control"value="${student.age}" >
                                            <div id="divCheckAge"></div>
                                        </div>
                                    </div>
                                    <div class="row mt-3">
                                        <div class="col-md-12">
                                            <strong class="text-right fs-4">Số Điện Thoại</strong>
                                            <input type="text" name="phone" class="form-control" value="${student.phone}" >
                                            <div id="divCheckPhone"></div>
                                        </div>
                                    </div>
                                    <div class="row mt-3">
                                        <div class="col-md-12">
                                            <strong class="text-right fs-4">Email</strong>
                                            <input type="text" class="form-control" readonly="" value="${student.email}" >
                                        </div>
                                    </div>                                   
                                    <div class="row mt-3">
                                        <div class="col-md-12">
                                            <strong class="text-right fs-4">Giới Tính</strong>
                                            <label class="labels" id="genderlable" hidden="">${student.gender}</label><br/>
                                            <input class="form-check-input mr-1" type="radio" name="gender"  id="inlineRadio1" value="1"> 
                                            <span class="mr-4">Nam</span>
                                            <input class="form-check-input mr-1" type="radio" name="gender"  id="inlineRadio2" value="0"> 
                                            <span>Nữ</span>                                            
                                        </div>
                                    </div>
                                    <div class="row mt-3">
                                        <div class="col-md-11">
                                            <strong class="text-right fs-4">Link Facebook</strong>
                                            <input type="text" name="linkFb" class="form-control" value="${student.linkFb}">
                                        </div>
                                        <div class="col-md-1 mt-4 p-2">
                                            <a class="login-facebook-icon" style="height: 40px; width: 40px; margin-left: calc(100%-20px)" href="${student.linkFb}" title="" target="_blank">f</a>
                                        </div>
                                    </div>
                                    <div class="row mt-3">
                                        <div class="col-md-12">
                                            <label class="labels" style="font-size: 22px" for="cars">Tỉnh, thành phố</label>
                                            <select name="province" id="province" class="province form-select" onchange>
                                                <option value="">Select Province</option>
                                                <c:forEach items ="${listProvince}" var="o">
                                                    <option value="${o.provinceID}" 
                                                            <c:if test = "${student.provinceID == o.provinceID }">
                                                                selected="selected"
                                                            </c:if>    >${o.provinceName}</option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="error" id="errorProvince"></div> 

                                    <div class="row mt-3">
                                        <div class="col-md-12">
                                            <label class="labels" style="font-size: 22px" for="cars">Quận, phường</label>
                                            <select name="district"  id ="district" class="district form-select">
                                                <c:forEach items ="${listDistrict}" var="o">
                                                    <option value="${o.districtID}" 
                                                            <c:if test = "${student.districtID == o.districtID }">
                                                                selected="selected"
                                                            </c:if>    >${o.districtName}</option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="row mt-3">
                                        <div class="col-md-12">
                                            <strong class="text-right fs-4">Địa Chỉ</strong>
                                            <input type="text" name="addressDetail" class="form-control"value="${student.address}" >
                                        </div>
                                    </div>
                                </div>
                                <div class="mt-5 text-center">
                                    <button class="btn btn-primary profile-button" type="submit" onclick="checkValidatorForUpdateStudentProfile()">Lưu Hồ Sơ</button>
                                </div>
                                <label class="labels">${UpdateError}</label>
                                <label class="labels">${UpdateProcess}</label>
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
    
    <script src="validator/Validator.js"></script>
  
    <script language="javascript">
        var gender = document.getElementById('genderlable').innerHTML;
        if (gender == 1) {
            document.getElementById('inlineRadio1').setAttribute('checked', true);
        } else
        {
            document.getElementById('inlineRadio2').setAttribute('checked', true);
        }
        // Hàm xử lý khi thẻ select thay đổi giá trị được chọn
        // obj là tham số truyền vào và cũng chính là thẻ select


    </script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script
        src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
    crossorigin="anonymous"></script>
    <script>
        $(document).on('change', '.province', function () {
            var province = document.getElementById("province").value;
            $('#district').empty();
            $.ajax({
                type: "GET",
                url: "/Test_1/findDistrict",
                data: {
                    province: province,
                },
                headers: {
                    Accept: "application/json; charset=utf-8",
                    contentType: "application/json; charset=utf-8"
                },
                success: function (data) {
                    data.forEach(function (a) {
                        $("#district").append('<option value="' + a.districtID + '">' + a.districtName + '</option>');
                    });
                },
                error: function (e) {
                    console.log("ERROR: ", e);
                }
            });
        });</script>


    <script>
        var loadFile = function (event) {
            var output = document.getElementById('output');
            output.src = URL.createObjectURL(event.target.files[0]);
            output.onload = function () {
                URL.revokeObjectURL(output.src) // free memory
            }
        };</script>
</html>