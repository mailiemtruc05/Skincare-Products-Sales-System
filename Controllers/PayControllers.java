package edu.uth.wed_san_pham_cham_soc_da.Controllers;

import edu.uth.wed_san_pham_cham_soc_da.Service.ShoppingCartService;
import edu.uth.wed_san_pham_cham_soc_da.models.ShoppingCart;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.Collection;

@Controller
public class PayControllers {
    @Autowired
    private ShoppingCartService shoppingCartService;

    @GetMapping("/pay")
    public String pay(Model model) {
        // Lấy danh sách sản phẩm trong giỏ hàng
        Collection<ShoppingCart> cartItems = shoppingCartService.getAllItems();
        // Tính tổng tiền
        double totalPrice = shoppingCartService.getTotal();

        // Đưa dữ liệu vào model để hiển thị trong giao diện
        model.addAttribute("cartItems", cartItems);
        model.addAttribute("totalPrice", totalPrice);

        return "pay"; // Trả về trang thanh toán (pay.html)
    }
}