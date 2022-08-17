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

import model.Student;

/**
 *
 * @authFirstNameDELL
 */
public class StudentDAO extends DBContext {

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

    public String getStudentNo(String userName) {
        String sql = "select s.StudentNo from Students s join Account a on s.Email = a.Username where a.Username = ?";
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

    public ArrayList<Student> getAllStudent(int index) throws ClassNotFoundException, SQLException, Exception {
        ArrayList<Student> list = new ArrayList<>();
        String sql = "select StudentID, FirstName , LastName , Age , Phone , Unit , Email , CountryName , ProvinceName , DistrictName , AddressDetail ,Account.AccountStatus , Gender, Avatar\n"
                + "from Students\n"
                + "inner join Country on Students.CountryID=Country.CountryID\n"
                + "inner join Province on Students.ProvinceID = Province.ProvinceID\n"
                + "inner join District on Students.DistrictID = District.DistrictID\n"
                + "inner join Account on Students.Email = Account.username\n"
                + "ORDER BY StudentID\n"
                + "OFFSET ? ROWS FETCH NEXT 6 ROWS ONLY;";
        PreparedStatement ps = connection.prepareStatement(sql);
        ps.setInt(1, (index - 1) * 6);
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            list.add(new Student(rs.getString("StudentID"), rs.getString("FirstName"), rs.getString("LastName"), rs.getInt("Age"), rs.getString("Phone"),
                    rs.getString("Unit"), rs.getString("Email"), rs.getString("CountryName"), rs.getString("ProvinceName"), rs.getString("DistrictName"), rs.getString("AddressDetail"), rs.getInt("AccountStatus"), rs.getInt("Gender"), rs.getString("Avatar")));

        }
        return list;
    }

