package controller.java;

import java.io.IOException;
import java.util.Base64;
import java.util.Collections;
import java.util.List;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import beans.Doctor;
import daos.DoctorDAO;

@Controller
@RequestMapping("/doctor")
public class DoctorController {

    @Autowired
    private DoctorDAO doctorDAO;

    @GetMapping("/add")
    public String showAddDoctorForm(Model model) {
        model.addAttribute("doctor", new Doctor());
        return "empform";
    }
    
    @GetMapping("/view-all")
    public String listDoctors(Model model) {
        List<Doctor> doctors = doctorDAO.getAllDoctors();
        for (Doctor doctor : doctors) {
            if (doctor.getImage() != null) {
                doctor.setBase64Image(Base64.getEncoder().encodeToString(doctor.getImage()));
            }
        }
        model.addAttribute("doctors", doctors);
        return "viewemp";
    }

    @GetMapping("/search")
    public String searchDoctors(@RequestParam(required = false) String query, Model model) {
        List<Doctor> doctors;
        if (query != null && !query.isEmpty()) {
            try {
                int id = Integer.parseInt(query);
                Doctor doctor = doctorDAO.getDoctorById(id);
                doctors = doctor != null ? Collections.singletonList(doctor) : Collections.emptyList();
            } catch (NumberFormatException e) {
                doctors = doctorDAO.searchDoctorsByName(query);
            }
        } else {
            doctors = doctorDAO.getAllDoctors();
        }
        
        for (Doctor doctor : doctors) {
            if (doctor.getImage() != null) {
                doctor.setBase64Image(Base64.getEncoder().encodeToString(doctor.getImage()));
            }
        }
        
        model.addAttribute("doctors", doctors);
        model.addAttribute("searchQuery", query);
        return "viewemp"; 
    }

    @GetMapping("/details/{id}")
    public String viewDoctorDetails(@PathVariable("id") int id, Model model) {
        Doctor doctor = doctorDAO.getDoctorById(id);
        if (doctor == null) {
            return "redirect:/doctor/view-all";
        }
        
        if (doctor.getImage() != null) {
            doctor.setBase64Image(Base64.getEncoder().encodeToString(doctor.getImage()));
        }
        
        model.addAttribute("doctor", doctor);
        return "doctordetails";
    }
    

    @PostMapping("/save")
    public String saveDoctor(@Valid @ModelAttribute("doctor") Doctor doctor,
                           BindingResult result,
                           @RequestParam("imageFile") MultipartFile imageFile,
                           Model model) {
        if (result.hasErrors()) {
            return "empform";
        }

        try {
            if (!imageFile.isEmpty()) {
                doctor.setImage(imageFile.getBytes());
            }
        } catch (IOException e) {
            model.addAttribute("errorMessage", "Error uploading image");
            return "empform";
        }

        doctorDAO.saveDoctor(doctor);
        return "redirect:/doctor/view-all";
    }

    @GetMapping("/edit/{id}")
    public String showEditDoctorForm(@PathVariable("id") int id, Model model) {
        Doctor doctor = doctorDAO.getDoctorById(id);
        if (doctor == null) {
            return "redirect:/doctor/view-all";
        }

        model.addAttribute("doctor", doctor);
        if (doctor.getImage() != null) {
            model.addAttribute("base64Image", 
                Base64.getEncoder().encodeToString(doctor.getImage()));
        }

        return "empeditform";
    }

    @PostMapping("/update")
    public String updateDoctor(@Valid @ModelAttribute("doctor") Doctor doctor,
                             BindingResult result,
                             @RequestParam("imageFile") MultipartFile imageFile,
                             Model model) {
        if (result.hasErrors()) {
            Doctor existingDoctor = doctorDAO.getDoctorById(doctor.getId());
            if (existingDoctor != null && existingDoctor.getImage() != null) {
                model.addAttribute("base64Image", 
                    Base64.getEncoder().encodeToString(existingDoctor.getImage()));
            }
            return "empeditform";
        }

        try {
            if (!imageFile.isEmpty()) {
                doctor.setImage(imageFile.getBytes());
            } else {
                Doctor existingDoctor = doctorDAO.getDoctorById(doctor.getId());
                if (existingDoctor != null) {
                    doctor.setImage(existingDoctor.getImage());
                }
            }
        } catch (IOException e) {
            model.addAttribute("errorMessage", "Error uploading image");
            return "empeditform";
        }

        doctorDAO.updateDoctor(doctor);
        return "redirect:/view-doctor-admin";
    }

