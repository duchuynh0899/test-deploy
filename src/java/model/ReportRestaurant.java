/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.Date;

/**
 *
 * @author DELL
 */
public class ReportRestaurant {
    private int reportID;
    private int restaurantID;
    private String restaurantName;
    private int countReport;
    private int spam;
    private int offensive;
    private int violent;
    private int truthless;
    private Date reportTime;

    public ReportRestaurant() {
    }

    public int getReportID() {
        return reportID;
    }

    public void setReportID(int reportID) {
        this.reportID = reportID;
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

    public int getSpam() {
        return spam;
    }

    public void setSpam(int spam) {
        this.spam = spam;
    }

    public int getOffensive() {
        return offensive;
    }

    public void setOffensive(int offensive) {
        this.offensive = offensive;
    }

    public int getViolent() {
        return violent;
    }

    public void setViolent(int violent) {
        this.violent = violent;
    }

    public int getTruthless() {
        return truthless;
    }

    public void setTruthless(int truthless) {
        this.truthless = truthless;
    }

    public Date getReportTime() {
        return reportTime;
    }

    public void setReportTime(Date reportTime) {
        this.reportTime = reportTime;
    }

    public int getCountReport() {
        return countReport;
    }

    public void setCountReport(int countReport) {
        this.countReport = countReport;
    }
    

    public ReportRestaurant(int restaurantID, int spam, int offensive, int violent, int truthless) {
        this.restaurantID = restaurantID;
        this.spam = spam;
        this.offensive = offensive;
        this.violent = violent;
        this.truthless = truthless;
        
    }

    public ReportRestaurant(int restaurantID, String restaurantName, int spam, int offensive, int violent, int truthless) {
        this.restaurantID = restaurantID;
        this.restaurantName = restaurantName;
        this.spam = spam;
        this.offensive = offensive;
        this.violent = violent;
        this.truthless = truthless;
    }

 
   

   
    
    
}
