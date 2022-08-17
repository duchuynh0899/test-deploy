<%-- 
    Document   : addHostel
    Created on : Jul 11, 2022, 9:46:01 PM
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
        <link rel="stylesheet" href="css/addHostelStyle.css">
        <link rel="stylesheet" href="css/pagingStyle.css">
    </head>
    <body>
        <%@include file="/header.jsp" %>
        <div class="bg-white">
            <div class="d-flex nav-item main-home col-md-12">
                <ul id="navbar-items" class="col-md-2">
                    <%@include file="/sidebar.jsp" %>
                </ul>
                <div class="container rounded bg-white mt-5 mb-5 col-md-10">
                    <div class="col-xl-12 mt-5 mb-5">
                        <div>
                            <ul class="breadcrumb bg-white">
                                <li><a href="home.jsp">Trang chủ</a></li>
                                <li><a href="hostellist">Nhà trọ của tôi</a></li>
                                <li><a>Thêm nhà trọ mới</a></li>
                            </ul>
                        </div>
                        <div class="card">
                            <form class="form" method="POST" action="addhostel" name="addhostelForm" onsubmit="return validateAddHostel()"  enctype="multipart/form-data">
                                <div class="left-side">
                                    <div class="left_top">
                                        <strong class="fs-3">Ảnh nhà trọ</strong>
                                    </div> 
                                    <div class="mt-4">
                                        <input type="file" accept="image/*" onchange="loadFile(event)" name ="image1" id="file1">
                                        <label for="file1" style="position: absolute; margin-left: calc(5.5%); margin-top: calc(4.5%); opacity: 30%">+</label>
                                        <img id="output1" width="170rem" height="170rem"/>
                                        <script>
                                            var loadFile = function (event) {
                                                var output = document.getElementById('output1');
                                                output.src = URL.createObjectURL(event.target.files[0]);
                                                var img2 = document.getElementById('file2').type = "file";
                                                var img3 = document.getElementById('file3').type = "file";
                                                var img4 = document.getElementById('file4').type = "file";
                                                var img5 = document.getElementById('file5').type = "file";
                                                var img6 = document.getElementById('file6').type = "file";
                                                output.onload = function () {
                                                    URL.revokeObjectURL(output1.src); // free memory
                                                };
                                            };
                                        </script>

                                        <input type="" hidden accept="image/*" onchange="loadFile2(event)" name ="image2" id="file2" onclick="clickImg()">
                                        <label for="file2" style="position: absolute; margin-left: calc(8%); margin-top: calc(5%); opacity: 30%">+</label>
                                        <img id="output2" style="margin-left: calc(5%)" width="170rem" height="170rem"/>
                                        <script>
                                            var loadFile2 = function (event) {
                                                var output = document.getElementById('output2');
                                                output.src = URL.createObjectURL(event.target.files[0]);
                                                output.onload = function () {
                                                    URL.revokeObjectURL(output2.src); // free memory
                                                };
                                            };
                                        </script>

                                        <input type="" hidden accept="image/*" onchange="loadFile3(event)" name ="image3" id="file3" onclick="clickImg()">
                                        <label for="file3" style="position: absolute; margin-left: calc(8%); margin-top: calc(5%); opacity: 30%">+</label>
                                        <img id="output3" style="margin-left: calc(5%)" width="170rem" height="170rem"/>
                                        <script>
                                            var loadFile3 = function (event) {
                                                var output = document.getElementById('output3');
                                                output.src = URL.createObjectURL(event.target.files[0]);
                                                output.onload = function () {
                                                    URL.revokeObjectURL(output.src); // free memory
                                                };
                                            };
                                        </script>
                                    </div>
                                    <div class="mt-5">
                                        <input type="" hidden accept="image/*" onchange="loadFile4(event)" name ="image4" id="file4"  onclick="clickImg()">
                                        <label for="file4" style="position: absolute; margin-left: calc(6%); margin-top: calc(5.5%); opacity: 30%">+</label>
                                        <img id="output4" width="170rem" height="170rem"/>
                                        <script>
                                            var loadFile4 = function (event) {
                                                var output = document.getElementById('output4');
                                                output.src = URL.createObjectURL(event.target.files[0]);
                                                output.onload = function () {
                                                    URL.revokeObjectURL(output.src); // free memory
                                                };
                                            };
                                        </script>

                                        <input type="" hidden accept="image/*" onchange="loadFile5(event)" name ="image5" id="file5"  onclick="clickImg()">
                                        <label for="file5" style="position: absolute; margin-left: calc(8.5%); margin-top: calc(5.5%); opacity: 30%">+</label>
                                        <img id="output5" style="margin-left: calc(5%)" width="170rem" height="170rem"/>
                                        <script>
                                            var loadFile5 = function (event) {
                                                var output = document.getElementById('output5');
                                                output.src = URL.createObjectURL(event.target.files[0]);
                                                output.onload = function () {
                                                    URL.revokeObjectURL(output.src); // free memory
                                                };
                                            };
                                        </script> 

                                        <input type="" hidden accept="image/*" onchange="loadFile6(event)" name ="image6" id="file6"  onclick="clickImg()">
                                        <label for="file6" style="position: absolute; margin-left: calc(8.5%); margin-top: calc(5.5%); opacity: 30%">+</label>
                                        <img id="output6" style="margin-left: calc(5%)" width="170rem" height="170rem"/>
                                        <script>
                                            var loadFile6 = function (event) {
                                                var output = document.getElementById('output6');
                                                output.src = URL.createObjectURL(event.target.files[0]);
                                                output.onload = function () {
                                                    URL.revokeObjectURL(output.src); // free memory
                                                };
                                            };
                                        </script>
                                    </div>
                                    <div class="error" id="errorImg"></div>

                                    <div class="mt-5"> 
                                        <strong class="fs-3">Tình trạng phòng</strong>                   
                                    </div>   
                                    <div class="left_text">
                                        <input type="radio" id="collection1" name="status" value="yes"> 
                                        <label for="collection1">
                                            <div class="left_box">
                                                <div class="left_box_collection"> 
                                                    <div class="radio_button"> <span></span>
                                                        <h4>Còn phòng</h4>
                                                    </div>                               
                                                </div>
                                            </div>
                                        </label> 
                                        <input type="radio" id="collection2" checked name="status" value="no"> 
                                        <label for="collection2">
                                            <div class="left_box">
                                                <div class="left_box_collection">
                                                    <div class="radio_button"> <span></span>
                                                        <h4>Hết phòng</h4>
                                                    </div>
                                                </div>                                    
                                            </div>
                                        </label>
                                    </div>
                                </div>

                                <div class="right-side">
                                    <strong class="fs-3">Mô tả phòng</strong>
                                    <div class="input_text">
                                        <h4>Tên nhà trọ</h4>
                                        <input type="text" name="hostelName" placeholder="Nhập tên nhà trọ">  
                                    </div>
                                    <div class="error" id="errorName"></div>
                                    <div class="input_text">
                                        <strong class="fs-4">Số phòng</strong> 
                                        <input type="text" name="room" placeholder="Nhập số phòng"> 
                                    </div>   
                                    <div class="error" id="errorRoom"></div>
                                    <div class="input_text"> 
                                        <strong class="fs-4">Số tầng</strong> 
                                        <input type="number" name="floor" placeholder="Nhập số tầng">
                                    </div>
                                    <div class="error" id="errorFloor"></div>
                                    <div class="billing">
                                        <div class="input_text"> 
                                            <strong class="fs-4">Tỉnh, thành phố</strong> 
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
                                            <strong class="fs-4">Quận, phường</strong> 
                                            <select name="district"  id ="district" class="district"></select>
                                        </div>                         
                                    </div>
                                    <div class="input_text"> 
                                        <strong class="fs-4">Địa chỉ</strong> 
                                        <input type="text" name="address" placeholder="Nhập địa chỉ cụ thể"> 
                                    </div>
                                    <div class="error" id="errorAddress"></div>
                                    <div class="input_text"> 
                                        <strong class="fs-4">Giá thuê</strong>
                                        <input type="text" name="cost" placeholder="Nhập giá thuê"> 
                                    </div>
                                    <div class="error" id="errorCost"></div>
                                    <div class="input_text"> 
                                        <strong class="fs-4">Khoảng cách</strong> 
                                        <input type="text" name="distance" placeholder="Nhập khoảng cách"> 
                                    </div>
                                    <div class="error" id="errorDistance"></div>
                                    <div class="input_text"> 
                                        <strong class="fs-4">Mô tả</strong> 
                                        <textarea name="description" rows="5" style="width: 100%; margin-top: 10px" placeholder="Nhập mô tả"></textarea>
                                    </div>
                                    <div class="pay"> 
                                        <button type="submit" >Thêm nhà trọ</button>                  
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
            function validateAddHostel() {
                let isValid = true;
                const hostelName = document.addhostelForm.hostelName.value;
                const room = document.addhostelForm.room.value;
                const floor = document.addhostelForm.floor.value;
                const province = document.addhostelForm.province.value;
                const address = document.addhostelForm.address.value;
                const cost = document.addhostelForm.cost.value;
                const distance = document.addhostelForm.distance.value;
                const regex = /[+-]?([0-9]*[.])?[0-9]+/;
                const regex2 = /^[0-9]*$/;

                document.getElementById('errorName').innerText = ' ';
                document.getElementById('errorRoom').innerText = ' ';
                document.getElementById('errorFloor').innerText = ' ';
                document.getElementById('errorProvince').innerText = ' ';
                document.getElementById('errorAddress').innerText = ' ';
                document.getElementById('errorCost').innerText = ' ';
                document.getElementById('errorDistance').innerText = ' ';


                if (!hostelName) {
                    document.getElementById('errorName').innerText = 'Bạn phải nhập tên nhà trọ!';
                    isValid = false;
                }

                if (!room) {
                    document.getElementById('errorRoom').innerText = 'Bạn phải nhập số phòng!';
                    isValid = false;
                } else if (room <= 0) {
                    document.getElementById('errorRoom').innerText = 'Invalid!';
                    isValid = false;
                } else if (!regex2.test(room)) {
                    document.getElementById('errorRoom').innerText = 'Invalid!';
                    isValid = false;
                }

                if (!floor) {
                    document.getElementById('errorFloor').innerText = 'Bạn phải nhập số tầng!';
                    isValid = false;
                } else if (!regex2.test(floor)) {
                    document.getElementById('errorFloor').innerText = 'Invalid!';
                    isValid = false;
                } else if (floor <= 0) {
                    document.getElementById('errorFloor').innerText = 'Invalid!';
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
                    document.getElementById('errorCost').innerText = 'Bạn phải nhập giá thuê!';
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
                    document.getElementById('errorDistance').innerText = 'Invalid!';
                    isValid = false;
                } else if (distance <= 0) {
                    document.getElementById('errorDistance').innerText = 'Khoảng cách phải > 0 ';
                    isValid = false;
                }


                return isValid;

            }
        </script>
        <script>
            function clickImg() {
                var img1 = document.getElementById('output1').src;
//                var img2 = document.getElementById('output2').src;
//                var img3 = document.getElementById('output3').src;
//                var img4 = document.getElementById('output4').src;
//                var img5 = document.getElementById('output5').src;
//                var img6 = document.getElementById('output6').src;
                if (img1 == "") {
                    alert("Bạn phải thêm ảnh 1 đầu tiên");
                    return;

                }

            }

        </script>
    </body>
</html>
