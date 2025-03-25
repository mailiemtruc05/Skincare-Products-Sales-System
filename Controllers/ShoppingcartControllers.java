package edu.uth.wed_san_pham_cham_soc_da.Controllers;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ShoppingcartControllers {
        @RequestMapping("/shopping-cart")
        public String shoppingCart() { // Đổi tên phương thức cho hợp lệ
            return "shopping-cart";
        }
    }


