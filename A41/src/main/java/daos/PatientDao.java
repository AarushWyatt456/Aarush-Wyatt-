package daos;


import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import beans.Patient;

public class PatientDao {
    private Connection connection;

//    public PatientDao() {
//        connection = DBUtil.getConnection();
//    }

    public void addPatient(Patient patient) {
        try {
            PreparedStatement ps = connection.prepareStatement(
                "INSERT INTO patients (name, gender, dob, contact, address, blood_group, profile_pic) " +
                "VALUES (?, ?, ?, ?, ?, ?, ?)");
            ps.setString(1, patient.getName());
            ps.setString(2, patient.getGender());
            ps.setDate(3, patient.getDob());
            ps.setString(4, patient.getContact());
            ps.setString(5, patient.getAddress());
            ps.setString(6, patient.getBloodGroup());
            ps.setBlob(7, patient.getProfilePic());
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void updatePatient(Patient patient) {
        try {
            PreparedStatement ps = connection.prepareStatement(
                "UPDATE patients SET name=?, gender=?, dob=?, contact=?, address=?, blood_group=?, profile_pic=? " +
                "WHERE id=?");
            ps.setString(1, patient.getName());
            ps.setString(2, patient.getGender());
            ps.setDate(3, patient.getDob());
            ps.setString(4, patient.getContact());
            ps.setString(5, patient.getAddress());
            ps.setString(6, patient.getBloodGroup());
            ps.setBlob(7, patient.getProfilePic());
            ps.setInt(8, patient.getId());
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void deletePatient(int patientId) {
        try {
            PreparedStatement ps = connection.prepareStatement(
                "DELETE FROM patients WHERE id = ?");
            ps.setInt(1, patientId);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<Patient> getAllPatients() {
        List<Patient> patients = new ArrayList<>();
        try {
            Statement statement = connection.createStatement();
            ResultSet rs = statement.executeQuery("SELECT * FROM patients");
            
            while (rs.next()) {
                Patient patient = new Patient();
                patient.setId(rs.getInt("id"));
                patient.setName(rs.getString("name"));
                patient.setGender(rs.getString("gender"));
                patient.setDob(rs.getDate("dob"));
                patient.setContact(rs.getString("contact"));
                patient.setAddress(rs.getString("address"));
                patient.setBloodGroup(rs.getString("blood_group"));
                patient.setProfilePic(rs.getBlob("profile_pic"));
                patient.setCreatedAt(rs.getDate("created_at"));
                patients.add(patient);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return patients;
    }

    public Patient getPatientById(int patientId) {
        Patient patient = null;
        try {
            PreparedStatement ps = connection.prepareStatement(
                "SELECT * FROM patients WHERE id = ?");
            ps.setInt(1, patientId);
            
            ResultSet rs = ps.executeQuery();
            
            if (rs.next()) {
                patient = new Patient();
                patient.setId(rs.getInt("id"));
                patient.setName(rs.getString("name"));
                patient.setGender(rs.getString("gender"));
                patient.setDob(rs.getDate("dob"));
                patient.setContact(rs.getString("contact"));
                patient.setAddress(rs.getString("address"));
                patient.setBloodGroup(rs.getString("blood_group"));
                patient.setProfilePic(rs.getBlob("profile_pic"));
                patient.setCreatedAt(rs.getDate("created_at"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return patient;
    }

    public List<Patient> getPatientsByDoctor(int doctorId) {
        List<Patient> patients = new ArrayList<>();
        try {
            PreparedStatement ps = connection.prepareStatement(
                "SELECT p.* FROM patients p " +
                "JOIN doctor_patient dp ON p.id = dp.patient_id " +
                "WHERE dp.doctor_id = ?");
            ps.setInt(1, doctorId);
            
            ResultSet rs = ps.executeQuery();
            
            while (rs.next()) {
                Patient patient = new Patient();
                patient.setId(rs.getInt("id"));
                patient.setName(rs.getString("name"));
                patient.setGender(rs.getString("gender"));
                patient.setDob(rs.getDate("dob"));
                patient.setContact(rs.getString("contact"));
                patient.setAddress(rs.getString("address"));
                patient.setBloodGroup(rs.getString("blood_group"));
                patient.setProfilePic(rs.getBlob("profile_pic"));
                patient.setCreatedAt(rs.getDate("created_at"));
                patients.add(patient);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return patients;
    }
}