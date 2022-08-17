<%@page import="model.Admin"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha1/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!DOCTYPE html> 
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/profileStyle.css">
        <link rel="stylesheet" href="css/pagingStyle.css">
    </head>
    <body class="bg-white">
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
        <div class="px-0 bg-white">
            <%@include file="/header.jsp" %> 
            <div class="d-md-flex">
                <ul id="navbar-items" class="p-3">
                    <%@include file="/sidebar.jsp" %>
                </ul>
                <form action="UpdateAdminProfile" enctype="multipart/form-data"  method="post" name="updateAdminForm" onsubmit="return checkSend()">
                    <div class="container rounded bg-white mt-5 mb-5">
                        <div class="row">
                            <div>
                                <ul class="breadcrumb bg-white">
                                    <li><a href="home.jsp">Home</a></li>
                                    <li><a href="UpdateAdminProfile">My Profile</a></li>                                    
                                </ul>
                            </div>

                            <div class="col-md-4">
                                <div class="d-flex flex-column align-items-center text-center p-3 py-5"><img class="rounded-circle mt-5" height="150px" width="150px" src="${UserAvatar}" id="output">
                                    <div class="form-group mt-3">                       
                                        <input style="padding-left: 80px" type="file" name="avatarImage" accept="image/*" onchange="loadFile(event)" class="form-control-file" id="avatarImg">
                                    </div>
                                    <div id="divCheckImg"></div>
                                    <span class="mt-2">${admin.email}</span><br>
                                    <a href="${admin.linkFb}" title="" target="_blank">My Facebook</a>
                                </div>
                            </div>
                            <div class="col-md-8">
                                <div class="p-3 py-5">
                                    <div class="d-flex justify-content-between align-items-center mb-3">
                                        <h4 class="text-right">My Profile</h4>
                                    </div>
                                    <div class="row mt-2">
                                        <input name="id" value="${admin.adminID}" hidden="">
                                        <div class="col-md-6"><label class="labels">First Name</label><input type="text" name="firstName" class="form-control" value="${admin.firstName}" ></div>
                                        <div class="col-md-6"><label class="labels">Last Name</label><input type="text" name="lastName" class="form-control" value="${admin.lastName}" ></div>
                                    </div>
                                    <div class="row mt-3">
                                        <div class="col-md-12"><label class="labels">Age</label><input type="number" name="age" class="form-control"value="${admin.age}" ></div>
                                        <div id="divCheckAge"></div>
                                        <div class="col-md-12"><label class="labels">Mobile Number</label><input type="text" name="phone" class="form-control" value="${admin.phone}" ></div>
                                        <div id="divCheckPhone"></div>
                                        <div class="col-md-12"><label class="labels">Email</label><input type="text" class="form-control" readonly="" value="${admin.email}" ></div>
                                        <div class="col-md-12"><label class="labels">Link Facebook</label><input type="text" class="form-control" name="linkFb" value="${admin.linkFb}" ></div>
                                        <div class="col-md-12"><label class="labels">Giới tính</label></br>
                                            <label class="labels" id="genderlable" hidden="">${admin.gender}</label>
                                            <input class="form-check-input" type="radio" name="gender"  id="inlineRadio1" value="1"> Nam
                                            <input class="form-check-input" type="radio" name="gender"  id="inlineRadio2" value="0"> Nữ                                            
                                        </div>
                                    </div>

                                    <div class="col-md-12">
                                        <label class="labels" for="cars">Tỉnh, thành phố</label>
                                        <select name="province" id="province" class="province form-select" onchange>
                                            <option value="">Select Province</option>
                                            <c:forEach items ="${listProvince}" var="o">
                                                <option value="${o.provinceID}" 

                                                        <c:if test = "${admin.provinceID == o.provinceID }">
                                                            selected="selected"
                                                        </c:if>    >${o.provinceName}</option>

                                            </c:forEach>
                                        </select>
                                    </div>
                                    <div class="error" id="errorProvince"></div> 
                                    <div class="col-md-12">
                                        <label class="labels" for="cars">Quận, phường</label>
                                        <select name="district"  id ="district" class="district form-select">
                                            <c:forEach items ="${listDistrict}" var="o">
                                                <option value="${o.districtID}" 
                                                        <c:if test = "${admin.districtID == o.districtID }">
                                                            selected="selected"
                                                        </c:if>    >${o.districtName}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                    <div class="col-md-12"><label class="labels">Address Detail</label><input type="text" name="addressDetail" class="form-control"value="${admin.address}" ></div>
                                </div>
                                <div class="mt-5 text-center">
                                    <button class="btn btn-primary profile-button" type="submit" onclick="checkValidatorForUpdateAdminProfile()">Save Profile</button>
                                </div>
                                <label class="labels">${UpdateError}</label>
                                <label class="labels">${UpdateProcess}</label>
                            </div>
                        </div>
                    </div>
            </div>
        </form>
    </div>
</div>
<script>
            $(document).ready(function () {
    $(".toast").toast({delay: 4000});
            $(".toast").toast("show");
    });        </script>
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
            function validateUpdateAdmin() {
            let isValid = true;
                    const province = document.updateAdminForm.province.value;
                    document.getElementById('errorProvince').innerText = ' ';
                    if (!province) {
            document.getElementById('errorProvince').innerText = 'Bạn phải chọn tỉnh!';
                    isValid = false;
            }
            return isValid;
            }
</script>

<script>
    var loadFile = function (event) {
    var output = document.getElementById('output');
            output.src = URL.createObjectURL(event.target.files[0]);
            output.onload = function () {
            URL.revokeObjectURL(output.src) // free memory
            }
    };
</script>
<%@include file="/footer.jsp" %>
</html>
