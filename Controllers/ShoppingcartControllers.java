package edu.uth.wed_san_pham_cham_soc_da.Controllers;

import edu.uth.wed_san_pham_cham_soc_da.Service.ProductServiceImpl;
import edu.uth.wed_san_pham_cham_soc_da.Service.ShoppingCartService;
import edu.uth.wed_san_pham_cham_soc_da.Service.AccountService;
import edu.uth.wed_san_pham_cham_soc_da.models.Product;
import edu.uth.wed_san_pham_cham_soc_da.models.ShoppingCart;
import edu.uth.wed_san_pham_cham_soc_da.models.Account;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.math.BigDecimal;
import java.security.Principal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

// Controller xử lý các yêu cầu liên quan đến Giỏ Hàng
//Hiển thị trang giỏ hàng và tính toán coupon
// Xóa coupon
//Thêm, xóa, tăng, giảm số lượng qua API Ajax trả về JSON
@Controller
public class ShoppingcartControllers {

    //(Spring) sẽ tự động mang productService để dùng chức năng liên quan đến sản phẩm
    @Autowired
    private ProductServiceImpl productService;// Service sản phẩm

    // @Autowired: giống như khi bạn giơ tay hỏi cô: “Cho mình cuốn sách Giỏ Hàng,”
    // cô (Spring) sẽ tự động mang đúng cuốn ShoppingCartService đến cho bạn.
    // Bạn không phải tự đi lấy
    @Autowired
    private ShoppingCartService cartService;// Service giỏ hàng

    @Autowired
    private AccountService accountService;// Service tài khoản

    //Hiển thị trang giỏ hàng cùng thông tin sản phẩm, subtotal và coupon (nếu có)
    @GetMapping("/shopping-cart")
    public String shoppingCart(Model model,
                               Principal principal,
                               HttpSession session) {
        // Lấy tài khoản đăng nhập hiện tại
        Account account = accountService.findByUsername(principal.getName());

        //Lấy danh sách sản phẩm và subtotal
        List<ShoppingCart> items = cartService.getCartItems(account);
        double subtotal = cartService.getTotal(account);
        model.addAttribute("CARTITEMS", items);
        model.addAttribute("TOTAL", subtotal);

        //Xử lý coupon: nếu có, kiểm tra ngưỡng = discount * 10
        String couponCode = (String) session.getAttribute("couponCode");
        BigDecimal discount = (BigDecimal) session.getAttribute("couponDiscount");
        if (couponCode != null && discount != null) {
            double threshold = discount.doubleValue() * 10; // ngưỡng áp dụng coupon
            if (subtotal < threshold) {
                //Nếu subtotal dưới ngưỡng, xóa coupon
                session.removeAttribute("couponCode");
                session.removeAttribute("couponDiscount");
                model.addAttribute("couponError",
                        "");
            } else {
                // Nếu đạt điều kiện, đẩy thông tin coupon xuống view
                model.addAttribute("couponCode", couponCode);
                model.addAttribute("discount", discount);
                model.addAttribute("discountedTotal", subtotal - discount.doubleValue());
            }
        }

        return "shopping-cart";
    }

    // Xóa mã coupon khỏi session
    @GetMapping("/shopping-cart/remove-coupon")
    public String removeCoupon(HttpSession session,
                               RedirectAttributes ra) {
        session.removeAttribute("couponCode");
        session.removeAttribute("couponDiscount");
        ra.addFlashAttribute("message", "Đã gỡ bỏ mã giảm giá");
        return "redirect:/shopping-cart";
    }

