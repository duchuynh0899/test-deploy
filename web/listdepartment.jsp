<%-- 
    Document   : listdepartment
    Created on : Jun 18, 2022, 2:08:32 PM
    Author     : nguye
--%>
<script src="jquery/jquery.js"></script>
<script type="text/javascript" src='js/bootstrap.min.js'></script>
<link rel="stylesheet" href="css/bootstrap.css" />
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha1/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!DOCTYPE html> 
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/viewListStyle.css">
        <link rel="stylesheet" href="css/pagingStyle.css">
        <link rel="stylesheet" href="css/departmentStyle.css">
    </head>
    <body>
        <%@include file="/header.jsp" %>
        <div class="bg-white">
            <div class="d-flex nav-item main-home col-md-12">
                <ul id="navbar-items" class="col-md-2">
                    <%@include file="/sidebar.jsp" %>
                </ul>
                <div id="topnavbar" class="col-md-10">
                    <div class="d-flex align-items-center mb-3 mt-5 px-md-3 px-2 justify-content-center"> 
                        <form class="example d-flex align-items-center" action="department" method="post"> 
                            <input type="text" placeholder="" name="key" value="${key}"> 
                            <button type="submit"><i class="fa fa-search"></i></button> 
                        </form>
                    </div>
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-12 mt-5 mb-5">
                                <div>
                                    <ul class="breadcrumb">
                                        <li><a href="home.jsp">Trang chủ</a></li>
                                        <li><a>Danh sách Phòng Ban</a></li>
                                    </ul>
                                </div>
                           
                                <ul class="list-group shadow">
                                    <c:forEach items="${listDepPaging}" var="d" >
                                        <li class="list-group-item">
                                            <div class="d-flex media align-items-lg-center flex-column flex-lg-row p-2">
                                                <div class="col-md-3 media-body order-2 order-lg-1 image">
                                                    <img src="${d.img1}" alt="Generic placeholder image">
                                                </div>
                                                <div class="col-md-8 media-body order-2 order-lg-1 description ml-5" id="description">
                                                    <div>
                                                        <h4 class="font-weight-bold mb-3">
                                                            <a href="detaildepartment?id=${d.depId}" style="text-decoration: none; font-weight: bold">${d.depName}</a>
                                                        </h4>
                                                    </div>
                                                    <div>
                                                        <p style="font-size: 18px">${d.shortdes}</p>
                                                    </div>
                                                </div>
                                            </div> 
                                        </li> 
                                    </c:forEach>
                                </ul> 
                                <div class="clearfix">
                                    <ul class="pagination">
                                        <c:if test="${tag>1}">
                                            <li class="page-item disabled"><a href="department?index=${tag-1}&key=${key}">Previous</a></li>
                                            </c:if>
                                            <c:forEach begin="1" end="${endP}" var="i">
                                            <li class="page-item ${tag==i?"active":""}"><a href="department?index=${i}&key=${key}" class="page-link">${i}</a></li>
                                            </c:forEach>
                                            <c:if test="${tag<endP}">
                                            <li class="page-item"><a href="department?index=${tag+1}&key=${key}" class="page-link">Next</a></li>
                                            </c:if>
                                    </ul>
                                </div> 

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%@include file="/footer.jsp" %>
    </body>
</html>
