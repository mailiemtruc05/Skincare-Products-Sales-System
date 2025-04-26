package edu.uth.wed_san_pham_cham_soc_da.Controllers;

import edu.uth.wed_san_pham_cham_soc_da.Service.CouponService;
import edu.uth.wed_san_pham_cham_soc_da.models.Coupon;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.time.LocalDateTime;
import java.util.List;


//Controller quản lý giao diện Admin cho Coupon.
//Xem danh sách tất cả coupon
//Thêm mới coupon
//Xóa coupon hoặc bật + cập nhật thời hạn cho coupon được chọn

@Controller
@RequestMapping("/admin-coupons")
public class AdminCouponController {

    @Autowired
    private CouponService couponService;

    //Hiển thị trang quản lý coupon
    @GetMapping
    public String list(Model model) {
        //đưa "coupons" chứa danh sách tất cả coupon vào Model
        model.addAttribute("coupons", couponService.findAll());
        //Đưa "coupon" mới để binding với form thêm
        model.addAttribute("coupon", new Coupon());
        return "admin-coupons"; // chuyển đến template
    }

    //Xử lý thêm mới coupon
    @PostMapping("/add-new")
    public String saveNew(@ModelAttribute("coupon") Coupon coupon,
                          RedirectAttributes ra) {
        // thời điểm tạo
        LocalDateTime now = LocalDateTime.now();
        // gán createdAt
        coupon.setCreatedAt(now);
        // mặc định chưa active
        coupon.setActive(false);
        // hạn dùng 30 ngày sau
        coupon.setExpiredAt(now.plusDays(30));
        // lưu coupon mới
        couponService.save(coupon);
        ra.addFlashAttribute("message", "Đã thêm mã: " + coupon.getCode());
        return "redirect:/admin-coupons"; // quay lại trang quản lý
    }

    //Xử lý xóa hoặc bật + đặt hạn coupon đã chọn
    @PostMapping
    public String handleActions(
            @RequestParam(name = "selectedCodes", required = false) List<String> codes,
            @RequestParam("_action") String action,
            @RequestParam(name = "scheduledTime", required = false)
            @DateTimeFormat(iso = DateTimeFormat.ISO.DATE_TIME)
            LocalDateTime scheduledTime,
            RedirectAttributes ra) {
        //Xóa từng coupon theo mã
        if ("delete".equals(action) && codes != null) {
            codes.forEach(code ->
                    couponService.findByCode(code)
                            .ifPresent(c -> couponService.deleteById(c.getId()))
            );
            ra.addFlashAttribute("message", "Đã xóa " + codes.size() + " mã.");
        }
        else if (// Bật và đặt thời hạn cho coupon
                "schedule".equals(action) && codes != null && scheduledTime != null) {
            codes.forEach(code ->
                    couponService.findByCode(code).ifPresent(c -> {
                        c.setActive(true);
                        c.setExpiredAt(scheduledTime);
                        couponService.save(c);
                    })
            );
            ra.addFlashAttribute("message",
                    "Đã bật và đặt hạn đến " + scheduledTime + " cho " + codes.size() + " mã.");
        }

        return "redirect:/admin-coupons";
    }
}