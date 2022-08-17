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
import model.Club;
import model.Event;
import model.Student;

/**
 *
 * @author win
 */
public class ClubDAO extends DBContext {

    public ArrayList<Club> getListClubsPagging(int index) {
        ArrayList<Club> listClub = new ArrayList<>();
        String sql = "SELECT * FROM [dbo].[Clubs] \n"
                + "ORDER BY ClubID OFFSET ? ROWS FETCH NEXT 5 ROWS ONLY;";
        PreparedStatement st;
        try {
            st = connection.prepareStatement(sql);
            st.setInt(1, (index - 1) * 5);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                listClub.add(new Club(rs.getInt("ClubID"), rs.getString("Avatar"), rs.getString("ClubName"), rs.getString("ClubPresident"), rs.getString("Facebook"), rs.getString("Email"), rs.getString("Description")));

            }
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return listClub;

    }

    public ArrayList<Club> getListClubs() {
        ArrayList<Club> listClub = new ArrayList<>();
        String sql = "SELECT * FROM [dbo].[Clubs] ";
        PreparedStatement st;
        try {
            st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                listClub.add(new Club(rs.getInt("ClubID"), rs.getString("Avatar"), rs.getString("ClubName"), rs.getString("ClubPresident"), rs.getString("Facebook"), rs.getString("Email"), rs.getString("Description")));

            }
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return listClub;

    }

    public ArrayList<Club> getListClubsByCategories(int type) {
        ArrayList<Club> listClub = new ArrayList<>();
        String sql = "SELECT * FROM [dbo].[Clubs] WHERE [Type] = " + type + "";
        PreparedStatement st;
        try {
            st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                listClub.add(new Club(rs.getInt("ClubID"), rs.getString("Avatar"), rs.getString("ClubName"), rs.getString("ClubPresident"), rs.getString("Facebook"), rs.getString("Email"), rs.getString("Description")));

            }
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return listClub;

    }

    public ArrayList<Club> getListClubsByCategoriesPagging(int type, int index) {
        ArrayList<Club> listClub = new ArrayList<>();
        String sql = "SELECT * FROM [dbo].[Clubs] WHERE [Type] = " + type + " ORDER BY ClubID OFFSET ? ROWS FETCH NEXT 5 ROWS ONLY;";
        PreparedStatement st;
        try {
            st = connection.prepareStatement(sql);
            st.setInt(1, (index - 1) * 5);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                listClub.add(new Club(rs.getInt("ClubID"), rs.getString("Avatar"), rs.getString("ClubName"), rs.getString("ClubPresident"), rs.getString("Facebook"), rs.getString("Email"), rs.getString("Description")));

            }
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return listClub;

    }

