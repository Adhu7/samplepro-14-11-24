package dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import org.mindrot.jbcrypt.BCrypt;

import bean.UserBean;
import db.ArtDB;

public class UserDao {

    public void insertUsers(UserBean user) throws SQLException {
        String query = "INSERT INTO userreg(name, phone, email, password, isActive) VALUES(?,?,?,?,?)";
        try (Connection con = ArtDB.getConnection(); PreparedStatement pst = con.prepareStatement(query)) {
            pst.setString(1, user.getName());
            pst.setString(2, user.getPhone());
            pst.setString(3, user.getEmail());
            pst.setString(4, user.getPassword());
            pst.setInt(5, 1);  // Explicitly setting isActive to 1 (active)
            pst.executeUpdate();
        }
    }

    public boolean isEmailExists(String email) throws SQLException {
        String query = "SELECT * FROM userReg WHERE email=?";
        try (Connection con = ArtDB.getConnection(); PreparedStatement pst = con.prepareStatement(query)) {
            pst.setString(1, email);
            try (ResultSet rs = pst.executeQuery()) {
                return rs.next();  // Returns true if email exists
            }
        }
    }

    // Method to get a user by their email
    public UserBean getUserByEmail(String email) throws SQLException {
        String query = "SELECT * FROM userReg WHERE email = ?";
        try (Connection con = ArtDB.getConnection(); PreparedStatement pst = con.prepareStatement(query)) {
            pst.setString(1, email);  // Set the email parameter in the query
            try (ResultSet rs = pst.executeQuery()) {
                if (rs.next()) {
                    // If a user is found, return the UserBean with user details
                    return new UserBean(
                        rs.getInt("userId"), 
                        rs.getString("name"), 
                        rs.getString("phone"),
                        rs.getString("email"), 
                        rs.getString("password"), 
                        rs.getInt("isActive")  // Including isActive in the UserBean
                    );
                }
            }
        }
        return null;  // Return null if no user is found with the given email
    }

    // Method to get a user by email and password (with password hashing comparison)
    public UserBean getUserByEmailAndPassword(String email, String password) throws SQLException {
        String query = "SELECT * FROM userReg WHERE email = ?";
        try (Connection con = ArtDB.getConnection(); PreparedStatement pst = con.prepareStatement(query)) {
            pst.setString(1, email);
            try (ResultSet rs = pst.executeQuery()) {
                if (rs.next()) {
                    String storedHash = rs.getString("password");  // Retrieve hashed password from the database
                    // Compare the provided password with the stored hash
                    if (BCrypt.checkpw(password, storedHash)) {
                        return new UserBean(
                            rs.getInt("userId"), 
                            rs.getString("name"), 
                            rs.getString("phone"), 
                            rs.getString("email"),
                            storedHash,
                            rs.getInt("isActive")  // Include isActive in the result
                        );
                    }
                }
            }
        }
        return null;
    }

    // Get user by userId
    public UserBean getUsers(int userId) throws SQLException {
        String query = "SELECT * FROM userReg WHERE userId= ?";
        try (Connection con = ArtDB.getConnection(); PreparedStatement pst = con.prepareStatement(query)) {
            pst.setInt(1, userId);
            ResultSet rs = pst.executeQuery();
            if (rs.next()) {
                return new UserBean(
                    rs.getInt("userId"), 
                    rs.getString("name"), 
                    rs.getString("phone"),
                    rs.getString("email"), 
                    rs.getString("password"),
                    rs.getInt("isActive")  // Including isActive
                );
            }
        }
        return null;
    }

    // Update user information
    public void updateUsers(UserBean user) throws SQLException {
        String query = "UPDATE userReg SET name= ?, phone= ?, email= ?, password= ?, isActive= ? WHERE userId= ?";
        try (Connection con = ArtDB.getConnection(); PreparedStatement pst = con.prepareStatement(query)) {
            pst.setString(1, user.getName());
            pst.setString(2, user.getPhone());
            pst.setString(3, user.getEmail());
            pst.setString(4, user.getPassword());
            pst.setInt(5, user.getIsActive());  // Update isActive as well
            pst.setInt(6, user.getUserId());
            pst.executeUpdate();
        }
    }

    // Delete user by userId
    public void deleteUsers(int userId) throws SQLException {
        String query = "DELETE FROM userReg WHERE userId= ?";
        try (Connection con = ArtDB.getConnection(); PreparedStatement pst = con.prepareStatement(query)) {
            pst.setInt(1, userId);
            pst.executeUpdate();
        }
    }

    // Get all users
    public List<UserBean> getAllUsers() throws SQLException {
        List<UserBean> users = new ArrayList<>();
        String query = "SELECT * FROM userReg";  // Assuming the table has the 'isActive' field
        try (Connection con = ArtDB.getConnection();
             Statement st = con.createStatement();
             ResultSet rs = st.executeQuery(query)) {

            while (rs.next()) {
                // Include 'isActive' when creating the UserBean
                users.add(new UserBean(
                    rs.getInt("userId"), 
                    rs.getString("name"), 
                    rs.getString("phone"),
                    rs.getString("email"), 
                    rs.getString("password"),
                    rs.getInt("isActive")  // Get 'isActive' from the result set
                ));
            }
        }
        return users;
    }

    // Get the count of users
    public int getCountUser() throws SQLException {
        int totalUsers = 0;  // Variable to store the total count
        String countSql = "SELECT COUNT(*) FROM userReg";  // Query to get the count of users
        try (Connection conn = ArtDB.getConnection();
             PreparedStatement countStmt = conn.prepareStatement(countSql);
             ResultSet countRs = countStmt.executeQuery()) {

            if (countRs.next()) {
                totalUsers = countRs.getInt(1);  // Get the total count of users
            }
        }
        return totalUsers;  // Return the count
    }
    
    public void updateUserStatus(int userId, int status) throws SQLException {
        String query = "UPDATE userReg SET isActive = ? WHERE userId = ?";
        try (Connection con = ArtDB.getConnection(); PreparedStatement pst = con.prepareStatement(query)) {
            pst.setInt(1, status);  // Set the new status (1 for active, 0 for inactive)
            pst.setInt(2, userId);   // Set the userId to specify which user to update
            pst.executeUpdate();     // Execute the update query
        }
    }

}
