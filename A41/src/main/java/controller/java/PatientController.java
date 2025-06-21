package controller.java;


import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import javax.sql.rowset.serial.SerialException;

import beans.Patient;
import beans.User;
import daos.PatientDao;
import daos.UserDao;

import java.io.InputStream;

@MultipartConfig(maxFileSize = 16177215) // 16MB max
public class PatientController extends HttpServlet {
    private PatientDao patientDao;

    @Override
    public void init() {
        patientDao = new PatientDao();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        
        if (user == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        String action = request.getParameter("action");
        
        if (action.equals("add")) {
            // Handle file upload
            Part filePart = request.getPart("profile_pic");
            InputStream profilePic = null;
            if (filePart != null && filePart.getSize() > 0) {
                profilePic = filePart.getInputStream();
            }
            
            Patient patient = new Patient();
            patient.setName(request.getParameter("name"));
            patient.setGender(request.getParameter("gender"));
            patient.setDob(Date.valueOf(request.getParameter("dob")));
            patient.setContact(request.getParameter("contact"));
            patient.setAddress(request.getParameter("address"));
            patient.setBloodGroup(request.getParameter("blood_group"));
            
            if (profilePic != null) {
                try {
					patient.setProfilePic(new javax.sql.rowset.serial.SerialBlob(profilePic.readAllBytes()));
				} catch (SerialException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
            }
            
            patientDao.addPatient(patient);
            
            // If this is a patient registration, update the user record with patient_id
            if (user.getRole().equals("patient")) {
                // Get the newly created patient ID
                // This would require adding a method to get patient by email or similar
                // For simplicity, we'll assume we have the ID
                user.setPatientId(patient.getId());
                UserDao userDao = new UserDao();
                userDao.updateUser(user);
            }
            
            response.sendRedirect("patient-list.jsp?success=patient_added");
        } else if (action.equals("update")) {
            // Similar to add, but with ID
            int patientId = Integer.parseInt(request.getParameter("id"));
            Patient patient = patientDao.getPatientById(patientId);
            
            patient.setName(request.getParameter("name"));
            patient.setGender(request.getParameter("gender"));
            patient.setDob(Date.valueOf(request.getParameter("dob")));
            patient.setContact(request.getParameter("contact"));
            patient.setAddress(request.getParameter("address"));
            patient.setBloodGroup(request.getParameter("blood_group"));
            
            // Handle file upload if new image provided
            Part filePart = request.getPart("profile_pic");
            if (filePart != null && filePart.getSize() > 0) {
                InputStream profilePic = filePart.getInputStream();
                try {
					patient.setProfilePic(new javax.sql.rowset.serial.SerialBlob(profilePic.readAllBytes()));
				} catch (SQLException | IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
            }
            
            patientDao.updatePatient(patient);
            response.sendRedirect("patient-view.jsp?id=" + patientId + "&success=patient_updated");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        
        if (user == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        String action = request.getParameter("action");
        
        if (action == null) {
            // Show patient list
            List<Patient> patients;
            
            if (user.getRole().equals("doctor")) {
                patients = patientDao.getPatientsByDoctor(user.getDoctorId());
            } else if (user.getRole().equals("admin")) {
                patients = patientDao.getAllPatients();
            } else {
                // Patient can only see their own info
                Patient patient = patientDao.getPatientById(user.getPatientId());
                request.setAttribute("patient", patient);
                request.getRequestDispatcher("patient-view.jsp").forward(request, response);
                return;
            }
            
            request.setAttribute("patients", patients);
            request.getRequestDispatcher("patient-list.jsp").forward(request, response);
        } else if (action.equals("view")) {
            int patientId = Integer.parseInt(request.getParameter("id"));
            Patient patient = patientDao.getPatientById(patientId);
            request.setAttribute("patient", patient);
            request.getRequestDispatcher("patient-view.jsp").forward(request, response);
        } else if (action.equals("delete")) {
            int patientId = Integer.parseInt(request.getParameter("id"));
            patientDao.deletePatient(patientId);
            response.sendRedirect("patient-list.jsp?success=patient_deleted");
        } else if (action.equals("new")) {
            request.getRequestDispatcher("patient-form.jsp").forward(request, response);
        } else if (action.equals("edit")) {
            int patientId = Integer.parseInt(request.getParameter("id"));
            Patient patient = patientDao.getPatientById(patientId);
            request.setAttribute("patient", patient);
            request.getRequestDispatcher("patient-form.jsp").forward(request, response);
        }
    }
}