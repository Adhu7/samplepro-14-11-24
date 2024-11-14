/*
 * package bean;
 * 
 * public class ArtistCategoryBean { private int categoryId; private String
 * categoryName;
 * 
 * // Default constructor public ArtistCategoryBean() {}
 * 
 * // Constructor with parameters public ArtistCategoryBean(int categoryId,
 * String categoryName) { this.categoryId = categoryId; this.categoryName =
 * categoryName; }
 * 
 * // Getter and Setter for categoryId public int getCategoryId() { return
 * categoryId; }
 * 
 * public void setCategoryId(int categoryId) { this.categoryId = categoryId; }
 * 
 * // Getter and Setter for categoryName public String getCategoryName() {
 * return categoryName; }
 * 
 * public void setCategoryName(String categoryName) { this.categoryName =
 * categoryName; }
 * 
 * // Optional: toString method for better output format
 * 
 * @Override public String toString() { return "ArtistCategoryBean{" +
 * "categoryId=" + categoryId + ", categoryName='" + categoryName + '\'' + '}';
 * } }
 */

package bean;

import java.sql.Timestamp;

public class ArtistCategoryBean {
    private int categoryId;
    private String categoryName;
    private Timestamp createdAt;

    // Default constructor
    public ArtistCategoryBean() {}

    // Constructor with parameters
    public ArtistCategoryBean(int categoryId, String categoryName, Timestamp createdAt) {
        this.categoryId = categoryId;
        this.categoryName = categoryName;
        this.createdAt = createdAt;
    }

    // Getter and Setter for categoryId
    public int getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }

    // Getter and Setter for categoryName
    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }

    // Getter and Setter for createdAt
    public Timestamp getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Timestamp createdAt) {
        this.createdAt = createdAt;
    }

    // Optional: toString method for better output format
    @Override
    public String toString() {
        return "ArtistCategoryBean{" +
                "categoryId=" + categoryId +
                ", categoryName='" + categoryName + '\'' +
                ", createdAt=" + createdAt +
                '}';
    }
}
