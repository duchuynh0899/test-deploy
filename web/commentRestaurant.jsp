<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <link rel="stylesheet" href="css/commentStyle.css" />
        <link rel="stylesheet" href="css/pagingStyle.css">
        <style>
            .rating_heading{
                animation: scale-up 1s ease;
                font-weight:  bold;
                color: orange;
            }
            @keyframes scale-up{
                0%{
                    opacity: 0;
                    transform: scale(.5);
                }
                100%{
                    opacity: 1;
                    transform: scale(1);
                }
            }

            .star_rating {
                user-select: none;
                /*                background-color: #e6e6e6;*/
                padding: 1rem 2rem;
                margin: 1rem;
                border-radius: .3rem;
                animation: slide-up 1s ease;
                text-align: center;
            }
            @keyframes slide-up{
                0%{
                    opacity: 0;
                    transform: translateY(50px);
                }
                100%{
                    opacity: 1;
                    transform: translateY(0px);
                }
            }
            .star {
                font-size: 3rem;
                color: #ff9800;
                background-color: unset;
                border: none;
                text-align: center;

            }
            .star:hover{
                cursor: pointer;   
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
                <div id="topnavbar" class="col-md-10">
                    <div class="col-md-12 mb-5 mt-5">
                        <div>
                            <ul class="breadcrumb">
                                <li><a href="home.jsp">Trang ch???</a></li>
                                <li><a href="FilterHostelController">Danh s??ch nh?? ??n</a></li>
                                <li><a>Chi ti???t nh?? ??n</a></li>
                                <li><a>????nh gi?? nh?? ??n</a></li>
                            </ul>
                        </div>
                        <input id="restaurantId" value="${restaurantID}" hidden/>
                        <div class="container mt-5">
                            <div class="d-flex justify-content-center row">
                                <div class="col-md-8" style="min-width: 100%">
                                    <div class="row" style="background-color: #ffffff">
                                        <div class="d-flex flex-column comment-section">
                                            <h3 class="rating_heading">????nh gi?? 5 sao</h3>
                                            <div class ="star_rating">
                                                <p style="font-weight:  bold; font-size: 30px">C???m nh???n c???a b???n v??? nh?? h??ng n??y?</p>
                                                <c:if test="${studentComment == null}">
                                                    <button class="star" id="star1"  value="1">&#9734;</button>
                                                    <button class="star" id="star2"  value="2">&#9734;</button>
                                                    <button class="star" id="star3"  value="3">&#9734;</button>
                                                    <button class="star" id="star4"  value="4">&#9734;</button>
                                                    <button class="star" id="star5"  value="5">&#9734;</button>
                                                    <p class="current_rating">0 tr??n 5</p>
                                                </c:if> 
                                                <c:if test="${studentComment.starvoting == 1}">
                                                    <button class="star" id="star1"  value="1">&#9733;</button>
                                                    <button class="star" id="star2"  value="2">&#9734;</button>
                                                    <button class="star" id="star3"  value="3">&#9734;</button>
                                                    <button class="star" id="star4"  value="4">&#9734;</button>
                                                    <button class="star" id="star5"  value="5">&#9734;</button>
                                                    <p class="current_rating">1 tr??n 5</p>
                                                </c:if>   
                                                <c:if test="${studentComment.starvoting  == 2}">
                                                    <button class="star" id="star1"  value="1">&#9733;</button>
                                                    <button class="star" id="star2"  value="2">&#9733;</button>
                                                    <button class="star" id="star3"  value="3">&#9734;</button>
                                                    <button class="star" id="star4"  value="4">&#9734;</button>
                                                    <button class="star" id="star5"  value="5">&#9734;</button>
                                                    <p class="current_rating">2 tr??n 5</p>
                                                </c:if>  
                                                <c:if test="${studentComment.starvoting  == 3}">
                                                    <button class="star" id="star1"  value="1">&#9733;</button>
                                                    <button class="star" id="star2"  value="2">&#9733;</button>
                                                    <button class="star" id="star3"  value="3">&#9733;</button>
                                                    <button class="star" id="star4"  value="4">&#9734;</button>
                                                    <button class="star" id="star5"  value="5">&#9734;</button>
                                                    <p class="current_rating">3 tr??n 5</p>
                                                </c:if>  
                                                <c:if test="${studentComment.starvoting == 4}">
                                                    <button class="star" id="star1"  value="1">&#9733;</button>
                                                    <button class="star" id="star2"  value="2">&#9733;</button>
                                                    <button class="star" id="star3"  value="3">&#9733;</button>
                                                    <button class="star" id="star4"  value="4">&#9733;</button>
                                                    <button class="star" id="star5"  value="5">&#9734;</button>
                                                    <p class="current_rating">4 tr??n 5</p>
                                                </c:if>  
                                                <c:if test="${studentComment.starvoting == 5}">
                                                    <button class="star" id="star1"  value="1">&#9733;</button>
                                                    <button class="star" id="star2"  value="2">&#9733;</button>
                                                    <button class="star" id="star3"  value="3">&#9733;</button>
                                                    <button class="star" id="star4"  value="4">&#9733;</button>
                                                    <button class="star" id="star5"  value="5">&#9733;</button>
                                                    <p class="current_rating">5 tr??n 5</p></div>
                                                </c:if>  
                                            <div class="p-2">
                                                <div class="d-flex flex-row align-items-start">
                                                    <img class="rounded-circle" src=" ${studentComment.studentAvatar}" width="40">
                                                    <textarea class="form-control ml-1 shadow-none textarea" id="message" > ${studentComment.message}</textarea>
                                                </div>
                                                <div class="mt-2 text-right">
                                                    <button class="btn btn-primary btn-sm shadow-none" onclick="postComment()" type="button">Post comment</button>
                                                    <button class="btn btn-outline-primary btn-sm ml-1 shadow-none" type="button">Cancel</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%@include file="/footer.jsp" %>
        <script>
            const allStars = document.querySelectorAll('.star');
            let current_rating = document.querySelector('.current_rating');

            allStars.forEach((star, i) => {
                star.onclick = function () {
                    let current_star_level = i + 1;
                    current_rating.innerText = current_star_level + ' tr??n 5 ';
                    allStars.forEach((star, j) => {
                        if (current_star_level >= j + 1) {
                            star.innerHTML = '&#9733';
                        } else {
                            star.innerHTML = '&#9734';
                        }
                    })
                }
            });



        </script>  
        <script>

            function postComment() {
                var restaurantId = document.getElementById("restaurantId").value;
                var x = document.getElementById("message").value;
                var u = 0;
                allStars.forEach((star, i) => {
                    if (star.textContent != "???") {
                        u++;
                    }

                });

                if (u == 0) {
                    alert("Vui l??ng x???p h???ng nh?? tr???!");
                    return;
                } else {
                    $.ajax({
                        type: "POST",

                        url: "/Test_1/starRestaurant",
                        data: {
                            restaurantId: restaurantId,
                            star: u,
                            message: x
                        },
                        headers: {
                            Accept: "application/json; charset=utf-8",
                            contentType: "application/json; charset=utf-8"
                        },

                        success: function (data) {

                            alert('C???m ??n b???n ???? ????nh gi?? nh?? h??ng!');
                            window.location = "/Test_1/RestaurantListController?id=" + restaurantId;
                        },
                        error: function (e) {
                            console.log("ERROR: ", e);
                        }
                    });
                }
            }


            $(".btnSave").click(function () {
                var restaurantId = document.getElementById("restaurantId").value;
                var i = 0;
                allStars.forEach((star, i) => {
                    i++;
                });
                alert(i);
                $.ajax({
                    type: "POST",

                    url: "/Test_1/starRestaurant",
                    data: {
                        restaurantId: restaurantId,
                        star: 5,
                    },
                    headers: {
                        Accept: "application/json; charset=utf-8",
                        contentType: "application/json; charset=utf-8"
                    },

                    success: function (data) {

                        alert(data);
                    },
                    error: function (e) {
                        console.log("ERROR: ", e);
                    }
                });
            });
        </script>
    </body>
    <<<<<<< HEAD
</html>
=======

</html>
>>>>>>> e97cb61cc179d4a750c9c8828f5d5754f7166038
