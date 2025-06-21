// UserDao.java
package daos;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import beans.User;

import java.sql.*;
import java.util.List;

@Repository
public class UserDao {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    private final RowMapper<User> userMapper = (rs, rowNum) -> {
        User user = new User();
        user.setId(rs.getInt("id"));
        user.setName(rs.getString("name"));
        user.setEmail(rs.getString("email"));
        user.setPassword(rs.getString("password"));
        user.setRole(rs.getString("role"));
        user.setDoctorId(rs.getObject("doctor_id", Integer.class));
        user.setPatientId(rs.getObject("patient_id", Integer.class));
        user.setProfilePic(rs.getBlob("profile_pic"));
        user.setCreatedAt(rs.getString("created_at"));
        return user;
    };

    public User validateUser(String email, String password, String role) {
        String sql = "SELECT * FROM users WHERE email = ? AND password = ? AND role = ?";
        return jdbcTemplate.query(sql, userMapper, email, password, role)
                .stream().findFirst().orElse(null);
    }

    public User validateUser(String email, String password) {
        String sql = "SELECT * FROM users WHERE email = ? AND password = ?";
        return jdbcTemplate.query(sql, userMapper, email, password)
                .stream().findFirst().orElse(null);
    }

    public void addUser(User user) {
        String sql = "INSERT INTO users (name, email, password, role, doctor_id, patient_id, profile_pic) " +
                     "VALUES (?, ?, ?, ?, ?, ?, ?)";
        jdbcTemplate.update(sql,
            user.getName(),
            user.getEmail(),
            user.getPassword(),
            user.getRole(),
            user.getDoctorId(),
            user.getPatientId(),
            user.getProfilePic()
        );
    }

    public void updateUser(User user) {
        String sql = "UPDATE users SET name=?, email=?, password=?, role=?, doctor_id=?, patient_id=?, profile_pic=? WHERE id=?";
        jdbcTemplate.update(sql,
            user.getName(),
            user.getEmail(),
            user.getPassword(),
            user.getRole(),
            user.getDoctorId(),
            user.getPatientId(),
            user.getProfilePic(),
            user.getId()
        );
    }

    public List<User> getAllUsers() {
        return jdbcTemplate.query("SELECT * FROM users", userMapper);
    }

    public User getUserById(int id) {
        String sql = "SELECT * FROM users WHERE id = ?";
        return jdbcTemplate.query(sql, userMapper, id).stream().findFirst().orElse(null);
    }

    public void deleteUser(int id) {
        jdbcTemplate.update("DELETE FROM users WHERE id = ?", id);
    }
    
    public boolean isDoctorEmail(String email) {
        String sql = "SELECT COUNT(*) FROM doctors WHERE email = ?";
        Integer count = jdbcTemplate.queryForObject(sql, Integer.class, email);
        return count != null && count > 0;
    }

}
