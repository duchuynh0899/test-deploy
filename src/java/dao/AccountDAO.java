/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Account;

/**
 *
 * @author HOANG LONG
 */
public class AccountDAO extends DBContext {

    public Account getAccount(String user, String pass) {
        String sql = "select * from account where username=? and password=?";
        PreparedStatement st;
        try {
            st = connection.prepareStatement(sql);
            st.setString(1, user);
            st.setString(2, pass);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return new Account(user, pass, rs.getInt(3),rs.getBoolean(5));
            }
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    
    
    public boolean exsitedAccount(String username) {
        String sql = "select * from account where username=?";
        PreparedStatement st;
        try {
            st = connection.prepareStatement(sql);
            st.setString(1, username);

            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    public boolean UpdatePassword(String username,String newpass) {
        String sql = "UPDATE Account\n" +
                     "SET Password = ?\n" +
                     "WHERE Username=?";
        PreparedStatement st;
        try {
            st = connection.prepareStatement(sql);
            st.setString(1, newpass);
            st.setString(2, username);
            st.executeUpdate();
            return true;
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return false;
    }
    
    public void insertNewAccount(Account a) {
        String sql = "insert into account values(?,?,?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, a.getRoleId());
            st.setString(2, a.getUsername());
            st.setString(3, a.getPassword());    
            st.setBoolean(4, true);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
    
    public Account checkLogin(String user, String pass) {
        String sql = "select * from account where username=? and password=?";
        PreparedStatement st;
        try {
            st = connection.prepareStatement(sql);
            st.setString(1, user);
            st.setString(2, pass);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return new Account(user, pass, rs.getInt(2),rs.getBoolean(5));
            }
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public String getPasswordByUsername(String username) {
        String sql = "select password from account where username=?";
        PreparedStatement st;
        try {
            st = connection.prepareStatement(sql);
            st.setString(1, username);           
            ResultSet rs = st.executeQuery();
            if (rs.next()) {           
                return rs.getString(1);
            }
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
}
