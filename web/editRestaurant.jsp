<%-- 
    Document   : edithostel
    Created on : Jul 17, 2022, 4:23:34 PM
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
        <style>
            .error {
                color: red;
            }
            .message {
                color: green;

            }
        </style>
    </head>
    <body>
        <div class="px-0">
            <c:choose>
                <c:when test="${stt.equals('1')}">
                    <div class="position-fixed bottom-0 end-0 p-3" style="right: 10px; bottom: 10px; z-index: 11">
                        <div class="toast" data-autohide="true">
                            <div class="toast-header bg-success">
                                <strong class="mr-auto text-white"><h4>Chỉnh Sửa Nhà Hàng Thành Công</h4></strong>
                                <button type="button" class="ml-2 mb-1 close" data-dismiss="toast">&times;</button>
                            </div>
                            <div class="toast-body">
                                Chỉnh sửa nhà hàng thành công !
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
                    <div class="container rounded bg-white mt-5 mb-5 col-md-10">
                        <div class="col-xl-12 mb-5">
                            <div>
                                <ul class="breadcrumb bg-white">
                                    <li><a href="home.jsp">Trang chủ</a></li>
                                    <li><a href="ListRestaurantBySeller">Nhà hàng của tôi</a></li>
                                    <li><a>Chi tiết nhà hàng</a></li>
                                </ul>
                            </div>
                            <div class="card">
                                <form class="form" method="POST" id="updateForm" action="EditRestaurantController"  name="editRestaurantForm" onsubmit="return validateRestaurant()" enctype="multipart/form-data">
                                    <div class="input_text" hidden>
                                        <input type="text" name="id" value="${restaurant.restaurantID}" hidden>
                                    </div>
                                    <div class="left-side">
                                        <div class="left_top">
                                            <strong class="fs-3">Ảnh nhà ăn</strong>
                                        </div>
                                        <div class="mt-3">
                                            <input type="file" accept="image/*" onchange="loadFile(event)" name ="restaurantImage" id="file1">
                                            <label for="file1" style="position: absolute; margin-left: 70px; margin-top: 65px; opacity: 50%">+</label>
                                            <img id="Url1" name="Url1" width="100%" height="100%"
                                                 <c:if test="${restaurant.restaurantImage != null}">
                                                     src="${restaurant.restaurantImage}" </c:if>/>
                                                 <script>
                                                     var loadFile = function (event) {
                                                         var output = document.getElementById('Url1');
                                                         output.src = URL.createObjectURL(event.target.files[0]);
                                                         output.style.width = "170px";
                                                         output.style.height = "170px";
                                                         output.onload = function () {
                                                             URL.revokeObjectURL(output.src) // free memory
                                                         }
                                                     };
                                                 </script>
                                            <c:if test="${restaurant.restaurantImage != null}">
                                                <a id="U1" class ="Url1" style="position: absolute; margin-left: -20px; text-decoration: none" href="deleteimgres?id=${restaurant.restaurantID}&url=Url1">X</a>
                                            </c:if>
                                        </div> 
                                    </div>

                                    <div class="right-side">
                                        <h3>Mô tả nhà hàng</h3>
                                        <div class="input_text"> <input type="text" name="restaurantName" value="${restaurant.restaurantName}"> <span>Tên nhà trọ</span> </div>
                                        <div class="error" id="errorName"></div>


                                        <div class="billing">
                                            <div class="input_text"> 
                                                <span>Tỉnh, thành phố</span> 
                                                <select name="province" id="province" class="province">
                                                    <option value="">Select Province</option>
                                                    <c:forEach items ="${listProvince}" var="o">
                                                        <option value="${o.provinceID}" 
                                                                <c:if test = "${restaurant.provinceName == o.provinceName }">
                                                                    selected="selected"
                                                                </c:if>    >${o.provinceName}</option>
                                                    </c:forEach>
                                                </select>
                                            </div>                         
                                        </div>
                                        <div class="error" id="errorProvince"></div>
                                        <div class="billing">
                                            <div class="input_text"> 
                                                <span>Quận, phường</span> 
                                                <select name="district"  id ="district" class="district">
                                                    <c:forEach items ="${listDistrict}" var="o">
                                                        <option value="${o.districtID}" 
                                                                <c:if test = "${restaurant.districtName == o.districtName }">
                                                                    selected="selected"
                                                                </c:if>    >${o.districtName}</option>
                                                    </c:forEach>
                                                </select>
                                            </div>                         
                                        </div>
                                        <div class="input_text"> <input type="text" name="address" value="${restaurant.address}"> <span>Địa chỉ</span> 
                                            <div class="error" id="errorAddress"></div></div>
                                        <div class="input_text"> <input type="text" name="cost" value="${restaurant.cost}"> <span>Giá dao động</span> 
                                            <div class="error" id="errorCost"></div></div>
                                        <div class="input_text"> <input type="text" name="distance" value="${restaurant.distance}"> <span>Khoảng cách</span> 
                                            <div class="error" id="errorDistance"></div></div>
                                        <div> <span>Mô tả</span> 
                                            <textarea style="width: 100%; margin-top: 10px" type="text" name="description">
                                                ${restaurant.description}
                                            </textarea>
                                        </div>
                                        <div class="pay"> 
                                            <button type="submit">Save</button> 
                                            <button style="margin-top: 5px" type="reset">Reset </button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%@include file="/footer.jsp" %>

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
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
            $("#U1").click(function (event) {
                event.preventDefault();
                $.ajax({
                    url: $(this).attr('href'),
                    success: function (response) {
                        var output = document.getElementById(response);
                        output.removeAttribute('src');
                        $("." + response).remove();
                        output.onload = function () {
                            URL.revokeObjectURL(output.src) // free memory
                        }


                    }
                });
                return false; // for good measure
            });</script>
        <script>
            function reset() {
                location.reload();
            }

        </script>

        <script>
            function validateRestaurant() {
                let isValid = true;
                const hostelName = document.editRestaurantForm.restaurantName.value;
                const province = document.editRestaurantForm.province.value;
                const address = document.editRestaurantForm.address.value;
                const cost = document.editRestaurantForm.cost.value;
                const distance = document.editRestaurantForm.distance.value;
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

        <script
            src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
            crossorigin="anonymous">
        </script>
        <script>
            $(document).ready(function () {
                $(".toast").toast({delay: 4000});
                $(".toast").toast("show");

            });
        </script>
    </body>
</html>