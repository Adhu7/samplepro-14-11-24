package bean;

public class UserBean {
    private int userId;
    private String name;
    private String phone;
    private String email;
    private String password;
    private int isActive;  // Add isActive field

    // Default constructor
    public UserBean() {
        super();
    }

    // Constructor with all fields, including isActive
    public UserBean(int userId, String name, String phone, String email, String password, int isActive) {
        super();
        this.userId = userId;
        this.name = name;
        this.phone = phone;
        this.email = email;
        this.password = password;
        this.isActive = isActive;  // Initialize isActive
    }

    // Getters and setters for all fields, including isActive
    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getIsActive() {
        return isActive;
    }

    public void setIsActive(int isActive) {
        this.isActive = isActive;
    }

    // Override toString to include isActive
    @Override
    public String toString() {
        return "UserBean [userId=" + userId + ", name=" + name + ", phone=" + phone + ", email=" + email + 
               ", password=" + password + ", isActive=" + isActive + "]";
    }
}
