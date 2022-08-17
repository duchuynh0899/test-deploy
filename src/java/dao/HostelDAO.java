/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Hostel;
import model.StarVote;

/**
 *
 * @author nguye
 */
public class HostelDAO extends DBContext {

    public void addHostel(Hostel h) {
        try {
            String sql = "INSERT INTO [dbo].[Hostels]\n"
                    + "           ([HostelName]\n"
                    + "           ,[SellerID]\n"
                    + "           ,[TotalRoom]\n"
                    + "           ,[Status]\n"
                    + "           ,[Floors]\n"
                    + "           ,[CountryID]\n"
                    + "           ,[ProvinceID]\n"
                    + "           ,[DistrictID]\n"
                    + "           ,[AddressDetail]\n"
                    + "           ,[RentCost]\n"
                    + "           ,[Distance]\n"
                    + "           ,[Descriptions]\n"
                    + "           ,[StarVoting])\n"
                    + "     VALUES\n"
                    + "           (?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,1\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,0)";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, h.getHostelName());
            statement.setInt(2, h.getSellerID());
            statement.setInt(3, h.getTotalRoom());
            statement.setBoolean(4, h.isStatus());
            statement.setInt(5, h.getFloor());
            statement.setInt(6, h.getProvinceID());
            statement.setInt(7, h.getDistrictID());
            statement.setString(8, h.getAddress());
            statement.setDouble(9, h.getCost());
            statement.setDouble(10, h.getDistance());
            statement.setString(11, h.getDescription());
            statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(HostelDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    

    public ArrayList<Hostel> listAllHostel() {
        ArrayList<Hostel> h = new ArrayList<>();
        try {

            String sql = "select h.HostelID, h.HostelName,s.FirstName + ' '+ s.LastName as sellerName, h.TotalRoom, h.Status,h.Floors,c.CountryName,p.ProvinceName,d.DistrictName,h.AddressDetail,h.RentCost,h.Distance,h.Descriptions,i.Url1,i.Url2,i.Url3,i.Url4,i.Url5,i.Url6,h.StarVoting from Hostels h\n"
                    + "                    join Country c on h.CountryID =c.CountryID\n"
                    + "                    join District d on h.DistrictID = d.DistrictID\n"
                    + "                    join Province p on h.ProvinceID = p.ProvinceID\n"
                    + "                    join Sellers s on h.SellerID = s.SellerID\n"
                    + "                    left join HostelImage i on h.HostelID = i.HostelID";

            PreparedStatement st;

            st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                h.add(new Hostel(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getBoolean(5), rs.getInt(6),
                        rs.getString(7), rs.getString(8), rs.getString(9), rs.getString(10),
                        rs.getDouble(11), rs.getDouble(12), rs.getString(13), rs.getString(14), rs.getString(15), rs.getString(16), rs.getString(17), rs.getString(18),
                        rs.getString(19), rs.getFloat(20)));

            }

        } catch (SQLException ex) {
            Logger.getLogger(HostelDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return h;
    }

    public ArrayList<Hostel> listAllHostelPagging(int intdex) {
        ArrayList<Hostel> h = new ArrayList<>();
        try {

            String sql = "select h.HostelID, h.HostelName,s.FirstName + ' '+ s.LastName as sellerName, h.TotalRoom, h.Status,h.Floors,c.CountryName,p.ProvinceName,d.DistrictName,h.AddressDetail,h.RentCost,h.Distance,h.Descriptions,i.Url1,i.Url2,i.Url3,i.Url4,i.Url5,i.Url6,h.StarVoting from Hostels h\n"
                    + "                    join Country c on h.CountryID =c.CountryID\n"
                    + "                    join District d on h.DistrictID = d.DistrictID\n"
                    + "                    join Province p on h.ProvinceID = p.ProvinceID\n"
                    + "                    join Sellers s on h.SellerID = s.SellerID\n"
                    + "                    left join HostelImage i on h.HostelID = i.HostelID\n"
                    + "			   order by h.HostelID\n"
                    + "			   OFFSET ? ROWS FETCH NEXT 6 ROWS ONLY";

            PreparedStatement st;

            st = connection.prepareStatement(sql);
            st.setInt(1, (intdex - 1) * 6);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                h.add(new Hostel(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getBoolean(5), rs.getInt(6),
                        rs.getString(7), rs.getString(8), rs.getString(9), rs.getString(10),
                        rs.getDouble(11), rs.getDouble(12), rs.getString(13), rs.getString(14), rs.getString(15), rs.getString(16), rs.getString(17), rs.getString(18),
                        rs.getString(19), rs.getFloat(20)));

            }

        } catch (SQLException ex) {
            Logger.getLogger(HostelDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return h;
    }

    public ArrayList<Hostel> filterHostel(double costUnder, double costUpper, double distance, float star) {
        ArrayList<Hostel> h = new ArrayList<>();
        try {

            String sql = "";
            if (star == 0) {
                sql = "select h.HostelID, h.HostelName,s.FirstName + ' '+ s.LastName as sellerName, h.TotalRoom, \n"
                        + "h.Status,h.Floors,c.CountryName,p.ProvinceName,d.DistrictName,\n"
                        + "h.AddressDetail,h.RentCost,h.Distance,h.Descriptions,\n"
                        + "i.Url1,i.Url2,i.Url3,i.Url4,i.Url5,i.Url6,h.StarVoting from Hostels h\n"
                        + "join Country c on h.CountryID =c.CountryID\n"
                        + "join District d on h.DistrictID = d.DistrictID\n"
                        + "join Province p on h.ProvinceID = p.ProvinceID\n"
                        + "join Sellers s on h.SellerID = s.SellerID\n"
                        + "left join HostelImage i on h.HostelID = i.HostelID\n"
                        + "where h.RentCost between " + costUnder + " and " + costUpper + "\n"
                        + "and h.Distance <= " + distance + " and h.StarVoting = 0\n"
                        + "order by h.HostelID";
            } else if (star == 5) {
                sql = "select h.HostelID, h.HostelName,s.FirstName + ' '+ s.LastName as sellerName, h.TotalRoom, \n"
                        + "h.Status,h.Floors,c.CountryName,p.ProvinceName,d.DistrictName,\n"
                        + "h.AddressDetail,h.RentCost,h.Distance,h.Descriptions,\n"
                        + "i.Url1,i.Url2,i.Url3,i.Url4,i.Url5,i.Url6,h.StarVoting from Hostels h\n"
                        + "join Country c on h.CountryID =c.CountryID\n"
                        + "join District d on h.DistrictID = d.DistrictID\n"
                        + "join Province p on h.ProvinceID = p.ProvinceID\n"
                        + "join Sellers s on h.SellerID = s.SellerID\n"
                        + "left join HostelImage i on h.HostelID = i.HostelID\n"
                        + "where h.RentCost between " + costUnder + " and " + costUpper + "\n"
                        + "and h.Distance <= " + distance + " and h.StarVoting <= 5\n"
                        + "order by h.HostelID";
            } else {
                sql = "select h.HostelID, h.HostelName,s.FirstName + ' '+ s.LastName as sellerName, h.TotalRoom, \n"
                        + "h.Status,h.Floors,c.CountryName,p.ProvinceName,d.DistrictName,\n"
                        + "h.AddressDetail,h.RentCost,h.Distance,h.Descriptions,\n"
                        + "i.Url1,i.Url2,i.Url3,i.Url4,i.Url5,i.Url6,h.StarVoting from Hostels h\n"
                        + "join Country c on h.CountryID =c.CountryID\n"
                        + "join District d on h.DistrictID = d.DistrictID\n"
                        + "join Province p on h.ProvinceID = p.ProvinceID\n"
                        + "join Sellers s on h.SellerID = s.SellerID\n"
                        + "left join HostelImage i on h.HostelID = i.HostelID\n"
                        + "where h.RentCost between " + costUnder + " and " + costUpper + "\n"
                        + "and h.Distance <= " + distance + " and h.StarVoting >= " + star + "\n"
                        + "order by h.HostelID";
            }
            PreparedStatement st;

            st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                h.add(new Hostel(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getBoolean(5), rs.getInt(6),
                        rs.getString(7), rs.getString(8), rs.getString(9), rs.getString(10),
                        rs.getDouble(11), rs.getDouble(12), rs.getString(13), rs.getString(14), rs.getString(15), rs.getString(16), rs.getString(17), rs.getString(18),
                        rs.getString(19), rs.getFloat(20)));
            }

        } catch (SQLException ex) {
            Logger.getLogger(HostelDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return h;
    }

    public ArrayList<Hostel> filterHostelPagging(double costUnder, double costUpper, double distance, int index, float star) {
        ArrayList<Hostel> h = new ArrayList<>();
        try {

            String sql = "";
            if (star == 0) {
                sql = "select h.HostelID, h.HostelName,s.FirstName + ' '+ s.LastName as sellerName, h.TotalRoom, \n"
                        + "h.Status,h.Floors,c.CountryName,p.ProvinceName,d.DistrictName,\n"
                        + "h.AddressDetail,h.RentCost,h.Distance,h.Descriptions,\n"
                        + "i.Url1,i.Url2,i.Url3,i.Url4,i.Url5,i.Url6,h.StarVoting from Hostels h\n"
                        + "join Country c on h.CountryID =c.CountryID\n"
                        + "join District d on h.DistrictID = d.DistrictID\n"
                        + "join Province p on h.ProvinceID = p.ProvinceID\n"
                        + "join Sellers s on h.SellerID = s.SellerID\n"
                        + "left join HostelImage i on h.HostelID = i.HostelID\n"
                        + "where h.RentCost between " + costUnder + " and " + costUpper + "\n"
                        + "and h.Distance <= " + distance + " and h.StarVoting = 0\n"
                        + "order by h.HostelID OFFSET ? ROWS FETCH NEXT 6 ROWS ONLY";
            } else if (star == 5) {
                sql = "select h.HostelID, h.HostelName,s.FirstName + ' '+ s.LastName as sellerName, h.TotalRoom, \n"
                        + "h.Status,h.Floors,c.CountryName,p.ProvinceName,d.DistrictName,\n"
                        + "h.AddressDetail,h.RentCost,h.Distance,h.Descriptions,\n"
                        + "i.Url1,i.Url2,i.Url3,i.Url4,i.Url5,i.Url6,h.StarVoting from Hostels h\n"
                        + "join Country c on h.CountryID =c.CountryID\n"
                        + "join District d on h.DistrictID = d.DistrictID\n"
                        + "join Province p on h.ProvinceID = p.ProvinceID\n"
                        + "join Sellers s on h.SellerID = s.SellerID\n"
                        + "left join HostelImage i on h.HostelID = i.HostelID\n"
                        + "where h.RentCost between " + costUnder + " and " + costUpper + "\n"
                        + "and h.Distance <= " + distance + " and h.StarVoting <= 5\n"
                        + "order by h.HostelID OFFSET ? ROWS FETCH NEXT 6 ROWS ONLY";
            } else {
                sql = "select h.HostelID, h.HostelName,s.FirstName + ' '+ s.LastName as sellerName, h.TotalRoom, \n"
                        + "h.Status,h.Floors,c.CountryName,p.ProvinceName,d.DistrictName,\n"
                        + "h.AddressDetail,h.RentCost,h.Distance,h.Descriptions,\n"
                        + "i.Url1,i.Url2,i.Url3,i.Url4,i.Url5,i.Url6,h.StarVoting from Hostels h\n"
                        + "join Country c on h.CountryID =c.CountryID\n"
                        + "join District d on h.DistrictID = d.DistrictID\n"
                        + "join Province p on h.ProvinceID = p.ProvinceID\n"
                        + "join Sellers s on h.SellerID = s.SellerID\n"
                        + "left join HostelImage i on h.HostelID = i.HostelID\n"
                        + "where h.RentCost between " + costUnder + " and " + costUpper + "\n"
                        + "and h.Distance <= " + distance + " and h.StarVoting >= " + star + "\n"
                        + "order by h.HostelID OFFSET ? ROWS FETCH NEXT 6 ROWS ONLY";
            }
            PreparedStatement st;

            st = connection.prepareStatement(sql);
            st.setInt(1, (index - 1) * 6);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                h.add(new Hostel(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getBoolean(5), rs.getInt(6),
                        rs.getString(7), rs.getString(8), rs.getString(9), rs.getString(10),
                        rs.getDouble(11), rs.getDouble(12), rs.getString(13), rs.getString(14), rs.getString(15), rs.getString(16), rs.getString(17), rs.getString(18),
                        rs.getString(19), rs.getFloat(20) / 5 * 100));
            }

        } catch (SQLException ex) {
            Logger.getLogger(HostelDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return h;
    }

    
    
    public ArrayList<Hostel> filterHostelText(String keyword, double costUnder, double costUpper, double distance, float star) {
        ArrayList<Hostel> h = new ArrayList<>();
        try {

            String sql = "";

            sql = "select h.HostelID, h.HostelName,s.FirstName + ' '+ s.LastName as sellerName, h.TotalRoom, \n"
                    + "h.Status,h.Floors,c.CountryName,p.ProvinceName,d.DistrictName,\n"
                    + "h.AddressDetail,h.RentCost,h.Distance,h.Descriptions,\n"
                    + "i.Url1,i.Url2,i.Url3,i.Url4,i.Url5,i.Url6,h.StarVoting from Hostels h\n"
                    + "join Country c on h.CountryID =c.CountryID\n"
                    + "join District d on h.DistrictID = d.DistrictID\n"
                    + "join Province p on h.ProvinceID = p.ProvinceID\n"
                    + "join Sellers s on h.SellerID = s.SellerID\n"
                    + "left join HostelImage i on h.HostelID = i.HostelID\n"
                    + "where h.HostelName like N'%" + keyword + "%' and h.RentCost between " + costUnder + " and " + costUpper + "\n"
                    + "and h.Distance <= " + distance + " and h.StarVoting <= " + star + "\n"
                    + "order by h.HostelID";
            PreparedStatement st;

            st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                h.add(new Hostel(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getBoolean(5), rs.getInt(6),
                        rs.getString(7), rs.getString(8), rs.getString(9), rs.getString(10),
                        rs.getDouble(11), rs.getDouble(12), rs.getString(13), rs.getString(14), rs.getString(15), rs.getString(16), rs.getString(17), rs.getString(18),
                        rs.getString(19), rs.getFloat(20)));
            }

        } catch (SQLException ex) {
            Logger.getLogger(HostelDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return h;
    }

    public ArrayList<Hostel> filterHostelTextPagging(String keyword, double costUnder, double costUpper, double distance, float star, int index) {
        ArrayList<Hostel> h = new ArrayList<>();
        try {

            String sql = "";
            if (star == 0) {
                sql = "select h.HostelID, h.HostelName,s.FirstName + ' '+ s.LastName as sellerName, h.TotalRoom, \n"
                        + "h.Status,h.Floors,c.CountryName,p.ProvinceName,d.DistrictName,\n"
                        + "h.AddressDetail,h.RentCost,h.Distance,h.Descriptions,\n"
                        + "i.Url1,i.Url2,i.Url3,i.Url4,i.Url5,i.Url6,h.StarVoting from Hostels h\n"
                        + "join Country c on h.CountryID =c.CountryID\n"
                        + "join District d on h.DistrictID = d.DistrictID\n"
                        + "join Province p on h.ProvinceID = p.ProvinceID\n"
                        + "join Sellers s on h.SellerID = s.SellerID\n"
                        + "left join HostelImage i on h.HostelID = i.HostelID\n"
                        + "where h.HostelName like N'%" + keyword + "%' and h.RentCost between " + costUnder + " and " + costUpper + "\n"
                        + "and h.Distance <= " + distance + " and h.StarVoting = 0\n"
                        + "order by h.HostelID OFFSET ? ROWS FETCH NEXT 6 ROWS ONLY";
            } else if (star == 5) {
                sql = "select h.HostelID, h.HostelName,s.FirstName + ' '+ s.LastName as sellerName, h.TotalRoom, \n"
                        + "h.Status,h.Floors,c.CountryName,p.ProvinceName,d.DistrictName,\n"
                        + "h.AddressDetail,h.RentCost,h.Distance,h.Descriptions,\n"
                        + "i.Url1,i.Url2,i.Url3,i.Url4,i.Url5,i.Url6,h.StarVoting from Hostels h\n"
                        + "join Country c on h.CountryID =c.CountryID\n"
                        + "join District d on h.DistrictID = d.DistrictID\n"
                        + "join Province p on h.ProvinceID = p.ProvinceID\n"
                        + "join Sellers s on h.SellerID = s.SellerID\n"
                        + "left join HostelImage i on h.HostelID = i.HostelID\n"
                        + "where h.HostelName like N'%" + keyword + "%' and h.RentCost between " + costUnder + " and " + costUpper + "\n"
                        + "and h.Distance <= " + distance + " and h.StarVoting <= 5\n"
                        + "order by h.HostelID OFFSET ? ROWS FETCH NEXT 6 ROWS ONLY";
            } else {
                sql = "select h.HostelID, h.HostelName,s.FirstName + ' '+ s.LastName as sellerName, h.TotalRoom, \n"
                        + "h.Status,h.Floors,c.CountryName,p.ProvinceName,d.DistrictName,\n"
                        + "h.AddressDetail,h.RentCost,h.Distance,h.Descriptions,\n"
                        + "i.Url1,i.Url2,i.Url3,i.Url4,i.Url5,i.Url6,h.StarVoting from Hostels h\n"
                        + "join Country c on h.CountryID =c.CountryID\n"
                        + "join District d on h.DistrictID = d.DistrictID\n"
                        + "join Province p on h.ProvinceID = p.ProvinceID\n"
                        + "join Sellers s on h.SellerID = s.SellerID\n"
                        + "left join HostelImage i on h.HostelID = i.HostelID\n"
                        + "where h.HostelName like N'%" + keyword + "%' and h.RentCost between " + costUnder + " and " + costUpper + "\n"
                        + "and h.Distance <= " + distance + " and h.StarVoting >= " + star + "\n"
                        + "order by h.HostelID OFFSET ? ROWS FETCH NEXT 6 ROWS ONLY";
            }
            PreparedStatement st;

            st = connection.prepareStatement(sql);
            st.setInt(1, (index - 1) * 6);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                h.add(new Hostel(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getBoolean(5), rs.getInt(6),
                        rs.getString(7), rs.getString(8), rs.getString(9), rs.getString(10),
                        rs.getDouble(11), rs.getDouble(12), rs.getString(13), rs.getString(14), rs.getString(15), rs.getString(16), rs.getString(17), rs.getString(18),
                        rs.getString(19), rs.getFloat(20) / 5 * 100));
            }

        } catch (SQLException ex) {
            Logger.getLogger(HostelDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return h;
    }

    public ArrayList<Hostel> listHostelbySeller(int sellerID) {
        ArrayList<Hostel> h = new ArrayList<>();
        try {

            String sql = "select h.HostelID, h.HostelName,s.FirstName + ' '+ s.LastName as sellerName, h.TotalRoom, h.Status,h.Floors,c.CountryName,p.ProvinceName,d.DistrictName,h.AddressDetail,h.RentCost,h.Distance,h.Descriptions,i.Url1,i.Url2,i.Url3,i.Url4,i.Url5,i.Url6,h.StarVoting from Hostels h\n"
                    + "                   join Country c on h.CountryID =c.CountryID\n"
                    + "                   join District d on h.DistrictID = d.DistrictID\n"
                    + "                    join Province p on h.ProvinceID = p.ProvinceID\n"
                    + "                    join Sellers s on h.SellerID = s.SellerID\n"
                    + "                    left join HostelImage i on h.HostelID = i.HostelID where s.SellerID = ? ";

            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, sellerID);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                h.add(new Hostel(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getBoolean(5), rs.getInt(6),
                        rs.getString(7), rs.getString(8), rs.getString(9), rs.getString(10),
                        rs.getDouble(11), rs.getDouble(12), rs.getString(13), rs.getString(14), rs.getString(15), rs.getString(16), rs.getString(17), rs.getString(18),
                        rs.getString(19), rs.getFloat(20)/5*100));

            }

        } catch (SQLException ex) {
            Logger.getLogger(HostelDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return h;
    }

    public Hostel getHostelInfo(int HostelID) {
        Hostel h = new Hostel();
        try {

            String sql = "select h.HostelID, h.HostelName,s.FirstName + ' '+ s.LastName as sellerName, h.TotalRoom, h.Status,h.Floors,c.CountryName,p.ProvinceName,d.DistrictName,h.AddressDetail,h.RentCost,h.Distance,h.Descriptions,i.Url1,i.Url2,i.Url3,i.Url4,i.Url5,i.Url6 from Hostels h \n"
                    + "join Country c on h.CountryID =c.CountryID\n"
                    + "join District d on h.DistrictID = d.DistrictID\n"
                    + "join Province p on h.ProvinceID = p.ProvinceID\n"
                    + "join Sellers s on h.SellerID = s.SellerID\n"
                    + "left join HostelImage i on h.HostelID = i.HostelID where h.HostelID = ?";

            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, HostelID);
            ResultSet rs = statement.executeQuery();
            if (rs.next()) {
                h.setHostelID(rs.getInt(1));
                h.setHostelName(rs.getString(2));
                h.setSellerName(rs.getString(3));
                h.setTotalRoom(rs.getInt(4));
                h.setStatus(rs.getBoolean(5));
                h.setFloor(rs.getInt(6));
                h.setCountryName(rs.getString(7));
                h.setProvinceNamẹ(rs.getString(8));
                h.setDistrictName(rs.getString(9));
                h.setAddress(rs.getString(10));
                h.setCost(rs.getDouble(11));
                h.setDistance(rs.getDouble(12));
                h.setDescription(rs.getString(13));
                h.setImg1(rs.getString(14));
                h.setImg2(rs.getString(15));
                h.setImg3(rs.getString(16));
                h.setImg4(rs.getString(17));
                h.setImg5(rs.getString(18));
                h.setImg6(rs.getString(19));
            }
            return h;
        } catch (SQLException ex) {
            Logger.getLogger(HostelDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;

    }

    public void updateHostel(Hostel h) {
        try {

            String sql = "UPDATE [dbo].[Hostels]\n"
                    + "   SET [HostelName] = ?\n"
                    + "      ,[TotalRoom] = ?\n"
                    + "      ,[Status] = ?\n"
                    + "      ,[Floors] = ?\n"
                    + "      ,[ProvinceID] = ?\n"
                    + "      ,[DistrictID] = ?\n"
                    + "      ,[AddressDetail] = ?\n"
                    + "      ,[RentCost] = ?\n"
                    + "      ,[Distance] = ?\n"
                    + "      ,[Descriptions] = ?\n"
                    + " WHERE HostelID = ? ";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, h.getHostelName());
            statement.setInt(2, h.getTotalRoom());
            statement.setBoolean(3, h.isStatus());
            statement.setInt(4, h.getFloor());
            statement.setInt(5, h.getProvinceID());
            statement.setInt(6, h.getDistrictID());
            statement.setString(7, h.getAddress());
            statement.setDouble(8, h.getCost());
            statement.setDouble(9, h.getDistance());
            statement.setString(10, h.getDescription());
            statement.setInt(11, h.getHostelID());
            statement.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(HostelDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void deleteHostelImage(int hostelID) {

        try {

            String sql = "DELETE FROM HostelImage WHERE HostelID =?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, hostelID);
            statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(HostelDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void deleteReportbyHostel(int hostelID) {
        try {
            String sql = "DELETE FROM ReportHostel WHERE HostelID=?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, hostelID);
            statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(HostelDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void deleteHostel(int hostelID) {

        try {

            String sql = "DELETE FROM Hostels WHERE HostelID =?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, hostelID);
            statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(HostelDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    public ArrayList<Hostel> getlHostelByNamePagging(String keyword, int index) {
        ArrayList<Hostel> h = new ArrayList<>();
        try {

            String sql = "select h.HostelID, h.HostelName,s.FirstName + ' '+ s.LastName as sellerName, h.TotalRoom, \n"
                    + "h.Status,h.Floors,c.CountryName,p.ProvinceName,d.DistrictName,\n"
                    + "h.AddressDetail,h.RentCost,h.Distance,h.Descriptions,\n"
                    + "i.Url1,i.Url2,i.Url3,i.Url4,i.Url5,i.Url6,h.StarVoting from Hostels h\n"
                    + "join Country c on h.CountryID =c.CountryID\n"
                    + "join District d on h.DistrictID = d.DistrictID\n"
                    + "join Province p on h.ProvinceID = p.ProvinceID\n"
                    + "join Sellers s on h.SellerID = s.SellerID\n"
                    + "left join HostelImage i on h.HostelID = i.HostelID\n"
                    + "where h.HostelName like N'%" + keyword + "%' order by h.HostelID OFFSET ? ROWS FETCH NEXT 6 ROWS ONLY";

            PreparedStatement st;

            st = connection.prepareStatement(sql);
            st.setInt(1, (index - 1) * 6);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                h.add(new Hostel(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getBoolean(5), rs.getInt(6),
                        rs.getString(7), rs.getString(8), rs.getString(9), rs.getString(10),
                        rs.getDouble(11), rs.getDouble(12), rs.getString(13), rs.getString(14), rs.getString(15), rs.getString(16), rs.getString(17), rs.getString(18),
                        rs.getString(19), rs.getFloat(20)));
            }

        } catch (SQLException ex) {
            Logger.getLogger(HostelDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return h;
    }

    public ArrayList<Hostel> getlHostelByName(String keyword) {
        ArrayList<Hostel> list = new ArrayList<>();
        try {

            String sql = "select h.HostelID, h.HostelName,s.FirstName + ' '+ s.LastName as sellerName, h.TotalRoom, \n"
                    + "h.Status,h.Floors,c.CountryName,p.ProvinceName,d.DistrictName,\n"
                    + "h.AddressDetail,h.RentCost,h.Distance,h.Descriptions,\n"
                    + "i.Url1,i.Url2,i.Url3,i.Url4,i.Url5,i.Url6,h.StarVoting from Hostels h\n"
                    + "join Country c on h.CountryID =c.CountryID\n"
                    + "join District d on h.DistrictID = d.DistrictID\n"
                    + "join Province p on h.ProvinceID = p.ProvinceID\n"
                    + "join Sellers s on h.SellerID = s.SellerID\n"
                    + "left join HostelImage i on h.HostelID = i.HostelID\n"
                    + "where h.HostelName like N'%" + keyword + "%' order by h.HostelID";

            PreparedStatement st;

            st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Hostel(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getBoolean(5), rs.getInt(6),
                        rs.getString(7), rs.getString(8), rs.getString(9), rs.getString(10),
                        rs.getDouble(11), rs.getDouble(12), rs.getString(13), rs.getString(14), rs.getString(15), rs.getString(16), rs.getString(17), rs.getString(18),
                        rs.getString(19), rs.getFloat(20)));
            }

        } catch (SQLException ex) {
            Logger.getLogger(HostelDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    // dem so luong nha tro
    public int getTotalPage(String keyword, ArrayList<Hostel> hostels) {
        if (keyword == null || keyword == "") {
            hostels = listAllHostel();
        } else {
            hostels = getlHostelByName(keyword);
        }
        int totalPage = hostels.size() / 6;
        if (hostels.size() % 6 != 0) {
            totalPage++;
        }
        return totalPage;
    }

    // dem so luong nha tro theo loc
    public int getTotalPageByFilter(ArrayList<Hostel> hostels, double costUnder, double costUpper, double distance, float star) {
        hostels = filterHostel(costUnder, costUpper, distance, star);
        int totalPage = hostels.size() / 6;
        if (hostels.size() % 6 != 0) {
            totalPage++;
        }
        return totalPage;
    }

    public int getTotalPageTextByFilter(ArrayList<Hostel> hostels, String keyword, double costUnder, double costUpper, double distance, float star) {
        hostels = filterHostelText(keyword, costUnder, costUpper, distance, star);
        int totalPage = hostels.size() / 6;
        if (hostels.size() % 6 != 0) {
            totalPage++;
        }
        return totalPage;
    }

    public double getMaxCost() {
        double maxCost = 0;
        try {

            String sql = "									select top 1 h.HostelID, Max(h.RentCost) from Hostels h\n"
                    + "                                        join Country c on h.CountryID =c.CountryID\n"
                    + "                                       join District d on h.DistrictID = d.DistrictID\n"
                    + "                                       join Province p on h.ProvinceID = p.ProvinceID\n"
                    + "                                        join Sellers s on h.SellerID = s.SellerID\n"
                    + "                                       left join HostelImage i on h.HostelID = i.HostelID\n"
                    + "									   group by h.HostelID,h.RentCost\n"
                    + "									   order by h.RentCost desc";

            PreparedStatement st;

            st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Hostel h = new Hostel();
                h.setHostelID(rs.getInt(1));
                h.setCost(rs.getDouble(2));
                maxCost = h.getCost();

            }

        } catch (SQLException ex) {
            Logger.getLogger(HostelDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return maxCost;
    }

    public List<Hostel> pagingHostels(int index) {
        List<Hostel> list = new ArrayList<>();
        String sql = "select h.HostelID, h.HostelName,s.FirstName + ' '+ s.LastName as sellerName, h.TotalRoom, h.Status,h.Floors,c.CountryName,p.ProvinceName,d.DistrictName,h.AddressDetail,h.RentCost,h.Distance,h.Descriptions,i.Url1,i.Url2,i.Url3,i.Url4,i.Url5,i.Url6 from Hostels h\n"
                + "join Country c on h.CountryID =c.CountryID\n"
                + "join District d on h.DistrictID = d.DistrictID\n"
                + "join Province p on h.ProvinceID = p.ProvinceID\n"
                + "join Sellers s on h.SellerID = s.SellerID\n"
                + "left join HostelImage i on h.HostelID = i.HostelID\n"
                + "ORDER BY HostelID\n"
                + "OFFSET ? ROWS FETCH NEXT 6 ROWS ONLY;";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);

            ps.setInt(1, (index - 1) * 6);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Hostel(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getBoolean(5), rs.getInt(6),
                        rs.getString(7), rs.getString(8), rs.getString(9), rs.getString(10),
                        rs.getDouble(11), rs.getDouble(12), rs.getString(13), rs.getString(14), rs.getString(15), rs.getString(16), rs.getString(17), rs.getString(18),
                        rs.getString(19), 0));
            }
        } catch (SQLException ex) {
            Logger.getLogger(HostelDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public int getTotalHostels() {
        String sql = "select count(*) from Hostels";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException ex) {
            Logger.getLogger(HostelDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return 0;
    }

    public int getSellerIdByHostelId(int hostelID) {
        String sql = "select SellerID from Hostels where HostelID=?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, hostelID);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException ex) {
            Logger.getLogger(HostelDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return 0;
    }

    public String getHostelNameByHostelId(int hostelID) {
        String sql = "select HostelName from Hostels where HostelID=?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, hostelID);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                return rs.getString(1);
            }
        } catch (SQLException ex) {
            Logger.getLogger(HostelDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    
    public String getSellerEmailByHostelId(int hostelID) {
        String sql = "Select Sellers.Email from Hostels join Sellers on Sellers.SellerID=Hostels.SellerID where HostelID=?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, hostelID);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                return rs.getString(1);
            }
        } catch (SQLException ex) {
            Logger.getLogger(HostelDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    
    public void addHostelID(int hostelID) {
        try {

            String sql = "INSERT INTO [dbo].[HostelImage]\n"
                    + "			   ([HostelID])\n"
                    + "		 VALUES\n"
                    + "			   (?)";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, hostelID);
            statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(HostelDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void addImage(int hostelID, String url1, String url2, String url3, String url4, String url5, String url6) {
        try {

            String sql = "UPDATE [dbo].[HostelImage]\n"
                    + "   SET \n"
                    + "      [Url1] = ?\n"
                    + "      ,[Url2] = ?\n"
                    + "      ,[Url3] = ?\n"
                    + "      ,[Url4] = ?\n"
                    + "      ,[Url5] = ?\n"
                    + "      ,[Url6] = ?\n"
                    + "WHERE HostelID = ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, url1);
            statement.setString(2, url2);
            statement.setString(3, url3);
            statement.setString(4, url4);
            statement.setString(5, url5);
            statement.setString(6, url6);
            statement.setInt(7, hostelID);
            statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(HostelDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void addEachImage(int hostelID, String url, String indexofURL) {
        try {

            String sql = "UPDATE [dbo].[HostelImage]\n"
                    + "   SET \n"
                    + indexofURL + "       = ?\n"
                    + "WHERE HostelID = ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, url);

            statement.setInt(2, hostelID);
            statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(HostelDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void deleteImage(int hostelID, String indexofURL) {

        try {

            String sql = "UPDATE [dbo].[HostelImage]\n"
                    + "   SET \n"
                    + indexofURL + "       = NULL\n"
                    + "WHERE HostelID = ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, hostelID);
            statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(HostelDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    public int getNewestHostelID() {
        try {

            String sql = "SELECT  TOP 1 HostelID FROM Hostels ORDER BY HostelID DESC";
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();

            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException ex) {
            Logger.getLogger(HostelDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

    public List<StarVote> listStar(int hostelID) {
        List<StarVote> list = new ArrayList<>();
        String sql = "SELECT StarVoting, COUNT(*) as numberofvote\n"
                + "  FROM StarVotingHostel\n"
                + "  where HostelID=?\n"
                + "  group by StarVoting";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, hostelID);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new StarVote(rs.getInt(1), rs.getInt(2)));
            }
        } catch (SQLException ex) {
            Logger.getLogger(HostelDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public void updateStarAVG(int hostelID, double starAVG) {
        try {

            String sql = "UPDATE [dbo].[Hostels]\n"
                    + "   SET [StarVoting] = ?\n"
                    + " WHERE HostelID = ? ";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setDouble(1, starAVG);
            statement.setInt(2, hostelID);
            statement.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(HostelDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public static void main(String[] args) {
        HostelDAO h = new HostelDAO();
        ArrayList<Hostel> hostels = h.listAllHostelPagging(1);
        for (Hostel hostel : hostels) {
            System.out.println(hostel.getHostelName());
        }
    }

}