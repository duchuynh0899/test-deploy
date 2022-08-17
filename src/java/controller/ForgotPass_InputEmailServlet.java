/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.AccountDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author longn
 */
public class ForgotPass_InputEmailServlet extends HttpServlet {

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
            out.println("<title>Servlet ForgotPass_InputEmailServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ForgotPass_InputEmailServlet at " + request.getContextPath() + "</h1>");
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
        String accept=(String)request.getAttribute("accept");
        if (accept == "YES")
        {
            doPost(request, response);
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
        if ((String) request.getAttribute("accept") == null) {
            String username = request.getParameter("username");
            AccountDAO ad = new AccountDAO();
            if (ad.exsitedAccount(username)) {
                request.getSession().setAttribute("directAfterAuthen", "ForgotPass_InputEmailServlet");
                request.setAttribute("email", username);
                request.getSession().setAttribute("email", username);
                //request.getSession().setAttribute("code", code); // add to session
                //this.getServletConfig().getServletContext().setAttribute("code", code); // add to application context
                request.getRequestDispatcher("/AuthenticateServlet").forward(request, response);
                // response.sendRedirect("checkRegisterCode.jsp");
            } else {
                request.setAttribute("errorInputEmail", "your email is not registerd");
                request.getRequestDispatcher("forgotPass_InputEmail.jsp").forward(request, response);
            }
        } else if ((String) request.getAttribute("accept") == "YES") {           
            response.sendRedirect("ForgotPass_InputNewPassServlet");
            
            //request.getRequestDispatcher("/ForgotPass_InputNewPassServlet").forward(request, response);
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
