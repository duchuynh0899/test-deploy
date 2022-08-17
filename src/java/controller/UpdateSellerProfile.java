/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.AddressDAO;
import dao.SellerDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.nio.file.Files;
import java.nio.file.Paths;

import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import model.Country;
import model.District;
import model.Province;
import model.Seller;

/**
 *
 * @author longn
 */
@MultipartConfig
public class UpdateSellerProfile extends HttpServlet {

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
            out.println("<title>Servlet UpdateSellerProfile</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UpdateSellerProfile at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    public void reloadPage(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("utf-8");
        SellerDAO sellerDAO = new SellerDAO();
        String username = (String) request.getSession().getAttribute("username");
        Seller seller = sellerDAO.getSellertByUsername(username);
        String UserAvatar = sellerDAO.getAvatarByUsername(username);
        request.setAttribute("seller", seller);
        request.setAttribute("UserAvatar", UserAvatar);
        AddressDAO a = new AddressDAO();

        request.setAttribute("listProvince", a.listProvince());
        if (seller.getProvinceID() + "" != "") {
            request.setAttribute("listDistrict", a.listDistrict(seller.getProvinceID()));
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
        request.getRequestDispatcher("self_profileSeller.jsp").forward(request, response);
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
        //save image
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("utf-8");
        HttpSession session = request.getSession();
        
        String email = (String) request.getSession().getAttribute("username");
        String UserAvatar = null;
        Part part = request.getPart("avatarImage");

        String realPath1 = request.getServletContext().getRealPath("/avatarImages");
        String realPath = realPath1.replaceFirst("build", "");
        String filename = Paths.get(part.getSubmittedFileName()).getFileName().toString();

        SellerDAO sdb = new SellerDAO();
        UserAvatar = sdb.getAvatarByUsername(email);
        String firstName, lastName, addressDetail, phone, linkFb;
        //   int age, countryID;
        String gender = request.getParameter("gender");
//            int provinceID = Integer.parseInt(request.getParameter("province"));
//            int districtID = Integer.parseInt(request.getParameter("district"));
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
        // age = Integer.parseInt(request.getParameter("age"));
        String age = request.getParameter("age");
        linkFb = request.getParameter("linkFb");
        
        if (!Files.exists(Paths.get(realPath))) {
            Files.createDirectories(Paths.get(realPath));
        }
        if (part.getSize() == 0) {
            // Seller sellerUpdate = new Seller(firstName, lastName, age, phone, email, 1, provinceID, districtID, addressDetail, gender,linkFb);
            // if (sdb.updateSellerProfile(UserAvatar, sellerUpdate) == true) {Avatar=?,FirstName=?,LastName=?,Age=?,Phone=?,CountryID=?,ProvinceID=?,DistrictID=?,AddressDetail=?,Gender=?,LinkFacebook=? where email=?";
            if (sdb.updateSellerProfileNoPro(UserAvatar, firstName, lastName, age, phone, "1", provinceID, districtID, addressDetail, gender, linkFb, email) == true) {
                reloadPage(request, response);
                session.setAttribute("stt", "1");
//                request.setAttribute("UpdateProcess", "Update successfully");
//                request.getRequestDispatcher("self_profileSeller.jsp").forward(request, response);
             //    request.getRequestDispatcher("home.jsp").forward(request, response);
                response.sendRedirect(request.getContextPath() + "/UpdateSellerProfile" );
            } else {
                reloadPage(request, response);
                request.setAttribute("UpdateProcess", "Update fail");
                request.getRequestDispatcher("self_profileSeller.jsp").forward(request, response);
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
               
            if (sdb.updateSellerProfileNoPro(UserAvatar, firstName, lastName, age, phone, "1", provinceID, districtID, addressDetail, gender, linkFb, email) == true) {
                reloadPage(request, response);
                try {
                    Thread.sleep(2000);
                } catch (InterruptedException ex) {
                    Logger.getLogger(UpdateSellerProfile.class.getName()).log(Level.SEVERE, null, ex);
                }
                 session.setAttribute("stt", "1");
                 response.sendRedirect(request.getContextPath() + "/UpdateSellerProfile" );
             
            } else {
                reloadPage(request, response);
                request.setAttribute("UpdateProcess", "Update fail");
                request.getRequestDispatcher("self_profileSeller.jsp").forward(request, response);
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
