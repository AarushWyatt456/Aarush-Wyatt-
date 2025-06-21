package beans;

import java.sql.Timestamp;

public class MedicalRecord {
    private int id;
    private int patientId;
    private int doctorId;
    private Integer appointmentId;
    private String diagnosis;
    private String prescription;
    private String notes;
    private Timestamp recordDate;
    
   
    public MedicalRecord() {}
    
    public MedicalRecord(int patientId, int doctorId, String diagnosis, String prescription) {
        this.patientId = patientId;
        this.doctorId = doctorId;
        this.diagnosis = diagnosis;
        this.prescription = prescription;
    }
    
    // Getters and setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }
    
    public int getPatientId() { return patientId; }
    public void setPatientId(int patientId) { this.patientId = patientId; }
    
    public int getDoctorId() { return doctorId; }
    public void setDoctorId(int doctorId) { this.doctorId = doctorId; }
    
    public Integer getAppointmentId() { return appointmentId; }
    public void setAppointmentId(Integer appointmentId) { this.appointmentId = appointmentId; }
    
    public String getDiagnosis() { return diagnosis; }
    public void setDiagnosis(String diagnosis) { this.diagnosis = diagnosis; }
    
    public String getPrescription() { return prescription; }
    public void setPrescription(String prescription) { this.prescription = prescription; }
    
    public String getNotes() { return notes; }
    public void setNotes(String notes) { this.notes = notes; }
    
    public Timestamp getRecordDate() { return recordDate; }
    public void setRecordDate(Timestamp recordDate) { this.recordDate = recordDate; }
}