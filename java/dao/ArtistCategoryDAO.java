
package dao;
import bean.ArtistCategoryBean;
import db.ArtDB;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ArtistCategoryDAO {

    // Method to insert a new artist category
    public boolean addArtistCategory(ArtistCategoryBean category) {
        boolean result = false;
        String query = "INSERT INTO artist_category (categoryName) VALUES (?)";

        try (Connection conn = ArtDB.getConnection(); 
             PreparedStatement ps = conn.prepareStatement(query, Statement.RETURN_GENERATED_KEYS)) {

            ps.setString(1, category.getCategoryName());
            int rowsAffected = ps.executeUpdate();

            if (rowsAffected > 0) {
                result = true;
                try (ResultSet generatedKeys = ps.getGeneratedKeys()) {
                    if (generatedKeys.next()) {
                        category.setCategoryId(generatedKeys.getInt(1));
                        category.setCreatedAt(getCategoryCreatedAt(category.getCategoryId(), conn));
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return result;
    }

    // Retrieve createdAt for a specific category
    private Timestamp getCategoryCreatedAt(int categoryId, Connection conn) throws SQLException {
        String query = "SELECT createdAt FROM artist_category WHERE categoryId = ?";
        try (PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setInt(1, categoryId);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return rs.getTimestamp("createdAt");
                }
            }
        }
        return null;
    }

    // Method to get all artist categories
    public List<ArtistCategoryBean> getAllCategories() {
        List<ArtistCategoryBean> categories = new ArrayList<>();
        String query = "SELECT * FROM artist_category";

        try (Connection conn = ArtDB.getConnection();
             PreparedStatement ps = conn.prepareStatement(query);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                ArtistCategoryBean category = new ArtistCategoryBean();
                category.setCategoryId(rs.getInt("categoryId"));
                category.setCategoryName(rs.getString("categoryName"));
                category.setCreatedAt(rs.getTimestamp("createdAt"));
                categories.add(category);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return categories;
    }

    // Method to get a category by ID
    public ArtistCategoryBean getCategoryById(int categoryId) {
        ArtistCategoryBean category = null;
        String query = "SELECT * FROM artist_category WHERE categoryId = ?";

        try (Connection conn = ArtDB.getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {

            ps.setInt(1, categoryId);

            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    category = new ArtistCategoryBean();
                    category.setCategoryId(rs.getInt("categoryId"));
                    category.setCategoryName(rs.getString("categoryName"));
                    category.setCreatedAt(rs.getTimestamp("createdAt"));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return category;
    }

    // Method to update an artist category
	/*
	 * public boolean updateCategory(ArtistCategoryBean category) { boolean result =
	 * false; String query =
	 * "UPDATE artist_category SET categoryName = ? WHERE categoryId = ?";
	 * 
	 * try (Connection conn = ArtDB.getConnection(); PreparedStatement ps =
	 * conn.prepareStatement(query)) {
	 * 
	 * ps.setString(1, category.getCategoryName()); ps.setInt(2,
	 * category.getCategoryId());
	 * 
	 * int rowsAffected = ps.executeUpdate(); if (rowsAffected > 0) { result = true;
	 * } } catch (SQLException e) { e.printStackTrace(); }
	 * 
	 * return result; }
	 */
    
    public boolean updateCategory(ArtistCategoryBean category) {
        boolean result = false;
        String query = "UPDATE artist_category SET categoryName = ? WHERE categoryId = ?";

        try (Connection conn = ArtDB.getConnection(); 
             PreparedStatement ps = conn.prepareStatement(query)) {

            ps.setString(1, category.getCategoryName());
            ps.setInt(2, category.getCategoryId());

            int rowsAffected = ps.executeUpdate();
            if (rowsAffected > 0) {
                result = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return result;
    }


    // Method to delete an artist category
    public boolean deleteCategory(int categoryId) {
        boolean result = false;
        String query = "DELETE FROM artist_category WHERE categoryId = ?";

        try (Connection conn = ArtDB.getConnection(); 
             PreparedStatement ps = conn.prepareStatement(query)) {

            ps.setInt(1, categoryId);

            int rowsAffected = ps.executeUpdate();
            if (rowsAffected > 0) {
                result = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return result;
    }
}
