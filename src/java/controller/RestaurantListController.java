/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.AddressDAO;
import dao.RestaurantDAO;

import dao.StarDAO;
import dao.StudentDAO;

import dao.SellerDAO;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Food;
import model.Restaurant;
import model.StarVoting;

/**
 *
 * @author DELL
 */
public class RestaurantListController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet RestaurantListController</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet RestaurantListController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("utf-8");
        
        int id = Integer.parseInt(request.getParameter("id"));
        String isListbySeller=request.getParameter("isListbySeller");
        if (isListbySeller!=null&&isListbySeller.equalsIgnoreCase("true")) {
            isListbySeller = "true";
            request.setAttribute("isListbySeller", isListbySeller);
        }
        
        String isSeeFromReport=request.getParameter("isSeeFromReport");
        if (isSeeFromReport!=null&&isSeeFromReport.equalsIgnoreCase("true")) {
            isSeeFromReport = "true";
            request.setAttribute("isSeeFromReport", isSeeFromReport);
        }
        RestaurantDAO restaurantDAO = new RestaurantDAO();
        Restaurant restaurant = restaurantDAO.getRestaurantID(id);
        
        StudentDAO stdao = new StudentDAO();
        if (stdao.getStudentNo((String) request.getSession().getAttribute("username")) != null) {
            request.setAttribute("isStudent", 1);
        }
        
        StarDAO daost = new StarDAO();

        String indexPage = request.getParameter("index");
        if (indexPage == null) {
            indexPage = "1";
        }
        int index = Integer.parseInt(indexPage);

        int total = daost.getTotalCommentRestaurant(id);
        int endPage = total / 5;
        if (total % 5 != 0) {
            endPage++;
        }

        List<StarVoting> sv = daost.pagingCommentRestaurant(id, index);
         List<StarVoting> sv1 = daost.getListCommentByRestaurant(id);
        if (!sv1.isEmpty()) {

            int count = 0;
            float sum = 0;
            for (StarVoting starVoting : sv1) {
                sum += starVoting.getStarvoting();
                count++;
            }

            restaurant.setStarAVG((sum / count) / 5 * 100);
        } else {
            restaurant.setStarAVG(0);
        }
        

        
        request.setAttribute("totalcomment", total);
        request.setAttribute("listCmtHostelPaging", sv);
        request.setAttribute("endP", endPage);
        request.setAttribute("tag", index);
        
        
        
        
        ArrayList<Food> listFood = restaurantDAO.listFoodByRestaurant(id);
        int SellerID = restaurantDAO.getSellerIdByRestaurantId(id);
       

        AddressDAO a = new AddressDAO();
        request.setAttribute("listFood", listFood);
        request.setAttribute("restaurant", restaurant);
        request.setAttribute("sellerId", SellerID);
        
        request.setAttribute("listProvince", a.listProvince());
        request.setAttribute("listDistrict", a.getDistrictByProName(restaurant.getProvinceName()));
        HttpSession session = request.getSession();
        request.getRequestDispatcher("viewRestaurant.jsp").forward(request, response);
        session.removeAttribute("stt");
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
