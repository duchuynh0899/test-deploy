<%-- 
    Document   : report
    Created on : Aug 7, 2022, 10:56:29 PM
    Author     : dung
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://unpkg.com/tailwindcss@^2/dist/tailwind.min.css">
        <script src="https://cdn.jsdelivr.net/gh/alpinejs/alpine@v2.x.x/dist/alpine.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="css/reportStyle.css" />
    </head>
    <body>
        <div class="min-h-screen flex justify-center items-center bg-indigo-300 ">
            <div class="h-auto w-96 font-sans px-4 rounded-lg bg-white ">
                <div class="main">
                    <div class="flex justify-center items-center mt-3">
                        <span class="h-20 w-20"><img src="https://imgur.com/4Y88KnF.gif"></span>
                    </div>
                    <p class="text-center mt-4 text-2xl font-semibold">Report a Problem </p>
                    <p class="text-center mt-1 text-sm text-gray-600 font-semibold">This purchase is on your card endeing in 0978</p>
                    <hr class="mt-3">
                    <p class="text-lg mt-3 text-red-600 font-semibold">HILTON HOTELS</p>
                    <p class="text-sm font-semibold">87324 Pennsylvania Ave</p>
                    <p class="text-sm font-semibold" >Portland, OR 10923</p>
                    <p class="text-lg mt-3 font-semibold">$447.02</p>
                    <div class="flex gap-7 items-center">
                        <p class="font-semibold">Purchased</p>
                        <p class="text-sm font-semibold">Sun,Aprill,02,2022</p>
                    </div>
                    <hr class="mt-3">
                    <div class="flex flex-col mt-3">
                        <div>
                            <input class="cursor-pointer" id="r1" type="radio" name="select" > 
                            <label for="r1">I didn't make this purchase.</label>
                        </div>
                        <div>
                            <input class="cursor-pointer" id="2" type="radio" name="select" >
                            <label> I made this purchase,but its wrong.</label>
                        </div>

                    </div>
                    <button class="continue mt-4 mb-10 h-12 w-full bg-green-400 rounded-lg hover:bg-green-700 text-white text-sm cursor-pointer transition-all">Continue</button>
                </div>



                <div class="main hidden">
                    <div class="relative flex justify-center items-center mt-3">
                        <span class="h-20 w-20"><img src="https://imgur.com/95raLM3.png"></span>
                        <i class="fa fa-arrow-left absolute left-0 top-2 cursor-pointer text-gray-400"></i>
                    </div>

                    <p class="text-center mt-4 text-2xl font-semibold">This Might be a Fraud</p>
                    <p class="text-center mt-1 text-sm text-gray-600 font-semibold">Someone might be making purchases with John's credit card or number.We can protect your account right now. </p>
                    <div class="flex justify-between mt-5">
                        <div class="relative flex flex-col text-center justify-center items-center">
                            <i class="fa fa-lock text-blue-400" style="font-size:30px"></i>
                            <p class="font-semibold text-gray-800 mt-3">1. Lock Your Card First</p>
                            <p class="text-xs font-semibold text-gray-800 mt-1">We'll decline all new purchases on it.</p>
                        </div>
                        <div class="relative flex text-center flex-col justify-center items-center">
                            <i class="fa fa-list text-blue-400" style="font-size:30px"></i>
                            <p class="font-semibold text-gray-800 mt-3">2. Review Purchases</p>
                            <p class="text-xs font-semibold text-gray-800 mt-1">Tell us about fraudulent.</p>
                        </div>
                        <div class=" flex text-center flex-col justify-center items-center">
                            <i class="fa fa-credit-card text-blue-400" style="font-size:30px"></i>
                            <p class="font-semibold text-gray-800 mt-3">3. Get A New Card</p>
                            <p class="text-xs font-semibold text-gray-800 mt-1">We'll send John a new card.</p>
                        </div>
                    </div>
                    <button class="mt-4 mb-10 h-12 w-full bg-red-600 rounded-lg hover:bg-red-800 text-white text-sm cursor-pointer transition-all">Lets's Get Started</button>
                </div>


            </div>
        </div>
        <script src="js/reportProblem.js"></script>
    </body>
</html>
