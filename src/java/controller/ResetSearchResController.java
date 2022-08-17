/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.RestaurantDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Restaurant;

/**
 *
 * @author win
 */
@WebServlet(name = "ResetSearchResController", urlPatterns = {"/ResetSearchRes"})
public class ResetSearchResController extends HttpServlet {

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
            out.println("<title>Servlet ResetSearchResController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ResetSearchResController at " + request.getContextPath() + "</h1>");
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
        String index = request.getParameter("index");
        if (index == null) {
            index = "1";

        }
        RestaurantDAO restaurantDAO = new RestaurantDAO();
        ArrayList<Restaurant> restaurants = restaurantDAO.listAllRestaurant(Integer.parseInt(index));
        String distance = request.getParameter("distance");
        String keyword = request.getParameter("keyword");
        String star = request.getParameter("star");
        int totalPage = 1;
        if (distance == null || distance.equals("")) {
            distance = "10";
        }
        if (star == null || star.equals("")) {
            star = "5";
        }
        if (keyword == null || keyword.equalsIgnoreCase("") || keyword.isEmpty()) {
            totalPage = restaurantDAO.getTotalPage(restaurantDAO.listAllRes(Double.parseDouble(distance), Float.parseFloat(star)), Double.parseDouble(distance), Float.parseFloat(star));
            restaurants = restaurantDAO.filterRestaurantPagging(Double.parseDouble(distance), Float.parseFloat(star), Integer.parseInt(index));
        } else {
            totalPage = restaurantDAO.getTotalPageByText(keyword, restaurants, Double.parseDouble(distance), Float.parseFloat(star));
            restaurants = restaurantDAO.listAllResByTextPagging(keyword, Double.parseDouble(distance), Float.parseFloat(star), Integer.parseInt(index));
        }
        if (restaurants.isEmpty()) {
            request.setAttribute("listSize", "Không tìm thấy kết quả phù hợp");
        }
//        request.setAttribute("totalPage", totalPage);
        request.setAttribute("endP", totalPage);
        request.setAttribute("tag", index);
        request.setAttribute("restaurants", restaurants);
        request.setAttribute("distance", distance);
        request.setAttribute("keyword", keyword);
        request.getRequestDispatcher("listAllRestaurant.jsp").forward(request, response);
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
