package beans;

import java.sql.Blob;
import java.sql.Date;

public class Patient {
    private int id;
    private String name;
    private String gender;
    private Date dob;
    private String contact;
    private String address;
    private String bloodGroup;
    private Blob profilePic;
    private Date createdAt;
    
    // Constructors
    public Patient() {}
    
    public Patient(String name, String gender, Date dob, String contact, String address, String bloodGroup) {
        this.name = name;
        this.gender = gender;
        this.dob = dob;
        this.contact = contact;
        this.address = address;
        this.bloodGroup = bloodGroup;
    }
    
    // Getters and setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }
    
    public String getName() { return name; }
    public void setName(String name) { this.name = name; }
    
    public String getGender() { return gender; }
    public void setGender(String gender) { this.gender = gender; }
    
    public Date getDob() { return dob; }
    public void setDob(Date dob) { this.dob = dob; }
    
    public String getContact() { return contact; }
    public void setContact(String contact) { this.contact = contact; }
    
    public String getAddress() { return address; }
    public void setAddress(String address) { this.address = address; }
    
    public String getBloodGroup() { return bloodGroup; }
    public void setBloodGroup(String bloodGroup) { this.bloodGroup = bloodGroup; }
    
    public Blob getProfilePic() { return profilePic; }
    public void setProfilePic(Blob profilePic) { this.profilePic = profilePic; }
    
    public Date getCreatedAt() { return createdAt; }
    public void setCreatedAt(Date createdAt) { this.createdAt = createdAt; }
}