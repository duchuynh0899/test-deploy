/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author DELL
 */
public class Food {
    private int foodID;
    private int restaurantID;
    private String restaurantName;
    private String foodName;
    private double cost;
    private String descriptions;
    private String imageURL;

    public Food() {
    }

    public int getFoodID() {
        return foodID;
    }

    public void setFoodID(int foodID) {
        this.foodID = foodID;
    }

    public int getRestaurantID() {
        return restaurantID;
    }

    public void setRestaurantID(int restaurantID) {
        this.restaurantID = restaurantID;
    }

    public String getRestaurantName() {
        return restaurantName;
    }

    public void setRestaurantName(String restaurantName) {
        this.restaurantName = restaurantName;
    }

    public String getFoodName() {
        return foodName;
    }

    public void setFoodName(String foodName) {
        this.foodName = foodName;
    }

    public double getCost() {
        return cost;
    }

    public void setCost(double cost) {
        this.cost = cost;
    }

    public String getDescriptions() {
        return descriptions;
    }

    public void setDescriptions(String descriptions) {
        this.descriptions = descriptions;
    }

    public String getImageURL() {
        return imageURL;
    }

    public void setImageURL(String imageURL) {
        this.imageURL = imageURL;
    }

    public Food(int foodID,int restaurantID, String restaurantName, String foodName, double cost, String descriptions, String imageURL) {
        this.foodID = foodID;
        this.restaurantID = restaurantID;
        this.restaurantName = restaurantName;
        this.foodName = foodName;
        this.cost = cost;
        this.descriptions = descriptions;
        this.imageURL = imageURL;
    }

    public Food(int foodID, String imageURL) {
        this.foodID = foodID;
        this.imageURL = imageURL;
    }

    public Food(int foodID, int restaurantID, String foodName, double cost, String descriptions, String imageURL) {
        this.foodID = foodID;
        this.restaurantID = restaurantID;
        this.foodName = foodName;
        this.cost = cost;
        this.descriptions = descriptions;
        this.imageURL = imageURL;
    }
    
    
}
