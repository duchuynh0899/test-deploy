/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.RestaurantDAO;
import java.io.IOException;
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
import model.Food;
import model.Restaurant;

/**
 *
 * @author DELL
 */
@MultipartConfig
public class AddFoodController extends HttpServlet {

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
        HttpSession session = request.getSession();
        int id = Integer.parseInt(request.getParameter("id"));
        // int foodID = Integer.parseInt(request.getParameter("foodID"));
        RestaurantDAO restaurantDAO = new RestaurantDAO();
        //Food food = restaurantDAO.getFoodID(foodID);
        Restaurant restaurant = restaurantDAO.getRestaurantID(id);
        ArrayList<Food> listFood = restaurantDAO.listFoodByRestaurant(id);
        request.setAttribute("listFood", listFood);
        request.setAttribute("restaurant", restaurant);
        //  request.setAttribute("food", food);
        request.getRequestDispatcher("addfood.jsp").forward(request, response);
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
        String foodName = request.getParameter("foodName");
        double costFodd = Double.parseDouble(request.getParameter("costFood"));
        String description = request.getParameter("desFood");
        int restaurantID = Integer.parseInt(request.getParameter("id"));
//        String foodID = Integer.parseInt(request.getParameter("foodID"));
//        String image = request.getParameter("imageFood");
        RestaurantDAO restaurantDAO = new RestaurantDAO();
        ArrayList<Food> listFood = restaurantDAO.listFoodByRestaurant(restaurantID);
        Part part = request.getPart("foodImage");
        String realPath1 = request.getServletContext().getRealPath("/foodImages");
        String realPath = realPath1.replaceFirst("build", "");
//        String filename = Paths.get(part.getSubmittedFileName()).getFileName().toString();
        if (!Files.exists(Paths.get(realPath))) {
            Files.createDirectories(Paths.get(realPath));
        }
        if (part.getSize() == 0) {
            if (restaurantDAO.createFood(restaurantID, foodName, costFodd, description)) {
                int newestFoodId = restaurantDAO.getNewestFoodID();
                restaurantDAO.createFoodImg(newestFoodId, "");
                //response.sendRedirect("ListRestaurantBySeller");
                session.setAttribute("stt", "1");
                response.sendRedirect(request.getContextPath() + "/AddFoodController?id=" + restaurantID);
            }
        } else {
            if (restaurantDAO.createFood(restaurantID, foodName, costFodd, description)) {
                int newestFoodId = restaurantDAO.getNewestFoodID();
                String foodImg = restaurantID + "_" + newestFoodId + ".jpg";
                String saveFoodImg = "foodImages/" + foodImg;
                part.write(realPath + "\\" + foodImg);
                restaurantDAO.createFoodImg(newestFoodId, saveFoodImg);
                //response.sendRedirect("ListRestaurantBySeller");
                  try {
                    Thread.sleep(3000);
                } catch (InterruptedException ex) {
                    Logger.getLogger(AddFoodController.class.getName()).log(Level.SEVERE, null, ex);
                }
                session.setAttribute("stt", "1");
                response.sendRedirect(request.getContextPath() + "/AddFoodController?id=" + restaurantID);
            }
        }
//        if (restaurantDAO.createFood(restaurantID, foodName, costFodd, description)) {
//            response.sendRedirect("ListRestaurantBySeller");
//        }
//        if(restaurantDAO.createImageFood(foodID, image)){
//            response.sendRedirect("ListRestaurantBySeller");
//        }
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
