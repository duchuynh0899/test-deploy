<%-- 
    Document   : header
    Created on : Jun 21, 2022, 11:55:08 PM
    Author     : asus
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <header>
        <meta charset="utf-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"></script>
        <link rel="stylesheet" href="css/viewListStyle.css">
        <link rel="stylesheet" href="css/style1.css">
    </header>
    <body>
        <div class="main_header col-md-12 d-flex">
            <div class="align-items-center left_box1 col-md-2"> 
                <button class="navbar-toggler bg-primary-light" type="button" data-bs-toggle="collapse" data-bs-target="#navbar-items" aria-controls="navbarSupportedContent" aria-expanded="true" aria-label="Toggle navigation"> 
                    <span class="fas fa-bars"></span> 
                </button> 
                <a class="text-decoration-none bg-home-light fs14 ps-2" href="home.jsp">
                    FCS<span class="fs13 pe-2">.com</span>
                </a> 
            </div>
            <div class="topnav_header col-md-10 d-flex">
                <%if (Integer.parseInt(request.getSession().getAttribute("role").toString()) == 1) {%>
                <a href="SellerListController?status=3&gender=3">
                    <i class="fas fa-user-tie"></i>
                    <span>CHỦ KINH DOANH</span>
                </a>  
                <a href="StudentListController?status=3&gender=3">
                    <i class="fas fa-user-graduate"></i>
                    <span>SINH VIÊN</span>
                </a> 
                <a href="ListAllReportHostelController">
                    <i class="fas fa-bell"></i>
                    <span>BÁO CÁO NHÀ TRỌ</span>
                </a>
                <a href="ListAllReportRestaurantController">
                    <i class="fas fa-bell"></i>
                    <span>BÁO CÁO NHÀ ĂN</span>
                </a>

                <%} else if (Integer.parseInt(request.getSession().getAttribute("role").toString()) == 3) {%>
                <a class="ml-5" href="hostellist">
                    <i class="fas fa-bed mr-3"></i>
                    <span>NHÀ TRỌ CỦA TÔI</span>
                </a>  
                <a class="ml-5" href="ListRestaurantBySeller">
                    <i class="fas fa-utensils mr-3"></i>
                    <span>NHÀ ĂN CỦA TÔI</span>
                </a>  

                <%} else if (Integer.parseInt(request.getSession().getAttribute("role").toString()) == 2) {%>
                <a class="ml-5" href="FilterRestaurantController">
                    <i class="fas fa-utensils mr-3"></i>
                    <span>NHÀ ĂN</span>
                </a>  
                <a class="ml-5" href="FilterHostelController">
                    <i class="fas fa-bed mr-3"></i>
                    <span>NHÀ TRỌ</span>
                </a>
                <%} else if (Integer.parseInt(request.getSession().getAttribute("role").toString()) == 4) {%>
                <a class="ml-5" href="AllEventByClub">
                    <i class="fas fa-chalkboard-teacher mr-3"></i>
                    <span>QUẢN LÝ SỰ KIỆN</span>
                </a>  
                <%}%>
                <div class="dropdownProfile ddf">    
                    <button class="dropdown-toggle mt-3" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        ${sessionScope.username}
                    </button>
                    <div class="dropdown-menu dropdown_menu_header" style="position: inherit" aria-labelledby="dropdownMenuButton">
                        <%if (Integer.parseInt(request.getSession().getAttribute("role").toString()) == 3) {%>
                        <a class="dropdown-item" href="UpdateSellerProfile">
                            HỒ SƠ CỦA TÔI
                        </a>
                        <%} else if (Integer.parseInt(request.getSession().getAttribute("role").toString()) == 2) {%>
                        <a class="dropdown-item" href="UpdateStudentProfile">
                            HỒ SƠ CỦA TÔI
                        </a>
                        <%} else if (Integer.parseInt(request.getSession().getAttribute("role").toString()) == 1) {%>
                        <a class="dropdown-item" href="UpdateAdminProfile">
                            HỒ SƠ CỦA TÔI
                        </a>
                        <%} else if (Integer.parseInt(request.getSession().getAttribute("role").toString()) == 4) {%>
                            <a class="dropdown-item" href="UpdateClubProfile">
                                <i class="fas fa-id-card-o"></i>HỒ SƠ CỦA TÔI
                            </a>
                        <%}%>
                        <a class="dropdown-item" href="ChangePasswordServlet">
                            ĐỔI MẬT KHẨU
                        </a>
                        <a class="dropdown-item" href="LogoutServlet">
                            ĐĂNG XUẤT
                            <i class="fas fa-sign-out"></i>
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>