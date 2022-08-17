/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.DepartmentDAO;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;
import java.util.ListIterator;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Department;

/**
 *
 * @author nguye
 */
public class DepartmentController extends HttpServlet {

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
//        DepartmentDAO dao = new DepartmentDAO();
//        ArrayList<Department> dep = dao.listDep();
//        request.setAttribute("listD", dep);
//        request.getRequestDispatcher("listdepartment.jsp").forward(request, response);
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
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("utf-8");
        DepartmentDAO dao = new DepartmentDAO();

        String indexPage = request.getParameter("index");
        if (indexPage == null) {
            indexPage = "1";
        }
        int index = Integer.parseInt(indexPage);

        int total = 1;
        int endPage = 1;

        ArrayList<Department> pagingDep = new ArrayList<Department>() {
        };
        String key = request.getParameter("key");
        if (key == null || key.equals("")) {
            total = dao.getTotalDepartment();
            endPage = total / 3;
            if (total % 3 != 0) {
                endPage++;
            }
            pagingDep = dao.pagingDepartment(index);
        } else {
            total = dao.getTotalDepartmentByText(dao.getAllDepartmentByText(key), key);
            endPage = total / 3;
            if (total % 3 != 0) {
                endPage++;
            }
            pagingDep = dao.pagingDepartmentByText(key, index);
        }

        request.setAttribute("listDepPaging", pagingDep);
        request.setAttribute("endP", endPage);
        request.setAttribute("tag", index);
        request.setAttribute("key", key);
        request.getRequestDispatcher("listdepartment.jsp").forward(request, response);
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
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("utf-8");
        DepartmentDAO dao = new DepartmentDAO();

        String indexPage = request.getParameter("index");
        if (indexPage == null) {
            indexPage = "1";
        }
        int index = Integer.parseInt(indexPage);

        int total = 1;
        int endPage = 1;

        ArrayList<Department> pagingDep = new ArrayList<Department>() {
        };
        String key = request.getParameter("key");
        if (key == null || key.equals("")) {
            total = dao.getTotalDepartment();
            endPage = total / 3;
            if (total % 3 != 0) {
                endPage++;
            }
            pagingDep = dao.pagingDepartment(index);
        } else {
            total = dao.getTotalDepartmentByText(dao.getAllDepartmentByText(key), key);
            endPage = total / 3;
            if (total % 3 != 0) {
                endPage++;
            }
            pagingDep = dao.pagingDepartmentByText(key, index);
        }

        request.setAttribute("listDepPaging", pagingDep);
        request.setAttribute("endP", endPage);
        request.setAttribute("tag", index);
        request.setAttribute("key", key);
        request.getRequestDispatcher("listdepartment.jsp").forward(request, response);
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