    public ArrayList<Student> listAllStudent() throws ClassNotFoundException, SQLException, Exception {
        ArrayList<Student> list = new ArrayList<>();
        String sql = "select StudentID, FirstName , LastName , Age , Phone , Unit , Email , CountryName , ProvinceName , DistrictName , AddressDetail ,Account.AccountStatus , Gender, Avatar\n"
                + "from Students\n"
                + "inner join Country on Students.CountryID=Country.CountryID\n"
                + "inner join Province on Students.ProvinceID = Province.ProvinceID\n"
                + "inner join District on Students.DistrictID = District.DistrictID\n"
                + "inner join Account on Students.Email = Account.username\n"
                + "ORDER BY StudentID";
        PreparedStatement ps = connection.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            list.add(new Student(rs.getString("StudentID"), rs.getString("FirstName"), rs.getString("LastName"), rs.getInt("Age"), rs.getString("Phone"),
                    rs.getString("Unit"), rs.getString("Email"), rs.getString("CountryName"), rs.getString("ProvinceName"), rs.getString("DistrictName"), rs.getString("AddressDetail"), rs.getInt("AccountStatus"), rs.getInt("Gender"), rs.getString("Avatar")));

        }
        return list;
    }

    public ArrayList<Student> filterStudOnlyStus(int status) throws ClassNotFoundException, SQLException, Exception {
        ArrayList<Student> list = new ArrayList<>();
        String sql = "select StudentID, FirstName , LastName , Age , Phone , Unit , Students.Email , CountryName , ProvinceName , \n"
                + "DistrictName , AddressDetail ,Account.AccountStatus , Gender, Avatar\n"
                + "from Students inner join Country on Students.CountryID=Country.CountryID\n"
                + "                inner join Province on Students.ProvinceID = Province.ProvinceID\n"
                + "                inner join District on Students.DistrictID = District.DistrictID\n"
                + "                 join Account on Students.Email = Account.username\n"
                + "				 WHERE Account.AccountStatus = " + status + "\n"
                + "                ORDER BY StudentID\n"
                + "";
        PreparedStatement ps = connection.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            list.add(new Student(rs.getString("StudentID"), rs.getString("FirstName"), rs.getString("LastName"), rs.getInt("Age"), rs.getString("Phone"),
                    rs.getString("Unit"), rs.getString("Email"), rs.getString("CountryName"), rs.getString("ProvinceName"), rs.getString("DistrictName"), rs.getString("AddressDetail"), rs.getInt("AccountStatus"), rs.getInt("Gender"), rs.getString("Avatar")));

        }
        return list;
    }

    public ArrayList<Student> filterStudOnlyGen(int gender) throws ClassNotFoundException, SQLException, Exception {
        ArrayList<Student> list = new ArrayList<>();
        String sql = "select StudentID, FirstName , LastName , Age , Phone , Unit , Students.Email , CountryName , ProvinceName , \n"
                + "DistrictName , AddressDetail ,Account.AccountStatus , Gender, Avatar\n"
                + "from Students inner join Country on Students.CountryID=Country.CountryID\n"
                + "                inner join Province on Students.ProvinceID = Province.ProvinceID\n"
                + "                inner join District on Students.DistrictID = District.DistrictID\n"
                + "                 join Account on Students.Email = Account.username\n"
                + "				 WHERE Gender = " + gender + "\n"
                + "                ORDER BY StudentID\n"
                + "";
        PreparedStatement ps = connection.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            list.add(new Student(rs.getString("StudentID"), rs.getString("FirstName"), rs.getString("LastName"), rs.getInt("Age"), rs.getString("Phone"),
                    rs.getString("Unit"), rs.getString("Email"), rs.getString("CountryName"), rs.getString("ProvinceName"), rs.getString("DistrictName"), rs.getString("AddressDetail"), rs.getInt("AccountStatus"), rs.getInt("Gender"), rs.getString("Avatar")));

        }
        return list;
    }

    public ArrayList<Student> filterStudOnlyUnit(String unit) throws ClassNotFoundException, SQLException, Exception {
        ArrayList<Student> list = new ArrayList<>();
        String sql = "select StudentID, FirstName , LastName , Age , Phone , Unit , Students.Email , CountryName , ProvinceName , \n"
                + "DistrictName , AddressDetail ,Account.AccountStatus , Gender, Avatar\n"
                + "from Students inner join Country on Students.CountryID=Country.CountryID\n"
                + "                inner join Province on Students.ProvinceID = Province.ProvinceID\n"
                + "                inner join District on Students.DistrictID = District.DistrictID\n"
                + "                 join Account on Students.Email = Account.username\n"
                + "				 WHERE Unit='" + unit + "'\n"
                + "                ORDER BY StudentID\n"
                + "";
        PreparedStatement ps = connection.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            list.add(new Student(rs.getString("StudentID"), rs.getString("FirstName"), rs.getString("LastName"), rs.getInt("Age"), rs.getString("Phone"),
                    rs.getString("Unit"), rs.getString("Email"), rs.getString("CountryName"), rs.getString("ProvinceName"), rs.getString("DistrictName"), rs.getString("AddressDetail"), rs.getInt("AccountStatus"), rs.getInt("Gender"), rs.getString("Avatar")));

        }
        return list;
    }

    public ArrayList<Student> filterStudUnitStatus(String unit, int status) throws ClassNotFoundException, SQLException, Exception {
        ArrayList<Student> list = new ArrayList<>();
        String sql = "select StudentID, FirstName , LastName , Age , Phone , Unit , Students.Email , CountryName , ProvinceName , \n"
                + "DistrictName , AddressDetail ,Account.AccountStatus , Gender, Avatar\n"
                + "from Students inner join Country on Students.CountryID=Country.CountryID\n"
                + "                inner join Province on Students.ProvinceID = Province.ProvinceID\n"
                + "                inner join District on Students.DistrictID = District.DistrictID\n"
                + "                 join Account on Students.Email = Account.username\n"
                + "				 WHERE Unit='" + unit + "' and Account.AccountStatus = " + status + "\n"
                + "                ORDER BY StudentID\n"
                + "";
        PreparedStatement ps = connection.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            list.add(new Student(rs.getString("StudentID"), rs.getString("FirstName"), rs.getString("LastName"), rs.getInt("Age"), rs.getString("Phone"),
                    rs.getString("Unit"), rs.getString("Email"), rs.getString("CountryName"), rs.getString("ProvinceName"), rs.getString("DistrictName"), rs.getString("AddressDetail"), rs.getInt("AccountStatus"), rs.getInt("Gender"), rs.getString("Avatar")));

        }
        return list;
    }

    public ArrayList<Student> filterStudUnitGen(String unit, int gender) throws ClassNotFoundException, SQLException, Exception {
        ArrayList<Student> list = new ArrayList<>();
        String sql = "select StudentID, FirstName , LastName , Age , Phone , Unit , Students.Email , CountryName , ProvinceName , \n"
                + "DistrictName , AddressDetail ,Account.AccountStatus , Gender, Avatar\n"
                + "from Students inner join Country on Students.CountryID=Country.CountryID\n"
                + "                inner join Province on Students.ProvinceID = Province.ProvinceID\n"
                + "                inner join District on Students.DistrictID = District.DistrictID\n"
                + "                 join Account on Students.Email = Account.username\n"
                + "				 WHERE Unit='" + unit + "' and Gender = " + gender + "\n"
                + "                ORDER BY StudentID\n"
                + "";
        PreparedStatement ps = connection.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            list.add(new Student(rs.getString("StudentID"), rs.getString("FirstName"), rs.getString("LastName"), rs.getInt("Age"), rs.getString("Phone"),
                    rs.getString("Unit"), rs.getString("Email"), rs.getString("CountryName"), rs.getString("ProvinceName"), rs.getString("DistrictName"), rs.getString("AddressDetail"), rs.getInt("AccountStatus"), rs.getInt("Gender"), rs.getString("Avatar")));

        }
        return list;
    }

    public ArrayList<Student> filterStudUnitGenStus(String unit, int gender, int status) throws ClassNotFoundException, SQLException, Exception {
        ArrayList<Student> list = new ArrayList<>();
        String sql = "select StudentID, FirstName , LastName , Age , Phone , Unit , Students.Email , CountryName , ProvinceName , \n"
                + "DistrictName , AddressDetail ,Account.AccountStatus , Gender, Avatar\n"
                + "from Students inner join Country on Students.CountryID=Country.CountryID\n"
                + "                inner join Province on Students.ProvinceID = Province.ProvinceID\n"
                + "                inner join District on Students.DistrictID = District.DistrictID\n"
                + "                 join Account on Students.Email = Account.username\n"
                + "				 WHERE Unit='" + unit + "' and Gender = " + gender + " and Account.AccountStatus = " + status + "\n"
                + "                ORDER BY StudentID\n"
                + "";
        PreparedStatement ps = connection.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            list.add(new Student(rs.getString("StudentID"), rs.getString("FirstName"), rs.getString("LastName"), rs.getInt("Age"), rs.getString("Phone"),
                    rs.getString("Unit"), rs.getString("Email"), rs.getString("CountryName"), rs.getString("ProvinceName"), rs.getString("DistrictName"), rs.getString("AddressDetail"), rs.getInt("AccountStatus"), rs.getInt("Gender"), rs.getString("Avatar")));

        }
        return list;
    }

    public ArrayList<Student> filterStudOnlyProvince(int province) throws ClassNotFoundException, SQLException, Exception {
        ArrayList<Student> list = new ArrayList<>();
        String sql = "select StudentID, FirstName , LastName , Age , Phone , Unit , Students.Email , CountryName , ProvinceName , \n"
                + "DistrictName , AddressDetail ,Account.AccountStatus , Gender, Avatar\n"
                + "from Students inner join Country on Students.CountryID=Country.CountryID\n"
                + "                inner join Province on Students.ProvinceID = Province.ProvinceID\n"
                + "                inner join District on Students.DistrictID = District.DistrictID\n"
                + "                 join Account on Students.Email = Account.username\n"
                + "				 WHERE Students.ProvinceID = " + province + "\n"
                + "                ORDER BY StudentID";
        PreparedStatement ps = connection.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            list.add(new Student(rs.getString("StudentID"), rs.getString("FirstName"), rs.getString("LastName"), rs.getInt("Age"), rs.getString("Phone"),
                    rs.getString("Unit"), rs.getString("Email"), rs.getString("CountryName"), rs.getString("ProvinceName"), rs.getString("DistrictName"), rs.getString("AddressDetail"), rs.getInt("AccountStatus"), rs.getInt("Gender"), rs.getString("Avatar")));

        }
        return list;
    }

    public ArrayList<Student> filterStudProvinceStus(int province, int status) throws ClassNotFoundException, SQLException, Exception {
        ArrayList<Student> list = new ArrayList<>();
        String sql = "select StudentID, FirstName , LastName , Age , Phone , Unit , Students.Email , CountryName , ProvinceName , \n"
                + "DistrictName , AddressDetail ,Account.AccountStatus , Gender, Avatar\n"
                + "from Students inner join Country on Students.CountryID=Country.CountryID\n"
                + "                inner join Province on Students.ProvinceID = Province.ProvinceID\n"
                + "                inner join District on Students.DistrictID = District.DistrictID\n"
                + "                 join Account on Students.Email = Account.username\n"
                + "				 WHERE Students.ProvinceID = " + province + " and Account.AccountStatus = " + status + "\n"
                + "                ORDER BY StudentID";
        PreparedStatement ps = connection.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            list.add(new Student(rs.getString("StudentID"), rs.getString("FirstName"), rs.getString("LastName"), rs.getInt("Age"), rs.getString("Phone"),
                    rs.getString("Unit"), rs.getString("Email"), rs.getString("CountryName"), rs.getString("ProvinceName"), rs.getString("DistrictName"), rs.getString("AddressDetail"), rs.getInt("AccountStatus"), rs.getInt("Gender"), rs.getString("Avatar")));

        }
        return list;
    }

    public ArrayList<Student> filterStudProvinceGen(int province, int gender) throws ClassNotFoundException, SQLException, Exception {
        ArrayList<Student> list = new ArrayList<>();
        String sql = "select StudentID, FirstName , LastName , Age , Phone , Unit , Students.Email , CountryName , ProvinceName , \n"
                + "DistrictName , AddressDetail ,Account.AccountStatus , Gender, Avatar\n"
                + "from Students inner join Country on Students.CountryID=Country.CountryID\n"
                + "                inner join Province on Students.ProvinceID = Province.ProvinceID\n"
                + "                inner join District on Students.DistrictID = District.DistrictID\n"
                + "                 join Account on Students.Email = Account.username\n"
                + "				 WHERE Students.ProvinceID = " + province + " and Gender = " + gender + "\n"
                + "                ORDER BY StudentID";
        PreparedStatement ps = connection.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            list.add(new Student(rs.getString("StudentID"), rs.getString("FirstName"), rs.getString("LastName"), rs.getInt("Age"), rs.getString("Phone"),
                    rs.getString("Unit"), rs.getString("Email"), rs.getString("CountryName"), rs.getString("ProvinceName"), rs.getString("DistrictName"), rs.getString("AddressDetail"), rs.getInt("AccountStatus"), rs.getInt("Gender"), rs.getString("Avatar")));

        }
        return list;
    }

    public ArrayList<Student> filterStudProvinceUnit(int province, String unit) throws ClassNotFoundException, SQLException, Exception {
        ArrayList<Student> list = new ArrayList<>();
        String sql = "select StudentID, FirstName , LastName , Age , Phone , Unit , Students.Email , CountryName , ProvinceName , \n"
                + "DistrictName , AddressDetail ,Account.AccountStatus , Gender, Avatar\n"
                + "from Students inner join Country on Students.CountryID=Country.CountryID\n"
                + "                inner join Province on Students.ProvinceID = Province.ProvinceID\n"
                + "                inner join District on Students.DistrictID = District.DistrictID\n"
                + "                 join Account on Students.Email = Account.username\n"
                + "				 WHERE Students.ProvinceID = " + province + " and Unit='" + unit + "'\n"
                + "                ORDER BY StudentID";
        PreparedStatement ps = connection.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            list.add(new Student(rs.getString("StudentID"), rs.getString("FirstName"), rs.getString("LastName"), rs.getInt("Age"), rs.getString("Phone"),
                    rs.getString("Unit"), rs.getString("Email"), rs.getString("CountryName"), rs.getString("ProvinceName"), rs.getString("DistrictName"), rs.getString("AddressDetail"), rs.getInt("AccountStatus"), rs.getInt("Gender"), rs.getString("Avatar")));

        }
        return list;
    }

    public ArrayList<Student> filterStudProvinceUnitStus(int province, String unit, int status) throws ClassNotFoundException, SQLException, Exception {
        ArrayList<Student> list = new ArrayList<>();
        String sql = "select StudentID, FirstName , LastName , Age , Phone , Unit , Students.Email , CountryName , ProvinceName , \n"
                + "DistrictName , AddressDetail ,Account.AccountStatus , Gender, Avatar\n"
                + "from Students inner join Country on Students.CountryID=Country.CountryID\n"
                + "                inner join Province on Students.ProvinceID = Province.ProvinceID\n"
                + "                inner join District on Students.DistrictID = District.DistrictID\n"
                + "                 join Account on Students.Email = Account.username\n"
                + "				 WHERE Students.ProvinceID = " + province + " and Unit='" + unit + "' and Account.AccountStatus = " + status + "\n"
                + "                ORDER BY StudentID";
        PreparedStatement ps = connection.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            list.add(new Student(rs.getString("StudentID"), rs.getString("FirstName"), rs.getString("LastName"), rs.getInt("Age"), rs.getString("Phone"),
                    rs.getString("Unit"), rs.getString("Email"), rs.getString("CountryName"), rs.getString("ProvinceName"), rs.getString("DistrictName"), rs.getString("AddressDetail"), rs.getInt("AccountStatus"), rs.getInt("Gender"), rs.getString("Avatar")));

        }
        return list;
    }

    public ArrayList<Student> filterStudProvinceUnitGen(int province, String unit, int gender) throws ClassNotFoundException, SQLException, Exception {
        ArrayList<Student> list = new ArrayList<>();
        String sql = "select StudentID, FirstName , LastName , Age , Phone , Unit , Students.Email , CountryName , ProvinceName , \n"
                + "DistrictName , AddressDetail ,Account.AccountStatus , Gender, Avatar\n"
                + "from Students inner join Country on Students.CountryID=Country.CountryID\n"
                + "                inner join Province on Students.ProvinceID = Province.ProvinceID\n"
                + "                inner join District on Students.DistrictID = District.DistrictID\n"
                + "                 join Account on Students.Email = Account.username\n"
                + "				 WHERE Students.ProvinceID = " + province + " and Unit='" + unit + "' and Gender = " + gender + "\n"
                + "                ORDER BY StudentID";
        PreparedStatement ps = connection.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            list.add(new Student(rs.getString("StudentID"), rs.getString("FirstName"), rs.getString("LastName"), rs.getInt("Age"), rs.getString("Phone"),
                    rs.getString("Unit"), rs.getString("Email"), rs.getString("CountryName"), rs.getString("ProvinceName"), rs.getString("DistrictName"), rs.getString("AddressDetail"), rs.getInt("AccountStatus"), rs.getInt("Gender"), rs.getString("Avatar")));

        }
        return list;
    }

    public ArrayList<Student> filterStudProvinceUnitGenStus(int province, String unit, int gender, int status) throws ClassNotFoundException, SQLException, Exception {
        ArrayList<Student> list = new ArrayList<>();
        String sql = "select StudentID, FirstName , LastName , Age , Phone , Unit , Students.Email , CountryName , ProvinceName , \n"
                + "DistrictName , AddressDetail ,Account.AccountStatus , Gender, Avatar\n"
                + "from Students inner join Country on Students.CountryID=Country.CountryID\n"
                + "                inner join Province on Students.ProvinceID = Province.ProvinceID\n"
                + "                inner join District on Students.DistrictID = District.DistrictID\n"
                + "                 join Account on Students.Email = Account.username\n"
                + "				 WHERE Students.ProvinceID = " + province + " and Unit='" + unit + "' and Gender = " + gender + " and Account.AccountStatus = " + status + "\n"
                + "                ORDER BY StudentID";
        PreparedStatement ps = connection.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            list.add(new Student(rs.getString("StudentID"), rs.getString("FirstName"), rs.getString("LastName"), rs.getInt("Age"), rs.getString("Phone"),
                    rs.getString("Unit"), rs.getString("Email"), rs.getString("CountryName"), rs.getString("ProvinceName"), rs.getString("DistrictName"), rs.getString("AddressDetail"), rs.getInt("AccountStatus"), rs.getInt("Gender"), rs.getString("Avatar")));

        }
        return list;
    }

    public ArrayList<Student> filterStudProvinceGenStus(int province, int gender, int status) throws ClassNotFoundException, SQLException, Exception {
        ArrayList<Student> list = new ArrayList<>();
        String sql = "select StudentID, FirstName , LastName , Age , Phone , Unit , Students.Email , CountryName , ProvinceName , \n"
                + "DistrictName , AddressDetail ,Account.AccountStatus , Gender, Avatar\n"
                + "from Students inner join Country on Students.CountryID=Country.CountryID\n"
                + "                inner join Province on Students.ProvinceID = Province.ProvinceID\n"
                + "                inner join District on Students.DistrictID = District.DistrictID\n"
                + "                 join Account on Students.Email = Account.username\n"
                + "		WHERE Students.ProvinceID = " + province + " and Gender = " + gender + " and Account.AccountStatus = " + status + "\n"
                + "                ORDER BY StudentID";
        PreparedStatement ps = connection.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            list.add(new Student(rs.getString("StudentID"), rs.getString("FirstName"), rs.getString("LastName"), rs.getInt("Age"), rs.getString("Phone"),
                    rs.getString("Unit"), rs.getString("Email"), rs.getString("CountryName"), rs.getString("ProvinceName"), rs.getString("DistrictName"), rs.getString("AddressDetail"), rs.getInt("AccountStatus"), rs.getInt("Gender"), rs.getString("Avatar")));

        }
        return list;
    }

    public ArrayList<Student> filterStudText(String text) throws ClassNotFoundException, SQLException, Exception {
        ArrayList<Student> list = new ArrayList<>();
        String sql = "select StudentID, FirstName , LastName , Age , Phone , Unit , Students.Email , CountryName , ProvinceName , \n"
                + "DistrictName , AddressDetail ,Account.AccountStatus , Gender, Avatar\n"
                + "from Students inner join Country on Students.CountryID=Country.CountryID\n"
                + "                inner join Province on Students.ProvinceID = Province.ProvinceID\n"
                + "                inner join District on Students.DistrictID = District.DistrictID\n"
                + "                 join Account on Students.Email = Account.username\n"
                + "				 WHERE (FirstName like N'%" + text + "%' OR LastName like N'%" + text + "%')\n"
                + "                ORDER BY StudentID";
        PreparedStatement ps = connection.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            list.add(new Student(rs.getString("StudentID"), rs.getString("FirstName"), rs.getString("LastName"), rs.getInt("Age"), rs.getString("Phone"),
                    rs.getString("Unit"), rs.getString("Email"), rs.getString("CountryName"), rs.getString("ProvinceName"), rs.getString("DistrictName"), rs.getString("AddressDetail"), rs.getInt("AccountStatus"), rs.getInt("Gender"), rs.getString("Avatar")));

        }
        return list;
    }

    public ArrayList<Student> filterStudKeyStus(String text, int status) throws ClassNotFoundException, SQLException, Exception {
        ArrayList<Student> list = new ArrayList<>();
        String sql = "select StudentID, FirstName , LastName , Age , Phone , Unit , Students.Email , CountryName , ProvinceName , \n"
                + "DistrictName , AddressDetail ,Account.AccountStatus , Gender, Avatar\n"
                + "from Students inner join Country on Students.CountryID=Country.CountryID\n"
                + "                inner join Province on Students.ProvinceID = Province.ProvinceID\n"
                + "                inner join District on Students.DistrictID = District.DistrictID\n"
                + "                 join Account on Students.Email = Account.username\n"
                + "WHERE (FirstName like N'%" + text + "%' OR LastName like N'%" + text + "%') and Account.AccountStatus = " + status + "\n"
                + "                ORDER BY StudentID";
        PreparedStatement ps = connection.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            list.add(new Student(rs.getString("StudentID"), rs.getString("FirstName"), rs.getString("LastName"), rs.getInt("Age"), rs.getString("Phone"),
                    rs.getString("Unit"), rs.getString("Email"), rs.getString("CountryName"), rs.getString("ProvinceName"), rs.getString("DistrictName"), rs.getString("AddressDetail"), rs.getInt("AccountStatus"), rs.getInt("Gender"), rs.getString("Avatar")));

        }
        return list;
    }

    public ArrayList<Student> filterStudKeyGen(String text, int gender) throws ClassNotFoundException, SQLException, Exception {
        ArrayList<Student> list = new ArrayList<>();
        String sql = "select StudentID, FirstName , LastName , Age , Phone , Unit , Students.Email , CountryName , ProvinceName , \n"
                + "DistrictName , AddressDetail ,Account.AccountStatus , Gender, Avatar\n"
                + "from Students inner join Country on Students.CountryID=Country.CountryID\n"
                + "                inner join Province on Students.ProvinceID = Province.ProvinceID\n"
                + "                inner join District on Students.DistrictID = District.DistrictID\n"
                + "                 join Account on Students.Email = Account.username\n"
                + "WHERE (FirstName like N'%" + text + "%' OR LastName like N'%" + text + "%') and Gender = " + gender + "\n"
                + "                ORDER BY StudentID";
        PreparedStatement ps = connection.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            list.add(new Student(rs.getString("StudentID"), rs.getString("FirstName"), rs.getString("LastName"), rs.getInt("Age"), rs.getString("Phone"),
                    rs.getString("Unit"), rs.getString("Email"), rs.getString("CountryName"), rs.getString("ProvinceName"), rs.getString("DistrictName"), rs.getString("AddressDetail"), rs.getInt("AccountStatus"), rs.getInt("Gender"), rs.getString("Avatar")));

        }
        return list;
    }

    public ArrayList<Student> filterStudByGenStus(int status, int gender) throws ClassNotFoundException, SQLException, Exception {
        ArrayList<Student> list = new ArrayList<>();
        String sql = "select StudentID, FirstName , LastName , Age , Phone , Unit , Students.Email , CountryName , ProvinceName , \n"
                + "DistrictName , AddressDetail ,Account.AccountStatus , Gender, Avatar\n"
                + "from Students inner join Country on Students.CountryID=Country.CountryID\n"
                + "                inner join Province on Students.ProvinceID = Province.ProvinceID\n"
                + "                inner join District on Students.DistrictID = District.DistrictID\n"
                + "                 join Account on Students.Email = Account.username\n"
                + "				 WHERE Account.AccountStatus = " + status + " and Gender = " + gender + "\n"
                + "                ORDER BY StudentID\n"
                + "";
        PreparedStatement ps = connection.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            list.add(new Student(rs.getString("StudentID"), rs.getString("FirstName"), rs.getString("LastName"), rs.getInt("Age"), rs.getString("Phone"),
                    rs.getString("Unit"), rs.getString("Email"), rs.getString("CountryName"), rs.getString("ProvinceName"), rs.getString("DistrictName"), rs.getString("AddressDetail"), rs.getInt("AccountStatus"), rs.getInt("Gender"), rs.getString("Avatar")));

        }
        return list;
    }

    public ArrayList<Student> filterStudByKeyGenStus(String text, int status, int gender) throws ClassNotFoundException, SQLException, Exception {
        ArrayList<Student> list = new ArrayList<>();
        String sql = "select StudentID, FirstName , LastName , Age , Phone , Unit , Students.Email , CountryName , ProvinceName , \n"
                + "DistrictName , AddressDetail ,Account.AccountStatus , Gender, Avatar\n"
                + "from Students inner join Country on Students.CountryID=Country.CountryID\n"
                + "                inner join Province on Students.ProvinceID = Province.ProvinceID\n"
                + "                inner join District on Students.DistrictID = District.DistrictID\n"
                + "                 join Account on Students.Email = Account.username\n"
                + "WHERE (FirstName like N'%" + text + "%' OR LastName like N'%" + text + "%') and Account.AccountStatus = " + status + " and Gender = " + gender + "\n"
                + "                ORDER BY StudentID\n"
                + "";
        PreparedStatement ps = connection.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            list.add(new Student(rs.getString("StudentID"), rs.getString("FirstName"), rs.getString("LastName"), rs.getInt("Age"), rs.getString("Phone"),
                    rs.getString("Unit"), rs.getString("Email"), rs.getString("CountryName"), rs.getString("ProvinceName"), rs.getString("DistrictName"), rs.getString("AddressDetail"), rs.getInt("AccountStatus"), rs.getInt("Gender"), rs.getString("Avatar")));

        }
        return list;
    }

    public ArrayList<Student> filterStudByKeyUnit(String text, String unit) throws ClassNotFoundException, SQLException, Exception {
        ArrayList<Student> list = new ArrayList<>();
        String sql = "select StudentID, FirstName , LastName , Age , Phone , Unit , Students.Email , CountryName , ProvinceName , \n"
                + "DistrictName , AddressDetail ,Account.AccountStatus , Gender, Avatar\n"
                + "from Students inner join Country on Students.CountryID=Country.CountryID\n"
                + "                inner join Province on Students.ProvinceID = Province.ProvinceID\n"
                + "                inner join District on Students.DistrictID = District.DistrictID\n"
                + "                 join Account on Students.Email = Account.username\n"
                + "WHERE (FirstName like N'%" + text + "%' OR LastName like N'%" + text + "%') and Unit='" + unit + "'\n"
                + "                ORDER BY StudentID\n"
                + "";
        PreparedStatement ps = connection.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            list.add(new Student(rs.getString("StudentID"), rs.getString("FirstName"), rs.getString("LastName"), rs.getInt("Age"), rs.getString("Phone"),
                    rs.getString("Unit"), rs.getString("Email"), rs.getString("CountryName"), rs.getString("ProvinceName"), rs.getString("DistrictName"), rs.getString("AddressDetail"), rs.getInt("AccountStatus"), rs.getInt("Gender"), rs.getString("Avatar")));

        }
        return list;
    }

    public ArrayList<Student> filterStudByKeyUnitStus(String text, String unit, int status) throws ClassNotFoundException, SQLException, Exception {
        ArrayList<Student> list = new ArrayList<>();
        String sql = "select StudentID, FirstName , LastName , Age , Phone , Unit , Students.Email , CountryName , ProvinceName , \n"
                + "DistrictName , AddressDetail ,Account.AccountStatus , Gender, Avatar\n"
                + "from Students inner join Country on Students.CountryID=Country.CountryID\n"
                + "                inner join Province on Students.ProvinceID = Province.ProvinceID\n"
                + "                inner join District on Students.DistrictID = District.DistrictID\n"
                + "                 join Account on Students.Email = Account.username\n"
                + "WHERE (FirstName like N'%" + text + "%' OR LastName like N'%" + text + "%') and Unit='" + unit + "' and Account.AccountStatus = " + status + "\n"
                + "                ORDER BY StudentID\n"
                + "";
        PreparedStatement ps = connection.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            list.add(new Student(rs.getString("StudentID"), rs.getString("FirstName"), rs.getString("LastName"), rs.getInt("Age"), rs.getString("Phone"),
                    rs.getString("Unit"), rs.getString("Email"), rs.getString("CountryName"), rs.getString("ProvinceName"), rs.getString("DistrictName"), rs.getString("AddressDetail"), rs.getInt("AccountStatus"), rs.getInt("Gender"), rs.getString("Avatar")));

        }
        return list;
    }

    public ArrayList<Student> filterStudByKeyUnitGen(String text, String unit, int gender) throws ClassNotFoundException, SQLException, Exception {
        ArrayList<Student> list = new ArrayList<>();
        String sql = "select StudentID, FirstName , LastName , Age , Phone , Unit , Students.Email , CountryName , ProvinceName , \n"
                + "DistrictName , AddressDetail ,Account.AccountStatus , Gender, Avatar\n"
                + "from Students inner join Country on Students.CountryID=Country.CountryID\n"
                + "                inner join Province on Students.ProvinceID = Province.ProvinceID\n"
                + "                inner join District on Students.DistrictID = District.DistrictID\n"
                + "                 join Account on Students.Email = Account.username\n"
                + "WHERE (FirstName like N'%" + text + "%' OR LastName like N'%" + text + "%') and Unit='" + unit + "' and Gender = " + gender + "\n"
                + "                ORDER BY StudentID\n"
                + "";
        PreparedStatement ps = connection.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            list.add(new Student(rs.getString("StudentID"), rs.getString("FirstName"), rs.getString("LastName"), rs.getInt("Age"), rs.getString("Phone"),
                    rs.getString("Unit"), rs.getString("Email"), rs.getString("CountryName"), rs.getString("ProvinceName"), rs.getString("DistrictName"), rs.getString("AddressDetail"), rs.getInt("AccountStatus"), rs.getInt("Gender"), rs.getString("Avatar")));

        }
        return list;
    }

    public ArrayList<Student> filterStudByKeyUnitGenStus(String text, String unit, int gender, int status) throws ClassNotFoundException, SQLException, Exception {
        ArrayList<Student> list = new ArrayList<>();
        String sql = "select StudentID, FirstName , LastName , Age , Phone , Unit , Students.Email , CountryName , ProvinceName , \n"
                + "DistrictName , AddressDetail ,Account.AccountStatus , Gender, Avatar\n"
                + "from Students inner join Country on Students.CountryID=Country.CountryID\n"
                + "                inner join Province on Students.ProvinceID = Province.ProvinceID\n"
                + "                inner join District on Students.DistrictID = District.DistrictID\n"
                + "                 join Account on Students.Email = Account.username\n"
                + "WHERE (FirstName like N'%" + text + "%' OR LastName like N'%" + text + "%') and Unit='" + unit + "' and Gender = " + gender + " and Account.AccountStatus = " + status + "\n"
                + "                ORDER BY StudentID\n"
                + "";
        PreparedStatement ps = connection.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            list.add(new Student(rs.getString("StudentID"), rs.getString("FirstName"), rs.getString("LastName"), rs.getInt("Age"), rs.getString("Phone"),
                    rs.getString("Unit"), rs.getString("Email"), rs.getString("CountryName"), rs.getString("ProvinceName"), rs.getString("DistrictName"), rs.getString("AddressDetail"), rs.getInt("AccountStatus"), rs.getInt("Gender"), rs.getString("Avatar")));

        }
        return list;
    }

    public ArrayList<Student> filterStudKeyProvince(String text, int province) throws ClassNotFoundException, SQLException, Exception {
        ArrayList<Student> list = new ArrayList<>();
        String sql = "select StudentID, FirstName , LastName , Age , Phone , Unit , Students.Email , CountryName , ProvinceName , \n"
                + "DistrictName , AddressDetail ,Account.AccountStatus , Gender, Avatar\n"
                + "from Students inner join Country on Students.CountryID=Country.CountryID\n"
                + "                inner join Province on Students.ProvinceID = Province.ProvinceID\n"
                + "                inner join District on Students.DistrictID = District.DistrictID\n"
                + "                 join Account on Students.Email = Account.username\n"
                + "WHERE (FirstName like N'%" + text + "%' OR LastName like N'%" + text + "%') and Students.ProvinceID = " + province + "\n"
                + "                ORDER BY StudentID";
        PreparedStatement ps = connection.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            list.add(new Student(rs.getString("StudentID"), rs.getString("FirstName"), rs.getString("LastName"), rs.getInt("Age"), rs.getString("Phone"),
                    rs.getString("Unit"), rs.getString("Email"), rs.getString("CountryName"), rs.getString("ProvinceName"), rs.getString("DistrictName"), rs.getString("AddressDetail"), rs.getInt("AccountStatus"), rs.getInt("Gender"), rs.getString("Avatar")));

        }
        return list;
    }

    public ArrayList<Student> filterStudKeyProStus(String text, int province, int status) throws ClassNotFoundException, SQLException, Exception {
        ArrayList<Student> list = new ArrayList<>();
        String sql = "select StudentID, FirstName , LastName , Age , Phone , Unit , Students.Email , CountryName , ProvinceName , \n"
                + "DistrictName , AddressDetail ,Account.AccountStatus , Gender, Avatar\n"
                + "from Students inner join Country on Students.CountryID=Country.CountryID\n"
                + "                inner join Province on Students.ProvinceID = Province.ProvinceID\n"
                + "                inner join District on Students.DistrictID = District.DistrictID\n"
                + "                 join Account on Students.Email = Account.username\n"
                + "WHERE (FirstName like N'%" + text + "%' OR LastName like N'%" + text + "%') and Students.ProvinceID = " + province + " and Account.AccountStatus = " + status + "\n"
                + "                ORDER BY StudentID";
        PreparedStatement ps = connection.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            list.add(new Student(rs.getString("StudentID"), rs.getString("FirstName"), rs.getString("LastName"), rs.getInt("Age"), rs.getString("Phone"),
                    rs.getString("Unit"), rs.getString("Email"), rs.getString("CountryName"), rs.getString("ProvinceName"), rs.getString("DistrictName"), rs.getString("AddressDetail"), rs.getInt("AccountStatus"), rs.getInt("Gender"), rs.getString("Avatar")));

        }
        return list;
    }

    public ArrayList<Student> filterStudKeyProGenStus(String text, int province, int gender, int status) throws ClassNotFoundException, SQLException, Exception {
        ArrayList<Student> list = new ArrayList<>();
        String sql = "select StudentID, FirstName , LastName , Age , Phone , Unit , Students.Email , CountryName , ProvinceName , \n"
                + "DistrictName , AddressDetail ,Account.AccountStatus , Gender, Avatar\n"
                + "from Students inner join Country on Students.CountryID=Country.CountryID\n"
                + "                inner join Province on Students.ProvinceID = Province.ProvinceID\n"
                + "                inner join District on Students.DistrictID = District.DistrictID\n"
                + "                 join Account on Students.Email = Account.username\n"
                + "WHERE (FirstName like N'%" + text + "%' OR LastName like N'%" + text + "%') and Students.ProvinceID = " + province + " and Gender = " + gender + " and Account.AccountStatus = " + status + "\n"
                + "                ORDER BY StudentID";
        PreparedStatement ps = connection.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            list.add(new Student(rs.getString("StudentID"), rs.getString("FirstName"), rs.getString("LastName"), rs.getInt("Age"), rs.getString("Phone"),
                    rs.getString("Unit"), rs.getString("Email"), rs.getString("CountryName"), rs.getString("ProvinceName"), rs.getString("DistrictName"), rs.getString("AddressDetail"), rs.getInt("AccountStatus"), rs.getInt("Gender"), rs.getString("Avatar")));

        }
        return list;
    }

    public ArrayList<Student> filterStudKeyProUnitStus(String text, int province, String unit, int status) throws ClassNotFoundException, SQLException, Exception {
        ArrayList<Student> list = new ArrayList<>();
        String sql = "select StudentID, FirstName , LastName , Age , Phone , Unit , Students.Email , CountryName , ProvinceName , \n"
                + "DistrictName , AddressDetail ,Account.AccountStatus , Gender, Avatar\n"
                + "from Students inner join Country on Students.CountryID=Country.CountryID\n"
                + "                inner join Province on Students.ProvinceID = Province.ProvinceID\n"
                + "                inner join District on Students.DistrictID = District.DistrictID\n"
                + "                 join Account on Students.Email = Account.username\n"
                + "WHERE (FirstName like N'%" + text + "%' OR LastName like N'%" + text + "%') and Students.ProvinceID = " + province + " and Unit='" + unit + "' and Account.AccountStatus = " + status + "\n"
                + "                ORDER BY StudentID";
        PreparedStatement ps = connection.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            list.add(new Student(rs.getString("StudentID"), rs.getString("FirstName"), rs.getString("LastName"), rs.getInt("Age"), rs.getString("Phone"),
                    rs.getString("Unit"), rs.getString("Email"), rs.getString("CountryName"), rs.getString("ProvinceName"), rs.getString("DistrictName"), rs.getString("AddressDetail"), rs.getInt("AccountStatus"), rs.getInt("Gender"), rs.getString("Avatar")));

        }
        return list;
    }

    public ArrayList<Student> filterStudKeyProUnitGen(String text, int province, String unit, int gender) throws ClassNotFoundException, SQLException, Exception {
        ArrayList<Student> list = new ArrayList<>();
        String sql = "select StudentID, FirstName , LastName , Age , Phone , Unit , Students.Email , CountryName , ProvinceName , \n"
                + "DistrictName , AddressDetail ,Account.AccountStatus , Gender, Avatar\n"
                + "from Students inner join Country on Students.CountryID=Country.CountryID\n"
                + "                inner join Province on Students.ProvinceID = Province.ProvinceID\n"
                + "                inner join District on Students.DistrictID = District.DistrictID\n"
                + "                 join Account on Students.Email = Account.username\n"
                + "WHERE (FirstName like N'%" + text + "%' OR LastName like N'%" + text + "%') and Students.ProvinceID = " + province + " and Unit='" + unit + "' and Gender = " + gender + "\n"
                + "                ORDER BY StudentID";
        PreparedStatement ps = connection.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            list.add(new Student(rs.getString("StudentID"), rs.getString("FirstName"), rs.getString("LastName"), rs.getInt("Age"), rs.getString("Phone"),
                    rs.getString("Unit"), rs.getString("Email"), rs.getString("CountryName"), rs.getString("ProvinceName"), rs.getString("DistrictName"), rs.getString("AddressDetail"), rs.getInt("AccountStatus"), rs.getInt("Gender"), rs.getString("Avatar")));

        }
        return list;
    }

    public ArrayList<Student> filterStudKeyAll(String text, int province, String unit, int gender, int status) throws ClassNotFoundException, SQLException, Exception {
        ArrayList<Student> list = new ArrayList<>();
        String sql = "select StudentID, FirstName , LastName , Age , Phone , Unit , Students.Email , CountryName , ProvinceName , \n"
                + "DistrictName , AddressDetail ,Account.AccountStatus , Gender, Avatar\n"
                + "from Students inner join Country on Students.CountryID=Country.CountryID\n"
                + "                inner join Province on Students.ProvinceID = Province.ProvinceID\n"
                + "                inner join District on Students.DistrictID = District.DistrictID\n"
                + "                 join Account on Students.Email = Account.username\n"
                + "WHERE (FirstName like N'%" + text + "%' OR LastName like N'%" + text + "%') and Students.ProvinceID = " + province + " and Unit='" + unit + "' and Gender = " + gender + " and Account.AccountStatus = " + status + "\n"
                + "                ORDER BY StudentID";
        PreparedStatement ps = connection.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            list.add(new Student(rs.getString("StudentID"), rs.getString("FirstName"), rs.getString("LastName"), rs.getInt("Age"), rs.getString("Phone"),
                    rs.getString("Unit"), rs.getString("Email"), rs.getString("CountryName"), rs.getString("ProvinceName"), rs.getString("DistrictName"), rs.getString("AddressDetail"), rs.getInt("AccountStatus"), rs.getInt("Gender"), rs.getString("Avatar")));

        }
        return list;
    }

    public ArrayList<Student> filterStudKeyProUnit(String text, int province, String unit) throws ClassNotFoundException, SQLException, Exception {
        ArrayList<Student> list = new ArrayList<>();
        String sql = "select StudentID, FirstName , LastName , Age , Phone , Unit , Students.Email , CountryName , ProvinceName , \n"
                + "DistrictName , AddressDetail ,Account.AccountStatus , Gender, Avatar\n"
                + "from Students inner join Country on Students.CountryID=Country.CountryID\n"
                + "                inner join Province on Students.ProvinceID = Province.ProvinceID\n"
                + "                inner join District on Students.DistrictID = District.DistrictID\n"
                + "                 join Account on Students.Email = Account.username\n"
                + "WHERE (FirstName like N'%" + text + "%' OR LastName like N'%" + text + "%') and Students.ProvinceID = " + province + " and Unit='" + unit + "'\n"
                + "                ORDER BY StudentID";
        PreparedStatement ps = connection.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            list.add(new Student(rs.getString("StudentID"), rs.getString("FirstName"), rs.getString("LastName"), rs.getInt("Age"), rs.getString("Phone"),
                    rs.getString("Unit"), rs.getString("Email"), rs.getString("CountryName"), rs.getString("ProvinceName"), rs.getString("DistrictName"), rs.getString("AddressDetail"), rs.getInt("AccountStatus"), rs.getInt("Gender"), rs.getString("Avatar")));

        }
        return list;
    }

    public ArrayList<Student> filterStudKeyProGen(String text, int province, int gender) throws ClassNotFoundException, SQLException, Exception {
        ArrayList<Student> list = new ArrayList<>();
        String sql = "select StudentID, FirstName , LastName , Age , Phone , Unit , Students.Email , CountryName , ProvinceName , \n"
                + "DistrictName , AddressDetail ,Account.AccountStatus , Gender, Avatar\n"
                + "from Students inner join Country on Students.CountryID=Country.CountryID\n"
                + "                inner join Province on Students.ProvinceID = Province.ProvinceID\n"
                + "                inner join District on Students.DistrictID = District.DistrictID\n"
                + "                 join Account on Students.Email = Account.username\n"
                + "WHERE (FirstName like N'%" + text + "%' OR LastName like N'%" + text + "%') and Students.ProvinceID = " + province + " and Gender = " + gender + "\n"
                + "                ORDER BY StudentID";
        PreparedStatement ps = connection.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            list.add(new Student(rs.getString("StudentID"), rs.getString("FirstName"), rs.getString("LastName"), rs.getInt("Age"), rs.getString("Phone"),
                    rs.getString("Unit"), rs.getString("Email"), rs.getString("CountryName"), rs.getString("ProvinceName"), rs.getString("DistrictName"), rs.getString("AddressDetail"), rs.getInt("AccountStatus"), rs.getInt("Gender"), rs.getString("Avatar")));

        }
        return list;
    }

    public int getTotalStudent() {
        String sql = "select count(*) from Students";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException ex) {
            Logger.getLogger(StudentDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

    public Student getStudentByStudentID(String studentID) {
        try {
            String sql = "select StudentID, FirstName , LastName , Age , Phone , Unit,Email , CountryName , ProvinceName , DistrictName , AddressDetail , Account.AccountStatus ,Gender, Avatar\n"
                    + "from Students\n"
                    + "inner join Country on Students.CountryID=Country.CountryID\n"
                    + "left join Province on Students.ProvinceID = Province.ProvinceID\n"
                    + "left join District on Students.DistrictID = District.DistrictID\n"
                    + "inner join Account on Students.Email = Account.username\n"
                    + "where StudentID=?";
            PreparedStatement st;
            ResultSet rs;
            st = connection.prepareStatement(sql);
            st.setString(1, studentID);
            rs = st.executeQuery();
            while (rs.next()) {

                Student student = new Student(rs.getString("StudentID"), rs.getString("FirstName"), rs.getString("LastName"), rs.getInt("Age"), rs.getString("Phone"),
                        rs.getString("Unit"), rs.getString("Email"), rs.getString("CountryName"), rs.getString("ProvinceName"), rs.getString("DistrictName"), rs.getString("AddressDetail"), rs.getInt("AccountStatus"), rs.getInt("Gender"), rs.getString("Avatar"));
                st.close();
                rs.close();
                return student;
            }
            st.close();
            rs.close();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
        return null;
    }

    public void insertNewStudent(String email) {
        String sql = "insert into Students(Email) values(?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, email);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
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

    public String getStAvatarByUsername(String username) {
        try {
            String sql = "select Avatar\n"
                    + "from Students\n"
                    + "where Students.Email=?";
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

    public Student getAccount(String account) {
        try {
            String sql = "select StudentID, FirstName , LastName , Age , Phone , Unit,Email , CountryName , ProvinceName , DistrictName , AddressDetail , Account.AccountStatus ,Gender,Avatar\n"
                    + " from Students\n"
                    + " inner join Country on Students.CountryID=Country.CountryID\n"
                    + " inner join Province on Students.ProvinceID = Province.ProvinceID\n"
                    + " inner join District on Students.DistrictID = District.DistrictID\n"
                    + " inner join Account on Students.Email = Account.username\n"
                    + " where Email=?";
            PreparedStatement st;
            ResultSet rs;
            st = connection.prepareStatement(sql);
            st.setString(1, account);
            rs = st.executeQuery();
            while (rs.next()) {

                Student student = new Student(rs.getString("StudentID"), rs.getString("FirstName"), rs.getString("LastName"), rs.getInt("Age"), rs.getString("Phone"),
                        rs.getString("Unit"), rs.getString("Email"), rs.getString("CountryName"), rs.getString("ProvinceName"), rs.getString("DistrictName"), rs.getString("AddressDetail"), rs.getInt("AccountStatus"), rs.getInt("Gender"), rs.getString("Avatar"));
                st.close();
                rs.close();
                return student;
            }
            st.close();
            rs.close();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
        return null;
    }

    public Student getStudentByEmail(String email) {
        try {
            String sql = "select StudentID, FirstName , LastName , Age , Phone , Unit,Email , Students.CountryId , Students.ProvinceId "
                    + ", Students.DistrictId , AddressDetail , Account.AccountStatus ,Gender,Avatar,LinkFacebook,StudentNo\n"
                    + " from Students\n"
                    + " inner join Account on Students.Email = Account.username\n"
                    + " where Email=?";
            PreparedStatement st;
            ResultSet rs;
            st = connection.prepareStatement(sql);
            st.setString(1, email);
            rs = st.executeQuery();
            while (rs.next()) {
                Student student = new Student(rs.getString("StudentID"), rs.getString("FirstName"), rs.getString("LastName"), rs.getInt("Age"), rs.getString("Phone"),
                        rs.getString("Unit"), rs.getString("Email"), rs.getInt("CountryID"), rs.getInt("ProvinceID"), rs.getInt("DistrictID"),
                        rs.getString("AddressDetail"), rs.getInt("AccountStatus"), rs.getInt("Gender"), rs.getString("Avatar"), rs.getString("LinkFacebook"), rs.getInt("StudentNo"));
                st.close();
                rs.close();
                return student;
            }
            st.close();
            rs.close();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
        return null;
    }

    public boolean updateStudentProfile(String avatar, Student student) {
        boolean gender = true;
        if (student.getGender() == 1) {
            gender = true;
        } else if (student.getGender() == 0) {
            gender = false;
        }
        try {
            String sql = "UPDATE Students SET  Avatar=?,FirstName=?,LastName=?,Age=?,Phone=?,CountryID=?,ProvinceID=?,DistrictID=?,AddressDetail=?,Gender=?,LinkFacebook=?,StudentID=?,Unit=? where email=?";
            PreparedStatement st;
            st = connection.prepareStatement(sql);
            st.setString(1, avatar);
            st.setString(2, student.getFirstName());
            st.setString(3, student.getLastName());
            st.setInt(4, student.getAge());
            st.setString(5, student.getPhone());
            st.setInt(6, student.getCountryID());
            st.setInt(7, student.getProvinceID());
            st.setInt(8, student.getDistrictID());
            st.setString(9, student.getAddress());
            st.setBoolean(10, gender);
            st.setString(11, student.getLinkFb());
            st.setString(12, student.getStudentID());
            st.setString(13, student.getUnit());
            st.setString(14, student.getEmail());
            st.executeUpdate();
            st.close();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean updateStudentProfileNoPro(String avatar, String firstName, String lastName, String age, String phone, String countryId, String provinceId, String districtId, String addressDetail, String gender, String linkFaceBook, String studentId, String unit, String email) {
        try {
            String sql = "UPDATE Students SET  Avatar=?,FirstName=?,LastName=?,Age=?,Phone=?,CountryID=?,ProvinceID=?,DistrictID=?,AddressDetail=?,Gender=?,LinkFacebook=?,StudentID=?,Unit=? where email=?";
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
            st.setString(10, gender);
            st.setString(11, linkFaceBook);
            st.setString(12, studentId);
            st.setString(13, unit);
            st.setString(14, email);
            st.executeUpdate();
            st.close();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

//    public static void main(String[] args) {
//        Student s=new Student();
//        StudentDAO sdb=new StudentDAO();
//        s=sdb.getStudentByEmail("nguyenmyhoa120920@gmail.com");
//        System.out.println(s.getEmail());
//    }
}
