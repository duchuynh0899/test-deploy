/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.ReportRestaurantDAO;
import dao.RestaurantDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Restaurant;

/**
 *
 * @author DELL
 */
public class ReportRestaurantController extends HttpServlet {

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
            out.println("<title>Servlet ReportRestaurantController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ReportRestaurantController at " + request.getContextPath() + "</h1>");
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
        RestaurantDAO restauratnDAO = new RestaurantDAO();
        String id = request.getParameter("id");
        Restaurant restaurant = restauratnDAO.getRestaurantID(Integer.parseInt(id));
        request.setAttribute("restaurant", restaurant);
        request.getRequestDispatcher("reportRestaurant.jsp").forward(request, response);
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
        HttpSession session = request.getSession();
        int restaurantID = Integer.parseInt(request.getParameter("id"));
        String spamStr = request.getParameter("spam");
        int spam = 1;
        if (spamStr == null) {
            spam = 0;
        }
        String offensiveStr = request.getParameter("offensive");
        int offensive = 1;
        if (offensiveStr == null) {
            offensive = 0;
        }
        String violentStr = request.getParameter("violent");
        int violent = 1;
        if (violentStr == null) {
            violent = 0;
        }
        String truthStr = request.getParameter("truthless");
        int truthless = 1;
        if (truthStr == null) {
            truthless = 0;
        }

        ReportRestaurantDAO reportRestaurantDAO = new ReportRestaurantDAO();
        if (reportRestaurantDAO.createReportRestaurant(restaurantID, spam, offensive, violent, truthless)) {
            session.setAttribute("stt", "1");
            //  response.sendRedirect("ListAllRestaurantController");
            // request.getRequestDispatcher("ListAllRestaurantController").forward(request, response);
            response.sendRedirect(request.getContextPath() + "/RestaurantListController?id=" + restaurantID);

        }
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
