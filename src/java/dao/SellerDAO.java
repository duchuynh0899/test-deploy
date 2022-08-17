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
import model.Seller;

/**
 *
 * @author DELL
 */
public class SellerDAO extends DBContext {

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

    public ArrayList<Seller> getAllSeller(int index) throws ClassNotFoundException, SQLException, Exception {
        ArrayList<Seller> list = new ArrayList<>();
        String sql = "select SellerID, FirstName , LastName , Age , Phone , Email , CountryName , ProvinceName , DistrictName , AddressDetail ,Account.AccountStatus , Gender,Avatar,LinkFacebook\n"
                + "from Sellers\n"
                + "inner join Country on Sellers.CountryID=Country.CountryID\n"
                + "inner join Province on Sellers.ProvinceID = Province.ProvinceID\n"
                + "inner join District on Sellers.DistrictID = District.DistrictID\n"
                + "inner join Account on Sellers.Email = Account.username\n"
                + "ORDER BY SellerID\n"
                + "OFFSET ? ROWS FETCH NEXT 6 ROWS ONLY;";
        PreparedStatement ps = connection.prepareStatement(sql);
        ps.setInt(1, (index - 1) * 6);
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            list.add(new Seller(rs.getInt("sellerID"), rs.getString("FirstName"), rs.getString("LastName"), rs.getInt("Age"), rs.getString("Phone"),
                    rs.getString("Email"), rs.getString("CountryName"), rs.getString("ProvinceName"), rs.getString("DistrictName"), rs.getString("AddressDetail"), rs.getInt("AccountStatus"), rs.getInt("Gender"), rs.getString("Avatar"), rs.getString("LinkFacebook")));
        }
        return list;
    }

    public ArrayList<Seller> getAllSellerNoPagging() {
        ArrayList<Seller> list = new ArrayList<>();
        try {
            String sql = "select SellerID, FirstName , LastName , Age , Phone , Email , CountryName , ProvinceName , DistrictName , AddressDetail ,Account.AccountStatus , Gender,Avatar,LinkFacebook\n"
                    + "from Sellers\n"
                    + "inner join Country on Sellers.CountryID=Country.CountryID\n"
                    + "inner join Province on Sellers.ProvinceID = Province.ProvinceID\n"
                    + "inner join District on Sellers.DistrictID = District.DistrictID\n"
                    + "inner join Account on Sellers.Email = Account.username\n"
                    + "ORDER BY SellerID";
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Seller(rs.getInt("sellerID"), rs.getString("FirstName"), rs.getString("LastName"), rs.getInt("Age"), rs.getString("Phone"),
                        rs.getString("Email"), rs.getString("CountryName"), rs.getString("ProvinceName"), rs.getString("DistrictName"), rs.getString("AddressDetail"), rs.getInt("AccountStatus"), rs.getInt("Gender"), rs.getString("Avatar"), rs.getString("LinkFacebook")));
            }

        } catch (SQLException ex) {
            Logger.getLogger(SellerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public ArrayList<Seller> filterSellerWithText(String key, int province, int status, int gender) {
        ArrayList<Seller> list = new ArrayList<>();
        try {
            String sql = "select SellerID, FirstName , LastName , Age , Phone , Email , CountryName , ProvinceName , DistrictName , \n"
                    + "AddressDetail ,Account.AccountStatus , Gender,Avatar,LinkFacebook from Sellers\n"
                    + "inner join Country on Sellers.CountryID=Country.CountryID\n"
                    + "inner join Province on Sellers.ProvinceID = Province.ProvinceID\n"
                    + "inner join District on Sellers.DistrictID = District.DistrictID\n"
                    + "inner join Account on Sellers.Email = Account.username\n"
                    + "WHERE (FirstName LIKE N'%" + key + "%' OR LastName LIKE N'%" + key + "%') AND Sellers.ProvinceID = " + province + " \n"
                    + "and Account.AccountStatus = " + status + " and Gender = " + gender + "\n"
                    + "ORDER BY SellerID";
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Seller(rs.getInt("sellerID"), rs.getString("FirstName"), rs.getString("LastName"), rs.getInt("Age"), rs.getString("Phone"),
                        rs.getString("Email"), rs.getString("CountryName"), rs.getString("ProvinceName"), rs.getString("DistrictName"), rs.getString("AddressDetail"), rs.getInt("AccountStatus"), rs.getInt("Gender"), rs.getString("Avatar"), rs.getString("LinkFacebook")));
            }

        } catch (SQLException ex) {
            Logger.getLogger(SellerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public ArrayList<Seller> filterSellerWithTextNoProNoGenNoSta(String key) {
        ArrayList<Seller> list = new ArrayList<>();
        try {
            String sql = "select SellerID, FirstName , LastName , Age , Phone , Email , CountryName , ProvinceName , DistrictName , \n"
                    + "AddressDetail ,Account.AccountStatus , Gender,Avatar,LinkFacebook from Sellers\n"
                    + "inner join Country on Sellers.CountryID=Country.CountryID\n"
                    + "inner join Province on Sellers.ProvinceID = Province.ProvinceID\n"
                    + "inner join District on Sellers.DistrictID = District.DistrictID\n"
                    + "inner join Account on Sellers.Email = Account.username\n"
                    + "WHERE (FirstName LIKE N'%" + key + "%' OR LastName LIKE N'%" + key + "%') \n"
                    + "ORDER BY SellerID";
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Seller(rs.getInt("sellerID"), rs.getString("FirstName"), rs.getString("LastName"), rs.getInt("Age"), rs.getString("Phone"),
                        rs.getString("Email"), rs.getString("CountryName"), rs.getString("ProvinceName"), rs.getString("DistrictName"), rs.getString("AddressDetail"), rs.getInt("AccountStatus"), rs.getInt("Gender"), rs.getString("Avatar"), rs.getString("LinkFacebook")));
            }

        } catch (SQLException ex) {
            Logger.getLogger(SellerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public ArrayList<Seller> filterSellerWithTextNoProNoGen(String key, int status) {
        ArrayList<Seller> list = new ArrayList<>();
        try {
            String sql = "select SellerID, FirstName , LastName , Age , Phone , Email , CountryName , ProvinceName , DistrictName , \n"
                    + "AddressDetail ,Account.AccountStatus , Gender,Avatar,LinkFacebook from Sellers\n"
                    + "inner join Country on Sellers.CountryID=Country.CountryID\n"
                    + "inner join Province on Sellers.ProvinceID = Province.ProvinceID\n"
                    + "inner join District on Sellers.DistrictID = District.DistrictID\n"
                    + "inner join Account on Sellers.Email = Account.username\n"
                    + "WHERE (FirstName LIKE N'%" + key + "%' OR LastName LIKE N'%" + key + "%')  \n"
                    + "and Account.AccountStatus = " + status + " \n"
                    + "ORDER BY SellerID";
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Seller(rs.getInt("sellerID"), rs.getString("FirstName"), rs.getString("LastName"), rs.getInt("Age"), rs.getString("Phone"),
                        rs.getString("Email"), rs.getString("CountryName"), rs.getString("ProvinceName"), rs.getString("DistrictName"), rs.getString("AddressDetail"), rs.getInt("AccountStatus"), rs.getInt("Gender"), rs.getString("Avatar"), rs.getString("LinkFacebook")));
            }

        } catch (SQLException ex) {
            Logger.getLogger(SellerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public ArrayList<Seller> filterSellerWithTextNoProNoSta(String key, int gender) {
        ArrayList<Seller> list = new ArrayList<>();
        try {
            String sql = "select SellerID, FirstName , LastName , Age , Phone , Email , CountryName , ProvinceName , DistrictName , \n"
                    + "AddressDetail ,Account.AccountStatus , Gender,Avatar,LinkFacebook from Sellers\n"
                    + "inner join Country on Sellers.CountryID=Country.CountryID\n"
                    + "inner join Province on Sellers.ProvinceID = Province.ProvinceID\n"
                    + "inner join District on Sellers.DistrictID = District.DistrictID\n"
                    + "inner join Account on Sellers.Email = Account.username\n"
                    + "WHERE (FirstName LIKE N'%" + key + "%' OR LastName LIKE N'%" + key + "%')  and Gender = " + gender + "\n"
                    + "ORDER BY SellerID";
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Seller(rs.getInt("sellerID"), rs.getString("FirstName"), rs.getString("LastName"), rs.getInt("Age"), rs.getString("Phone"),
                        rs.getString("Email"), rs.getString("CountryName"), rs.getString("ProvinceName"), rs.getString("DistrictName"), rs.getString("AddressDetail"), rs.getInt("AccountStatus"), rs.getInt("Gender"), rs.getString("Avatar"), rs.getString("LinkFacebook")));
            }

        } catch (SQLException ex) {
            Logger.getLogger(SellerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public ArrayList<Seller> filterSellerWithTextNoGenNoSta(String key, int province) {
        ArrayList<Seller> list = new ArrayList<>();
        try {
            String sql = "select SellerID, FirstName , LastName , Age , Phone , Email , CountryName , ProvinceName , DistrictName , \n"
                    + "AddressDetail ,Account.AccountStatus , Gender,Avatar,LinkFacebook from Sellers\n"
                    + "inner join Country on Sellers.CountryID=Country.CountryID\n"
                    + "inner join Province on Sellers.ProvinceID = Province.ProvinceID\n"
                    + "inner join District on Sellers.DistrictID = District.DistrictID\n"
                    + "inner join Account on Sellers.Email = Account.username\n"
                    + "WHERE (FirstName LIKE N'%" + key + "%' OR LastName LIKE N'%" + key + "%') AND Sellers.ProvinceID = " + province + " \n"
                    + "ORDER BY SellerID";
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Seller(rs.getInt("sellerID"), rs.getString("FirstName"), rs.getString("LastName"), rs.getInt("Age"), rs.getString("Phone"),
                        rs.getString("Email"), rs.getString("CountryName"), rs.getString("ProvinceName"), rs.getString("DistrictName"), rs.getString("AddressDetail"), rs.getInt("AccountStatus"), rs.getInt("Gender"), rs.getString("Avatar"), rs.getString("LinkFacebook")));
            }

        } catch (SQLException ex) {
            Logger.getLogger(SellerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public ArrayList<Seller> filterSellerWithTextNoGen(String key, int province, int status) {
        ArrayList<Seller> list = new ArrayList<>();
        try {
            String sql = "select SellerID, FirstName , LastName , Age , Phone , Email , CountryName , ProvinceName , DistrictName , \n"
                    + "AddressDetail ,Account.AccountStatus , Gender,Avatar,LinkFacebook from Sellers\n"
                    + "inner join Country on Sellers.CountryID=Country.CountryID\n"
                    + "inner join Province on Sellers.ProvinceID = Province.ProvinceID\n"
                    + "inner join District on Sellers.DistrictID = District.DistrictID\n"
                    + "inner join Account on Sellers.Email = Account.username\n"
                    + "WHERE (FirstName LIKE N'%" + key + "%' OR LastName LIKE N'%" + key + "%') AND Sellers.ProvinceID = " + province + " \n"
                    + "and Account.AccountStatus = " + status + " \n"
                    + "ORDER BY SellerID";
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Seller(rs.getInt("sellerID"), rs.getString("FirstName"), rs.getString("LastName"), rs.getInt("Age"), rs.getString("Phone"),
                        rs.getString("Email"), rs.getString("CountryName"), rs.getString("ProvinceName"), rs.getString("DistrictName"), rs.getString("AddressDetail"), rs.getInt("AccountStatus"), rs.getInt("Gender"), rs.getString("Avatar"), rs.getString("LinkFacebook")));
            }

        } catch (SQLException ex) {
            Logger.getLogger(SellerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public ArrayList<Seller> filterSellerWithTextNoSta(String key, int province, int gender) {
        ArrayList<Seller> list = new ArrayList<>();
        try {
            String sql = "select SellerID, FirstName , LastName , Age , Phone , Email , CountryName , ProvinceName , DistrictName , \n"
                    + "AddressDetail ,Account.AccountStatus , Gender,Avatar,LinkFacebook from Sellers\n"
                    + "inner join Country on Sellers.CountryID=Country.CountryID\n"
                    + "inner join Province on Sellers.ProvinceID = Province.ProvinceID\n"
                    + "inner join District on Sellers.DistrictID = District.DistrictID\n"
                    + "inner join Account on Sellers.Email = Account.username\n"
                    + "WHERE (FirstName LIKE N'%" + key + "%' OR LastName LIKE N'%" + key + "%') AND Sellers.ProvinceID = " + province + " \n"
                    + "and Gender = " + gender + "\n"
                    + "ORDER BY SellerID";
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Seller(rs.getInt("sellerID"), rs.getString("FirstName"), rs.getString("LastName"), rs.getInt("Age"), rs.getString("Phone"),
                        rs.getString("Email"), rs.getString("CountryName"), rs.getString("ProvinceName"), rs.getString("DistrictName"), rs.getString("AddressDetail"), rs.getInt("AccountStatus"), rs.getInt("Gender"), rs.getString("Avatar"), rs.getString("LinkFacebook")));
            }

        } catch (SQLException ex) {
            Logger.getLogger(SellerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public ArrayList<Seller> filterSellerWithTextAndAll(String key, int province, int gender, int status) {
        ArrayList<Seller> list = new ArrayList<>();
        try {
            String sql = "select SellerID, FirstName , LastName , Age , Phone , Email , CountryName , ProvinceName , DistrictName , \n"
                    + "AddressDetail ,Account.AccountStatus , Gender,Avatar,LinkFacebook from Sellers\n"
                    + "inner join Country on Sellers.CountryID=Country.CountryID\n"
                    + "inner join Province on Sellers.ProvinceID = Province.ProvinceID\n"
                    + "inner join District on Sellers.DistrictID = District.DistrictID\n"
                    + "inner join Account on Sellers.Email = Account.username\n"
                    + "WHERE (FirstName LIKE N'%" + key + "%' OR LastName LIKE N'%" + key + "%') AND Sellers.ProvinceID = " + province + " \n"
                    + "and Gender = " + gender + "\n"
                    + "and Account.AccountStatus = " + status + " \n"
                    + "ORDER BY SellerID";
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Seller(rs.getInt("sellerID"), rs.getString("FirstName"), rs.getString("LastName"), rs.getInt("Age"), rs.getString("Phone"),
                        rs.getString("Email"), rs.getString("CountryName"), rs.getString("ProvinceName"), rs.getString("DistrictName"), rs.getString("AddressDetail"), rs.getInt("AccountStatus"), rs.getInt("Gender"), rs.getString("Avatar"), rs.getString("LinkFacebook")));
            }

        } catch (SQLException ex) {
            Logger.getLogger(SellerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public ArrayList<Seller> filterSellerWithTextNoProvince(String key, int status, int gender) {
        ArrayList<Seller> list = new ArrayList<>();
        try {
            String sql = "select SellerID, FirstName , LastName , Age , Phone , Email , CountryName , ProvinceName , DistrictName , \n"
                    + "AddressDetail ,Account.AccountStatus , Gender,Avatar,LinkFacebook from Sellers\n"
                    + "inner join Country on Sellers.CountryID=Country.CountryID\n"
                    + "inner join Province on Sellers.ProvinceID = Province.ProvinceID\n"
                    + "inner join District on Sellers.DistrictID = District.DistrictID\n"
                    + "inner join Account on Sellers.Email = Account.username\n"
                    + "WHERE (FirstName LIKE N'%" + key + "%' OR LastName LIKE N'%" + key + "%') \n"
                    + "and Account.AccountStatus = " + status + " and Gender = " + gender + "\n"
                    + "ORDER BY SellerID";
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Seller(rs.getInt("sellerID"), rs.getString("FirstName"), rs.getString("LastName"), rs.getInt("Age"), rs.getString("Phone"),
                        rs.getString("Email"), rs.getString("CountryName"), rs.getString("ProvinceName"), rs.getString("DistrictName"), rs.getString("AddressDetail"), rs.getInt("AccountStatus"), rs.getInt("Gender"), rs.getString("Avatar"), rs.getString("LinkFacebook")));
            }

        } catch (SQLException ex) {
            Logger.getLogger(SellerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public ArrayList<Seller> filterSellerNoText(int province, int status, int gender) {
        ArrayList<Seller> list = new ArrayList<>();
        try {
            String sql = "select SellerID, FirstName , LastName , Age , Phone , Email , CountryName , ProvinceName , DistrictName , \n"
                    + "AddressDetail ,Account.AccountStatus , Gender,Avatar,LinkFacebook from Sellers\n"
                    + "inner join Country on Sellers.CountryID=Country.CountryID\n"
                    + "inner join Province on Sellers.ProvinceID = Province.ProvinceID\n"
                    + "inner join District on Sellers.DistrictID = District.DistrictID\n"
                    + "inner join Account on Sellers.Email = Account.username\n"
                    + "WHERE Sellers.ProvinceID = " + province + " \n"
                    + "and Account.AccountStatus = " + status + " and Gender = " + gender + "\n"
                    + "ORDER BY SellerID";
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Seller(rs.getInt("sellerID"), rs.getString("FirstName"), rs.getString("LastName"), rs.getInt("Age"), rs.getString("Phone"),
                        rs.getString("Email"), rs.getString("CountryName"), rs.getString("ProvinceName"), rs.getString("DistrictName"), rs.getString("AddressDetail"), rs.getInt("AccountStatus"), rs.getInt("Gender"), rs.getString("Avatar"), rs.getString("LinkFacebook")));
            }

        } catch (SQLException ex) {
            Logger.getLogger(SellerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public ArrayList<Seller> filterSellerNoTextNoGenDerNoStatus(int province) {
        ArrayList<Seller> list = new ArrayList<>();
        try {
            String sql = "select SellerID, FirstName , LastName , Age , Phone , Email , CountryName , ProvinceName , DistrictName , \n"
                    + "AddressDetail ,Account.AccountStatus , Gender,Avatar,LinkFacebook from Sellers\n"
                    + "inner join Country on Sellers.CountryID=Country.CountryID\n"
                    + "inner join Province on Sellers.ProvinceID = Province.ProvinceID\n"
                    + "inner join District on Sellers.DistrictID = District.DistrictID\n"
                    + "inner join Account on Sellers.Email = Account.username\n"
                    + "WHERE Sellers.ProvinceID = " + province + " \n"
                    + "ORDER BY SellerID";
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Seller(rs.getInt("sellerID"), rs.getString("FirstName"), rs.getString("LastName"), rs.getInt("Age"), rs.getString("Phone"),
                        rs.getString("Email"), rs.getString("CountryName"), rs.getString("ProvinceName"), rs.getString("DistrictName"), rs.getString("AddressDetail"), rs.getInt("AccountStatus"), rs.getInt("Gender"), rs.getString("Avatar"), rs.getString("LinkFacebook")));
            }

        } catch (SQLException ex) {
            Logger.getLogger(SellerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public ArrayList<Seller> filterSellerNoTextNoStatus(int province, int gender) {
        ArrayList<Seller> list = new ArrayList<>();
        try {
            String sql = "select SellerID, FirstName , LastName , Age , Phone , Email , CountryName , ProvinceName , DistrictName , \n"
                    + "AddressDetail ,Account.AccountStatus , Gender,Avatar,LinkFacebook from Sellers\n"
                    + "inner join Country on Sellers.CountryID=Country.CountryID\n"
                    + "inner join Province on Sellers.ProvinceID = Province.ProvinceID\n"
                    + "inner join District on Sellers.DistrictID = District.DistrictID\n"
                    + "inner join Account on Sellers.Email = Account.username\n"
                    + "WHERE Sellers.ProvinceID = " + province + " and Gender = " + gender + "\n"
                    + "ORDER BY SellerID";
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Seller(rs.getInt("sellerID"), rs.getString("FirstName"), rs.getString("LastName"), rs.getInt("Age"), rs.getString("Phone"),
                        rs.getString("Email"), rs.getString("CountryName"), rs.getString("ProvinceName"), rs.getString("DistrictName"), rs.getString("AddressDetail"), rs.getInt("AccountStatus"), rs.getInt("Gender"), rs.getString("Avatar"), rs.getString("LinkFacebook")));
            }

        } catch (SQLException ex) {
            Logger.getLogger(SellerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public ArrayList<Seller> filterSellerNoTextNoGender(int province, int status) {
        ArrayList<Seller> list = new ArrayList<>();
        try {
            String sql = "select SellerID, FirstName , LastName , Age , Phone , Email , CountryName , ProvinceName , DistrictName , \n"
                    + "AddressDetail ,Account.AccountStatus , Gender,Avatar,LinkFacebook from Sellers\n"
                    + "inner join Country on Sellers.CountryID=Country.CountryID\n"
                    + "inner join Province on Sellers.ProvinceID = Province.ProvinceID\n"
                    + "inner join District on Sellers.DistrictID = District.DistrictID\n"
                    + "inner join Account on Sellers.Email = Account.username\n"
                    + "WHERE Sellers.ProvinceID = " + province + " \n"
                    + "and Account.AccountStatus = " + status + " \n"
                    + "ORDER BY SellerID";
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Seller(rs.getInt("sellerID"), rs.getString("FirstName"), rs.getString("LastName"), rs.getInt("Age"), rs.getString("Phone"),
                        rs.getString("Email"), rs.getString("CountryName"), rs.getString("ProvinceName"), rs.getString("DistrictName"), rs.getString("AddressDetail"), rs.getInt("AccountStatus"), rs.getInt("Gender"), rs.getString("Avatar"), rs.getString("LinkFacebook")));
            }

        } catch (SQLException ex) {
            Logger.getLogger(SellerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public ArrayList<Seller> filterSellerNoTextNoProvince(int status, int gender) {
        ArrayList<Seller> list = new ArrayList<>();
        try {
            String sql = "select SellerID, FirstName , LastName , Age , Phone , Email , CountryName , ProvinceName , DistrictName , \n"
                    + "AddressDetail ,Account.AccountStatus , Gender,Avatar,LinkFacebook from Sellers\n"
                    + "inner join Country on Sellers.CountryID=Country.CountryID\n"
                    + "inner join Province on Sellers.ProvinceID = Province.ProvinceID\n"
                    + "inner join District on Sellers.DistrictID = District.DistrictID\n"
                    + "inner join Account on Sellers.Email = Account.username\n"
                    + "WHERE Account.AccountStatus = " + status + " and Gender = " + gender + "\n"
                    + "ORDER BY SellerID";
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Seller(rs.getInt("sellerID"), rs.getString("FirstName"), rs.getString("LastName"), rs.getInt("Age"), rs.getString("Phone"),
                        rs.getString("Email"), rs.getString("CountryName"), rs.getString("ProvinceName"), rs.getString("DistrictName"), rs.getString("AddressDetail"), rs.getInt("AccountStatus"), rs.getInt("Gender"), rs.getString("Avatar"), rs.getString("LinkFacebook")));
            }

        } catch (SQLException ex) {
            Logger.getLogger(SellerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public ArrayList<Seller> filterSellerNoTextNoProvinceNoGender(int status) {
        ArrayList<Seller> list = new ArrayList<>();
        try {
            String sql = "select SellerID, FirstName , LastName , Age , Phone , Email , CountryName , ProvinceName , DistrictName , \n"
                    + "AddressDetail ,Account.AccountStatus , Gender,Avatar,LinkFacebook from Sellers\n"
                    + "inner join Country on Sellers.CountryID=Country.CountryID\n"
                    + "inner join Province on Sellers.ProvinceID = Province.ProvinceID\n"
                    + "inner join District on Sellers.DistrictID = District.DistrictID\n"
                    + "inner join Account on Sellers.Email = Account.username\n"
                    + "WHERE Account.AccountStatus = " + status + "\n"
                    + "ORDER BY SellerID";
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Seller(rs.getInt("sellerID"), rs.getString("FirstName"), rs.getString("LastName"), rs.getInt("Age"), rs.getString("Phone"),
                        rs.getString("Email"), rs.getString("CountryName"), rs.getString("ProvinceName"), rs.getString("DistrictName"), rs.getString("AddressDetail"), rs.getInt("AccountStatus"), rs.getInt("Gender"), rs.getString("Avatar"), rs.getString("LinkFacebook")));
            }

        } catch (SQLException ex) {
            Logger.getLogger(SellerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public ArrayList<Seller> filterSellerNoTextNoProvinceNoStatus(int gender) {
        ArrayList<Seller> list = new ArrayList<>();
        try {
            String sql = "select SellerID, FirstName , LastName , Age , Phone , Email , CountryName , ProvinceName , DistrictName , \n"
                    + "AddressDetail ,Account.AccountStatus , Gender,Avatar,LinkFacebook from Sellers\n"
                    + "inner join Country on Sellers.CountryID=Country.CountryID\n"
                    + "inner join Province on Sellers.ProvinceID = Province.ProvinceID\n"
                    + "inner join District on Sellers.DistrictID = District.DistrictID\n"
                    + "inner join Account on Sellers.Email = Account.username\n"
                    + "WHERE Gender = " + gender + "\n"
                    + "ORDER BY SellerID";
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Seller(rs.getInt("sellerID"), rs.getString("FirstName"), rs.getString("LastName"), rs.getInt("Age"), rs.getString("Phone"),
                        rs.getString("Email"), rs.getString("CountryName"), rs.getString("ProvinceName"), rs.getString("DistrictName"), rs.getString("AddressDetail"), rs.getInt("AccountStatus"), rs.getInt("Gender"), rs.getString("Avatar"), rs.getString("LinkFacebook")));
            }

        } catch (SQLException ex) {
            Logger.getLogger(SellerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

//    public ArrayList<Seller> filterSellerNoText(int province, int status, int gender) {
//        ArrayList<Seller> list = new ArrayList<>();
//        try {
//            String sql = "select SellerID, FirstName , LastName , Age , Phone , Email , CountryName , ProvinceName , DistrictName , \n"
//                    + "AddressDetail ,Account.AccountStatus , Gender,Avatar,LinkFacebook from Sellers\n"
//                    + "inner join Country on Sellers.CountryID=Country.CountryID\n"
//                    + "inner join Province on Sellers.ProvinceID = Province.ProvinceID\n"
//                    + "inner join District on Sellers.DistrictID = District.DistrictID\n"
//                    + "inner join Account on Sellers.Email = Account.username\n"
//                    + "WHERE Sellers.ProvinceID = " + province + " \n"
//                    + "and Account.AccountStatus = " + status + " and Gender = " + gender + "\n"
//                    + "ORDER BY SellerID";
//            PreparedStatement ps = connection.prepareStatement(sql);
//            ResultSet rs = ps.executeQuery();
//            while (rs.next()) {
//                list.add(new Seller(rs.getInt("sellerID"), rs.getString("FirstName"), rs.getString("LastName"), rs.getInt("Age"), rs.getString("Phone"),
//                        rs.getString("Email"), rs.getString("CountryName"), rs.getString("ProvinceName"), rs.getString("DistrictName"), rs.getString("AddressDetail"), rs.getInt("AccountStatus"), rs.getInt("Gender"), rs.getString("Avatar"), rs.getString("LinkFacebook")));
//            }
//
//        } catch (SQLException ex) {
//            Logger.getLogger(SellerDAO.class.getName()).log(Level.SEVERE, null, ex);
//        }
//        return list;
//    }
    public int getTotalSeller() {
        String sql = "select count(*) from Sellers";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException ex) {
            Logger.getLogger(SellerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

    public Seller getSellertBySellerID(int sellerID) {
        try {
            String sql = "select SellerID, FirstName , LastName , Age , Phone , Email , CountryName , ProvinceName , DistrictName , AddressDetail , Account.AccountStatus,Gender,Avatar,LinkFacebook\n"
                    + "from Sellers\n"
                    + "inner join Country on Sellers.CountryID=Country.CountryID\n"
                    + "left join Province on Sellers.ProvinceID = Province.ProvinceID\n"
                    + "left join District on Sellers.DistrictID = District.DistrictID\n"
                    + "inner join Account on Sellers.Email = Account.username\n"
                    + "where SellerID=?";
            PreparedStatement st;
            ResultSet rs;
            st = connection.prepareStatement(sql);
            st.setInt(1, sellerID);
            rs = st.executeQuery();
            while (rs.next()) {
                Seller seller = new Seller(rs.getInt("SellerID"), rs.getString("FirstName"), rs.getString("LastName"), rs.getInt("Age"), rs.getString("Phone"),
                        rs.getString("Email"), rs.getString("CountryName"), rs.getString("ProvinceName"), rs.getString("DistrictName"), rs.getString("AddressDetail"), rs.getInt("AccountStatus"), rs.getInt("Gender"), rs.getString("Avatar"), rs.getString("LinkFacebook"));
                st.close();
                rs.close();
                return seller;
            }
            st.close();
            rs.close();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
        return null;
    }

    public boolean updateStatus(String username, int status) {
        try {
            String sql = "UPDATE Account SET  AccountStatus=? where Username=?";
            stm = connection.prepareStatement(sql);
            stm.setInt(1, status);
            stm.setString(2, username);
            stm.executeUpdate();
            System.out.println(sql);
            System.out.println("Update OK");
            stm.close();
            return true;
        } catch (Exception e) {
            System.out.println("Update fail" + e.getMessage());
        }
        return false;
    }

    public Seller getAccount(String account) {
        try {
            String sql = "select SellerID, FirstName , LastName , Age , Phone , Email , CountryName , ProvinceName , DistrictName , AddressDetail , Account.AccountStatus,Gender,Avatar,LinkFacebook\n"
                    + "from Sellers\n"
                    + "inner join Country on Sellers.CountryID=Country.CountryID\n"
                    + "inner join Province on Sellers.ProvinceID = Province.ProvinceID\n"
                    + "inner join District on Sellers.DistrictID = District.DistrictID\n"
                    + "inner join Account on Sellers.Email = Account.username\n"
                    + "where Email=?";
            PreparedStatement st;
            ResultSet rs;
            st = connection.prepareStatement(sql);
            st.setString(1, account);
            rs = st.executeQuery();
            while (rs.next()) {
                Seller seller = new Seller(rs.getInt("SellerID"), rs.getString("FirstName"), rs.getString("LastName"), rs.getInt("Age"), rs.getString("Phone"),
                        rs.getString("Email"), rs.getString("CountryName"), rs.getString("ProvinceName"), rs.getString("DistrictName"), rs.getString("AddressDetail"), rs.getInt("AccountStatus"), rs.getInt("Gender"), rs.getString("Avatar"), rs.getString("LinkFacebook"));
                st.close();
                rs.close();
                return seller;
            }
            st.close();
            rs.close();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
        return null;
    }

    public String getSellerID(String userName) {
        String sql = "select s.SellerID from Sellers s join Account a on s.Email = a.Username where a.Username = ?";
        PreparedStatement st;
        try {
            st = connection.prepareCall(sql);
            st.setString(1, userName);
            ResultSet rs = st.executeQuery();

            if (rs.next()) {
                return rs.getString(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public void insertNewSeller(String email) {
        String sql = "insert into Sellers(Email) values(?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, email);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public Seller getSellertByUsername(String username) {
        try {
            String sql = "select SellerID, FirstName , LastName , Age , Phone , Email , CountryID , ProvinceID , DistrictID , AddressDetail , Gender, LinkFacebook\n"
                    + "from Sellers\n"
                    + "where Sellers.Email=?";
            PreparedStatement st;
            ResultSet rs;
            st = connection.prepareStatement(sql);
            st.setString(1, username);
            rs = st.executeQuery();
            while (rs.next()) {
                Seller seller = new Seller(rs.getInt("SellerID"), rs.getString("FirstName"), rs.getString("LastName"), rs.getInt("Age"), rs.getString("Phone"),
                        rs.getString("Email"), rs.getInt("CountryID"), rs.getInt("ProvinceID"), rs.getInt("DistrictID"), rs.getString("AddressDetail"), rs.getInt("Gender"), rs.getString("LinkFacebook"));
                st.close();
                rs.close();
                return seller;
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
                    + "from Sellers\n"
                    + "where Sellers.Email=?";
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

    public boolean updateSellerProfile(String avatar, Seller seller) {
        boolean gender = true;
        if (seller.getGender() == 1) {
            gender = true;
        } else if (seller.getGender() == 0) {
            gender = false;
        }
        try {
            String sql = "UPDATE Sellers SET  Avatar=?,FirstName=?,LastName=?,Age=?,Phone=?,CountryID=?,ProvinceID=?,DistrictID=?,AddressDetail=?,Gender=?,LinkFacebook=? where email=?";
            PreparedStatement st;
            st = connection.prepareStatement(sql);
            st.setString(1, avatar);
            st.setString(2, seller.getFirstName());
            st.setString(3, seller.getLastName());
            st.setInt(4, seller.getAge());
            st.setString(5, seller.getPhone());
            st.setInt(6, seller.getCountryID());
            st.setInt(7, seller.getProvinceID());
            st.setInt(8, seller.getDistrictID());
            st.setString(9, seller.getAddress());
            st.setBoolean(10, gender);
            st.setString(11, seller.getLinkFb());
            st.setString(12, seller.getEmail());
            st.executeUpdate();
            st.close();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean updateSellerProfileNoPro(String avatar, String firstName, String lastName, String age, String phone, String countryId, String provinceId, String districtId, String addressDetail, String gender1, String linkFacebook, String email) {
        try {
            String sql = "UPDATE Sellers SET  Avatar=?,FirstName=?,LastName=?,Age=?,Phone=?,CountryID=?,ProvinceID=?,DistrictID=?,AddressDetail=?,Gender=?,LinkFacebook=? where email=?";
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
