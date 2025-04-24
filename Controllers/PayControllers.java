package edu.uth.wed_san_pham_cham_soc_da.Controllers;

import edu.uth.wed_san_pham_cham_soc_da.models.*;
import edu.uth.wed_san_pham_cham_soc_da.repository.ShoppingCartRepository;
import edu.uth.wed_san_pham_cham_soc_da.Service.AccountServiceiml;
import edu.uth.wed_san_pham_cham_soc_da.Service.PayService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import java.math.BigDecimal;
import java.security.Principal;
import java.util.List;

@Controller
@RequestMapping("/pay")
public class PayControllers {

    @Autowired
    private ShoppingCartRepository shoppingCartRepository;

    @Autowired
    private AccountServiceiml accountService;

    @Autowired
    private PayService payService;

    @GetMapping
    public String showPaymentPage(Model model,
                                  Principal principal,
                                  HttpSession session) {
        // Lấy account & cart
        String username = principal.getName();
        Account account = accountService.findByUsername(username);
        List<ShoppingCart> cartItems = shoppingCartRepository.findByAccount(account);

        // Tính total gốc
        long total = cartItems.stream()
                .mapToLong(i -> i.getPrice() * i.getQuantity())
                .sum();

        // Coupon từ session
        String     couponCode = (String)    session.getAttribute("couponCode");
        BigDecimal discount    = (BigDecimal)session.getAttribute("couponDiscount");

        // Tính total đã giảm
        Double discountedTotal = null;
        if (discount != null) {
            discountedTotal = total - discount.doubleValue();
        }

        // Chuẩn bị Pay object
        Pay pay = new Pay();
        pay.setTenKhachHang(account.getUsername());
        pay.setSoDienThoai(account.getPhone());
        pay.setEmail(account.getEmail());

        // Đẩy lên model
        model.addAttribute("cartItems",       cartItems);
        model.addAttribute("total",           total);
        model.addAttribute("couponCode",      couponCode);
        model.addAttribute("discount",        discount);
        model.addAttribute("discountedTotal", discountedTotal);
        model.addAttribute("account",         account);
        model.addAttribute("pay",             pay);

        return "pay";
    }

    @PostMapping
    public String processPayment(@ModelAttribute("pay") Pay payForm,
                                 Model model,
                                 Principal principal,
                                 HttpSession session) {
        // Lấy account & cart
        String username = principal.getName();
        Account account = accountService.findByUsername(username);
        List<ShoppingCart> cartItems = shoppingCartRepository.findByAccount(account);

        if (cartItems.isEmpty()) {
            model.addAttribute("error", "Giỏ hàng của bạn đang trống!");
            // reload dữ liệu (như GET)
            model.addAttribute("cartItems", cartItems);
            model.addAttribute("total", 0L);
            model.addAttribute("couponCode", session.getAttribute("couponCode"));
            model.addAttribute("discount",    session.getAttribute("couponDiscount"));
            model.addAttribute("discountedTotal", null);
            return "pay";
        }

        // Tính total gốc
        long total = cartItems.stream()
                .mapToLong(i -> i.getPrice() * i.getQuantity())
                .sum();
        // Coupon
        String     couponCode      = (String)    session.getAttribute("couponCode");
        BigDecimal discount         = (BigDecimal)session.getAttribute("couponDiscount");
        // Tính total đã giảm
        Double discountedTotal = null;
        if (discount != null) {
            discountedTotal = total - discount.doubleValue();
        }

        // Lưu đơn hàng
        Pay savedPay = payService.processPayment(account, payForm, cartItems,discount);
        List<OrderDetail> orderDetails = savedPay.getOrderDetails();

        // Đẩy xuống paymentSuccess
        model.addAttribute("order",          savedPay);
        model.addAttribute("orderDetails",   orderDetails);
        model.addAttribute("total",          total);
        model.addAttribute("couponCode",     couponCode);
        model.addAttribute("discount",       discount);
        model.addAttribute("discountedTotal",discountedTotal);
        model.addAttribute("account",        account);

        return "paymentSuccess";
    }
}
