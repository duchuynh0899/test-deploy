<%-- 
    Document   : listbus
    Created on : Jun 18, 2022, 10:25:42 AM
    Author     : longn
--%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Bus"%>
<%@page import="dao.BusDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha1/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/viewListStyle.css">
        <link rel="stylesheet" href="css/busStyle.css">
        <link rel="stylesheet" href="css/pagingStyle.css">
    </head>
    <body>
        <%@include file="/header.jsp" %>
        <div class="bg-white">
            <div class="d-flex nav-item main-home col-md-12">
                <ul id="navbar-items" class="col-md-2">
                    <%@include file="/sidebar.jsp" %>
                </ul>
                <div id="topnavbar" class="col-md-10">
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-12 mt-5">
                                <div>
                                    <ul class="breadcrumb">
                                        <li><a href="home.jsp">Trang chủ</a></li>
                                        <li><a>Danh sách xe Bus</a></li>
                                    </ul>
                                </div>
                                <ul class="list-group shadow">
                                    <%
                                        BusDAO bd = new BusDAO();
                                        ArrayList<Bus> listBus = (ArrayList<Bus>) request.getAttribute("listBusPaging");

                                    %>
                                    <%                                        for (Bus b : listBus) {%>
                                    <li class="list-group-item">
                                        <div class="d-flex media align-items-lg-center flex-column flex-lg-row p-1">
                                            <div class="col-md-3 media-body order-2 order-lg-1 image">
                                                <img src="<%=b.getUrl1()%>" alt="Generic placeholder image">
                                            </div>
                                            <div class="col-md-8 media-body order-2 order-lg-1 description ml-5" id="description">
                                                <h5 class="mt-0 font-weight-bold mb-2">
                                                    <a href="BusDetailServlet?number=<%=b.getNumber()%>" style="text-decoration: none; font-weight: bold">Xe <%=b.getNumber()%></a>
                                                </h5>
                                                <p style="font-size: 18px"><%=b.getShortDes()%></p>
                                            </div>
                                        </div> 
                                    </li> 
                                    <%}%>
                                </ul> 
                                <div class="clearfix">
                                    <ul class="pagination mb-5">
                                        <c:if test="${tag>1}">
                                            <li class="page-item disabled"><a href="BusPagingServlet?index=${tag-1}">Previous</a></li>
                                            </c:if>
                                            <c:forEach begin="1" end="${endP}" var="i">
                                            <li class="page-item ${tag==i?"active":""}"><a href="BusPagingServlet?index=${i}" class="page-link">${i}</a></li>
                                            </c:forEach>
                                            <c:if test="${tag<endP}">
                                            <li class="page-item"><a href="BusPagingServlet?index=${tag+1}" class="page-link">Next</a></li>
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
