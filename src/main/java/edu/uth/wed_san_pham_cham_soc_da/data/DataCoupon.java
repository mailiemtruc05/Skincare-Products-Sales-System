package edu.uth.wed_san_pham_cham_soc_da.data;

import edu.uth.wed_san_pham_cham_soc_da.models.Coupon;
import edu.uth.wed_san_pham_cham_soc_da.Service.CouponService;
import org.springframework.boot.CommandLineRunner;
import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Component;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.UUID;

@Order(7)  // Thiết lập thứ tự chạy: ưu tiên chạy runner này trước
@Component // Đánh dấu là một Spring Bean và sẽ được tự động phát hiện
public class DataCoupon implements CommandLineRunner {
    private final CouponService couponService;

    //Constructor injection của CouponService để tương tác với repository
    public DataCoupon(CouponService couponService) {
        this.couponService = couponService;
    }

    @Override
    public void run(String... args) throws Exception {
        //Tạo  coupon mẫu
        for (int i = 1; i <= 2; i++) {
            // Mã coupon
            String code = "VIP" + String.format("%03d", i);
            // Số tiền giảm
            BigDecimal amount = BigDecimal.valueOf(50000 * i);
            // Thời gian hết hạn: 30 ngày
            LocalDateTime expires = LocalDateTime.now().plusDays(30);
            // Chỉ lưu nếu coupon chưa tồn tại
            if (couponService.findByCode(code).isEmpty()) {
                Coupon c = new Coupon(code, amount, expires);
                couponService.save(c);
            }
        }
    }
}