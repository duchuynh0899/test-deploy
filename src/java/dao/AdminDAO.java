/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import model.Admin;
import model.Seller;

/**
 *
 * @author longn
 */
public class AdminDAO extends DBContext {

    PreparedStatement stm = null;
    ResultSet rs = null;

    public void CloseConnection() throws SQLException {
        if (rs != null) {
            rs.close();
        }
        if (stm != null) {
            stm.close();
        }
        if (connection != null) {
            connection.close();
        }
    }

    public Admin getAdminByUsername(String username) {
        try {
            String sql = "select AdminID, FirstName , LastName , Age , Phone , Email , CountryID , ProvinceID , DistrictID , AddressDetail , Gender, LinkFacebook\n"
                    + "from Admins\n"
                    + "where Admins.Email=?";
            PreparedStatement st;
            ResultSet rs;
            st = connection.prepareStatement(sql);
            st.setString(1, username);
            rs = st.executeQuery();
            while (rs.next()) {
                Admin admin = new Admin(rs.getInt("AdminID"), rs.getString("FirstName"), rs.getString("LastName"), rs.getInt("Age"), rs.getString("Phone"),
                        rs.getString("Email"), rs.getInt("CountryID"), rs.getInt("ProvinceID"), rs.getInt("DistrictID"), rs.getString("AddressDetail"), rs.getInt("Gender"), rs.getString("LinkFacebook"));
                st.close();
                rs.close();
                return admin;
            }
            st.close();
            rs.close();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
        return null;
    }

    public String getAvatarByUsername(String username) {
        try {
            String sql = "select Avatar\n"
                    + "from Admins\n"
                    + "where Admins.Email=?";
            PreparedStatement st;
            ResultSet rs;
            st = connection.prepareStatement(sql);
            st.setString(1, username);
            rs = st.executeQuery();
            if (rs.next()) {
                String avatar = rs.getString(1);
                st.close();
                rs.close();
                return avatar;
            }
            st.close();
            rs.close();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
        return null;
    }

   
    
    public boolean updateAdminProfileNoPro(String avatar, String firstName,String lastName,String age,String phone,String countryId,String provinceId,String districtId,String addressDetail,String gender1,String linkFacebook,String email) {      
        try {
            String sql = "UPDATE Admins SET  Avatar=?,FirstName=?,LastName=?,Age=?,Phone=?,CountryID=?,ProvinceID=?,DistrictID=?,AddressDetail=?,Gender=?,LinkFacebook=? where email=?";
            PreparedStatement st;
            st = connection.prepareStatement(sql);
            st.setString(1, avatar);
            st.setString(2, firstName);
            st.setString(3, lastName);
            st.setString(4, age);
            st.setString(5, phone);
            st.setString(6, countryId);
            st.setString(7, provinceId);
            st.setString(8, districtId);
            st.setString(9, addressDetail);
            st.setString(10, gender1);
            st.setString(11, linkFacebook);
            st.setString(12, email);
            st.executeUpdate();
            st.close();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

}
