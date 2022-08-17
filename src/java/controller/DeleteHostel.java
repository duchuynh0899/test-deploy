/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.HostelDAO;
import dao.SendMail;
import dao.StarDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Hostel;

/**
 *
 * @author nguye
 */
public class DeleteHostel extends HttpServlet {

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

        HostelDAO dao = new HostelDAO();
        StarDAO dao1 = new StarDAO();
        int role = Integer.parseInt(request.getSession().getAttribute("role").toString());
        int hostelID = Integer.parseInt(request.getParameter("id"));
        String hostelName=dao.getHostelNameByHostelId(hostelID);
        String email=dao.getSellerEmailByHostelId(hostelID);
        dao.deleteReportbyHostel(hostelID);
        dao.deleteHostelImage(hostelID);
        dao1.deleteVoteHostel(hostelID);
        dao.deleteHostel(hostelID);
        if (role == 3) {
            HttpSession session = request.getSession();
            session.setAttribute("stt", "2");
            response.sendRedirect(request.getContextPath() + "/hostellist");
        } else if (role == 1) {
            SendMail sm=new SendMail();          
            sm.SendMailDelete(hostelName, email);
            HttpSession session = request.getSession();
            session.setAttribute("stt", "1");
            response.sendRedirect(request.getContextPath() + "/ListAllReportHostelController");
            
        }
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
