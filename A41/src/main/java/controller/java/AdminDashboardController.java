//package controller.java;
//
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.GetMapping;
//import org.springframework.web.bind.annotation.RequestMapping;
//
//import beans.User;
//
//import javax.servlet.http.HttpSession;
//
//@Controller
//@RequestMapping("/admin")
//public class AdminDashboardController {
//
//    @GetMapping("/dashboard")
//    public String showDashboard(HttpSession session, Model model) {
//        // Authentication check
//        User user = (User) session.getAttribute("user");
//        if (user == null || !"admin".equals(user.getRole())) {
//            return "redirect:/login";
//        }
//        
//        // Add dashboard statistics if needed
//        // model.addAttribute("totalDoctors", doctorService.countAll());
//        // model.addAttribute("totalPatients", patientService.countAll());
//        
//        return "admin-dashboard"; // Must match your JSP file name exactly
//    }
//
//    @GetMapping("/add-doctor")
//    public String showAddDoctorForm(HttpSession session) {
//        if (!isAdmin(session)) return "redirect:/login";
//        return "add-doctor";
//    }
//
//    @GetMapping("/view-doctors")
//    public String showViewDoctors(HttpSession session) {
//        if (!isAdmin(session)) return "redirect:/login";
//        return "viewemp2";
//    }
//
//    @GetMapping("/patient-form")
//    public String showPatientForm(HttpSession session) {
//        if (!isAdmin(session)) return "redirect:/login";
//        return "patient-form";
//    }
//
//    @GetMapping("/all-users")
//    public String showAllUsers(HttpSession session) {
//        if (!isAdmin(session)) return "redirect:/login";
//        return "hello";
//    }
//
//    @GetMapping("/reports")
//    public String showReports(HttpSession session) {
//        if (!isAdmin(session)) return "redirect:/login";
//        return "reports";
//    }
//
//    private boolean isAdmin(HttpSession session) {
//        User user = (User) session.getAttribute("user");
//        return user != null && "admin".equals(user.getRole());
//    }
//}




package controller.java;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import beans.User;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/admin")
public class AdminDashboardController {

    @GetMapping("/dashboard")
    public String showDashboard(HttpSession session, Model model) {
        User user = (User) session.getAttribute("user");
        if (!isAdmin(session)) {
            return "redirect:/login";
        }
        
        // Add any admin dashboard data here
        // model.addAttribute("doctorCount", doctorService.getCount());
        
        return "admin-dashboard";
    }

    @GetMapping("/add-doctor")
    public String showAddDoctorForm(HttpSession session) {
        if (!isAdmin(session)) return "redirect:/login";
        return "add-doctor";
    }

    @GetMapping("/view-doctors")
    public String showViewDoctors(HttpSession session) {
        if (!isAdmin(session)) return "redirect:/login";
        return "viewemp2";
    }

    @GetMapping("/patient-form")
    public String showPatientForm(HttpSession session) {
        if (!isAdmin(session)) return "redirect:/login";
        return "patient-form";
    }

    @GetMapping("/all-users")
    public String showAllUsers(HttpSession session) {
        if (!isAdmin(session)) return "redirect:/login";
        return "hello";
    }

    @GetMapping("/reports")
    public String showReports(HttpSession session) {
        if (!isAdmin(session)) return "redirect:/login";
        return "reports";
    }

    private boolean isAdmin(HttpSession session) {
        User user = (User) session.getAttribute("user");
        return user != null && "admin".equals(user.getRole());
    }
}