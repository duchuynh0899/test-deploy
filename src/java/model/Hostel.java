/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author nguye
 */
public class Hostel {

    private int hostelID;
    private String hostelName;
    private int sellerID;
    private int totalRoom;
    private boolean status;
    private int floor;
    private int countryID;
    private int provinceID;
    private int districtID;
    private String countryName;
    private String provinceNamẹ;
    private String districtName;
    private String address;
    private double cost;
    private double distance;
    private String description;
    private String sellerName;
    private String img1;
    private String img2;
    private String img3;
    private String img4;
    private String img5;
    private String img6;
    
    private double starAVG;
    
    public Hostel() {
    }

    public Hostel(String hostelName, int totalRoom, boolean status, int floor, int provinceID, int districtID, String address, double cost, double distance, String description) {
        this.hostelName = hostelName;
        this.totalRoom = totalRoom;
        this.status = status;
        this.floor = floor;
        this.provinceID = provinceID;
        this.districtID = districtID;
        this.address = address;
        this.cost = cost;
        this.distance = distance;
        this.description = description;
    }

    public Hostel(int hostelID, String hostelName, int totalRoom, boolean status, int floor, int provinceID, int districtID, String address, double cost, double distance, String description) {
        this.hostelID = hostelID;
        this.hostelName = hostelName;
        this.totalRoom = totalRoom;
        this.status = status;
        this.floor = floor;
        this.provinceID = provinceID;
        this.districtID = districtID;
        this.address = address;
        this.cost = cost;
        this.distance = distance;
        this.description = description;
    }
    
    public Hostel(int hostelID, String hostelName, String sellerName, int totalRoom, boolean status, int floor, String countryName, String provinceNamẹ, String districtName, String address, double cost, double distance, String description, String img1, String img2, String img3, String img4, String img5, String img6, double starAVG) {
        this.hostelID = hostelID;
        this.hostelName = hostelName;
        this.sellerName = sellerName;
        this.totalRoom = totalRoom;
        this.status = status;
        this.floor = floor;
        this.countryName = countryName;
        this.provinceNamẹ = provinceNamẹ;
        this.districtName = districtName;
        this.address = address;
        this.cost = cost;
        this.distance = distance;
        this.description = description;
        this.img1 = img1;
        this.img2 = img2;
        this.img3 = img3;
        this.img4 = img4;
        this.img5 = img5;
        this.img6 = img6;
        this.starAVG = starAVG;
    }

    public Hostel(int hostelID, String hostelName, int sellerID, int totalRoom, boolean status, int floor, int countryID, int provinceID, int districtID, String address, double cost, double distance, String description) {
        this.hostelID = hostelID;
        this.hostelName = hostelName;
        this.sellerID = sellerID;
        this.totalRoom = totalRoom;
        this.status = status;
        this.floor = floor;
        this.countryID = countryID;
        this.provinceID = provinceID;
        this.districtID = districtID;
        this.address = address;
        this.cost = cost;
        this.distance = distance;
        this.description = description;
    }

    public Hostel(String hostelName, int sellerID, int totalRoom, boolean status, int floor, int countryID, int provinceID, int districtID, String address, double cost, double distance, String description) {
        this.hostelName = hostelName;
        this.sellerID = sellerID;
        this.totalRoom = totalRoom;
        this.status = status;
        this.floor = floor;
        this.countryID = countryID;
        this.provinceID = provinceID;
        this.districtID = districtID;

        this.address = address;
        this.cost = cost;
        this.distance = distance;
        this.description = description;
    }

 

    public double getStarAVG() {
        return starAVG;
    }

    public void setStarAVG(double starAVG) {
        this.starAVG = starAVG;
    }

    

    

    
    public String getImg1() {
        return img1;
    }

    public void setImg1(String img1) {
        this.img1 = img1;
    }

    public String getImg2() {
        return img2;
    }

    public void setImg2(String img2) {
        this.img2 = img2;
    }

    public String getImg3() {
        return img3;
    }

    public void setImg3(String img3) {
        this.img3 = img3;
    }

    public String getImg4() {
        return img4;
    }

    public void setImg4(String img4) {
        this.img4 = img4;
    }

    public String getImg5() {
        return img5;
    }

    public void setImg5(String img5) {
        this.img5 = img5;
    }

    public String getImg6() {
        return img6;
    }

    public void setImg6(String img6) {
        this.img6 = img6;
    }

    public String getSellerName() {
        return sellerName;
    }

    public void setSellerName(String sellerName) {
        this.sellerName = sellerName;
    }

    public String getCountryName() {
        return countryName;
    }

    public void setCountryName(String countryName) {
        this.countryName = countryName;
    }

    public String getProvinceNamẹ() {
        return provinceNamẹ;
    }

    public void setProvinceNamẹ(String provinceNamẹ) {
        this.provinceNamẹ = provinceNamẹ;
    }

    public String getDistrictName() {
        return districtName;
    }

    public void setDistrictName(String districtName) {
        this.districtName = districtName;
    }

    public int getHostelID() {
        return hostelID;
    }

    public void setHostelID(int hostelID) {
        this.hostelID = hostelID;
    }

    public String getHostelName() {
        return hostelName;
    }

    public void setHostelName(String hostelName) {
        this.hostelName = hostelName;
    }

    public int getSellerID() {
        return sellerID;
    }

    public void setSellerID(int sellerID) {
        this.sellerID = sellerID;
    }

    public int getTotalRoom() {
        return totalRoom;
    }

    public void setTotalRoom(int totalRoom) {
        this.totalRoom = totalRoom;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public int getFloor() {
        return floor;
    }

    public void setFloor(int floor) {
        this.floor = floor;
    }

    public int getCountryID() {
        return countryID;
    }

    public void setCountryID(int countryID) {
        this.countryID = countryID;
    }

    public int getProvinceID() {
        return provinceID;
    }

    public void setProvinceID(int provinceID) {
        this.provinceID = provinceID;
    }

    public int getDistrictID() {
        return districtID;
    }

    public void setDistrictID(int districtID) {
        this.districtID = districtID;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public double getCost() {
        return cost;
    }

    public void setCost(double cost) {
        this.cost = cost;
    }

    public double getDistance() {
        return distance;
    }

    public void setDistance(double distance) {
        this.distance = distance;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

}
