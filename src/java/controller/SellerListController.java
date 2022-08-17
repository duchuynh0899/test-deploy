/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.AddressDAO;
import dao.SellerDAO;
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
import model.Seller;
import model.Student;

/**
 *
 * @author DELL
 */
public class SellerListController extends HttpServlet {

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
        try {
            response.setContentType("text/html;charset=UTF-8");
            request.setCharacterEncoding("utf-8");
            ArrayList<Seller> listSeller = new ArrayList<>();
            SellerDAO dao = new SellerDAO();
            HttpSession session = request.getSession();
            String key = request.getParameter("key");
            String province = request.getParameter("province");
            String gender = request.getParameter("gender");
            String status = request.getParameter("status");
            AddressDAO a = new AddressDAO();

            if (key == null || key.equalsIgnoreCase("") || key.isEmpty()) {
                if (province == null || province.equals("") || province.isEmpty()) {
                    if (gender.equals("3")) {
                        if (status.equals("3")) {
                            listSeller = dao.getAllSellerNoPagging();
                        } else {
                            listSeller = dao.filterSellerNoTextNoProvinceNoGender(Integer.parseInt(status));
                        }
                    } else {
                        if (status.equals("3")) {
                            listSeller = dao.filterSellerNoTextNoProvinceNoStatus(Integer.parseInt(gender));
                        } else {
                            listSeller = dao.filterSellerNoTextNoProvince(Integer.parseInt(status), Integer.parseInt(gender));
                        }
                    }
                } else {
                    if (gender.equals("3")) {
                        if (status.equals("3")) {
                            listSeller = dao.filterSellerNoTextNoGenDerNoStatus(Integer.parseInt(province));
                        } else {
                            listSeller = dao.filterSellerNoTextNoGender(Integer.parseInt(province), Integer.parseInt(status));
                        }
                    } else {
                        if (status.equals("3")) {
                            listSeller = dao.filterSellerNoTextNoStatus(Integer.parseInt(province), Integer.parseInt(gender));
                        } else {
                            listSeller = dao.filterSellerNoText(Integer.parseInt(province), Integer.parseInt(status), Integer.parseInt(gender));
                        }
                    }
                }

            } else {
                if (province == null || province.equals("") || province.isEmpty()) {
                    if (gender.equals("3")) {
                        if (status.equals("3")) {
                            listSeller = dao.filterSellerWithTextNoProNoGenNoSta(key);
                        } else {
                            listSeller = dao.filterSellerWithTextNoProNoGen(key, Integer.parseInt(status));
                        }
                    } else {
                        if (status.equals("3")) {
                            listSeller = dao.filterSellerWithTextNoProNoSta(key, Integer.parseInt(gender));
                        } else {
                            listSeller = dao.filterSellerWithTextNoProvince(key, Integer.parseInt(status), Integer.parseInt(gender));
                        }
                    }
                } else {
                    if (gender.equals("3")) {
                        if (status.equals("3")) {
                            listSeller = dao.filterSellerWithTextNoGenNoSta(key, Integer.parseInt(province));
                        } else {
                            listSeller = dao.filterSellerWithTextNoGen(key, Integer.parseInt(province), Integer.parseInt(status));
                        }
                    } else {
                        if (status.equals("3")) {
                            listSeller = dao.filterSellerWithTextNoSta(key, Integer.parseInt(province), Integer.parseInt(gender));
                        } else {
                            listSeller = dao.filterSellerWithTextAndAll(key, Integer.parseInt(province), Integer.parseInt(status), Integer.parseInt(gender));
                        }
                    }
                }
            }

            if (listSeller.isEmpty()) {
                request.setAttribute("listSize", "Không tìm thấy kết quả phù hợp");
            }

            request.setAttribute("listProvince", a.listProvince());
            request.setAttribute("listSeller", listSeller);
            request.setAttribute("province", province);
            request.setAttribute("gender", gender);
            request.setAttribute("status", status);
            request.setAttribute("key", key);
            request.getRequestDispatcher("seller-list.jsp").forward(request, response);
            session.removeAttribute("stt");
        } catch (Exception ex) {
            Logger.getLogger(StudentListController.class.getName()).log(Level.SEVERE, null, ex);
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
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(StudentListController.class.getName()).log(Level.SEVERE, null, ex);
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
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(StudentListController.class.getName()).log(Level.SEVERE, null, ex);
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
