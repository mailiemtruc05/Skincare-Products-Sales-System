package edu.uth.wed_san_pham_cham_soc_da.Controllers;

import ch.qos.logback.core.model.Model;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
@Controller
public class HomeController {
    @RequestMapping("/home")
    public String home() {
        return "index"; // Điều hướng đến templates/index.html
    }
}

