<%@page import="model.Club"%>
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
                <form action="UpdateClubProfile" enctype="multipart/form-data"  method="post" >
                    <div class="container rounded bg-white mt-5 mb-5">
                        <div class="row">
                            <div>
                                <ul class="breadcrumb bg-white">
                                    <li><a href="home.jsp">Home</a></li>
                                    <li><a href="UpdateClubProfile">My Club Profile</a></li>                                    
                                </ul>
                            </div>
                            <div class="col-md-4">
                                <div class="d-flex flex-column align-items-center text-center p-3 py-5"><img class="rounded-circle mt-5" width="150px" src="${UserAvatar}" id="output">
                                    <div class="form-group mt-3">                       
                                        <input style="padding-left: 80px" type="file" name="avatarImage" accept="image/*" onchange="loadFile(event)" class="form-control-file" id="avatarImg">
                                    </div>
                                    <div id="divCheckImg"></div>
                                    <span class="mt-2">${club.email}</span><br>
                                    <a href="${club.facebook}" title="" target="_blank">My Facebook</a>
                                </div>
                            </div>
                            <div class="col-md-8">
                                <div class="p-3 py-5">
                                    <div class="d-flex justify-content-between align-items-center mb-3">
                                        <h4 class="text-right">My Club Profile</h4>
                                    </div>
                                    <div class="row mt-2">
                                        <input name="id" value="${club.clubID}" hidden="">
                                        <div class="col-md-6"><label class="labels">Tên CLB</label><input type="text" name="clubName" class="form-control" value="${club.clubName}" ></div>
                                        <div class="col-md-6"><label class="labels">Chủ Nghiệm CLB</label><input type="text" name="clubPresident" class="form-control" value="${club.clubPresident}" ></div>
                                    </div>
                                    <div class="row mt-3">
                                        <div class="col-md-12"><label class="labels">Email</label><input type="text" class="form-control" readonly="" value="${club.email}" ></div>
                                        <div class="col-md-12"><label class="labels">Link Facebook</label><input type="text" class="form-control" name="linkFb" value="${club.facebook}" ></div>
                                    </div>

                                    <div class="col-md-12"><label class="labels">Mô Tả</label><input type="text" name="description" class="form-control"value="${club.des}" ></div>
                                </div>
                                <div class="mt-5 text-center">
                                    <button class="btn btn-primary profile-button" type="submit" onclick="checkValidatorForUpdateProfile()" >Save Profile</button>
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
    });</script>
</body>
<script src="validator/Validator.js"></script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
    src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
crossorigin="anonymous"></script>


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
