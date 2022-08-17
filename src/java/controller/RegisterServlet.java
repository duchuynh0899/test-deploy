/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.AccountDAO;
import dao.SellerDAO;
import dao.StudentDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Account;

/**
 *
 * @author longn
 */
public class RegisterServlet extends HttpServlet {

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
            out.println("<title>Servlet RegisterServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet RegisterServlet at " + request.getContextPath() + "</h1>");
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
        String username = request.getParameter("username");
        String pass = request.getParameter("pass");
        String role = request.getParameter("role");
        String accept = (String) request.getAttribute("accept");
        if (username == null && pass == null && role == null && accept == null) {
            response.sendRedirect("register.jsp");
        } else if ("YES".equals(accept)) {
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
        //fptcaringsystem@gmail.com
        //doan1234
        if (request.getParameter("username") != null && request.getParameter("pass") != null) {
            String username = request.getParameter("username");
            String pass = request.getParameter("pass");
            String role = request.getParameter("role");
            boolean status = true;
            AccountDAO adb = new AccountDAO();
            if (adb.exsitedAccount(username)) {
                request.setAttribute("errorRegister", username + " exsited!!!");
                request.getRequestDispatcher("register.jsp").forward(request, response);
            } else {
                Account a = new Account(username, pass, Integer.parseInt(role), status);
                request.getSession().setAttribute("account", a);
                request.getSession().setAttribute("directAfterAuthen", "RegisterServlet");
                request.setAttribute("email", username);
                //request.getSession().setAttribute("code", code); // add to session
                //this.getServletConfig().getServletContext().setAttribute("code", code); // add to application context
                request.getRequestDispatcher("/AuthenticateServlet").forward(request, response);
                // response.sendRedirect("checkRegisterCode.jsp");
            }
        } else {
            if ("YES".equals((String) request.getAttribute("accept"))) {
                Account a = new Account();
                AccountDAO adb = new AccountDAO();
                a = (Account) request.getSession().getAttribute("account");
                adb.insertNewAccount(a);
                if (a.getRoleId() == 2) {
                   StudentDAO stda=new StudentDAO();
                   stda.insertNewStudent(a.getUsername());
                } else if (a.getRoleId() == 3) {
                    SellerDAO sda=new SellerDAO();
                    sda.insertNewSeller(a.getUsername());
                }
                request.getSession().invalidate();
                request.removeAttribute("accept");
                response.sendRedirect("login.jsp");
            }
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
