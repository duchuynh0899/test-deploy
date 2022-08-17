/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.Date;
import java.sql.Timestamp;


/**
 *
 * @author nguye
 */
public class StarVoting {

    private int id;
    private int studentNo;
    private String studentName;
    private int hostelID;
    private Timestamp date;
    private String message;
    private int restaurantID;
    private int starvoting;
    private String studentAvatar;

    public StarVoting() {
    }

    public StarVoting(int studentNo, String message, int restaurantID, int starvoting) {
        this.studentNo = studentNo;
        this.message = message;
        this.restaurantID = restaurantID;
        this.starvoting = starvoting;
    }

    
    
    
    public StarVoting( int studentNo, int hostelID, String message, int starvoting) {
        
        this.studentNo = studentNo;
        this.hostelID = hostelID;
        this.starvoting = starvoting;
        this.message = message;
    }

    public StarVoting(int id, int studentNo, int hostelID, int starvoting) {
        this.id = id;
        this.studentNo = studentNo;
        this.hostelID = hostelID;
        this.starvoting = starvoting;
    }

    public StarVoting(int studentNo, int hostelID, Timestamp date, String message, int starvoting) {
        this.studentNo = studentNo;
        this.hostelID = hostelID;
        this.date = date;
        this.message = message;
        this.starvoting = starvoting;
    }

    public StarVoting(int id, String studentName, Timestamp date, String message, int starvoting,String studentAvatar) {
        this.id = id;
        this.studentName = studentName;
        this.date = date;
        this.message = message;
        this.starvoting = starvoting;
        this.studentAvatar = studentAvatar;
    }
    
    

    public String getStudentName() {
        return studentName;
    }

    public void setStudentName(String studentName) {
        this.studentName = studentName;
    }

    public String getStudentAvatar() {
        return studentAvatar;
    }

    public void setStudentAvatar(String studentAvatar) {
        this.studentAvatar = studentAvatar;
    }
    
    
    
    

    public Timestamp getDate() {
        return date;
    }

    public void setDate(Timestamp date) {
        this.date = date;
    }
    
    
    
    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }
    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getHostelID() {
        return hostelID;
    }

    public void setHostelID(int hostelID) {
        this.hostelID = hostelID;
    }

    public int getStudentNo() {
        return studentNo;
    }

    public void setStudentNo(int studentNo) {
        this.studentNo = studentNo;
    }

    public int getRestaurantID() {
        return restaurantID;
    }

    public void setRestaurantID(int restaurantID) {
        this.restaurantID = restaurantID;
    }

    public int getStarvoting() {
        return starvoting;
    }

    public void setStarvoting(int starvoting) {
        this.starvoting = starvoting;
    }
    
    
}