    public Club getClubByID(int id) {
        Club club = new Club();
        String sql = "select * from Clubs where ClubID = ?";
        PreparedStatement st;
        try {
            st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                club.setClubID(rs.getInt("ClubID"));
                club.setAvatar(rs.getString("Avatar"));
                club.setClubName(rs.getString("ClubName"));
                club.setClubPresident(rs.getString("ClubPresident"));
                club.setFacebook(rs.getString("Facebook"));
                club.setEmail(rs.getString("Email"));
                club.setDes(rs.getString("Description"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return club;
    }

    public ArrayList getClubByTextPagging(String key, int index) {
        ArrayList<Club> clubs = new ArrayList<>();
        String sql = "select * from Clubs where ClubName like N'%" + key + "%' or Description like N'%" + key + "%' ORDER BY ClubID OFFSET ? ROWS FETCH NEXT 5 ROWS ONLY;";
        PreparedStatement st;
        try {
            st = connection.prepareStatement(sql);
            st.setInt(1, (index - 1) * 5);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                clubs.add(new Club(rs.getInt("ClubID"), rs.getString("Avatar"), rs.getString("ClubName"), rs.getString("ClubPresident"), rs.getString("Facebook"), rs.getString("Email"), rs.getString("Description")));
            }
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return clubs;
    }

    public ArrayList getClubByText(String key) {
        ArrayList<Club> clubs = new ArrayList<>();
        String sql = "select * from Clubs where ClubName like N'%" + key + "%' or Description like N'%" + key + "%'";
        PreparedStatement st;
        try {
            st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                clubs.add(new Club(rs.getInt("ClubID"), rs.getString("Avatar"), rs.getString("ClubName"), rs.getString("ClubPresident"), rs.getString("Facebook"), rs.getString("Email"), rs.getString("Description")));
            }
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return clubs;
    }

    public int getTotalPage(ArrayList<Club> clubs) {
        clubs = getListClubs();
        int totalPage = clubs.size() / 5;
        if (clubs.size() % 5 != 0) {
            totalPage++;
        }
        return totalPage;
    }

    public int getTotalPageCategory(ArrayList<Club> clubs, int type) {
        clubs = getListClubsByCategories(type);
        int totalPage = clubs.size() / 5;
        if (clubs.size() % 5 != 0) {
            totalPage++;
        }
        return totalPage;
    }

    public int getTotalPageByText(ArrayList<Club> clubs, String key) {
        clubs = getClubByText(key);
        int totalPage = clubs.size() / 5;
        if (clubs.size() % 5 != 0) {
            totalPage++;
        }
        return totalPage;
    }

    public int getTotalPageByTextType(ArrayList<Club> clubs, String key, int type) {
        clubs = getClubByTextAndCategories(key, type);
        int totalPage = clubs.size() / 5;
        if (clubs.size() % 5 != 0) {
            totalPage++;
        }
        return totalPage;
    }

    public ArrayList getClubByTextAndCategories(String key, int type) {
        ArrayList<Club> clubs = new ArrayList<>();
        String sql = "select * from Clubs where (ClubName like N'%" + key + "%' or Description like N'%" + key + "%') and [Type] = " + type + "";
        PreparedStatement st;
        try {
            st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                clubs.add(new Club(rs.getInt("ClubID"), rs.getString("Avatar"), rs.getString("ClubName"), rs.getString("ClubPresident"), rs.getString("Facebook"), rs.getString("Email"), rs.getString("Description")));
            }
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return clubs;
    }

    public ArrayList getClubByTextAndCategoriesPagging(String key, int type, int index) {
        ArrayList<Club> clubs = new ArrayList<>();
        String sql = "select * from Clubs where (ClubName like N'%" + key + "%' or Description like N'%" + key + "%') and [Type] = " + type + ""
                + "ORDER BY ClubID OFFSET ? ROWS FETCH NEXT 5 ROWS ONLY;";
        PreparedStatement st;
        try {
            st = connection.prepareStatement(sql);
            st.setInt(1, (index - 1) * 5);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                clubs.add(new Club(rs.getInt("ClubID"), rs.getString("Avatar"), rs.getString("ClubName"), rs.getString("ClubPresident"), rs.getString("Facebook"), rs.getString("Email"), rs.getString("Description")));
            }
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return clubs;
    }

    public Club getClubByEmail(String email) {
        Club club = new Club();
        String sql = "select * from Clubs where Email = ?";
        PreparedStatement st;
        try {
            st = connection.prepareStatement(sql);
            st.setString(1, email);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                club.setClubID(rs.getInt("ClubID"));
                club.setAvatar(rs.getString("Avatar"));
                club.setClubName(rs.getString("ClubName"));
                club.setClubPresident(rs.getString("ClubPresident"));
                club.setFacebook(rs.getString("Facebook"));
                club.setEmail(rs.getString("Email"));
                club.setDes(rs.getString("Description"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return club;
    }

    public int getClubIDByEmail(String email) {
        int id = 0;
        String sql = "SELECT [ClubID]\n"
                + "     \n"
                + "  FROM [FCS].[dbo].[Clubs] where email = ?";
        PreparedStatement st;
        try {
            st = connection.prepareStatement(sql);
            st.setString(1, email);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                id = rs.getInt(1);
            }
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return id;
    }

    public String getAvatarByUsername(String username) {
        try {
            String sql = "select Avatar\n"
                    + "from Clubs\n"
                    + "where Email=?";
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

    public ArrayList<Event> getEvent(int id) {
        ArrayList<Event> list = new ArrayList<>();
        String sql = "select * from EventOfClub where ClubID = ?";
        PreparedStatement st;
        try {
            st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Event(rs.getInt("EventID"), rs.getInt("ClubID"), rs.getString("EventName"), rs.getString("Time"), rs.getString("Description"), rs.getString("Url1")));
            }
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public ArrayList<Event> getEventByEmail(String id) {
        ArrayList<Event> list = new ArrayList<>();
        String sql = "  select * from EventOfClub e join Clubs c on e.ClubID = c.ClubID where  c.Email = ?";
        PreparedStatement st;
        try {
            st = connection.prepareStatement(sql);
            st.setString(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Event(rs.getInt("EventID"), rs.getInt("ClubID"), rs.getString("EventName"), rs.getString("Time"), rs.getString("Description"), rs.getString("Url1")));
            }
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public Event getEventByID(int id) {
        Event event = new Event();
        String sql = "SELECT * FROM [dbo].[EventOfClub] WHERE EventID = " + id + "";
        PreparedStatement st;
        try {
            st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                event.setEventID(rs.getInt(1));
                event.setClubID(rs.getInt(2));
                event.setEventName(rs.getString(3));
                event.setTime(rs.getString(4));
                event.setDes(rs.getString(5));
                event.setUrl(rs.getString(6));
            }
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return event;
    }

    public int getEventIDByName(String name) {
        int id = 0;
        String sql = "SELECT EventID FROM [dbo].[EventOfClub] WHERE EventName = N'" + name + "'";
        PreparedStatement st;
        try {
            st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                id = rs.getInt(1);
            }
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return id;
    }

    public void updateEvent(Event e, int id) {
        try {

            String sql = "UPDATE [dbo].[EventOfClub]\n"
                    + "   SET [EventName] =?\n"
                    + "      ,[Time] = ?\n"
                    + "      ,[Description] = ?\n"
                    + "      ,[Url1] = ?\n"
                    + " WHERE EventID = " + id + "";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, e.getEventName());
            statement.setString(2, e.getTime());
            statement.setString(3, e.getDes());
            statement.setString(4, e.getUrl());
            statement.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(HostelDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public String getImgByEventName(String name) {
        String img = null;
        String sql = "SELECT [Url1]\n"
                + "     \n"
                + "  FROM EventOfClub where EventName = ?";
        PreparedStatement st;
        try {
            st = connection.prepareStatement(sql);
            st.setString(1, name);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                img = rs.getString(1);
            }
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return img;
    }

    public static void main(String[] args) {
        ClubDAO club = new ClubDAO();
        Event e = club.getEventByID(2);
        System.out.println(e.getEventName());
    }

    public boolean updateClubProfile(String avatar, Club club) {

        try {
            String sql = "UPDATE Clubs SET  Avatar=?,ClubName=?,ClubPresident=?,Facebook=?,Description=? where email=?";
            PreparedStatement st;
            st = connection.prepareStatement(sql);
            st.setString(1, avatar);
            st.setString(2, club.getClubName());
            st.setString(3, club.getClubPresident());
            st.setString(4, club.getFacebook());
            st.setString(5, club.getDes());
            st.setString(6, club.getEmail());
            st.executeUpdate();
            st.close();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public void addEvent(Event e) {
        try {
            String sql = "INSERT INTO [dbo].[EventOfClub]\n"
                    + "           ([ClubID]\n"
                    + "           ,[EventName]\n"
                    + "           ,[Time]\n"
                    + "           ,[Description]\n"
                    + "           ,[Url1])\n"
                    + "     VALUES\n"
                    + "           (?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?)";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, e.getClubID());
            statement.setString(2, e.getEventName());
            statement.setString(3, e.getTime());
            statement.setString(4, e.getDes());
            statement.setString(5, e.getUrl());
            statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ClubDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void deleteEvent(int eventID) {

        try {

            String sql = "DELETE FROM [EventOfClub] WHERE EventID =?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, eventID);
            statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(HostelDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

}
