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
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Bus;
/**
 *
 * @author longn
 */
public class BusDAO extends DBContext{
     public ArrayList<Bus> getAllBus() {
        ArrayList<Bus> list =new ArrayList<>();
        String sql = "SELECT * FROM BUSES";
        PreparedStatement st;
        try {
            st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
             while(rs.next()){
                list.add(new Bus(rs.getInt(1),rs.getFloat(2),rs.getString(4),rs.getString(5),rs.getString(6)));
            }
            return list;
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
     
     public String getBusStopByNumber(int number) {
        String sql = "SELECT BUSSTOP FROM BUSES WHERE BUSNUMBER=?";
        String busStop=null;
        PreparedStatement st;
        try {
            st = connection.prepareStatement(sql);
            st.setInt(1, number);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                busStop=rs.getString(1);
            }
            return busStop;
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
     
     public String getBusImageByNumber(int number) {
        String sql = "SELECT Url1 FROM BUSES WHERE BUSNUMBER=?";
        String Url1=null;
        PreparedStatement st;
        try {
            st = connection.prepareStatement(sql);
            st.setInt(1, number);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Url1=rs.getString(1);
            }
            return Url1;
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
     
     public List<Bus> pagingBus(int index) {
        List<Bus> list = new ArrayList<>();
        String sql = "SELECT * FROM Buses\n"
                + "ORDER BY BusNumber\n"
                + "OFFSET ? ROWS FETCH NEXT 3 ROWS ONLY;";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);

            ps.setInt(1, (index - 1) * 3);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Bus(rs.getInt(1),rs.getFloat(2),rs.getString(4),rs.getString(5),rs.getString(6)));
            }
        } catch (SQLException ex) {
            Logger.getLogger(DepartmentDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
     
     public int getTotalBus() {
        String sql = "select count(*) from Buses";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DepartmentDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return 0;
    }
     public static void main(String[] args) {
        BusDAO b = new BusDAO();
         System.out.println(b.getAllBus());
    }
}
