/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import java.util.logging.Level;
import java.util.logging.Logger;
import model.Department;
import model.StarVoting;

/**
 *
 * @author nguye
 */
public class StarDAO extends DBContext {

    public void addStarVoting(StarVoting s) {
        try {
            String sql = "INSERT INTO [dbo].[StarVotingHostel]\n"
                    + "           ([StudentNo]\n"
                    + "           ,[HostelID]\n"
                    + "           ,[StarVoting]\n"
                    + "           ,[Comment]\n"
                    + "           ,[Date])\n"
                    + "     VALUES\n"
                    + "           (?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,GETDATE())";

            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, s.getStudentNo());
            statement.setInt(2, s.getHostelID());
            statement.setInt(3, s.getStarvoting());
            statement.setString(4, s.getMessage());
            statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(StarDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void addStarVotingRestaurant(StarVoting s) {
        try {
            String sql = "INSERT INTO [dbo].[StarVotingRestaurant]\n"
                    + "           ([StudentNo]\n"
                    + "           ,[RestaurantID]\n"
                    + "           ,[StarVoting]\n"
                    + "           ,[Comment]\n"
                    + "           ,[Date])\n"
                    + "     VALUES\n"
                    + "           (?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,GETDATE())";

            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, s.getStudentNo());
            statement.setInt(2, s.getRestaurantID());
            statement.setInt(3, s.getStarvoting());
            statement.setString(4, s.getMessage());
            statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(StarDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void updateStarVoting(int id, int star, String comment) {
        try {
            String sql = "UPDATE [dbo].[StarVotingHostel]\n"
                    + "   SET [StarVoting] = ?\n"
                    + "      ,[Comment] = ?\n"
                    + "      ,[Date] = GetDate()\n"
                    + " WHERE ID = ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, star);
            statement.setString(2, comment);
            statement.setInt(3, id);

            statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(StarDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void updateStarVotingRestaurant(int id, int star, String comment) {
        try {
            String sql = "UPDATE [dbo].[StarVotingRestaurant]\n"
                    + "   SET [StarVoting] = ?\n"
                    + "      ,[Comment] = ?\n"
                    + "      ,[Date] = GetDate()\n"
                    + " WHERE ID = ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, star);
            statement.setString(2, comment);
            statement.setInt(3, id);

            statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(StarDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public ArrayList<StarVoting> getListCommentByHostel(int hostelID) {
        ArrayList<StarVoting> star = new ArrayList<>();
        try {

            String sql = "select svh.ID, svh.Comment, svh.[Date], svh.StarVoting, s.FirstName+' '+s.LastName as studentName ,s.Avatar\n"
                    + "from StarVotingHostel svh join Students s on s.StudentNo = svh.StudentNo where hostelID= ? order by [Date] desc  ";
            PreparedStatement st;

            st = connection.prepareStatement(sql);
            st.setInt(1, hostelID);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                star.add(new StarVoting(rs.getInt(1), rs.getString(5), rs.getTimestamp(3), rs.getString(2), rs.getInt(4), rs.getString(6)));
            }

        } catch (SQLException ex) {
            Logger.getLogger(StarDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return star;

    }

    public ArrayList<StarVoting> getListCommentByRestaurant(int resID) {
        ArrayList<StarVoting> star = new ArrayList<>();
        try {

            String sql = "select svh.ID, svh.Comment, svh.[Date], svh.StarVoting, s.FirstName+' '+s.LastName as studentName ,s.Avatar\n"
                    + "from StarVotingRestaurant svh join Students s on s.StudentNo = svh.StudentNo where RestaurantID= ? order by [Date] desc  ";
            PreparedStatement st;

            st = connection.prepareStatement(sql);
            st.setInt(1, resID);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                star.add(new StarVoting(rs.getInt(1), rs.getString(5), rs.getTimestamp(3), rs.getString(2), rs.getInt(4), rs.getString(6)));
            }

        } catch (SQLException ex) {
            Logger.getLogger(StarDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return star;

    }

    public StarVoting getCommentofStudent(int hostelID, int studentNo) {

        try {

            String sql = "select svh.ID, svh.Comment, svh.[Date], svh.StarVoting, s.FirstName+' '+s.LastName as studentName ,s.Avatar\n"
                    + "from StarVotingHostel svh join Students s on s.StudentNo = svh.StudentNo where hostelID= ? and s.StudentNo = ?	 order by [Date] desc ";
            PreparedStatement st;

            st = connection.prepareStatement(sql);
            st.setInt(1, hostelID);
            st.setInt(2, studentNo);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return new StarVoting(rs.getInt(1), rs.getString(5), rs.getTimestamp(3), rs.getString(2), rs.getInt(4), rs.getString(6));
            }

        } catch (SQLException ex) {
            Logger.getLogger(StarDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;

    }

    public StarVoting getCommentRestaurantOfStudent(int resID, int studentNo) {

        try {

            String sql = "select svh.ID, svh.Comment, svh.[Date], svh.StarVoting, s.FirstName+' '+s.LastName as studentName ,s.Avatar\n"
                    + "from StarVotingRestaurant svh join Students s on s.StudentNo = svh.StudentNo where RestaurantID= ? and s.StudentNo = ?	 order by [Date] desc ";
            PreparedStatement st;

            st = connection.prepareStatement(sql);
            st.setInt(1, resID);
            st.setInt(2, studentNo);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return new StarVoting(rs.getInt(1), rs.getString(5), rs.getTimestamp(3), rs.getString(2), rs.getInt(4), rs.getString(6));
            }

        } catch (SQLException ex) {
            Logger.getLogger(StarDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;

    }

    public List<StarVoting> pagingCommentHostel(int hostelID, int index) {
        List<StarVoting> star = new ArrayList<>();
        String sql = "select svh.ID, svh.Comment, svh.[Date], svh.StarVoting, s.FirstName+' '+s.LastName as studentName ,s.Avatar\n"
                + "from StarVotingHostel svh join Students s on s.StudentNo = svh.StudentNo\n"
                + "				where HostelID =?\n"
                + "                ORDER BY Date desc\n"
                + "				\n"
                + "                OFFSET ? ROWS FETCH NEXT 5 ROWS ONLY  ";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, hostelID);
            ps.setInt(2, (index - 1) * 5);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                star.add(new StarVoting(rs.getInt(1), rs.getString(5), rs.getTimestamp(3), rs.getString(2), rs.getInt(4), rs.getString(6)));
            }
        } catch (SQLException ex) {
            Logger.getLogger(StarDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return star;
    }

    public List<StarVoting> pagingCommentRestaurant(int resID, int index) {
        List<StarVoting> star = new ArrayList<>();
        String sql = "select svh.ID, svh.Comment, svh.[Date], svh.StarVoting, s.FirstName+' '+s.LastName as studentName ,s.Avatar\n"
                + "from StarVotingRestaurant svh join Students s on s.StudentNo = svh.StudentNo\n"
                + "				where RestaurantID =?\n"
                + "                ORDER BY Date desc\n"
                + "				\n"
                + "                OFFSET ? ROWS FETCH NEXT 5 ROWS ONLY  ";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, resID);
            ps.setInt(2, (index - 1) * 5);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                star.add(new StarVoting(rs.getInt(1), rs.getString(5), rs.getTimestamp(3), rs.getString(2), rs.getInt(4), rs.getString(6)));
            }
        } catch (SQLException ex) {
            Logger.getLogger(StarDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return star;
    }

    public int getTotalComment(int hostelID) {
        String sql = "select count(*) from StarVotingHostel where HostelID =?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, hostelID);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException ex) {
            Logger.getLogger(StarDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return 0;
    }

    public int getTotalCommentRestaurant(int resID) {
        String sql = "select count(*) from StarVotingRestaurant where RestaurantID =?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, resID);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException ex) {
            Logger.getLogger(StarDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return 0;
    }

    public void deleteVoteHostel(int hostelID) {

        try {

            String sql = "DELETE FROM [dbo].[StarVotingHostel]\n"
                    + "      WHERE HostelID=?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, hostelID);
            statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(StarDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

    }
    
      public void deleteVoteRestaurant(int resID) {

        try {

            String sql = "DELETE FROM [dbo].[StarVotingRestaurant]\n"
                    + "      WHERE RestaurantID=?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, resID);
            statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(StarDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    public static void main(String[] args) {
//        long millis = System.currentTimeMillis();
//        java.sql.Date date = new java.sql.Date(millis);
//        System.out.println(date);

//        DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
//        Date date = new Date(); 
//         DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
//        
//        long millis = System.currentTimeMillis();
//        java.sql.Date date = new java.sql.Date(millis);
//        
//        Date date1 = Date.valueOf(dateFormat.format(date));
//        System.out.println(dateFormat.format(date));
//        java.util.Date utilDate = new java.util.Date();
//        java.sql.Date sqlDate = new java.sql.Date(utilDate.getTime());
//        System.out.println("utilDate:" + utilDate);
//        System.out.println("sqlDate:" + sqlDate);
//        StarDAO dao = new StarDAO();
//        ArrayList<StarVoting> s = dao.getListCommentByHostel(76);
//
//        System.out.println(s.get(0).getDate());

    }
}
