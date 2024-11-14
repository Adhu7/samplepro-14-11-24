package dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import bean.ArtistBean;

import db.ArtDB;
public class ArtistDao {
	public void insertUsers(ArtistBean user) throws SQLException {
		String query = "INSERT INTO artist(name, genre, email, phn) VALUES(?,?,?,?)";
		try (Connection con = ArtDB.getConnection(); PreparedStatement pst = con.prepareStatement(query)) {
			pst.setString(1, user.getName());
			pst.setString(2, user.getGenre());
			pst.setString(3, user.getEmail());
			pst.setString(4, user.getPhn());
			pst.executeUpdate();
		}
	}
	public ArtistBean getUsers(int artistId) throws SQLException {
		String query = "SELECT * FROM artist WHERE artistId= ?";
		try (Connection con = ArtDB.getConnection(); PreparedStatement pst = con.prepareStatement(query)) {
			pst.setInt(1, artistId);
			ResultSet rs = pst.executeQuery();
			if (rs.next()) {
				return new ArtistBean(rs.getInt("artistId"), rs.getString("name"), rs.getString("genre"),
						rs.getString("email"), rs.getString("phn"));

			}
		}
		return null;
	}

	public void updateUsers(ArtistBean artist) throws SQLException {
	    String query = "UPDATE artist SET genre = ?, email = ?, phn = ? WHERE artistId = ?";
	    try (Connection con = ArtDB.getConnection(); PreparedStatement pst = con.prepareStatement(query)) {
	        pst.setString(1, artist.getGenre());
	        pst.setString(2, artist.getEmail());
	        pst.setString(3, artist.getPhn());
	        pst.setInt(4, artist.getArtistId());
	        pst.executeUpdate();
	    }
	}
	
	public boolean updateArtist(ArtistBean artist) throws SQLException {
	    String query = "UPDATE artist SET name = ?, genre = ?, email = ?, phn = ? WHERE artistId = ?";
	    try (Connection con = ArtDB.getConnection(); PreparedStatement pst = con.prepareStatement(query)) {
	        pst.setString(1, artist.getName());
	        pst.setString(2, artist.getGenre());
	        pst.setString(3, artist.getEmail());
	        pst.setString(4, artist.getPhn());
	        pst.setInt(5, artist.getArtistId());

	        int rowsUpdated = pst.executeUpdate();
	        return rowsUpdated > 0;  // Returns true if at least one row was updated
	    }
	}


	public void deleteUsers(int artistId) throws SQLException {
		String query = "DELETE FROM artist WHERE artistId= ?";
		try (Connection con = ArtDB.getConnection(); PreparedStatement pst = con.prepareStatement(query)) {
			pst.setInt(1, artistId);
			pst.executeUpdate();
		}
	}
	
	
	public List<ArtistBean> getAllUsers() throws SQLException {
        List<ArtistBean> artists = new ArrayList<>();
        String query = "SELECT * FROM artist";  // Replace 'artist' with your actual table name

        try (Connection con = ArtDB.getConnection();
             PreparedStatement pst = con.prepareStatement(query);
             ResultSet rs = pst.executeQuery()) {

            while (rs.next()) {
                ArtistBean artist = new ArtistBean(
                    rs.getInt("artistId"),
                    rs.getString("name"),
                    rs.getString("genre"),
                    rs.getString("email"),
                    rs.getString("phn")
                );
                artists.add(artist);
            }
        }
        return artists;
    }
	
	  //getArtistNameById Method
    public String getArtistNameById(int artistId) {
        String query = "SELECT name FROM artist WHERE artistId = ?";
        try (Connection conn = ArtDB.getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {
            
            ps.setInt(1, artistId);
            ResultSet rs = ps.executeQuery();
            
            if (rs.next()) {
                return rs.getString("name"); // Return the artist name
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null; // Return null if artist is not found or in case of an error
    }
    
    //get all artist list
    public List<String> getAllArtistNames() {
        List<String> artistNames = new ArrayList<>();
        String query = "SELECT name FROM artist";
        
        try (Connection conn = ArtDB.getConnection();
             PreparedStatement ps = conn.prepareStatement(query);
             ResultSet rs = ps.executeQuery()) {
            
            while (rs.next()) {
                artistNames.add(rs.getString("name"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return artistNames;
    }

    public int getCountArtist() throws SQLException {
        int totalArtists = 0;  // Variable to store the total count
        
        String countSql = "SELECT COUNT(*) FROM artist";  // Query to get the count of products
        
        try (Connection conn = ArtDB.getConnection();
             PreparedStatement countStmt = conn.prepareStatement(countSql);
             ResultSet countRs = countStmt.executeQuery()) {
            
            if (countRs.next()) {
            	totalArtists = countRs.getInt(1);  // Get the total count of products
            }
            
        }
        return totalArtists;  // Return the count
    }


}
