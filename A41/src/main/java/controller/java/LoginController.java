//package controller.java;
//
//import beans.User;
//import daos.UserDao;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.*;
//import javax.servlet.http.HttpSession;
//import java.util.Objects;
//
//@Controller
//public class LoginController {
//
//    @Autowired
//    private UserDao userDao;
//
//    @GetMapping("/login")
//    public String showLoginForm(HttpSession session) {
//        // Null-safe session check
//        if (session != null) {
//            User user = (User) session.getAttribute("user");
//            if (user != null) {
//                return redirectBasedOnRole(user);
//            }
//        }
//        return "login"; // Ensure login.jsp exists
//    }
//
//    @PostMapping("/login")
//    public String handleLogin(
//        @RequestParam String email,
//        @RequestParam String password,
//        HttpSession session,
//        Model model
//    ) {
//        try {
//            if ("admin@gmail.com".equals(email) && "admin899".equals(password)) {
//                User admin = new User();
//                admin.setEmail(email);
//                admin.setRole("admin");
//                session.setAttribute("user", admin);
//                return "redirect:/admin/dashboard";
//            }
//
//            User user = userDao.validateUser(email, password);
//            if (user != null) {
//                session.setAttribute("user", user);
//                return redirectBasedOnRole(user);
//            } else {
//                model.addAttribute("error", "Invalid email or password");
//                return "login";
//            }
//        } catch (Exception e) {
//            model.addAttribute("error", "System error. Please try again.");
//            return "login";
//        }
//    }
//
//    @GetMapping("/register")
//    public String showRegisterForm() {
//        return "register";
//    }
//
//    @PostMapping("/register")
//    public String handleRegistration(@RequestParam String name,
//                                     @RequestParam String email,
//                                     @RequestParam String password,
//                                     HttpSession session,
//                                     Model model) {
//
//        if (name.isEmpty() || email.isEmpty() || password.isEmpty()) {
//            model.addAttribute("error", "All fields are required");
//            return "register";
//        }
//
//        // Automatically assign role
//        String role = userDao.isDoctorEmail(email) ? "doctor" : "patient";
//
//        User newUser = new User(name, email, password, role);
//        userDao.addUser(newUser);
//        session.setAttribute("user", newUser);
//        return redirectBasedOnRole(newUser);
//    }
//
//    private String redirectBasedOnRole(User user) {
//        switch (user.getRole()) {
//            case "admin": return "redirect:/admin/dashboard";
//            case "doctor": return "redirect:/doctor/dashboard";
//            case "patient": return "redirect:/patient/dashboard";
//            default: return "redirect:/login";
//        }
//    }
//
//    // Dashboard views
//    @GetMapping("/admin/dashboard")
//    public String adminDashboard() {
//        return "admin_dashboard";
//    }
//
//    @GetMapping("/doctor/dashboard")
//    public String doctorDashboard() {
//        return "doctor_dashboard";
//    }
//
//    @GetMapping("/patient/dashboard")
//    public String patientDashboard() {
//        return "patient_dashboard";
//    }
//}


//package controller.java;
//
//import beans.User;
//import daos.UserDao;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.*;
//import javax.servlet.http.HttpSession;
//
//@Controller
//public class LoginController {
//
//    @Autowired
//    private UserDao userDao;
//
//    // Show login form
//    @GetMapping("/login")
//    public String showLoginForm(HttpSession session) {
//        // Check if user is already logged in
//        if (session != null && session.getAttribute("user") != null) {
//            User user = (User) session.getAttribute("user");
//            return redirectBasedOnRole(user);
//        }
//        return "login"; // Ensure login.jsp exists in /WEB-INF/views/
//    }
//
//    // Process login
//    @PostMapping("/login")
//    public String handleLogin(
//            @RequestParam String email,
//            @RequestParam String password,
//            HttpSession session,
//            Model model) {
//        
//        try {
//            // Hardcoded admin login
//            if ("admin@gmail.com".equals(email) && "admin899".equals(password)) {
//                User admin = new User();
//                admin.setEmail(email);
//                admin.setRole("admin");
//                session.setAttribute("user", admin);
//                return "redirect:/admin/dashboard";
//            }
//
//            // Regular user login
//            User user = userDao.validateUser(email, password);
//            if (user != null) {
//                session.setAttribute("user", user);
//                return redirectBasedOnRole(user);
//            } else {
//                model.addAttribute("error", "Invalid email or password");
//                return "login";
//            }
//        } catch (Exception e) {
//            model.addAttribute("error", "System error. Please try again.");
//            return "login";
//        }
//    }
//
//    // Show registration form
//    @GetMapping("/register")
//    public String showRegisterForm() {
//        return "register";
//    }
//
//    // Process registration
//    @PostMapping("/register")
//    public String handleRegistration(
//            @RequestParam String name,
//            @RequestParam String email,
//            @RequestParam String password,
//            HttpSession session,
//            Model model) {
//        
//        try {
//            if (name == null || name.isEmpty() || email == null || email.isEmpty() || password == null || password.isEmpty()) {
//                model.addAttribute("error", "All fields are required");
//                return "register";
//            }
//
//            String role = userDao.isDoctorEmail(email) ? "doctor" : "patient";
//            User newUser = new User(name, email, password, role);
//            
//            userDao.addUser(newUser);
//            session.setAttribute("user", newUser);
//            return redirectBasedOnRole(newUser);
//            
//        } catch (Exception e) {
//            model.addAttribute("error", "Registration failed. Please try again.");
//            return "register";
//        }
//    }
//
//    // Helper method for role-based redirection
//    private String redirectBasedOnRole(User user) {
//        if (user == null) return "redirect:/login";
//        
//        switch (user.getRole()) {
//            case "admin":   return "redirect:/admin/dashboard";
//            case "doctor":  return "redirect:/doctor/dashboard";
//            case "patient": return "redirect:/patient/dashboard";
//            default:         return "redirect:/login";
//        }
//    }
//
//    // Logout handler
//    @GetMapping("/logout")
//    public String logout(HttpSession session) {
//        if (session != null) {
//            session.invalidate();
//        }
//        return "redirect:/login";
//    }
//}


package controller.java;

import beans.User;
import daos.UserDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;

@Controller
public class LoginController {

    @Autowired
    private UserDao userDao;

    @GetMapping("/login")
    public String showLoginForm(HttpSession session) {
        if (session.getAttribute("user") != null) {
            return redirectBasedOnRole((User) session.getAttribute("user"));
        }
        return "login";
    }

    @PostMapping("/login")
    public String handleLogin(
            @RequestParam String email,
            @RequestParam String password,
            HttpSession session,
            Model model) {

        try {
            // Admin login
            if ("admin@gmail.com".equals(email) && "admin899".equals(password)) {
                User admin = new User();
                admin.setEmail(email);
                admin.setRole("admin");
                session.setAttribute("user", admin);
                return "admin_dashboard";
            }

            // Regular user login
            User user = userDao.validateUser(email, password);
            if (user != null) {
                session.setAttribute("user", user);
                return redirectBasedOnRole(user);
            } else {
                model.addAttribute("error", "Invalid email or password");
                return "login";
            }
        } catch (Exception e) {
            model.addAttribute("error", "System error. Please try again.");
            return "login";
        }
    }

    private String redirectBasedOnRole(User user) {
        if (user == null) return "redirect:/login";
        
        switch (user.getRole()) {
            case "admin": return "redirect:/admin/dashboard";
            case "doctor": return "redirect:/doctor/dashboard";
            case "patient": return "redirect:/patient/dashboard";
            default: return "redirect:/login";
        }
    }
}