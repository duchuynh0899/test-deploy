/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import com.google.gson.Gson;
import dao.AddressDAO;
import dao.RestaurantDAO;
import java.io.IOException;
import java.io.PrintWriter;
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
public class EditRestaurantController extends HttpServlet {

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

        request.setCharacterEncoding("utf-8");
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

        int id = Integer.parseInt(request.getParameter("id"));

        RestaurantDAO restaurantDAO = new RestaurantDAO();
        Restaurant restaurant = restaurantDAO.getRestaurantID(id);

        ArrayList<Food> listFood = restaurantDAO.listFoodByRestaurant(id);

        AddressDAO a = new AddressDAO();
        request.setAttribute("listFood", listFood);
        request.setAttribute("restaurant", restaurant);

        request.setAttribute("listProvince", a.listProvince());
        request.setAttribute("listDistrict", a.getDistrictByProName(restaurant.getProvinceName()));
        request.getRequestDispatcher("editRestaurant.jsp").forward(request, response);
        HttpSession session = request.getSession();
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
        RestaurantDAO restaurantDAO = new RestaurantDAO();
        int restaurantID = Integer.parseInt(request.getParameter("id"));
        String restaurantName = request.getParameter("restaurantName");
        int provinceID = Integer.parseInt(request.getParameter("province"));
        int districtID = Integer.parseInt(request.getParameter("district"));
        String address = request.getParameter("address");
        String cost = request.getParameter("cost");
        //   String image = request.getParameter("image");
        float distance = Float.parseFloat(request.getParameter("distance"));
        String description = request.getParameter("description");
//        if (restaurantDAO.updateRestaurant(restaurantID, restaurantName, provinceID, districtID, address, cost, distance, description,image)) {
//            response.sendRedirect("ListRestaurantBySeller");
//        }
        Part part = request.getPart("restaurantImage");
        String realPath1 = request.getServletContext().getRealPath("/restaurantImages");
        String realPath = realPath1.replaceFirst("build", "");
        if (!Files.exists(Paths.get(realPath))) {
            Files.createDirectories(Paths.get(realPath));
        }
        if (part.getSize() == 0) {
            if (restaurantDAO.updateRestaurantNoImg(restaurantID, restaurantName, provinceID, districtID, address, cost, distance, description)) {
                session.setAttribute("stt", "1");
                response.sendRedirect(request.getContextPath() + "/EditRestaurantController?id=" + restaurantID);
            }
        } else {
            String restaurantImg = restaurantName + "img.jpg";
            String SaveRestaurantImg = "restaurantImages/" + restaurantImg;
            part.write(realPath + "\\" + restaurantImg);
            if (restaurantDAO.updateRestaurant(restaurantID, restaurantName, provinceID, districtID, address, cost, distance, description, SaveRestaurantImg)) {
                session.setAttribute("stt", "1");
                try {
                    Thread.sleep(3000);
                } catch (InterruptedException ex) {
                    Logger.getLogger(EditRestaurantController.class.getName()).log(Level.SEVERE, null, ex);
                }
                response.sendRedirect(request.getContextPath() + "/EditRestaurantController?id=" + restaurantID);

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
