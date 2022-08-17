/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author win
 */
public class Event {
    private int eventID;
    private int clubID;
    private String eventName;
    private String time;
    private String des;
    private String url;

    public Event() {
    }

    public Event(int clubID, String eventName, String time, String des, String url) {
        this.clubID = clubID;
        this.eventName = eventName;
        this.time = time;
        this.des = des;
        this.url = url;
    }

    public Event(int eventID, int clubID, String eventName, String time, String des, String url) {
        this.eventID = eventID;
        this.clubID = clubID;
        this.eventName = eventName;
        this.time = time;
        this.des = des;
        this.url = url;
    }

    public Event(String eventName, String time, String des) {
        this.eventName = eventName;
        this.time = time;
        this.des = des;
    }
    
    public Event(String eventName, String time, String des,String img) {
        this.eventName = eventName;
        this.time = time;
        this.des = des;
        this.url=img;
    }

    public Event(int clubID, String eventName, String time, String des) {
        this.clubID = clubID;
        this.eventName = eventName;
        this.time = time;
        this.des = des;
    }
    

    public int getEventID() {
        return eventID;
    }

    public void setEventID(int eventID) {
        this.eventID = eventID;
    }

    public int getClubID() {
        return clubID;
    }

    public void setClubID(int clubID) {
        this.clubID = clubID;
    }

    public String getEventName() {
        return eventName;
    }

    public void setEventName(String eventName) {
        this.eventName = eventName;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public String getDes() {
        return des;
    }

    public void setDes(String des) {
        this.des = des;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }
    
    
}
