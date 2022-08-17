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
public class Club {
    private int clubID;
    private String avatar;
    private String clubName;
    private String clubPresident;
    private String facebook;
    private String email;
    private String des;

    public Club() {
    }

    public Club(int clubID, String avatar, String clubName, String clubPresident, String facebook, String email, String des) {
        this.clubID = clubID;
        this.avatar = avatar;
        this.clubName = clubName;
        this.clubPresident = clubPresident;
        this.facebook = facebook;
        this.email = email;
        this.des = des;
    }

    public Club(String avatar, String clubName, String clubPresident, String facebook, String email, String des) {
        this.avatar = avatar;
        this.clubName = clubName;
        this.clubPresident = clubPresident;
        this.facebook = facebook;
        this.email = email;
        this.des = des;
    }

    
    

    public int getClubID() {
        return clubID;
    }

    public void setClubID(int clubID) {
        this.clubID = clubID;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public String getClubName() {
        return clubName;
    }

    public void setClubName(String clubName) {
        this.clubName = clubName;
    }

    public String getClubPresident() {
        return clubPresident;
    }

    public void setClubPresident(String clubPresident) {
        this.clubPresident = clubPresident;
    }

    public String getFacebook() {
        return facebook;
    }

    public void setFacebook(String facebook) {
        this.facebook = facebook;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getDes() {
        return des;
    }

    public void setDes(String des) {
        this.des = des;
    }
    
    
}
