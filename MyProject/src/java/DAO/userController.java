/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 * UserController - JDBC Database Connection
 * @author MSI
 */
public class userController {
    
    // =================== DATABASE CONFIGURATION ===================
    private static final String JDBC_DRIVER = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
    private static final String DB_URL = "jdbc:sqlserver://localhost:1433;databaseName=Management;encrypt=false;trustServerCertificate=true";
    private static final String DB_USER = "sa";
    private static final String DB_PASSWORD = "123";
    
    // =================== JDBC CONNECTION METHOD ===================
    /**
     * Tạo kết nối JDBC đến SQL Server
     */
    private Connection getConnection() throws SQLException {
        try {
            // Load JDBC driver
            Class.forName(JDBC_DRIVER);
            
            // Establish connection
            Connection connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
            System.out.println("JDBC Connection established successfully");
            return connection;
            
        } catch (ClassNotFoundException e) {
            throw new SQLException("JDBC Driver not found: " + e.getMessage(), e);
        }
    }
    
    // =================== USER AUTHENTICATION ===================
    /**
     * Xác thực đăng nhập user
     */
    public User authenticateUser(String username, String password) {
        String sql = "SELECT * FROM Users WHERE Username = ? AND Password = ? AND IsActive = 1";
        
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setString(1, username);
            pstmt.setString(2, password);
            
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    User user = mapResultSetToUser(rs);
                    
                    // Update last login
                    updateLastLogin(user.getId());
                    
                    System.out.println("User authenticated successfully: " + username);
                    return user;
                }
            }
            
        } catch (SQLException e) {
            System.err.println("Authentication error: " + e.getMessage());
            e.printStackTrace();
        }
        
        return null;
    }
    
    // =================== CREATE USER ===================
    /**
     * Tạo user mới
     */
    public boolean createUser(String username, String password, String role) {
        String sql = "INSERT INTO Users (Username, Password, Role, IsActive, CreatedDate) VALUES (?, ?, ?, 1, GETDATE())";
        
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            
            pstmt.setString(1, username);
            pstmt.setString(2, password);
            pstmt.setString(3, role);
            
            int rowsAffected = pstmt.executeUpdate();
            
            if (rowsAffected > 0) {
                try (ResultSet generatedKeys = pstmt.getGeneratedKeys()) {
                    if (generatedKeys.next()) {
                        int newUserId = generatedKeys.getInt(1);
                        System.out.println("User created successfully with ID: " + newUserId);
                        return true;
                    }
                }
            }
            
        } catch (SQLException e) {
            System.err.println("Create user error: " + e.getMessage());
            e.printStackTrace();
        }
        
        return false;
    }
    
    /**
     * Tạo user mới từ User object
     */
    public boolean createUser(User user) {
        return createUser(user.getUsername(), user.getPassword(), user.getRole());
    }
    
    // =================== READ USER BY ID ===================
    /**
     * Tìm user theo ID
     */
    public User getUserById(int userId) {
        String sql = "SELECT * FROM Users WHERE ID = ?";
        
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setInt(1, userId);
            
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    return mapResultSetToUser(rs);
                }
            }
            
        } catch (SQLException e) {
            System.err.println("Get user by ID error: " + e.getMessage());
            e.printStackTrace();
        }
        
        return null;
    }
    
    // =================== READ USER BY USERNAME ===================
    /**
     * Tìm user theo username
     */
    public User getUserByUsername(String username) {
        String sql = "SELECT * FROM Users WHERE Username = ?";
        
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setString(1, username);
            
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    return mapResultSetToUser(rs);
                }
            }
            
        } catch (SQLException e) {
            System.err.println("Get user by username error: " + e.getMessage());
            e.printStackTrace();
        }
        
        return null;
    }
    
    // =================== GET ALL USERS ===================
    /**
     * Lấy tất cả users
     */
    public List<User> getAllUsers() {
        List<User> users = new ArrayList<>();
        String sql = "SELECT * FROM Users ORDER BY CreatedDate DESC";
        
        try (Connection conn = getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {
            
            while (rs.next()) {
                users.add(mapResultSetToUser(rs));
            }
            
        } catch (SQLException e) {
            System.err.println("Get all users error: " + e.getMessage());
            e.printStackTrace();
        }
        
        return users;
    }
    
    // =================== GET USERS BY ROLE ===================
    /**
     * Lấy users theo role
     */
    public List<User> getUsersByRole(String role) {
        List<User> users = new ArrayList<>();
        String sql = "SELECT * FROM Users WHERE Role = ? AND IsActive = 1 ORDER BY Username";
        
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setString(1, role);
            
            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    users.add(mapResultSetToUser(rs));
                }
            }
            
        } catch (SQLException e) {
            System.err.println("Get users by role error: " + e.getMessage());
            e.printStackTrace();
        }
        
        return users;
    }
    
    // =================== UPDATE USER ===================
    /**
     * Cập nhật thông tin user
     */
    public boolean updateUser(int userId, String username, String password, String role) {
        String sql = "UPDATE Users SET Username = ?, Password = ?, Role = ? WHERE ID = ?";
        
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setString(1, username);
            pstmt.setString(2, password);
            pstmt.setString(3, role);
            pstmt.setInt(4, userId);
            
            int rowsAffected = pstmt.executeUpdate();
            
            if (rowsAffected > 0) {
                System.out.println("User updated successfully: " + username);
                return true;
            }
            
        } catch (SQLException e) {
            System.err.println("Update user error: " + e.getMessage());
            e.printStackTrace();
        }
        
        return false;
    }
    
    /**
     * Cập nhật user từ User object
     */
    public boolean updateUser(User user) {
        return updateUser(user.getId(), user.getUsername(), user.getPassword(), user.getRole());
    }
    
    // =================== DELETE USER ===================
    /**
     * Xóa user (soft delete - set IsActive = false)
     */
    public boolean deleteUser(int userId) {
        String sql = "UPDATE Users SET IsActive = 0 WHERE ID = ?";
        
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setInt(1, userId);
            
            int rowsAffected = pstmt.executeUpdate();
            
            if (rowsAffected > 0) {
                System.out.println("User deactivated successfully: ID " + userId);
                return true;
            }
            
        } catch (SQLException e) {
            System.err.println("Delete user error: " + e.getMessage());
            e.printStackTrace();
        }
        
        return false;
    }
    
    // =================== HARD DELETE USER ===================
    /**
     * Xóa user vĩnh viễn
     */
    public boolean hardDeleteUser(int userId) {
        String sql = "DELETE FROM Users WHERE ID = ?";
        
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setInt(1, userId);
            
            int rowsAffected = pstmt.executeUpdate();
            
            if (rowsAffected > 0) {
                System.out.println("User permanently deleted: ID " + userId);
                return true;
            }
            
        } catch (SQLException e) {
            System.err.println("Hard delete user error: " + e.getMessage());
            e.printStackTrace();
        }
        
        return false;
    }
    
    // =================== UPDATE LAST LOGIN ===================
    /**
     * Cập nhật thời gian đăng nhập cuối
     */
    private boolean updateLastLogin(int userId) {
        String sql = "UPDATE Users SET LastLogin = GETDATE() WHERE ID = ?";
        
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setInt(1, userId);
            
            int rowsAffected = pstmt.executeUpdate();
            return rowsAffected > 0;
            
        } catch (SQLException e) {
            System.err.println("Update last login error: " + e.getMessage());
            e.printStackTrace();
        }
        
        return false;
    }
    
    // =================== CHECK USERNAME EXISTS ===================
    /**
     * Kiểm tra username đã tồn tại chưa
     */
    public boolean isUsernameExists(String username) {
        String sql = "SELECT COUNT(*) FROM Users WHERE Username = ?";
        
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setString(1, username);
            
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt(1) > 0;
                }
            }
            
        } catch (SQLException e) {
            System.err.println("Check username exists error: " + e.getMessage());
            e.printStackTrace();
        }
        
        return false;
    }
    
    // =================== CHANGE PASSWORD ===================
    /**
     * Đổi mật khẩu user
     */
    public boolean changePassword(int userId, String oldPassword, String newPassword) {
        // Kiểm tra mật khẩu cũ
        String checkSql = "SELECT COUNT(*) FROM Users WHERE ID = ? AND Password = ?";
        
        try (Connection conn = getConnection();
             PreparedStatement checkStmt = conn.prepareStatement(checkSql)) {
            
            checkStmt.setInt(1, userId);
            checkStmt.setString(2, oldPassword);
            
            try (ResultSet rs = checkStmt.executeQuery()) {
                if (rs.next() && rs.getInt(1) == 0) {
                    System.err.println("Old password is incorrect");
                    return false;
                }
            }
            
            // Cập nhật mật khẩu mới
            String updateSql = "UPDATE Users SET Password = ? WHERE ID = ?";
            try (PreparedStatement updateStmt = conn.prepareStatement(updateSql)) {
                updateStmt.setString(1, newPassword);
                updateStmt.setInt(2, userId);
                
                int rowsAffected = updateStmt.executeUpdate();
                
                if (rowsAffected > 0) {
                    System.out.println("Password changed successfully for user ID: " + userId);
                    return true;
                }
            }
            
        } catch (SQLException e) {
            System.err.println("Change password error: " + e.getMessage());
            e.printStackTrace();
        }
        
        return false;
    }
    
    // =================== GET USER COUNT ===================
    /**
     * Đếm tổng số users
     */
    public int getTotalUserCount() {
        String sql = "SELECT COUNT(*) FROM Users";
        
        try (Connection conn = getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {
            
            if (rs.next()) {
                return rs.getInt(1);
            }
            
        } catch (SQLException e) {
            System.err.println("Get user count error: " + e.getMessage());
            e.printStackTrace();
        }
        
        return 0;
    }
    
    // =================== GET ACTIVE USER COUNT ===================
    /**
     * Đếm số users đang hoạt động
     */
    public int getActiveUserCount() {
        String sql = "SELECT COUNT(*) FROM Users WHERE IsActive = 1";
        
        try (Connection conn = getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {
            
            if (rs.next()) {
                return rs.getInt(1);
            }
            
        } catch (SQLException e) {
            System.err.println("Get active user count error: " + e.getMessage());
            e.printStackTrace();
        }
        
        return 0;
    }
    
    // =================== SEARCH USERS ===================
    /**
     * Tìm kiếm users theo username (LIKE)
     */
    public List<User> searchUsersByUsername(String searchTerm) {
        List<User> users = new ArrayList<>();
        String sql = "SELECT * FROM Users WHERE Username LIKE ? AND IsActive = 1 ORDER BY Username";
        
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setString(1, "%" + searchTerm + "%");
            
            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    users.add(mapResultSetToUser(rs));
                }
            }
            
        } catch (SQLException e) {
            System.err.println("Search users error: " + e.getMessage());
            e.printStackTrace();
        }
        
        return users;
    }
    
    // =================== STORED PROCEDURE EXAMPLE ===================
    /**
     * Sử dụng stored procedure để đăng nhập
     */
    public User loginWithStoredProcedure(String username, String password) {
        String sql = "{call sp_UserLogin(?, ?)}";
        
        try (Connection conn = getConnection();
             CallableStatement cstmt = conn.prepareCall(sql)) {
            
            cstmt.setString(1, username);
            cstmt.setString(2, password);
            
            try (ResultSet rs = cstmt.executeQuery()) {
                if (rs.next()) {
                    String status = rs.getString("LoginStatus");
                    if ("SUCCESS".equals(status)) {
                        return mapResultSetToUser(rs);
                    }
                }
            }
            
        } catch (SQLException e) {
            System.err.println("Stored procedure login error: " + e.getMessage());
            e.printStackTrace();
        }
        
        return null;
    }
    
    // =================== TRANSACTION EXAMPLE ===================
    /**
     * Transaction example - Chuyển quyền giữa 2 users
     */
    public boolean transferRole(int fromUserId, int toUserId, String newRole) {
        Connection conn = null;
        
        try {
            conn = getConnection();
            conn.setAutoCommit(false); // Bắt đầu transaction
            
            // Update user 1
            String sql1 = "UPDATE Users SET Role = 'Employee' WHERE ID = ?";
            try (PreparedStatement pstmt1 = conn.prepareStatement(sql1)) {
                pstmt1.setInt(1, fromUserId);
                pstmt1.executeUpdate();
            }
            
            // Update user 2
            String sql2 = "UPDATE Users SET Role = ? WHERE ID = ?";
            try (PreparedStatement pstmt2 = conn.prepareStatement(sql2)) {
                pstmt2.setString(1, newRole);
                pstmt2.setInt(2, toUserId);
                pstmt2.executeUpdate();
            }
            
            conn.commit(); // Commit transaction
            System.out.println("Role transfer completed successfully");
            return true;
            
        } catch (SQLException e) {
            System.err.println("Transaction failed: " + e.getMessage());
            if (conn != null) {
                try {
                    conn.rollback();
                    System.out.println("Transaction rolled back");
                } catch (SQLException ex) {
                    ex.printStackTrace();
                }
            }
            e.printStackTrace();
        } finally {
            if (conn != null) {
                try {
                    conn.setAutoCommit(true);
                    conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
        
        return false;
    }
    
    // =================== TEST CONNECTION ===================
    /**
     * Test database connection
     */
    public boolean testConnection() {
        try (Connection conn = getConnection()) {
            if (conn != null && !conn.isClosed()) {
                System.out.println("✅ Database connection test successful!");
                System.out.println("Database: " + conn.getCatalog());
                System.out.println("URL: " + conn.getMetaData().getURL());
                return true;
            }
        } catch (SQLException e) {
            System.err.println("❌ Database connection test failed!");
            e.printStackTrace();
        }
        return false;
    }
    
    // =================== HELPER METHODS ===================
    /**
     * Map ResultSet to User object
     */
    private User mapResultSetToUser(ResultSet rs) throws SQLException {
        User user = new User();
        user.setId(rs.getInt("ID"));
        user.setUsername(rs.getString("Username"));
        user.setPassword(rs.getString("Password"));
        user.setRole(rs.getString("Role"));
        return user;
    }
}