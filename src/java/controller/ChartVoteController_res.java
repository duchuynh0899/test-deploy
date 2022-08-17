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
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.StarVote;

/**
 *
 * @author longn
 */
public class ChartVoteController_res extends HttpServlet {

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
            out.println("<title>Servlet ChartVoteController_res</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ChartVoteController_res at " + request.getContextPath() + "</h1>");
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
        int restaurantId = Integer.parseInt(request.getParameter("restaurantId"));

        RestaurantDAO rdb = new RestaurantDAO();
        List<StarVote> list = new ArrayList<>();
        list = rdb.listStar(restaurantId);
        int oneStar = 0, twoStar = 0, fourStar = 0, threeStar = 0, fiveStar = 0;
        for (StarVote sv : list) {
            if (sv.getStar() == 1) {
                oneStar = sv.getNumOfStar();
            } else if (sv.getStar() == 2) {
                twoStar = sv.getNumOfStar();
            } else if (sv.getStar() == 3) {
                threeStar = sv.getNumOfStar();
            } else if (sv.getStar() == 4) {
                fourStar = sv.getNumOfStar();
            } else if (sv.getStar() == 5) {
                fiveStar = sv.getNumOfStar();
            }
        }
        request.setAttribute("oneStar", oneStar);
        request.setAttribute("twoStar", twoStar);
        request.setAttribute("threeStar", threeStar);
        request.setAttribute("fourStar", fourStar);
        request.setAttribute("fiveStar", fiveStar);
        request.getRequestDispatcher("voteChart.jsp").forward(request, response);
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
