/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.HostelDAO;
import dao.ReportHostelDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Hostel;

/**
 *
 * @author DELL
 */
public class ReportHostelController extends HttpServlet {

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
        HostelDAO hostelDAO = new HostelDAO();
        String id = request.getParameter("id");
        Hostel hostel = hostelDAO.getHostelInfo(Integer.parseInt(id));
        request.setAttribute("hostel", hostel);
        request.getRequestDispatcher("reportHostel.jsp").forward(request, response);
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
        int hostelID = Integer.parseInt(request.getParameter("id"));
        //System.out.println(hostelID);
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

        ReportHostelDAO reportHostelDAO = new ReportHostelDAO();
        if (reportHostelDAO.createReportHostel(hostelID, spam, offensive, violent, truthless)) {
            HostelDAO hostelDAO = new HostelDAO();
            String indexPage = request.getParameter("index");
            if (indexPage == null) {
                indexPage = "1";
            }
            int index = Integer.parseInt(indexPage);

            int total = hostelDAO.getTotalHostels();
            int endPage = total / 6;
            if (total % 6 != 0) {
                endPage++;
            }
            List<Hostel> pagingHostel = hostelDAO.pagingHostels(index);
            request.setAttribute("listHostelPaging", pagingHostel);
            request.setAttribute("endP", endPage);
            request.setAttribute("tag", index);
            session.setAttribute("stt", "1");
            response.sendRedirect(request.getContextPath() + "/detailhostel?id="+ hostelID);
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
