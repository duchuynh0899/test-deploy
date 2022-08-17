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
public class Restaurant {

    private int restaurantID;
    private String restaurantName;
    private int sellerID;
    private String sellerName;
    private int countryID;
    private String countryName;
    private int provinceID;
    private String provinceName;
    private int districtID;
    private String districtName;
    private String address;
    private String cost;
    private float distance;
    private String description;
    private String restaurantImage;

     private float starAVG;

    public double getStarAVG() {
        return starAVG;
    }

    public void setStarAVG(float starAVG) {
        this.starAVG = starAVG;
    }
    

    public Restaurant() {
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

    public int getSellerID() {
        return sellerID;
    }

    public void setSellerID(int sellerID) {
        this.sellerID = sellerID;
    }

    public int getCountryID() {
        return countryID;
    }

    public void setCountryID(int countryID) {
        this.countryID = countryID;
    }

    public String getCountryName() {
        return countryName;
    }

    public void setCountryName(String countryName) {
        this.countryName = countryName;
    }

    public int getProvinceID() {
        return provinceID;
    }

    public void setProvinceID(int provinceID) {
        this.provinceID = provinceID;
    }

    public String getProvinceName() {
        return provinceName;
    }

    public void setProvinceName(String provinceName) {
        this.provinceName = provinceName;
    }

    public int getDistrictID() {
        return districtID;
    }

    public void setDistrictID(int districtID) {
        this.districtID = districtID;
    }

    public String getDistrictName() {
        return districtName;
    }

    public void setDistrictName(String districtName) {
        this.districtName = districtName;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getCost() {
        return cost;
    }

    public void setCost(String cost) {
        this.cost = cost;
    }

    public float getDistance() {
        return distance;
    }

    public void setDistance(float distance) {
        this.distance = distance;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Restaurant(int provinceID, String provinceName) {
        this.provinceID = provinceID;
        this.provinceName = provinceName;
    }

    public String getSellerName() {
        return sellerName;
    }

    public void setSellerName(String sellerName) {
        this.sellerName = sellerName;
    }

    public String getRestaurantImage() {
        return restaurantImage;
    }

    public void setRestaurantImage(String restaurantImage) {
        this.restaurantImage = restaurantImage;
    }

    public Restaurant(String restaurantName, int sellerID, int countryID, int provinceID, int districtID, String address, String cost, float distance, String description) {
        this.restaurantName = restaurantName;
        this.sellerID = sellerID;
        this.countryID = countryID;
        this.provinceID = provinceID;
        this.districtID = districtID;
        this.address = address;
        this.cost = cost;
        this.distance = distance;
        this.description = description;
    }

    public Restaurant(int restaurantID, String restaurantName, String sellerName, String countryName, String provinceName, String districtName, String address, String cost, float distance, String description, String restaurantImage) {
        this.restaurantID = restaurantID;
        this.restaurantName = restaurantName;
        this.sellerName = sellerName;
        this.countryName = countryName;
        this.provinceName = provinceName;
        this.districtName = districtName;
        this.address = address;
        this.cost = cost;
        this.distance = distance;
        this.description = description;
        this.restaurantImage=restaurantImage;
        
    }
    public Restaurant(int restaurantID, String restaurantName, String sellerName ,String countryName, String provinceName, String districtName, String address, String cost, float distance, String description,String restaurantImage, float starAVG ) {
        this.restaurantID = restaurantID;
        this.restaurantName = restaurantName;
        this.sellerName = sellerName;
        this.countryName = countryName;
        this.provinceName = provinceName;
        this.districtName = districtName;
        this.address = address;
        this.cost = cost;
        this.distance = distance;
        this.description = description;
        this.restaurantImage=restaurantImage;
        this.starAVG = starAVG;
    }

    public Restaurant(int restaurantID, String restaurantName, int sellerID, int countryID, int provinceID, int districtID, String address, String cost, float distance, String description, String restaurantImage) {
        this.restaurantID = restaurantID;
        this.restaurantName = restaurantName;
        this.sellerID = sellerID;
        this.countryID = countryID;
        this.provinceID = provinceID;
        this.districtID = districtID;
        this.address = address;
        this.cost = cost;
        this.distance = distance;
        this.description = description;
        this.restaurantImage = restaurantImage;
    }

}
