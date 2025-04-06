package com.eadn.dao;

import com.eadn.entity.User;
import java.sql.*;
import javax.sql.DataSource;
import jakarta.annotation.Resource;

public class UserDAO {
    @Resource(name = "jdbc/postgresPool")
    private DataSource dataSource;

    public User findByEmail(String email) throws SQLException {
        String sql = "SELECT * FROM users WHERE email = ?";
        try (Connection conn = dataSource.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, email);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    User user = new User();
                    user.setId(rs.getLong("id"));
                    user.setEmail(rs.getString("email"));
                    user.setPassword(rs.getString("password"));
                    return user;
                }
            }
        }
        return null;
    }

    public void updateResetToken(String email, String token) throws SQLException {
        String sql = "UPDATE users SET reset_token = ?, reset_token_expiry = ? WHERE email = ?";
        try (Connection conn = dataSource.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, token);
            stmt.setTimestamp(2, new Timestamp(System.currentTimeMillis() + 3600000)); // 1 hour validity
            stmt.setString(3, email);
            stmt.executeUpdate();
        }
    }
}