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
public class Department {
    private int depId;
    private String depName;
    private String depnameAbbreviation;
    private String email;
    private String phone;
    private String openday;
    private String img1;
    private String img2;    
    private String description;
    private String shortdes;

    public Department() {
    }

    public Department(int depId, String depName, String depnameAbbreviation, String email, String phone, String openday, String img1, String img2, String description, String shortdes) {
        this.depId = depId;
        this.depName = depName;
        this.depnameAbbreviation = depnameAbbreviation;
        this.email = email;
        this.phone = phone;
        this.openday = openday;
        this.img1 = img1;
        this.img2 = img2;
        this.description = description;
        this.shortdes = shortdes;
    }

    public int getDepId() {
        return depId;
    }

    public void setDepId(int depId) {
        this.depId = depId;
    }

    public String getDepName() {
        return depName;
    }

    public void setDepName(String depName) {
        this.depName = depName;
    }

    public String getDepnameAbbreviation() {
        return depnameAbbreviation;
    }

    public void setDepnameAbbreviation(String depnameAbbreviation) {
        this.depnameAbbreviation = depnameAbbreviation;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getOpenday() {
        return openday;
    }

    public void setOpenday(String openday) {
        this.openday = openday;
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

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getShortdes() {
        return shortdes;
    }

    public void setShortdes(String shortdes) {
        this.shortdes = shortdes;
    }

    @Override
    public String toString() {
        return "Department{" + "depId=" + depId + ", depName=" + depName + ", depnameAbbreviation=" + depnameAbbreviation + ", email=" + email + ", phone=" + phone + ", openday=" + openday + ", img1=" + img1 + ", img2=" + img2 + ", description=" + description + ", shortdes=" + shortdes + '}';
    }
}