    //Thêm sản phẩm vào giỏ hàng qua Ajax, trả về JSON { success, message, cartTotal }
    @GetMapping(value = "/shopping-cart/addAjax/{id}", produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public Map<String, Object> addCartAjax(@PathVariable("id") int id,
                                           Principal principal) {
        // Lấy tài khoản đăng nhập hiện tại
        Account account = accountService.findByUsername(principal.getName());
        // tim sản phẩm theo productID
        Product product = productService.getProductById(id);

        Map<String, Object> resp = new HashMap<>();
        if (product != null) {
            // Tạo sản phẩm  mới và thêm vào giỏ
            ShoppingCart item = new ShoppingCart();
            item.setProduct(product);
            item.setProductName(product.getProductName());
            item.setPrice(product.getPrice().longValue());
            item.setQuantity(1);
            cartService.addItem(account, item);

            // tính tổng tiền
            double cartTotal = cartService.getTotal(account);

            resp.put("success", true);
            resp.put("message", "Sản phẩm đã được thêm vào giỏ hàng.");
            resp.put("cartTotal", cartTotal);
        } else {
            resp.put("success", false);
            resp.put("message", "Không tìm thấy sản phẩm.");
        }
        return resp;
    }

    //Xóa sản phẩm theo productId qua Ajax, trả về JSON { productId, cartTotal }
    @GetMapping(value = "/shopping-cart/remove/{id}", produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public Map<String,Object> removeItemAjax(@PathVariable int id, Principal principal) {
        // Lấy tài khoản đăng nhập
        Account account = accountService.findByUsername(principal.getName());
        // Xóa sản phẩm khỏi giỏ hàng của account dựa trên productId
        cartService.removeItem(account, id);
        // Tính lại tổng tiền sau khi xóa
        double cartTotal = cartService.getTotal(account);
        return Map.of(
                "productId", id,
                "cartTotal", cartTotal
        );
    }

    //Tăng số lượng lên 1 qua Ajax, trả về JSON { productId, quantity, lineTotal, cartTotal }
    @GetMapping(value = "/shopping-cart/increase/{id}", produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public Map<String, Object> increaseItemAjax(@PathVariable("id") int id, Principal principal) {
        // Lấy tài khoản đăng nhập hiện tại
        Account account = accountService.findByUsername(principal.getName());
        // Tăng quantity thêm 1
        cartService.addItem(account, new ShoppingCart() {{
            setProduct(productService.getProductById(id));
            setQuantity(1);
        }});
        // Lấy thong tin vừa cập nhật
        ShoppingCart item = cartService.getCartItems(account).stream()
                .filter(i -> i.getProduct().getId().equals(id))
                .findFirst().orElseThrow();

        // Tính lại tổng tiền sau khi tăng
        double cartTotal = cartService.getTotal(account);

        Map<String, Object> resp = new HashMap<>();
        resp.put("productId", id);
        resp.put("quantity", item.getQuantity());
        resp.put("lineTotal", item.getTotal());
        resp.put("cartTotal", cartTotal);
        return resp;
    }

    //Giảm số lượng xuống 1 (tối thiểu 1) qua Ajax,trả về JSON { productId, quantity, lineTotal, cartTotal }
    @GetMapping(value = "/shopping-cart/decrease/{id}", produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public Map<String,Object> decreaseItemAjax(@PathVariable int id, Principal principal) {
        // Lấy tài khoản đăng nhập hiện tại
        Account account = accountService.findByUsername(principal.getName());
        // Giảm 1 (không dưới 1)
        int newQty = cartService.getCartItems(account).stream()
                .filter(i -> i.getProduct().getId().equals(id))
                .findFirst()
                .map(i -> Math.max(i.getQuantity()-1, 1))
                .orElse(1);
        cartService.updateItem(account, id, newQty);

        // Lấy thong tin vừa cập nhật
        ShoppingCart item = cartService.getCartItems(account).stream()
                .filter(i -> i.getProduct().getId().equals(id))
                .findFirst().orElseThrow();

        // Tính lại tổng tiền sau khi giảm
        double cartTotal = cartService.getTotal(account);

        return Map.of(
                "productId", id,
                "quantity", item.getQuantity(),
                "lineTotal", item.getTotal(),
                "cartTotal", cartTotal
        );
    }
}