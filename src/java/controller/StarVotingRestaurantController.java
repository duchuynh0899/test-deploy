/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import com.google.gson.Gson;
import dao.HostelDAO;
import dao.RestaurantDAO;
import dao.StarDAO;
import dao.StudentDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.StarVoting;

/**
 *
 * @author nguye
 */
public class StarVotingRestaurantController extends HttpServlet {

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
            out.println("<title>Servlet StarVotingRestaurantController</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet StarVotingRestaurantController at " + request.getContextPath() + "</h1>");
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
        processRequest(request, response);
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
                PrintWriter out = response.getWriter();
        int star = Integer.parseInt(request.getParameter("star"));
        int resId = Integer.parseInt(request.getParameter("restaurantId"));
        String comment = request.getParameter("message");

        String json = new Gson().toJson(star);
        StudentDAO stdao = new StudentDAO();

        int studentNo = Integer.parseInt(stdao.getStudentNo((String) request.getSession().getAttribute("username")));

        StarDAO dao = new StarDAO();

        if (dao.getCommentRestaurantOfStudent(resId, studentNo) != null) {
            dao.updateStarVotingRestaurant(dao.getCommentRestaurantOfStudent(resId, studentNo).getId(), star, comment);
        }

        dao.addStarVotingRestaurant(new StarVoting(studentNo, comment, resId, star));

        ArrayList<StarVoting> sv = dao.getListCommentByRestaurant(resId);
        if (!sv.isEmpty()) {

            int count = 0;
            double sum = 0;
            for (StarVoting starVoting : sv) {
                sum += starVoting.getStarvoting();
                count++;
            }
            RestaurantDAO h = new RestaurantDAO();
            h.updateStarAvgRestaurant(resId, (sum / count));

        }

        response.sendRedirect(request.getContextPath() + "/RestaurantListController?id=" + resId);
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
