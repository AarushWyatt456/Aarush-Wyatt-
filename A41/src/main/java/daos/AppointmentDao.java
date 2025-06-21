package daos;


import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import beans.Appointment;

public class AppointmentDao {
    private Connection connection;

//    public AppointmentDao() {
//        connection = DBUtil.getConnection();
//    }

    public void addAppointment(Appointment appointment) {
        try {
            PreparedStatement ps = connection.prepareStatement(
                "INSERT INTO appointments (patient_id, doctor_id, appointment_date, reason, status, duration_minutes, notes) " +
                "VALUES (?, ?, ?, ?, ?, ?, ?)");
            ps.setInt(1, appointment.getPatientId());
            ps.setInt(2, appointment.getDoctorId());
            ps.setTimestamp(3, appointment.getAppointmentDate());
            ps.setString(4, appointment.getReason());
            ps.setString(5, appointment.getStatus());
            ps.setInt(6, appointment.getDurationMinutes());
            ps.setString(7, appointment.getNotes());
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void updateAppointment(Appointment appointment) {
        try {
            PreparedStatement ps = connection.prepareStatement(
                "UPDATE appointments SET patient_id=?, doctor_id=?, appointment_date=?, reason=?, " +
                "status=?, duration_minutes=?, notes=? WHERE id=?");
            ps.setInt(1, appointment.getPatientId());
            ps.setInt(2, appointment.getDoctorId());
            ps.setTimestamp(3, appointment.getAppointmentDate());
            ps.setString(4, appointment.getReason());
            ps.setString(5, appointment.getStatus());
            ps.setInt(6, appointment.getDurationMinutes());
            ps.setString(7, appointment.getNotes());
            ps.setInt(8, appointment.getId());
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void deleteAppointment(int appointmentId) {
        try {
            PreparedStatement ps = connection.prepareStatement(
                "DELETE FROM appointments WHERE id = ?");
            ps.setInt(1, appointmentId);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<Appointment> getAllAppointments() {
        List<Appointment> appointments = new ArrayList<>();
        try {
            Statement statement = connection.createStatement();
            ResultSet rs = statement.executeQuery("SELECT * FROM appointments");
            
            while (rs.next()) {
                Appointment appointment = new Appointment();
                appointment.setId(rs.getInt("id"));
                appointment.setPatientId(rs.getInt("patient_id"));
                appointment.setDoctorId(rs.getInt("doctor_id"));
                appointment.setAppointmentDate(rs.getTimestamp("appointment_date"));
                appointment.setReason(rs.getString("reason"));
                appointment.setStatus(rs.getString("status"));
                appointment.setDurationMinutes(rs.getInt("duration_minutes"));
                appointment.setNotes(rs.getString("notes"));
                appointment.setCreatedAt(rs.getTimestamp("created_at"));
                appointments.add(appointment);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return appointments;
    }

    public Appointment getAppointmentById(int appointmentId) {
        Appointment appointment = null;
        try {
            PreparedStatement ps = connection.prepareStatement(
                "SELECT * FROM appointments WHERE id = ?");
            ps.setInt(1, appointmentId);
            
            ResultSet rs = ps.executeQuery();
            
            if (rs.next()) {
                appointment = new Appointment();
                appointment.setId(rs.getInt("id"));
                appointment.setPatientId(rs.getInt("patient_id"));
                appointment.setDoctorId(rs.getInt("doctor_id"));
                appointment.setAppointmentDate(rs.getTimestamp("appointment_date"));
                appointment.setReason(rs.getString("reason"));
                appointment.setStatus(rs.getString("status"));
                appointment.setDurationMinutes(rs.getInt("duration_minutes"));
                appointment.setNotes(rs.getString("notes"));
                appointment.setCreatedAt(rs.getTimestamp("created_at"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return appointment;
    }

    public List<Appointment> getAppointmentsByPatient(int patientId) {
        List<Appointment> appointments = new ArrayList<>();
        try {
            PreparedStatement ps = connection.prepareStatement(
                "SELECT * FROM appointments WHERE patient_id = ? ORDER BY appointment_date DESC");
            ps.setInt(1, patientId);
            
            ResultSet rs = ps.executeQuery();
            
            while (rs.next()) {
                Appointment appointment = new Appointment();
                appointment.setId(rs.getInt("id"));
                appointment.setPatientId(rs.getInt("patient_id"));
                appointment.setDoctorId(rs.getInt("doctor_id"));
                appointment.setAppointmentDate(rs.getTimestamp("appointment_date"));
                appointment.setReason(rs.getString("reason"));
                appointment.setStatus(rs.getString("status"));
                appointment.setDurationMinutes(rs.getInt("duration_minutes"));
                appointment.setNotes(rs.getString("notes"));
                appointment.setCreatedAt(rs.getTimestamp("created_at"));
                appointments.add(appointment);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return appointments;
    }

    public List<Appointment> getAppointmentsByDoctor(int doctorId) {
        List<Appointment> appointments = new ArrayList<>();
        try {
            PreparedStatement ps = connection.prepareStatement(
                "SELECT * FROM appointments WHERE doctor_id = ? ORDER BY appointment_date DESC");
            ps.setInt(1, doctorId);
            
            ResultSet rs = ps.executeQuery();
            
            while (rs.next()) {
                Appointment appointment = new Appointment();
                appointment.setId(rs.getInt("id"));
                appointment.setPatientId(rs.getInt("patient_id"));
                appointment.setDoctorId(rs.getInt("doctor_id"));
                appointment.setAppointmentDate(rs.getTimestamp("appointment_date"));
                appointment.setReason(rs.getString("reason"));
                appointment.setStatus(rs.getString("status"));
                appointment.setDurationMinutes(rs.getInt("duration_minutes"));
                appointment.setNotes(rs.getString("notes"));
                appointment.setCreatedAt(rs.getTimestamp("created_at"));
                appointments.add(appointment);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return appointments;
    }
}