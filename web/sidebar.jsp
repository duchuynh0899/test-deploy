<%-- 
    Document   : sidebar
    Created on : Jul 10, 2022, 11:54:58 AM
    Author     : asus
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <link rel="stylesheet" href="css/viewListStyle.css">
    </head>
    <body>
        <div class="main-sb">
            <ul>
                <%if (Integer.parseInt(request.getSession().getAttribute("role").toString()) == 1) {%>
                <li> 
                    <a class="bg-hostel-light fs12 ps-3" href="FilterRestaurantController">
                        <span class="fas fa-utensils mr-4"></span> 
                        <span>NHÀ ĂN</span>
                    </a>  
                </li>
                <li> 

                    <a class="bg-hostel-light fs12 ps-3" href="FilterHostelController">
                        <span class="fas fa-bed mr-3"></span> 
                        <span>NHÀ TRỌ</span>
                    </a> 
                </li>
                <li> 
                    <a class="bg-hostel-light fs12 ps-3" href="ClubListController">
                        <span class="fas fa-user-friends mr-3"></span>
                        <span>CÂU LẠC BỘ</span> 
                    </a> 
                <li> 
                    <a class="bg-hostel-light fs12 ps-3" href="BusPagingServlet">
                        <span class="fas fa-bus mr-3"></span> 
                        <span>XE BUS</span>
                    </a> 
                </li>
                <li> 

                    <a class="bg-hostel-light fs12 ps-3" href="department">
                        <span class="fas fa-graduation-cap mr-3"></span> 
                        <span>PHÒNG BAN</span>
                    </a> 
                </li>

                <%} else if (Integer.parseInt(request.getSession().getAttribute("role").toString()) == 3) {%>
                <li> 
                    <a class="bg-hostel-light fs12 ps-3" href="FilterRestaurantController">
                        <span class="fas fa-utensils mr-4"></span> 
                        <span>NHÀ ĂN</span>
                    </a>  
                </li>
                <li> 
                    <a class="bg-hostel-light fs12 ps-3" href="FilterHostelController">
                        <span class="fas fa-bed mr-3"></span> 
                        <span>NHÀ TRỌ</span>
                    </a> 
                </li>
                <%} else if (Integer.parseInt(request.getSession().getAttribute("role").toString()) == 2) {%>
                <li> 
                    <a class="bg-hostel-light fs12 ps-3" style="text-decoration: none; color: rgb(238, 77, 45)" href="ClubListController">
                        <span class="fas fa-user-friends mr-3"></span>
                        <span>CÂU LẠC BỘ</span>
                    </a> 
                <li> 
                    <a class="bg-hostel-light fs12 ps-3" style="text-decoration: none; color: rgb(238, 77, 45)" href="BusPagingServlet">
                        <span class="fas fa-bus mr-3"></span> 
                        <span>XE BUS</span>
                    </a> 
                </li>
                <li> 
                    <a class="bg-hostel-light fs12 ps-3" style="text-decoration: none; color: rgb(238, 77, 45)" href="department">
                        <span class="fas fa-graduation-cap mr-3"></span> 
                        <span>PHÒNG BAN</span>
                    </a> 
                </li>
                <%} else if (Integer.parseInt(request.getSession().getAttribute("role").toString()) == 4) {%>
                <%}%>
            </ul>
        </div>
    </body>
</html>
