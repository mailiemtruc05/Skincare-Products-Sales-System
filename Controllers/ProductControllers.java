package edu.uth.wed_san_pham_cham_soc_da.Controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ProductControllers {
    @RequestMapping("/product")
    public String product() {
        return "product"; // Điều hướng đến templates/product.html
    }
}
