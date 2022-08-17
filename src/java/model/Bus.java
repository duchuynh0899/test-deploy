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
public class Bus {
    int number;
    float cost;
    String stopPoint;
    String Url1;
    String Url2;
    String shortDes;

    public String getUrl1() {
        return Url1;
    }

    public void setUrl1(String Url1) {
        this.Url1 = Url1;
    }

    public String getUrl2() {
        return Url2;
    }

    public void setUrl2(String Url2) {
        this.Url2 = Url2;
    }

    public String getShortDes() {
        return shortDes;
    }

    public void setShortDes(String shortDes) {
        this.shortDes = shortDes;
    }
    

    public int getNumber() {
        return number;
    }

    public void setNumber(int number) {
        this.number = number;
    }

    public float getCost() {
        return cost;
    }

    public void setCost(float cost) {
        this.cost = cost;
    }

    public String getStopPoint() {
        return stopPoint;
    }

    public void setStopPoint(String stopPoint) {
        this.stopPoint = stopPoint;
    }

    

    public Bus() {
    }

    public Bus(int number, float cost, String Url1, String Url2, String shortDes) {
        this.number = number;
        this.cost = cost;
        this.Url1 = Url1;
        this.Url2 = Url2;
        this.shortDes = shortDes;
    }

    

    public Bus(int number, float cost, String stopPoint, String Url1, String Url2, String shortDes) {
        this.number = number;
        this.cost = cost;
        this.stopPoint = stopPoint;
        this.Url1 = Url1;
        this.Url2 = Url2;
        this.shortDes = shortDes;
    }
    
    
}
