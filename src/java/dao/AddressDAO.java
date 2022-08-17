/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Department;
import model.District;
import model.Province;

/**
 *
 * @author nguye
 */
public class AddressDAO extends DBContext{
    
    
    public ArrayList<Province> listProvince() {
        ArrayList<Province> p = new ArrayList<>();
        try {

            String sql = "select * from Province";
            PreparedStatement st;

            st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                p.add(new Province(rs.getInt(1), rs.getString(3)));
            }

        } catch (SQLException ex) {
            Logger.getLogger(AddressDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return p;
    }
    
     public ArrayList<District> listDistrict(int provinceID) {
        ArrayList<District> d = new ArrayList<>();
        try {

            String sql = "select * from District where ProvinceID = ?";
            PreparedStatement st;
            
            st = connection.prepareStatement(sql);
            st.setInt(1, provinceID);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                d.add(new District(rs.getInt(1), rs.getString(3)));
            }

        } catch (SQLException ex) {
            Logger.getLogger(AddressDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return d;
    }
     public ArrayList<District> getDistrictByProName(String provinceName) {
        ArrayList<District> d = new ArrayList<>();
        try {

            String sql = "select * from District d join Province p on d.ProvinceID = p.ProvinceID where p.ProvinceName = ?";
            PreparedStatement st;
            
            st = connection.prepareStatement(sql);
            st.setString(1, provinceName);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                d.add(new District(rs.getInt(1), rs.getString(3)));
            }

        } catch (SQLException ex) {
            Logger.getLogger(AddressDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return d;
    }
    
    
//    public static void main(String[] args) {
//        AddressDAO a = new AddressDAO();
//        System.out.println(a.getDistrictByProName("Bắc Giang").get(0).getDistrictName());
//    }
}
