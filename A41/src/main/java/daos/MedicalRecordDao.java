package daos;


import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import beans.MedicalRecord;

public class MedicalRecordDao {
    private Connection connection;

//    public MedicalRecordDao() {
//        connection = DBUtil.getConnection();
//    }

    public void addMedicalRecord(MedicalRecord record) {
        try {
            PreparedStatement ps = connection.prepareStatement(
                "INSERT INTO medical_records (patient_id, doctor_id, appointment_id, diagnosis, prescription, notes) " +
                "VALUES (?, ?, ?, ?, ?, ?)");
            ps.setInt(1, record.getPatientId());
            ps.setInt(2, record.getDoctorId());
            ps.setObject(3, record.getAppointmentId());
            ps.setString(4, record.getDiagnosis());
            ps.setString(5, record.getPrescription());
            ps.setString(6, record.getNotes());
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void updateMedicalRecord(MedicalRecord record) {
        try {
            PreparedStatement ps = connection.prepareStatement(
                "UPDATE medical_records SET patient_id=?, doctor_id=?, appointment_id=?, " +
                "diagnosis=?, prescription=?, notes=? WHERE id=?");
            ps.setInt(1, record.getPatientId());
            ps.setInt(2, record.getDoctorId());
            ps.setObject(3, record.getAppointmentId());
            ps.setString(4, record.getDiagnosis());
            ps.setString(5, record.getPrescription());
            ps.setString(6, record.getNotes());
            ps.setInt(7, record.getId());
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void deleteMedicalRecord(int recordId) {
        try {
            PreparedStatement ps = connection.prepareStatement(
                "DELETE FROM medical_records WHERE id = ?");
            ps.setInt(1, recordId);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<MedicalRecord> getAllMedicalRecords() {
        List<MedicalRecord> records = new ArrayList<>();
        try {
            Statement statement = connection.createStatement();
            ResultSet rs = statement.executeQuery("SELECT * FROM medical_records");
            
            while (rs.next()) {
                MedicalRecord record = new MedicalRecord();
                record.setId(rs.getInt("id"));
                record.setPatientId(rs.getInt("patient_id"));
                record.setDoctorId(rs.getInt("doctor_id"));
                record.setAppointmentId(rs.getInt("appointment_id"));
                record.setDiagnosis(rs.getString("diagnosis"));
                record.setPrescription(rs.getString("prescription"));
                record.setNotes(rs.getString("notes"));
                record.setRecordDate(rs.getTimestamp("record_date"));
                records.add(record);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return records;
    }

    public MedicalRecord getMedicalRecordById(int recordId) {
        MedicalRecord record = null;
        try {
            PreparedStatement ps = connection.prepareStatement(
                "SELECT * FROM medical_records WHERE id = ?");
            ps.setInt(1, recordId);
            
            ResultSet rs = ps.executeQuery();
            
            if (rs.next()) {
                record = new MedicalRecord();
                record.setId(rs.getInt("id"));
                record.setPatientId(rs.getInt("patient_id"));
                record.setDoctorId(rs.getInt("doctor_id"));
                record.setAppointmentId(rs.getInt("appointment_id"));
                record.setDiagnosis(rs.getString("diagnosis"));
                record.setPrescription(rs.getString("prescription"));
                record.setNotes(rs.getString("notes"));
                record.setRecordDate(rs.getTimestamp("record_date"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return record;
    }

    public List<MedicalRecord> getMedicalRecordsByPatient(int patientId) {
        List<MedicalRecord> records = new ArrayList<>();
        try {
            PreparedStatement ps = connection.prepareStatement(
                "SELECT * FROM medical_records WHERE patient_id = ? ORDER BY record_date DESC");
            ps.setInt(1, patientId);
            
            ResultSet rs = ps.executeQuery();
            
            while (rs.next()) {
                MedicalRecord record = new MedicalRecord();
                record.setId(rs.getInt("id"));
                record.setPatientId(rs.getInt("patient_id"));
                record.setDoctorId(rs.getInt("doctor_id"));
                record.setAppointmentId(rs.getInt("appointment_id"));
                record.setDiagnosis(rs.getString("diagnosis"));
                record.setPrescription(rs.getString("prescription"));
                record.setNotes(rs.getString("notes"));
                record.setRecordDate(rs.getTimestamp("record_date"));
                records.add(record);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return records;
    }
}