    @GetMapping("/delete/{id}")
    public String deleteDoctor(@PathVariable("id") int id) {
        doctorDAO.deleteDoctor(id);
        return "redirect:/view-doctors-admin";
    }
}

//
//package controller.java;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.validation.BindingResult;
//import org.springframework.web.bind.annotation.*;
//import org.springframework.web.multipart.MultipartFile;
//import org.springframework.web.servlet.mvc.support.RedirectAttributes;
//import daos.DoctorDAO;
//import beans.Doctor;
//import javax.servlet.http.HttpSession;
//import javax.validation.Valid;
//import java.io.IOException;
//import java.util.List;
//
//@Controller
//@RequestMapping("/admin")
//public class DoctorController {
//
//    @Autowired
//    private DoctorDAO doctorDao;
//
//    // Show add doctor form
//    @GetMapping("/add-doctor")
//    public String showAddForm(Model model) {
//        model.addAttribute("doctor", new Doctor());
//        return "add-doctor";
//    }
//
//    // Save new doctor
//    @PostMapping("/save-doctor")
//    public String saveDoctor(@ModelAttribute("doctor") @Valid Doctor doctor,
//                           BindingResult result,
//                           @RequestParam("imageFile") MultipartFile file,
//                           RedirectAttributes redirectAttributes,
//                           HttpSession session) throws IOException {
//        
//        // Validate input
//        if (result.hasErrors()) {
//            return "add-doctor";
//        }
//
//        // Check if email already exists
//        if (doctorDao.isDoctorEmail(doctor.getEmail())) {
//            result.rejectValue("email", "error.doctor", "Email already exists");
//            return "add-doctor";
//        }
//
//        // Handle image upload
//        if (!file.isEmpty()) {
//            doctor.setImage(file.getBytes());
//        } else {
//            // Set default image if none provided
//            doctor.setImage(getDefaultImage());
//        }
//
//        // Save doctor
//        doctorDao.saveDoctor(doctor);
//        redirectAttributes.addFlashAttribute("success", "Doctor added successfully!");
//        return "redirect:/admin/view-doctors";
//    }
//
//    // View all doctors
//    @GetMapping("/view-doctors")
//    public String viewDoctors(Model model) {
//        List<Doctor> doctors = doctorDao.getAllDoctors();
//        model.addAttribute("doctors", doctors);
//        return "view-doctors";
//    }
//
//    // Show edit form
//    @GetMapping("/edit-doctor/{id}")
//    public String showEditForm(@PathVariable("id") int id, Model model) {
//        Doctor doctor = doctorDao.getDoctorById(id);
//        model.addAttribute("doctor", doctor);
//        return "edit-doctor";
//    }
//
//    // Update doctor
//    @PostMapping("/update-doctor")
//    public String updateDoctor(@ModelAttribute("doctor") @Valid Doctor doctor,
//                             BindingResult result,
//                             @RequestParam("imageFile") MultipartFile file,
//                             RedirectAttributes redirectAttributes) throws IOException {
//        
//        if (result.hasErrors()) {
//            return "edit-doctor";
//        }
//
//        // Only update image if new file is provided
//        if (!file.isEmpty()) {
//            doctor.setImage(file.getBytes());
//        }
//
//        doctorDao.updateDoctor(doctor);
//        redirectAttributes.addFlashAttribute("success", "Doctor updated successfully!");
//        return "redirect:/admin/view-doctors";
//    }
//
//    // Delete doctor
//    @GetMapping("/delete-doctor/{id}")
//    public String deleteDoctor(@PathVariable("id") int id, RedirectAttributes redirectAttributes) {
//        doctorDao.deleteDoctor(id);
//        redirectAttributes.addFlashAttribute("success", "Doctor deleted successfully!");
//        return "redirect:/admin/view-doctors";
//    }
//
//    // Search doctors
//    @GetMapping("/search-doctors")
//    public String searchDoctors(@RequestParam("name") String name, Model model) {
//        List<Doctor> doctors = doctorDao.searchDoctorsByName(name);
//        model.addAttribute("doctors", doctors);
//        model.addAttribute("searchTerm", name);
//        return "view-doctors";
//    }
//
//    // Helper method for default image
//    private byte[] getDefaultImage() {
//        // Implement logic to return default image bytes
//        // For example, read from a file or use a placeholder
//        return new byte[0];
//    }
//}
