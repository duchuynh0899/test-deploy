/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author longn
 */
public class Seller {
    
    private int sellerID;
    private String firstName;
    private String lastName;
    private int age;
    private String phone;
    private String email;
    private int countryID;
    private String countryName;
    private String provinceName;
    private String districtName;
    private int provinceID;
    private int districtID;
    private String address;
    private int status;
    int gender;
    private String image;
    private String linkFb;

    public String getLinkFb() {
        return linkFb;
    }

    public void setLinkFb(String linkFb) {
        this.linkFb = linkFb;
    }

    public Seller() {
    }

    public Seller(int sellerID) {
        this.sellerID = sellerID;
    }

    public Seller(int sellerID, String firstName, String lastName, int age, String phone, String email, String countryName, String provinceName, String districtName, String address, int status, int gender, String image,String linkFb) {
        this.sellerID = sellerID;
        this.firstName = firstName;
        this.lastName = lastName;
        this.age = age;
        this.phone = phone;
        this.email = email;
        this.countryName = countryName;
        this.provinceName = provinceName;
        this.districtName = districtName;
        this.address = address;
        this.status = status;
        this.gender = gender;
        this.image = image;
        this.linkFb=linkFb;
    }

    public Seller(int sellerID, String firstName, String lastName, int age, String phone, String email, String countryName, String provinceName, String districtName, String address, int gender,String linkFb) {
        this.sellerID = sellerID;
        this.firstName = firstName;
        this.lastName = lastName;
        this.age = age;
        this.phone = phone;
        this.email = email;
        this.countryName = countryName;
        this.provinceName = provinceName;
        this.districtName = districtName;
        this.address = address;
        this.gender = gender;
        this.linkFb=linkFb;
    }
    
    public Seller(int sellerID, String firstName, String lastName, int age, String phone, String email, int countryID, int provinceID, int districtID, String address, int gender,String linkFb) {
        this.sellerID = sellerID;
        this.firstName = firstName;
        this.lastName = lastName;
        this.age = age;
        this.phone = phone;
        this.email = email;
        this.countryID = countryID;
        this.provinceID = provinceID;
        this.districtID = districtID;
        this.address = address;
        this.gender = gender;
        this.linkFb=linkFb;
    }
    
    public Seller(String firstName, String lastName, int age, String phone, String email, int countryID, int provinceID, int districtID, String address, int gender,String linkFb) {
        this.firstName = firstName;
        this.lastName = lastName;
        this.age = age;
        this.phone = phone;
        this.email = email;
        this.countryID = countryID;
        this.provinceID = provinceID;
        this.districtID = districtID;
        this.address = address;
        this.gender = gender;
        this.linkFb=linkFb;
    }

    public int getSellerID() {
        return sellerID;
    }

    public void setSellerID(int sellerID) {
        this.sellerID = sellerID;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }
    
    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
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

    public String getProvinceName() {
        return provinceName;
    }

    public void setProvinceName(String provinceName) {
        this.provinceName = provinceName;
    }

    public String getDistrictName() {
        return districtName;
    }

    public void setDistrictName(String districtName) {
        this.districtName = districtName;
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

    public void setDistricID(int districID) {
        this.districtID = districID;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public int getGender() {
        return gender;
    }

    public void setGender(int gender) {
        this.gender = gender;
    }
    
}
