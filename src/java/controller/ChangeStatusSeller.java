/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.SellerDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Seller;

/**
 *
 * @author DELL
 */
public class ChangeStatusSeller extends HttpServlet {

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
       try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(SellerListController.class.getName()).log(Level.SEVERE, null, ex);
        }
         try {
             SellerDAO dAO = new SellerDAO();
             String email = request.getParameter("email");
             Seller seller = dAO.getAccount(email);
             request.setAttribute("seller", seller);
                } catch (Exception e) {
                    System.out.println(e.getMessage());
                }
        request.getRequestDispatcher("profileSeller.jsp").forward(request, response);
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
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(SellerListController.class.getName()).log(Level.SEVERE, null, ex);
        }
        ArrayList<Seller> listSeller = new ArrayList<>();
        HttpSession session = request.getSession();
        int status = Integer.parseInt(request.getParameter("status"));
        String email = (request.getParameter("email"));
        SellerDAO sellerDAO = new SellerDAO();
        String indexPage= request.getParameter("index");
         if(indexPage==null){
            indexPage ="1";
        }
        int index = Integer.parseInt(indexPage);
 
        int total = sellerDAO.getTotalSeller();
        int endPage = total / 6;
        if (total % 6 != 0) {
            endPage++;
        }
        try {
            sellerDAO.getAllSeller(index);
        } catch (SQLException ex) {
            Logger.getLogger(ChangeStatusSeller.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            Logger.getLogger(ChangeStatusSeller.class.getName()).log(Level.SEVERE, null, ex);
        }
        sellerDAO.updateStatus(email, status);
        request.setAttribute("listSeller", listSeller);
        request.setAttribute("endP", endPage);
        request.setAttribute("tag", index);
         session.setAttribute("stt", "1");
       response.sendRedirect(request.getContextPath()+ "/SellerListController?status=3&gender=3");
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
