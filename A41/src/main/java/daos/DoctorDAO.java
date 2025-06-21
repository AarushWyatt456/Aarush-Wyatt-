package daos;

import java.sql.ResultSet;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import beans.Doctor;

import javax.validation.constraints.Min;

@Repository
public class DoctorDAO {

    @Autowired
    private JdbcTemplate jdbcTemplate;
    

    // Save new doctor
    public int saveDoctor(Doctor doctor) {
    	String sql = "INSERT INTO doctors (name, qualification, specialist, contact, gender, image, email, salary,password) VALUES (?,?, ?, ?, ?, ?, ?, ?, ?)";
    	return jdbcTemplate.update(sql,
    	    doctor.getName(),
    	    doctor.getQualification(),
    	    doctor.getSpecialist(),
    	    doctor.getContact(),
    	    doctor.getGender(),
    	    doctor.getImage(),
    	    doctor.getEmail(),
    	    doctor.getSalary());
    }

    // Get all doctors
    public List<Doctor> getAllDoctors() {
        String sql = "SELECT * FROM doctors";
        return jdbcTemplate.query(sql, new DoctorRowMapper());
    }

    // Get doctor by ID
    public Doctor getDoctorById(int id) {
        String sql = "SELECT * FROM doctors WHERE id = ?";
        return jdbcTemplate.queryForObject(sql, new DoctorRowMapper(), id);
    }

    //search doctor
    public List<Doctor> searchDoctorsByName(String name) {
        String sql = "SELECT * FROM doctors WHERE name LIKE ?";
        return jdbcTemplate.query(sql, new DoctorRowMapper(), "%" + name + "%");
    }
    // Update doctor
    public int updateDoctor(Doctor doctor) {
    	String sql = "UPDATE doctors SET name=?, qualification=?, specialist=?, contact=?, gender=?, image=?, email=?, salary=? WHERE id=?";
    	return jdbcTemplate.update(sql,
    	    doctor.getName(),
    	    doctor.getQualification(),
    	    doctor.getSpecialist(),
    	    doctor.getContact(),
    	    doctor.getGender(),
    	    doctor.getImage(),
    	    doctor.getEmail(),
    	    doctor.getSalary(),
    	    doctor.getId());
    }

    // Delete doctor
    public int deleteDoctor(int id) {
        String sql = "DELETE FROM doctors WHERE id = ?";
        return jdbcTemplate.update(sql, id);
    }

    // Inner RowMapper class to map result set to Doctor object
    private static class DoctorRowMapper implements RowMapper<Doctor> {
        @Override
        public Doctor mapRow(ResultSet rs, int rowNum) throws SQLException {
            Doctor doctor = new Doctor();
            doctor.setId(rs.getInt("id"));
            doctor.setName(rs.getString("name"));
            doctor.setQualification(rs.getString("qualification"));
            doctor.setSpecialist(rs.getString("specialist"));
            doctor.setContact(rs.getString("contact"));
            doctor.setGender(rs.getString("gender"));
            doctor.setEmail(rs.getString("email"));          
            doctor.setSalary(rs.getDouble("salary"));        
            doctor.setImage(rs.getBytes("image"));
            return doctor;
        }
    }
    public boolean isDoctorEmail(String email) {
        String sql = "SELECT COUNT(*) FROM doctors WHERE email = ?";
        Integer count = jdbcTemplate.queryForObject(sql, Integer.class, email);
        return count != null && count > 0;
    }


    }

