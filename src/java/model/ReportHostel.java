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
public class ReportHostel {
    private int reportID;
    private int hostelID;
    private String hostelName;
    private int spam;
    private int offensive;
    private int violent;
    private int truthless;
    private Date reportDate;

    public ReportHostel() {
    }

    public int getReportID() {
        return reportID;
    }

    public void setReportID(int reportID) {
        this.reportID = reportID;
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

    public Date getReportDate() {
        return reportDate;
    }

    public void setReportDate(Date reportDate) {
        this.reportDate = reportDate;
    }

    public ReportHostel(int hostelID, int spam, int offensive, int violent, int truthless) {
        this.hostelID = hostelID;
        this.spam = spam;
        this.offensive = offensive;
        this.violent = violent;
        this.truthless = truthless;
    }

    public ReportHostel(int hostelID, String hostelName, int spam, int offensive, int violent, int truthless) {
        this.hostelID = hostelID;
        this.hostelName = hostelName;
        this.spam = spam;
        this.offensive = offensive;
        this.violent = violent;
        this.truthless = truthless;
    }

   
    
    
    
}
