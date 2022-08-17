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
@WebServlet(name = "EditEvent", urlPatterns = {"/EditEvent"})
@MultipartConfig
public class EditEvent extends HttpServlet {

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
        ClubDAO clubDAO = new ClubDAO();
        HttpSession session = request.getSession();
        int id = Integer.parseInt(request.getParameter("eventID"));
        Event event = clubDAO.getEventByID(id);
        String eventName = event.getEventName();
        String time = event.getTime();
        String des = event.getDes();
        String eventImage = event.getUrl();
        request.setAttribute("eventImage", eventImage);
        request.setAttribute("eventName", eventName);
        request.setAttribute("time", time);
        request.setAttribute("des", des);
        request.getRequestDispatcher("editEvent.jsp").forward(request, response);
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
        ClubDAO clubDAO = new ClubDAO();
//        String username = (String) request.getSession().getAttribute("username");
//        ArrayList<Event> events = clubDAO.getEventByEmail(username);
        String eventName = request.getParameter("eventName");
        int id = clubDAO.getEventIDByName(eventName);
//        for (Event e : events) {
//            if(e.getEventName().equalsIgnoreCase(eventName)){
//                request.setAttribute("errorEventName", "EventName already existed!");
//                request.getRequestDispatcher("editEvent.jsp").forward(request, response);
//            } 
//        }

        String eventImgName;
        Part part = request.getPart("eventImage");
        String realPath1 = request.getServletContext().getRealPath("/eventImages");
        String realPath = realPath1.replaceFirst("build", "");
        //String filename = Paths.get(part.getSubmittedFileName()).getFileName().toString();
        if (!Files.exists(Paths.get(realPath))) {
            Files.createDirectories(Paths.get(realPath));
        }
        if (part.getSize() == 0) {
            eventImgName = clubDAO.getImgByEventName(eventName);
        } else {
            eventImgName = "eventImages/" + eventName + ".jpg";
            part.write(realPath + "\\" + eventName + ".jpg");
        }

        String time = request.getParameter("time");
        String des = request.getParameter("des");
        Event event = new Event(eventName, time, des, eventImgName);
        clubDAO.updateEvent(event, id);
        request.setAttribute("eventImage", eventImgName);
        request.setAttribute("eventName", eventName);
        request.setAttribute("time", time);
        request.setAttribute("des", des);
        HttpSession session = request.getSession();
        session.setAttribute("stt", "2");
        response.sendRedirect(request.getContextPath() + "/EditEvent?eventID=" + id);
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
