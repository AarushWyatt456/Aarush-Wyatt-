package controller.java;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {

    @GetMapping("/")
    public String home(Model model) {
        return "index"; // This will show your home page (index.jsp)
    }
    
    @GetMapping("/viewemp")
    public String viewDoctors(Model model) {
        // This can remain in DoctorController if you prefer
        return "view-doctors";
    }
    
    @GetMapping("/login")
    public String login() {
        return "login";
    }
    
    @GetMapping("/register")
    public String register() {
        return "register";
    }
}