/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.StudentDAO;
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
import model.Student;

/**
 *
 * @author DELL
 */
public class ChangeStatusStudent extends HttpServlet {

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
            throws ServletException, IOException, SQLException, Exception {
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
            Logger.getLogger(StudentListController.class.getName()).log(Level.SEVERE, null, ex);
        }
        try {
            StudentDAO dAO = new StudentDAO();
            String email = request.getParameter("email");
            Student student = dAO.getAccount(email);
            request.setAttribute("student", student);
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        request.getRequestDispatcher("profileStudent.jsp").forward(request, response);
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
            Logger.getLogger(StudentListController.class.getName()).log(Level.SEVERE, null, ex);
        }
        ArrayList<Student> listStudent = new ArrayList<>();
        int status = Integer.parseInt(request.getParameter("status"));
        String email = (request.getParameter("email"));
        StudentDAO studentDAO = new StudentDAO();
        String indexPage = request.getParameter("index");
            if (indexPage == null) {
                indexPage = "1";
            }
            int index = Integer.parseInt(indexPage);

            int total = studentDAO.getTotalStudent();
            int endPage = total / 6;
            if (total % 6 != 0) {
                endPage++;
            }
        try {
            
            studentDAO.getAllStudent(index);
        } catch (SQLException ex) {
            Logger.getLogger(ChangeStatusStudent.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            Logger.getLogger(ChangeStatusStudent.class.getName()).log(Level.SEVERE, null, ex);
        }
        studentDAO.updateStatus(email, status);
        request.setAttribute("listStudent", listStudent);
         request.setAttribute("endP", endPage);
        request.setAttribute("tag", index);
       // request.getRequestDispatcher("StudentListController").forward(request, response);
        // request.getRequestDispatcher("StudentListController?status=3&gender=3").forward(request, response);
         HttpSession session = request.getSession();
        session.setAttribute("stt", "1");
         response.sendRedirect(request.getContextPath()+ "/StudentListController?status=3&gender=3");
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
