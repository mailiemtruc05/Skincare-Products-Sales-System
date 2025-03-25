package edu.uth.wed_san_pham_cham_soc_da.Controllers;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
@Controller
public class PayControllers {
    @RequestMapping("/pay")
    public String pay() {
        return "pay"; // Điều hướng đến templates/about.html
    }
}
