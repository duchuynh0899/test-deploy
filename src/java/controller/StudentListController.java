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
public class StudentListController extends HttpServlet {

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
        request.setCharacterEncoding("utf-8");
        ArrayList<Student> listStudent = new ArrayList<>();
        StudentDAO dao = new StudentDAO();
        HttpSession session = request.getSession();
        String key = request.getParameter("key");
        String province = request.getParameter("province");
        String gender = request.getParameter("gender");
        String status = request.getParameter("status");
        String unit = request.getParameter("unit");
        AddressDAO a = new AddressDAO();

        if (key == null || key.equalsIgnoreCase("") || key.isEmpty()) {
            if (province == null || province.equals("") || province.isEmpty()) {
                if (unit == null || unit.equals("") || unit.isEmpty()) {
                    if (gender.equals("3")) {
                        if (status.equals("3")) {
                            listStudent = dao.listAllStudent();
                        } else {
                            listStudent = dao.filterStudOnlyStus(Integer.parseInt(status));
                        }
                    } else {
                        if (status.equals("3")) {
                            listStudent = dao.filterStudOnlyGen(Integer.parseInt(gender));
                        } else {
                            listStudent = dao.filterStudByGenStus(Integer.parseInt(status), Integer.parseInt(gender));
                        }
                    }
                } else {
                    if (gender.equals("3")) {
                        if (status.equals("3")) {
                            listStudent = dao.filterStudOnlyUnit(unit);
                        } else {
                            listStudent = dao.filterStudUnitStatus(unit, Integer.parseInt(status));
                        }
                    } else {
                        if (status.equals("3")) {
                            listStudent = dao.filterStudUnitGen(unit, Integer.parseInt(gender));
                        } else {
                            listStudent = dao.filterStudUnitGenStus(unit, Integer.parseInt(status), Integer.parseInt(gender));
                        }
                    }
                }

            } else {
                if (unit == null || unit.equals("") || unit.isEmpty()) {
                    if (gender.equals("3")) {
                        if (status.equals("3")) {
                            listStudent = dao.filterStudOnlyProvince(Integer.parseInt(province));
                        } else {
                            listStudent = dao.filterStudProvinceStus(Integer.parseInt(province), Integer.parseInt(status));
                        }
                    } else {
                        if (status.equals("3")) {
                            listStudent = dao.filterStudProvinceGen(Integer.parseInt(province), Integer.parseInt(gender));
                        } else {
                            listStudent = dao.filterStudProvinceGenStus(Integer.parseInt(province), Integer.parseInt(gender), Integer.parseInt(status));
                        }
                    }
                } else {
                    if (gender.equals("3")) {
                        if (status.equals("3")) {
                            listStudent = dao.filterStudProvinceUnit(Integer.parseInt(province), unit);
                        } else {
                            listStudent = dao.filterStudProvinceUnitStus(Integer.parseInt(province), unit, Integer.parseInt(status));
                        }
                    } else {
                        if (status.equals("3")) {
                            listStudent = dao.filterStudProvinceUnitGen(Integer.parseInt(province), unit, Integer.parseInt(gender));
                        } else {
                            listStudent = dao.filterStudProvinceUnitGenStus(Integer.parseInt(province), unit, Integer.parseInt(gender), Integer.parseInt(status));
                        }
                    }
                }
            }

        } else {
            if (province == null || province.equals("") || province.isEmpty()) {
                if (unit == null || unit.equals("") || unit.isEmpty()) {
                    if (gender.equals("3")) {
                        if (status.equals("3")) {
                            listStudent = dao.filterStudText(key);
                        } else {
                            listStudent = dao.filterStudKeyStus(key, Integer.parseInt(status));
                        }
                    } else {
                        if (status.equals("3")) {
                            listStudent = dao.filterStudKeyGen(key, Integer.parseInt(gender));
                        } else {
                            listStudent = dao.filterStudByKeyGenStus(key, Integer.parseInt(status), Integer.parseInt(gender));
                        }
                    }
                } else {
                    if (gender.equals("3")) {
                        if (status.equals("3")) {
                            listStudent = dao.filterStudByKeyUnit(key, unit);
                        } else {
                            listStudent = dao.filterStudByKeyUnitStus(key, unit, Integer.parseInt(status));
                        }
                    } else {
                        if (status.equals("3")) {
                            listStudent = dao.filterStudByKeyUnitGen(key, unit, Integer.parseInt(gender));
                        } else {
                            listStudent = dao.filterStudByKeyUnitGenStus(key, unit, Integer.parseInt(gender), Integer.parseInt(status));
                        }
                    }
                }

            } else {
                if (unit == null || unit.equals("") || unit.isEmpty()) {
                    if (gender.equals("3")) {
                        if (status.equals("3")) {
                            listStudent = dao.filterStudKeyProvince(key, Integer.parseInt(province));
                        } else {
                            listStudent = dao.filterStudKeyProStus(key, Integer.parseInt(province), Integer.parseInt(status));
                        }
                    } else {
                        if (status.equals("3")) {
                            listStudent = dao.filterStudKeyProGen(key, Integer.parseInt(province), Integer.parseInt(gender));
                        } else {
                            listStudent = dao.filterStudKeyProGenStus(key, Integer.parseInt(province), Integer.parseInt(gender), Integer.parseInt(status));
                        }
                    }
                } else {
                    if (gender.equals("3")) {
                        if (status.equals("3")) {
                            listStudent = dao.filterStudKeyProUnit(key, Integer.parseInt(province), unit);
                        } else {
                            listStudent = dao.filterStudKeyProUnitStus(key, Integer.parseInt(province), unit, Integer.parseInt(status));
                        }
                    } else {
                        if (status.equals("3")) {
                            listStudent = dao.filterStudKeyProUnitGen(key, Integer.parseInt(province), unit, Integer.parseInt(gender));
                        } else {
                            listStudent = dao.filterStudKeyAll(key, Integer.parseInt(province), unit, Integer.parseInt(gender), Integer.parseInt(status));
                        }
                    }
                }
            }
        }

        if (listStudent.isEmpty()) {
            request.setAttribute("listSize", "Không tìm thấy kết quả phù hợp");
        }
        request.setAttribute("listProvince", a.listProvince());
        request.setAttribute("listStudent", listStudent);
        request.setAttribute("province", province);
        request.setAttribute("gender", gender);
        request.setAttribute("status", status);
        request.setAttribute("key", key);
        request.getRequestDispatcher("student-list.jsp").forward(request, response);
        session.removeAttribute("stt");
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
