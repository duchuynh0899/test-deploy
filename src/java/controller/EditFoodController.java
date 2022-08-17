/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.RestaurantDAO;
import java.io.IOException;
import java.io.PrintWriter;
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
import model.Food;
import model.Restaurant;

/**
 *
 * @author DELL
 */
@MultipartConfig
public class EditFoodController extends HttpServlet {

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
            out.println("<title>Servlet EditFoodController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet EditFoodController at " + request.getContextPath() + "</h1>");
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
        int id = Integer.parseInt(request.getParameter("foodId"));
        RestaurantDAO restaurantDAO = new RestaurantDAO();
        Food food = restaurantDAO.getFoodID(id);
        request.setAttribute("food", food);
        int restaurantId = restaurantDAO.getResIdbyFoodID(id);
        request.setAttribute("restaurantId", restaurantId);
        request.getRequestDispatcher("editFood.jsp").forward(request, response);
    }
//run ddi t het pin

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
        RestaurantDAO restaurantDAO = new RestaurantDAO();
        String foodName = request.getParameter("foodName");
        double cost = Double.parseDouble(request.getParameter("costFood"));
        int foodID = Integer.parseInt(request.getParameter("foodId"));
        String description = request.getParameter("desFood");
        Food food = restaurantDAO.getFoodID(foodID);
        Part part = request.getPart("foodImage");
        String realPath1 = request.getServletContext().getRealPath("/foodImages");
        String realPath = realPath1.replaceFirst("build", "");
//        String filename = Paths.get(part.getSubmittedFileName()).getFileName().toString();
        if (!Files.exists(Paths.get(realPath))) {
            Files.createDirectories(Paths.get(realPath));
        }
        if (part.getSize() == 0) {
            if (restaurantDAO.updateFood(foodID, foodName, cost, description)) {

                //response.sendRedirect(request.getContextPath() + "/EditRestaurantController?id=" + food.getRestaurantID());
                session.setAttribute("stt", "2");
                response.sendRedirect(request.getContextPath() + "/AddFoodController?id=" + food.getRestaurantID());

            }
        } else {
            if (restaurantDAO.updateFood(foodID, foodName, cost, description)) {
                String foodImg = food.getRestaurantID() + "_" + foodID + ".jpg";
                String saveFoodImg = "foodImages/" + foodImg;
                part.write(realPath + "\\" + foodImg);
                restaurantDAO.updateFoodImg(foodID, saveFoodImg);
                  try {
                    Thread.sleep(3000);
                } catch (InterruptedException ex) {
                    Logger.getLogger(EditFoodController.class.getName()).log(Level.SEVERE, null, ex);
                }
                session.setAttribute("stt", "2");
                response.sendRedirect(request.getContextPath() + "/AddFoodController?id=" + food.getRestaurantID());

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
