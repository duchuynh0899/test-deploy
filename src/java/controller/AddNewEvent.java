/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.ClubDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import model.Event;

/**
 *
 * @author win
 */
@WebServlet(name = "AddNewEvent", urlPatterns = {"/AddNewEvent"})
@MultipartConfig
public class AddNewEvent extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
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
        request.getRequestDispatcher("addEvent.jsp").forward(request, response);
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

        String eventImgName;
        Part part = request.getPart("eventImage");
        String realPath1 = request.getServletContext().getRealPath("/eventImages");
        String realPath = realPath1.replaceFirst("build", "");
        //String filename = Paths.get(part.getSubmittedFileName()).getFileName().toString();
        if (!Files.exists(Paths.get(realPath))) {
            Files.createDirectories(Paths.get(realPath));
        }

        String eventName = request.getParameter("eventName");
        String time = request.getParameter("time");
        String des = request.getParameter("des");
        String username = (String) request.getSession().getAttribute("username");
        ClubDAO clubDAO = new ClubDAO();
        ArrayList<Event> events = clubDAO.getEventByEmail(username);
        int clubID = clubDAO.getClubIDByEmail(username);
        for (Event event : events) {
            if (event.getEventName().equalsIgnoreCase(eventName)) {
                request.setAttribute("errorEventName", "EventName already existed!");
                request.getRequestDispatcher("addEvent.jsp").forward(request, response);
            }
        }

        if (part.getSize() == 0) {
            eventImgName = null;
        } else {
            eventImgName = "eventImages/" + eventName + ".jpg";
            part.write(realPath + "\\" + eventName + ".jpg");
        }
        Event e = new Event(clubID, eventName, time, des, eventImgName);
        clubDAO.addEvent(e);
        request.setAttribute("eventImage", eventImgName);
        request.setAttribute("eventName", eventName);
        request.setAttribute("time", time);
        request.setAttribute("des", des);
        HttpSession session = request.getSession();
        session.setAttribute("stt", "1");
        response.sendRedirect(request.getContextPath() + "/AllEventByClub");
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
