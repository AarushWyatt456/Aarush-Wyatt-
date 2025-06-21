package beans;

import javax.validation.constraints.Min;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;

public class Doctor {

    private int id;

    @NotBlank(message = "Name is required")
    private String name;

    @NotBlank(message = "Qualification is required")
    private String qualification;

    @NotBlank(message = "Specialist is required")
    private String specialist;

    @NotBlank(message = "Contact is required")
    @Pattern(regexp = "^\\d{10}$", message = "Enter a valid 10-digit contact number")
    private String contact;

    @NotBlank(message = "Gender is required")
    private String gender;
    
    @NotBlank(message = "Email is required")
    @Pattern(regexp = ".+@.+\\..+", message = "Enter a valid email")
    private String email;

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
    @Min(value = 0, message = "Salary must be a positive number")
    private double salary;

    public double getSalary() {
        return salary;
    }



    public void setSalary(double salary) {
		this.salary = salary;
	}
	// For image display in JSP
    private String base64Image;

    // For storing the actual image
    private byte[] image;

    // Getters and setters

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getQualification() {
        return qualification;
    }

    public void setQualification(String qualification) {
        this.qualification = qualification;
    }

    public String getSpecialist() {
        return specialist;
    }

    public void setSpecialist(String specialist) {
        this.specialist = specialist;
    }

    public String getContact() {
        return contact;
    }

    public void setContact(String contact) {
        this.contact = contact;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public byte[] getImage() {
        return image;
    }

    public void setImage(byte[] image) {
        this.image = image;
    }

    public String getBase64Image() {
        return base64Image;
    }

    public void setBase64Image(String base64Image) {
        this.base64Image = base64Image;
    }
}
