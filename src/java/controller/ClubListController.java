/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.ClubDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Club;

/**
 *
 * @author win
 */
public class ClubListController extends HttpServlet {

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
        request.setCharacterEncoding("utf-8");
        ArrayList<Club> listClubs = new ArrayList<>();
        ClubDAO clubDAO = new ClubDAO();
        String index = request.getParameter("index");
        if (index == null) {
            index = "1";
        }
        int totalPage = 1;
        String key = request.getParameter("key");
        String type = request.getParameter("type");
        if (type == null || type.equals("") || type.isEmpty()) {
            if (key == null || key.equals("")) {
                totalPage = clubDAO.getTotalPage(listClubs);
                listClubs = clubDAO.getListClubsPagging(Integer.parseInt(index));
            } else {
                totalPage = clubDAO.getTotalPageByText(listClubs, key);
                listClubs = clubDAO.getClubByTextPagging(key, Integer.parseInt(index));
            }
            if (listClubs.isEmpty()) {
                request.setAttribute("listNull", "Không tìm thấy kết quả phù hợp!");
            } else {
                request.setAttribute("listNull", "Có " + listClubs.size() + " kết quả được tìm thấy");
            }
        } else {
            if (key == null || key.equals("")) {
                totalPage = clubDAO.getTotalPageCategory(listClubs, Integer.parseInt(type));
                listClubs = clubDAO.getListClubsByCategories(Integer.parseInt(type));
            } else {
                totalPage = clubDAO.getTotalPageByTextType(listClubs, key, Integer.parseInt(type));
                listClubs = clubDAO.getClubByTextAndCategories(key, Integer.parseInt(type));
            }
            if (listClubs.isEmpty()) {
                request.setAttribute("listNull", "Không tìm thấy kết quả phù hợp!");
            } else {
                request.setAttribute("listNull", "Có " + listClubs.size() + " kết quả được tìm thấy");
            }
        }
        request.setAttribute("endP", totalPage);
        request.setAttribute("tag", index);
        request.setAttribute("listClubs", listClubs);
        request.setAttribute("key", key);
        request.setAttribute("type", type);
        request.getRequestDispatcher("listClubs.jsp").forward(request, response);
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
