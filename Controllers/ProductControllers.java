package edu.uth.wed_san_pham_cham_soc_da.Controllers;


import edu.uth.wed_san_pham_cham_soc_da.Service.ProductService;
import edu.uth.wed_san_pham_cham_soc_da.models.Category;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
public class ProductControllers {
    @RequestMapping("/product")
    public String product(Model model) {
        model.addAttribute("LISTPRODUCT", service.getAll());
        return "product";
    } //tra ve trang product.html

    @Autowired
    ProductService service;
}
