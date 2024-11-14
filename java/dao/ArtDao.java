package dao;
import java.sql.*;
import java.util.*;
import bean.ArtBean;
import db.ArtDB;
public class ArtDao {
	
	    // Insert new artwork into the database
	    public boolean addArtwork(ArtBean artwork) {
	        String query = "INSERT INTO artwork (artTitle, artistName, artGenre, artPrice, uploadeImage) VALUES (?, ?, ?, ?, ?)";
	        
	        try (Connection conn = ArtDB.getConnection(); 
	             PreparedStatement ps = conn.prepareStatement(query)) {
	            
	            ps.setString(1, artwork.getArtTitle());
	            ps.setString(2, artwork.getArtistName());
	            ps.setString(3, artwork.getArtGenre());
	            ps.setDouble(4, artwork.getArtPrice());
	            ps.setString(5, artwork.getUploadImage());
	            
	            int result = ps.executeUpdate();
	            return result > 0;  // If 1 or more rows affected, insert is successful
	        } catch (SQLException e) {
	            e.printStackTrace();
	            return false;
	        }
	    }
		

	    // Delete artwork from the database
	    public boolean deleteArtwork(int artID) {
	        String query = "DELETE FROM artwork WHERE artId = ?";
	        
	        try (Connection conn = ArtDB.getConnection(); 
	             PreparedStatement ps = conn.prepareStatement(query)) {
	            
	            ps.setInt(1, artID);
	            int result = ps.executeUpdate();
	            return result > 0;  // If 1 or more rows affected, delete is successful
	        } catch (SQLException e) {
	            e.printStackTrace();
	            return false;
	        }
	    }

	    // Select a single artwork by ID
	    public ArtBean getArtworkById(int artId) {
	        String query = "SELECT * FROM artwork WHERE artId = ?";
	        ArtBean artwork = null;
	        
	        try (Connection conn = ArtDB.getConnection(); 
	             PreparedStatement ps = conn.prepareStatement(query)) {
	            
	            ps.setInt(1, artId);
	            ResultSet rs = ps.executeQuery();
	            
	            if (rs.next()) {
	                artwork = new ArtBean();
	                artwork.setArtId(rs.getInt("artId"));
	                artwork.setArtTitle(rs.getString("artTitle"));
	                artwork.setArtistName(rs.getString("artistName"));
	                artwork.setArtGenre(rs.getString("artGenre"));
	                artwork.setArtPrice(rs.getDouble("artPrice"));
	                artwork.setUploadImage(rs.getString("uploadeImage"));
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	        
	        return artwork;  
	    }

	    public List<ArtBean> getAllArtworks() {
	        List<ArtBean> artworks = new ArrayList<>();
	        String query = "SELECT * FROM artwork";
	        
	        try (Connection conn = ArtDB.getConnection(); 
	             PreparedStatement ps = conn.prepareStatement(query);
	             ResultSet rs = ps.executeQuery()) {
	            
	            while (rs.next()) {
	                ArtBean artwork = new ArtBean();
	                artwork.setArtId(rs.getInt("artId"));
	                artwork.setArtTitle(rs.getString("artTitle"));
	                artwork.setArtistName(rs.getString("artistName"));
	                artwork.setArtGenre(rs.getString("artGenre"));
	                artwork.setArtPrice(rs.getDouble("artPrice"));
	                artwork.setUploadImage(rs.getString("uploadeImage"));
	                artworks.add(artwork);
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	        
	        return artworks;  
	    }
	    
	    public boolean updateArtPrice(int artId, double newPrice) {
	        String query = "UPDATE artwork SET artPrice = ? WHERE artId = ?";
	        try (Connection conn = ArtDB.getConnection();
	             PreparedStatement stmt = conn.prepareStatement(query)) {
	            stmt.setDouble(1, newPrice);
	            stmt.setInt(2, artId);
	            return stmt.executeUpdate() > 0;
	        } catch (SQLException e) {
	            e.printStackTrace();
	            return false;
	        }
	    }
	    
	    public int getCountArtwork() throws SQLException {
	        int totalArts = 0;  // Variable to store the total count
	        
	        String countSql = "SELECT COUNT(*) FROM artwork";  // Query to get the count of products
	        
	        try (Connection conn = ArtDB.getConnection();
	             PreparedStatement countStmt = conn.prepareStatement(countSql);
	             ResultSet countRs = countStmt.executeQuery()) {
	            
	            if (countRs.next()) {
	                totalArts = countRs.getInt(1);  // Get the total count of products
	            }
	            
	        }
	        return totalArts;  // Return the count
	    }

	    public boolean updateArtwork(int artId, String price, String newImagePath) {
	        Connection con = null;
	        PreparedStatement pstmt = null;
	        boolean isUpdated = false;

	        try {
	            con = ArtDB.getConnection();
	            String sql = "UPDATE artwork SET price = ?, upload_image = ? WHERE art_id = ?";
	            pstmt = con.prepareStatement(sql);
	            pstmt.setString(1, price);
	            pstmt.setString(2, newImagePath); // Update image path
	            pstmt.setInt(3, artId);

	            int rows = pstmt.executeUpdate();
	            isUpdated = rows > 0;

	        } catch (SQLException e) {
	            e.printStackTrace();
	        } finally {
	            try {
	                if (pstmt != null) pstmt.close();
	                if (con != null) con.close();
	            } catch (SQLException e) {
	                e.printStackTrace();
	            }
	        }
	        return isUpdated;
	    }

	    public boolean updateArtwork(int artId, String artTitle, String artPrice, String newImagePath) {
	        String query = "UPDATE artwork SET artTitle = ?, artPrice = ?, uploadeImage = ? WHERE artId = ?";
	        
	        try (Connection conn = ArtDB.getConnection(); 
	             PreparedStatement ps = conn.prepareStatement(query)) {
	            
	            ps.setString(1, artTitle);
	            ps.setString(2, artPrice);
	            ps.setString(3, newImagePath);  // Update the image path if provided
	            ps.setInt(4, artId);
	            
	            int result = ps.executeUpdate();
	            return result > 0;  // If 1 or more rows affected, update is successful
	        } catch (SQLException e) {
	            e.printStackTrace();
	            return false;
	        }
	    }
	}


