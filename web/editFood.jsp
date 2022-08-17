<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!--<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">-->
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
    <body class="bg-white">
        <div class="px-0">
            <%@include file="/header.jsp" %> 
            <div class="d-flex nav-item main-home">
                <ul id="navbar-items">
                    <%@include file="/sidebar.jsp" %>
                </ul>
                <div class="container rounded bg-white mt-5 mb-5">
                    <div class="col-xl-12 mb-5">
                        <div>
                            <ul class="breadcrumb bg-white">

                                <li><a href="home.jsp">Trang chủ</a></li>
                                <li><a href="ListRestaurantBySeller">Nhà hàng của tôi</a></li>
                                <li><a href="AddFoodController?id=${restaurantId}">Menu của tôi</a></li>
                                <li><a>Chi tiết món ăn</a></li>
                            </ul>
                        </div>
                        <div class="card">
                            <form class="form" method="POST" id="updateForm" action="EditFoodController"  name="editFoodForm" onsubmit="return validateFood()" enctype="multipart/form-data">
                                <div class="input_text" hidden>
                                    <input type="text" name="foodId" value="${food.foodID}" hidden>
                                </div>
                                <div class="left-side">
                                    <div class="mt-5">
                                        <input type="file" accept="image/*" onchange="loadFile(event)" name ="foodImage" id="file1">
                                        <label for="file1" style="position: absolute; margin-left: 70px; margin-top: 65px; opacity: 50%">+</label>
                                        <img id="Url1" name="Url1" width="170px" height="170px"
                                             <c:if test="${food.imageURL != null}">
                                                 src="${food.imageURL}" </c:if>/>
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
                                        <c:if test="${food.imageURL != null}">
                                            <a id="U1" class ="Url1" style="position: absolute; margin-left: -20px; text-decoration: none" href="deleteFoodImage?foodId=${food.foodID}&url=Url1">X</a>
                                        </c:if>


                                    </div> 


                                </div>

                                <div class="right-side">
                                    <h3>Mô tả món ăn</h3>
                                    <div class="input_text"> <input type="text" name="foodName" value="${food.foodName}"><span>Tên món ăn</span> </div>
                                    <div class="error" id="errorName"></div>
                                    <div class="input_text"> <input type="text" name="costFood" value="${food.cost}"> <span>Giá dao động</span> 
                                        <div class="error" id="errorCost"></div></div>
                                    <div> <span>Mô tả</span> 
                                        <textarea style="width: 100%; margin-top: 10px" type="text" name="desFood">
                                            ${food.descriptions}
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

                                                 });
        </script>
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
            });
            

        </script>
        <script>
            function reset() {
                location.reload();
            }

        </script>

        <script>
            function validateFood() {
                let isValid = true;
                const foodName = document.editFoodForm.foodName.value;
                const costFood = document.editFoodForm.costFood.value;
                const regex = /[+-]?([0-9]*[.])?[0-9]+/;
                const regex2 = /^[0-9]*$/;
                document.getElementById('errorName').innerText = ' ';
                document.getElementById('errorCost').innerText = ' ';
                if (!foodName) {
                    document.getElementById('errorName').innerText = 'Bạn phải nhập tên món ăn!';
                    isValid = false;
                }
                if (!costFood) {
                    document.getElementById('errorCost').innerText = 'Bạn phải nhập giá của món ăn!';
                    isValid = false;
                } else if (!regex.test(distance)) {
                    document.getElementById('errorCost').innerText = 'Giá trị nhập không đúng. Giá tiền phải là số!';
                    isValid = false;
                } else if (distance <= 0) {
                    document.getElementById('errorCost').innerText = 'Giá tiền phải > 0 ';
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
    </body>
    <%@include file="/footer.jsp" %>
</html>