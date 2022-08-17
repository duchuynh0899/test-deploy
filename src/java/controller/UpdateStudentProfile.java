/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.AddressDAO;

import dao.StudentDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import model.Student;

/**
 *
 * @author longn
 */
@MultipartConfig
public class UpdateStudentProfile extends HttpServlet {

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
            out.println("<title>Servlet UpdateStudentProfile</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UpdateStudentProfile at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    public void reloadPage(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("utf-8");
        StudentDAO stDAO = new StudentDAO();
        String username = (String) request.getSession().getAttribute("username");
        Student student = stDAO.getStudentByEmail(username);
        String UserAvatar = stDAO.getStAvatarByUsername(username);
        request.setAttribute("student", student);
        request.setAttribute("UserAvatar", UserAvatar);
        AddressDAO a = new AddressDAO();
        request.setAttribute("listProvince", a.listProvince());
        if (student.getProvinceID() + "" != "") {
            request.setAttribute("listDistrict", a.listDistrict(student.getProvinceID()));
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
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("utf-8");
        HttpSession session = request.getSession();
        reloadPage(request, response);
        request.getRequestDispatcher("self_profileStudent.jsp").forward(request, response);
        session.removeAttribute("stt");
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
        HttpSession session = request.getSession();
        String email = (String) request.getSession().getAttribute("username");
        String UserAvatar = null;
        Part part = request.getPart("avatarImage");
        String firstName, lastName, addressDetail, phone, linkFb, studentId, unit;
        String age, countryID;
        String gender = request.getParameter("gender");
        String provinceID = request.getParameter("province");
        String districtID = request.getParameter("district");
        if (provinceID.isEmpty()) {
            provinceID = null;
            districtID = null;
        }
        firstName = request.getParameter("firstName");
        lastName = request.getParameter("lastName");
        addressDetail = request.getParameter("addressDetail");
        phone = request.getParameter("phone");
        age = request.getParameter("age");
        linkFb = request.getParameter("linkFb");
        studentId = request.getParameter("studentId");
        unit = request.getParameter("unit");
        StudentDAO sdb = new StudentDAO();
        String realPath1 = request.getServletContext().getRealPath("/avatarImages");
        String realPath = realPath1.replaceFirst("build", "");
        String filename = Paths.get(part.getSubmittedFileName()).getFileName().toString();
        if (!Files.exists(Paths.get(realPath))) {
            Files.createDirectories(Paths.get(realPath));
        }
        if (part.getSize() == 0) {

            UserAvatar = sdb.getStAvatarByUsername(email);
            /*
             st.setString(1, avatar);
             st.setString(2, student.getFirstName());
             st.setString(3, student.getLastName());
             st.setInt(4, student.getAge());
             st.setInt(5, student.getPhone());
             st.setInt(6, student.getCountryID());
             st.setInt(7, student.getProvinceID());
             st.setInt(8, student.getDistrictID());
             st.setString(9, student.getAddress());
             st.setBoolean(10, gender);
             st.setString(11, student.getLinkFb());
             st.setString(12,student.getStudentID());
             st.setString(13,student.getUnit());
             st.setString(14, student.getEmail());
             String avatar, String firstName,String lastName,String age,String phone,String countryId,String provinceId,String districtId,String addressDetail,String gender,String linkFaceBook,String studentId,String unit,String email
             */
            //Student studentUpdate = new Student(studentId, firstName, lastName, age, phone, unit, email, 1, provinceID, districtID, addressDetail, gender, linkFb);
            if (sdb.updateStudentProfileNoPro(UserAvatar, firstName, lastName, age, phone, "1", provinceID, districtID, addressDetail, gender, linkFb, studentId, unit, email) == true) {
                reloadPage(request, response);
                //request.setAttribute("UpdateProcess", "Update successfully");
                //request.getRequestDispatcher("self_profileStudent.jsp").forward(request, response);
                //request.getRequestDispatcher("home.jsp").forward(request, response);

                session.setAttribute("stt", "1");
                response.sendRedirect(request.getContextPath() + "/UpdateStudentProfile");

            } else {
                reloadPage(request, response);
                request.setAttribute("UpdateProcess", "Update fail");
                request.getRequestDispatcher("self_profileStudent.jsp").forward(request, response);
            }
        } else {

            /*SellerDAO sdb = new SellerDAO();
             Seller seller = sdb.getSellertByUsername(username);*/
            String avatarName = null;
            if (email.contains("@gmail.com")) {
                avatarName = email.replaceFirst("@gmail.com", "Avatar.jpg");
            } else if (email.contains("@fpt.edu.vn")) {
                avatarName = email.replaceFirst("@fpt.edu.vn", "Avatar.jpg");
            }
            UserAvatar = "avatarImages/" + avatarName;
            part.write(realPath + "\\" + avatarName);
            /* try (PrintWriter out = response.getWriter()) {
             out.println("<h1>Name: " + avatarName + "</h1>");
             out.println("<h1>uplodName: " + realPath.toString() + "</h1>");
             out.println("<h1>Part: " + part.toString() + "</h1>");
             out.print("<img src='avatarImages/" + avatarName + "'width='100'>");
             } catch (Exception e) {
             e.printStackTrace();
             }*/

            if (sdb.updateStudentProfileNoPro(UserAvatar, firstName, lastName, age, phone, "1", provinceID, districtID, addressDetail, gender, linkFb, studentId, unit, email) == true) {
                //request.setAttribute("UpdateProcess", "Update successfully");
                reloadPage(request, response);

                try {
                    Thread.sleep(2000);
                } catch (InterruptedException ex) {
                    Logger.getLogger(UpdateStudentProfile.class.getName()).log(Level.SEVERE, null, ex);
                }

              
//                request.setAttribute("UpdateProcess", "Update successfully");
//                request.getRequestDispatcher("self_profileSeller.jsp").forward(request, response);
                session.setAttribute("stt", "1");
                response.sendRedirect(request.getContextPath() + "/UpdateStudentProfile");

            } else {
                request.setAttribute("UpdateProcess", "Update fail");
                reloadPage(request, response);
                request.getRequestDispatcher("self_profileStudent.jsp").forward(request, response);
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
