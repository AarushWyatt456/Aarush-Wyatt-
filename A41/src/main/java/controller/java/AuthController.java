package controller.java;


import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import javax.sql.rowset.serial.SerialException;

import beans.User;
import daos.UserDao;

import java.io.InputStream;
import java.sql.SQLException;

@MultipartConfig(maxFileSize = 16177215) 
public class AuthController extends HttpServlet {
    private UserDao userDao;

    @Override
    public void init() {
        userDao = new UserDao();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        
        if (action == null) {
            // Login
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            
            User user = userDao.validateUser(email, password);
            
            if (user != null) {
                HttpSession session = request.getSession();
                session.setAttribute("user", user);
                
                switch(user.getRole()) {
                    case "admin":
                        response.sendRedirect("admin-dashboard.jsp");
                        break;
                    case "doctor":
                        response.sendRedirect("doctor-dashboard.jsp");
                        break;
                    case "patient":
                        response.sendRedirect("patient-dashboard.jsp");
                        break;
                    default:
                        response.sendRedirect("index.jsp?error=invalid_role");
                }
            } else {
                response.sendRedirect("index.jsp?error=invalid_credentials");
            }
        } else if (action.equals("register")) {
            // Registration
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            String role = request.getParameter("role");
            
            // Handle file upload
            Part filePart = request.getPart("profile_pic");
            InputStream profilePic = null;
            if (filePart != null && filePart.getSize() > 0) {
                profilePic = filePart.getInputStream();
            }
            
            User user = new User();
            user.setEmail(email);
            user.setPassword(password);
            user.setRole(role);
            
            // For doctor/patient registration, you would set doctor_id or patient_id here
            // This would typically be done after creating the doctor/patient record
            
            if (profilePic != null) {
                try {
					user.setProfilePic(new javax.sql.rowset.serial.SerialBlob(profilePic.readAllBytes()));
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
            
            userDao.addUser(user);
            
            // Redirect to appropriate page based on role
            response.sendRedirect("login.jsp?success=registration_complete");
        }
    }
}