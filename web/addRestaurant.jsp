<%-- 
    Document   : addRestaurantFixed
    Created on : Aug 9, 2022, 9:33:14 PM
    Author     : dung
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/viewListStyle.css">
        <link rel="stylesheet" href="css/addHostelStyle.css">
        <link rel="stylesheet" href="css/pagingStyle.css">
        <style>
            .error {
                color: red;
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
                <div class="container rounded bg-white mt-5 mb-5 col-md-10">
                    <div class="col-xl-12 mb-5">
                        <div>
                            <ul class="breadcrumb bg-white">
                                <li><a href="home.jsp">Trang chủ</a></li>
                                <li><a href="ListRestaurantBySeller">Nhà hàng của tôi</a></li>
                                <li><a>Thêm nhà hàng mới</a></li>
                            </ul>
                        </div>
                        <div class="card">
                            <form class="form" method="POST" action="AddRestaurantController" name="addRestaurantForm" onsubmit="return validateRestaurant()"  enctype="multipart/form-data">
                                <div class="left-side">
                                    <div class="left_top">
                                        <h4>Thêm ảnh nhà hàng</h4>
                                    </div> 
                                    <div class="mt-5">
                                        <input type="file" accept="image/*" onchange="loadFile(event)" name ="restaurantImage" id="file1">
                                        <label for="file1" style="position: absolute; margin-left: 70px; margin-top: 60px; opacity: 30%">+</label>
                                        <img id="output1" width="170px" height="170px"/>
                                        <script>
                                            var loadFile = function (event) {
                                                var output = document.getElementById('output1');
                                                output.src = URL.createObjectURL(event.target.files[0]);
                                                output.onload = function () {
                                                    URL.revokeObjectURL(output1.src) // free memory
                                                }
                                            };
                                        </script>
                                    </div>

                                    <div class="error" id="errorImg"></div>


                                </div>

                                <div class="right-side">
                                    <h3>Mô tả nhà hàng</h3>
                                    <div class="input_text"> <input type="text" name="restaurantName" placeholder="Nhập tên nhà hàng"> <span>Tên nhà hàng</span> </div>
                                    <div class="error" id="errorName"></div>
                                    <!--                                    <div class="input_text"> <input type="text" name="room" placeholder="Nhập số phòng"> <span>Số phòng</span> </div>   
                                                                        <div class="error" id="errorRoom"></div>
                                                                        <div class="input_text"> <input type="number" name="floor" placeholder="Nhập số tầng"> <span>Số tầng</span> </div>
                                                                        <div class="error" id="errorFloor"></div>-->
                                    <div class="billing">
                                        <div class="input_text"> 
                                            <span>Tỉnh, thành phố</span> 
                                            <select name="province" id="province" class="province">
                                                <option value="">Select Province</option>
                                                <c:forEach items ="${listProvince}" var="o">
                                                    <c:if test ="${o.provinceName == 'Hà Nội'}" >
                                                        <option value="${o.provinceID}" selected>${o.provinceName}</option>
                                                    </c:if>
                                                    <c:if test ="${o.provinceName != 'Hà Nội'}" >
                                                        <option value="${o.provinceID}" >${o.provinceName}</option>
                                                    </c:if>

                                                </c:forEach>
                                            </select> 
                                        </div>                         
                                    </div>
                                    <div class="error" id="errorProvince"></div>

                                    <div class="billing">
                                        <div class="input_text"> 
                                            <span>Quận, phường</span> 
                                            <select name="district"  id ="district" class="district"></select>
                                        </div>                         
                                    </div>

                                    <div class="input_text"> <input type="text" name="address" placeholder="Nhập địa chỉ cụ thể"> <span>Địa chỉ</span> 
                                        <div class="error" id="errorAddress"></div></div>
                                    <div class="input_text"> <input type="text" name="cost" placeholder="Nhập giá dao động"> <span>Giá chung</span>
                                        <div class="error" id="errorCost"></div></div>
                                    <div class="input_text"> <input type="text" name="distance" placeholder="Nhập khoảng cách"> <span>Khoảng cách</span> 
                                        <div class="error" id="errorDistance"></div></div>
                                    <div class="input_text"> <span>Mô tả</span> </div>
                                    <textarea placeholder="Nhập mô tả" rows="5" style="width: 100%; margin-top: 10px"  class="input_text" name="description" style="width:250px;height:150px;"></textarea>

                                    <div class="pay"> 
                                        <button type="submit" >Thêm nhà hàng</button>                  
                                    </div>

                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%@include file="/footer.jsp" %> 
        
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script
            src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
            crossorigin="anonymous">
        </script>
        <script>
            $(document).ready(function () {
                $.ajax({
                    type: "GET",

                    url: "/Test_1/findDistrict",
                    data: {
                        province: 21,
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

            });
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

            });
        </script>
        <script>
            function validateRestaurant() {
                let isValid = true;
                const hostelName = document.addRestaurantForm.restaurantName.value;
                const province = document.addRestaurantForm.province.value;
                const address = document.addRestaurantForm.address.value;
                const cost = document.addRestaurantForm.cost.value;
                const distance = document.addRestaurantForm.distance.value;
                const regex = /[+-]?([0-9]*[.])?[0-9]+/;
                const regex2 = /^[0-9]*$/;

                document.getElementById('errorName').innerText = ' ';
                document.getElementById('errorProvince').innerText = ' ';
                document.getElementById('errorAddress').innerText = ' ';
                document.getElementById('errorCost').innerText = ' ';
                document.getElementById('errorDistance').innerText = ' ';


                if (!hostelName) {
                    document.getElementById('errorName').innerText = 'Bạn phải nhập tên nhà hàng!';
                    isValid = false;
                }

                if (!province) {
                    document.getElementById('errorProvince').innerText = 'Bạn phải chọn tỉnh!';
                    isValid = false;
                }

                if (!address) {
                    document.getElementById('errorAddress').innerText = 'Bạn phải nhập địa chỉ!';
                    isValid = false;
                }

                if (!cost) {
                    document.getElementById('errorCost').innerText = 'Bạn phải nhập giá dao động!';
                    isValid = false;
                } else if (!regex.test(cost)) {
                    document.getElementById('errorCost').innerText = 'Invalid!';
                    isValid = false;
                } else if (cost <= 0) {
                    document.getElementById('errorCost').innerText = 'Giá thuê phải > 0 ';
                    isValid = false;
                }

                if (!distance) {
                    document.getElementById('errorDistance').innerText = 'Bạn phải nhập khoảng cách!';
                    isValid = false;
                } else if (!regex.test(distance)) {
                    document.getElementById('errorDistance').innerText = 'Giá trị nhập không đúng. Khoảng cách phải là số !';
                    isValid = false;
                } else if (distance <= 0) {
                    document.getElementById('errorDistance').innerText = 'Khoảng cách phải > 0 ';
                    isValid = false;
                }

                return isValid;

            }
        </script>
    </body>
</html>

