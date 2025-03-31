package edu.uth.wed_san_pham_cham_soc_da.Controllers;


import edu.uth.wed_san_pham_cham_soc_da.models.Product;
import edu.uth.wed_san_pham_cham_soc_da.Service.ShoppingCartService;
import edu.uth.wed_san_pham_cham_soc_da.models.ShoppingCart;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
@RequestMapping("/shopping-cart")
public class ShoppingcartControllers {
//    @RequestMapping("/shopping-cart")
//    public String shoppingCart() { // Đổi tên phương thức cho hợp lệ
//            return "shopping-cart";
//        }
    @Autowired
    private ShoppingCartService shoppingCartService;

    // Hiển thị trang giỏ hàng
    @GetMapping
    public String shoppingCart(Model model) {
        List<ShoppingCart> cartItems = shoppingCartService.getCartItems();
        model.addAttribute("cartItems", cartItems);
        return "shopping-cart";
    }

    // Xử lý thêm sản phẩm vào giỏ hàng
    @PostMapping("/add")
    public String addToCart(@RequestParam("productId") Integer productId) {
        shoppingCartService.addProductToCart(productId);
        return "redirect:/shopping-cart";
    }
}


