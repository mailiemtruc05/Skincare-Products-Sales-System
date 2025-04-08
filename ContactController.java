package edu.uth.wed_san_pham_cham_soc_da.Controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
@Controller
public class ContactController {
    @RequestMapping("/contact")
    public String contact() {
        return "contact"; // Điều hướng đến templates/contact.html
    }
}
