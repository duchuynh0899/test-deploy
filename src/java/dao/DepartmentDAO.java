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
import model.Department;

/**
 *
 * @author nguye
 */
public class DepartmentDAO extends DBContext {

    public ArrayList<Department> listDep() {
        ArrayList<Department> dep = new ArrayList<>();
        try {

            String sql = "select * from Department";
            PreparedStatement st;

            st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                dep.add(new Department(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6),
                        rs.getString(7), rs.getString(8), rs.getString(9), rs.getString(10)));
            }

        } catch (SQLException ex) {
            Logger.getLogger(DepartmentDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return dep;
    }

    public Department getDepartmentDetailbyID(int id) {
        Department d = new Department();

        try {

            String sql = "select * from Department where DepId = ? ";
            PreparedStatement st;
            st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return new Department(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6),
                        rs.getString(7), rs.getString(8), rs.getString(9), rs.getString(10));
            }
        } catch (SQLException ex) {
            Logger.getLogger(DepartmentDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public ArrayList<Department> pagingDepartment(int index) {
        ArrayList<Department> list = new ArrayList<>();
        String sql = "SELECT * FROM Department\n"
                + "ORDER BY DepId\n"
                + "OFFSET ? ROWS FETCH NEXT 3 ROWS ONLY;";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);

            ps.setInt(1, (index - 1) * 3);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Department(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6),
                        rs.getString(7), rs.getString(8), rs.getString(9), rs.getString(10)));
            }
        } catch (SQLException ex) {
            Logger.getLogger(DepartmentDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public int getTotalDepartment() {
        String sql = "select count(*) from Department";
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

    public ArrayList<Department> pagingDepartmentByText(String key, int index) {
        ArrayList<Department> list = new ArrayList<>();
        String sql = "SELECT * FROM Department where DepName like N'%"+key+"%' or ShortDescription like N'%"+key+"%'\n"
                + "ORDER BY DepId OFFSET ? ROWS FETCH NEXT 3 ROWS ONLY;";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);

            ps.setInt(1, (index - 1) * 3);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Department(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6),
                        rs.getString(7), rs.getString(8), rs.getString(9), rs.getString(10)));
            }
        } catch (SQLException ex) {
            Logger.getLogger(DepartmentDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
    
    public ArrayList<Department> getAllDepartmentByText(String key) {
        ArrayList<Department> list = new ArrayList<>();
        String sql = "SELECT * FROM Department where DepName like N'%"+key+"%' or ShortDescription like N'%"+key+"%'";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Department(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6),
                        rs.getString(7), rs.getString(8), rs.getString(9), rs.getString(10)));
            }
        } catch (SQLException ex) {
            Logger.getLogger(DepartmentDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public int getTotalDepartmentByText(ArrayList dep, String key) {
        dep = getAllDepartmentByText(key);
        int totalPage = dep.size();
        return totalPage;
    }

    public static void main(String[] args) {
        DepartmentDAO dao = new DepartmentDAO();
//        ArrayList<Department> dep = dao.listDep();
//        for (Department department : dep) {
//            System.out.println(department.getDepId() + department.getDepName() + department.getDepnameAbbreviation());
//        }

        Department d = dao.getDepartmentDetailbyID(1);
        System.out.println(d.toString());

    }

}
