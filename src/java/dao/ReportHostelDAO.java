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
import model.ReportHostel;

/**
 *
 * @author DELL
 */
public class ReportHostelDAO extends DBContext {

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

    public boolean createReportHostel(int hostelID, int spam, int offensive, int violent, int truthless) {
        try {
            String sql = "INSERT INTO ReportHostel (HostelID,Spam,Offensive,Violent,Truthless,ReportTime) VALUES (?,?,?,?,?,GetDate())";
            stm = connection.prepareStatement(sql);
            stm.setInt(1, hostelID);
            stm.setInt(2, spam);
            stm.setInt(3, offensive);
            stm.setInt(4, violent);
            stm.setInt(5, truthless);
            stm.executeUpdate();
            System.out.println(sql);
            System.out.println("Insert OK");
            return true;
        } catch (Exception e) {
            System.out.println("Insert fail" + e.getMessage());
        }
        return false;
    }

    public ArrayList<ReportHostel> listAllReportHostel(int index) {
        ArrayList<ReportHostel> report = new ArrayList<>();
        try {
            String sql = "Select a.HostelID, a.HostelName, SUM( a.Spam) Spam, SUM(a.Violent) Violent,\n"
                    + "                    SUM(a.Offensive) Offensive,SUM(a.Truthless) Truthless\n"
                    + "                    from\n"
                    + "                    (\n"
                    + "                    select rt.HostelID,rt.HostelName HostelName, CONVERT(INT, rr.Spam) Spam, CONVERT(INT,rr.Offensive) Offensive,\n"
                    + "                    CONVERT(INT, rr.Violent) Violent, CONVERT(INT, rr.Truthless) Truthless \n"
                    + "                    from Hostels rt \n"
                    + "                    inner join ReportHostel rr on rt.HostelID = rr.HostelID) as a \n"
                    + "                    group by a.HostelName,a.HostelID\n"
                    + "ORDER BY HostelID\n"
                    + "OFFSET ? ROWS FETCH NEXT 6 ROWS ONLY;";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, (index - 1) * 6);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                report.add(new ReportHostel(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getInt(4), rs.getInt(5), rs.getInt(6)));
            }
        } catch (SQLException ex) {
            Logger.getLogger(RestaurantDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return report;
    }

    public int getTotalReportHostel() {
        String sql = "select COUNT (HostelName) from Hostels";
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
}
