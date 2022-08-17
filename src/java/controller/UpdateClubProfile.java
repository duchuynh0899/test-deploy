/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.AddressDAO;
import dao.ClubDAO;
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
import model.Club;

/**
 *
 * @author longn
 */
@MultipartConfig
public class UpdateClubProfile extends HttpServlet {

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
            out.println("<title>Servlet UpdateClubProfile</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UpdateClubProfile at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    public void reloadPage(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("utf-8");
        ClubDAO clubDAO = new ClubDAO();
        String username = (String) request.getSession().getAttribute("username");
        Club club = clubDAO.getClubByEmail(username);
        String UserAvatar = clubDAO.getAvatarByUsername(username);
        request.setAttribute("club", club);
        request.setAttribute("UserAvatar", UserAvatar);
        AddressDAO a = new AddressDAO();

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
        request.getRequestDispatcher("self_profileClub.jsp").forward(request, response);
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

        String clubName, clubPresident, description, linkFb;

        clubName = request.getParameter("clubName");
        clubPresident = request.getParameter("clubPresident");
        description = request.getParameter("description");
        linkFb = request.getParameter("linkFb");

        String realPath1 = request.getServletContext().getRealPath("/avatarImages");
        String realPath = realPath1.replaceFirst("build", "");
        String filename = Paths.get(part.getSubmittedFileName()).getFileName().toString();
        if (!Files.exists(Paths.get(realPath))) {
            Files.createDirectories(Paths.get(realPath));
        }
        if (part.getSize() == 0) {
            ClubDAO cdb = new ClubDAO();
            UserAvatar = cdb.getAvatarByUsername(email);
            //public Club(String avatar, String clubName, String clubPresident, String facebook, String email, String des) {
            Club clubUpdate = new Club(UserAvatar, clubName, clubPresident, linkFb, email, description);
            if (cdb.updateClubProfile(UserAvatar, clubUpdate) == true) {
                reloadPage(request, response);
                session.setAttribute("stt", "1");
                response.sendRedirect(request.getContextPath() + "/UpdateClubProfile");
            } else {
                reloadPage(request, response);
                request.setAttribute("UpdateProcess", "Update fail");
                request.getRequestDispatcher("self_profileClub.jsp").forward(request, response);
            }
        } else {

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

            Club clubUpdate = new Club(UserAvatar, clubName, clubPresident, linkFb, email, description);
            ClubDAO cdb = new ClubDAO();
            if (cdb.updateClubProfile(UserAvatar, clubUpdate) == true) {
                reloadPage(request, response);
                try {
                    Thread.sleep(2000);
                } catch (InterruptedException ex) {
                    Logger.getLogger(UpdateClubProfile.class.getName()).log(Level.SEVERE, null, ex);
                }
                session.setAttribute("stt", "1");
                response.sendRedirect(request.getContextPath() + "/UpdateClubProfile");
            } else {
                reloadPage(request, response);
                request.setAttribute("UpdateProcess", "Update fail");
                request.getRequestDispatcher("self_profileClub.jsp").forward(request, response);
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
